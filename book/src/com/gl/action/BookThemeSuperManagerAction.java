package com.gl.action;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;
import org.jdom.Attribute;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.gl.model.Book;
import com.gl.model.BookTheme;
import com.gl.service.BookThemeService;
import com.gl.utils.ExcelHelper;
import com.gl.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BookThemeSuperManagerAction extends ActionSupport implements ModelDriven<BookTheme> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String templateId = "theme_big_class";
	private BookTheme bookTheme = new BookTheme();
	@Override
	public BookTheme getModel() {
		// TODO Auto-generated method stub
		return bookTheme;
	}
	private Integer page;
	private BookThemeService bookThemeService;
	private String classType;
	private String templateName;
	private String templateDownId;
	private String select;
	
	
	public String getSelect() {
		return select;
	}
	public void setSelect(String select) {
		this.select = select;
	}
	public String getTemplateName() {
		return templateName;
	}
	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}
	public String getTemplateDownId() {
		return templateDownId;
	}
	public void setTemplateDownId(String templateDownId) {
		this.templateDownId = templateDownId;
	}
	public String getClassType() {
		return classType;
	}
	public void setClassType(String classType) {
		System.out.println("当前选中的绘本主题所属班级为："+classType);
		this.classType = classType;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public BookThemeService getBookThemeService() {
		return bookThemeService;
	}
	public void setBookThemeService(BookThemeService bookThemeService) {
		this.bookThemeService = bookThemeService;
	}
	public String update() {
		System.out.println("------updating book info-------");
		bookThemeService.update(bookTheme);
		ServletActionContext.getRequest().getSession().setAttribute("classType", bookTheme.getClass_type());
		return "update";
	}
	public String save() {
		BookTheme temp = bookThemeService.findBookThemeByName(bookTheme.getTheme_name());
		if(temp==null) {
			
			bookThemeService.save(bookTheme);
			ServletActionContext.getRequest().getSession().setAttribute("classType", bookTheme.getClass_type());
		}
		return "save";
	}
	public String delete() {
		ServletActionContext.getRequest().getSession().setAttribute("classType", classType);
		System.out.println("^^^^^^"+classType);
		bookThemeService.delete(bookTheme);
		return "deleteSuccess";
	}
	public String addBookThemePage() {
		return "addBookThemePage";
	}
	public String editBookThemePage() {
		bookTheme=bookThemeService.selectBookThemeById(bookTheme.getIdbooktheme());
		return "editBookThemePage";
	}
	public String infoBookThemePage() {
		bookTheme=bookThemeService.selectBookThemeById(bookTheme.getIdbooktheme());
		return "infoBookThemePage";
	}
	public String booktheme() {
		String temp = (String)ServletActionContext.getRequest().getSession().getAttribute("classType");
		if(temp!=null) {
			classType=temp;
			ServletActionContext.getRequest().getSession().removeAttribute("classType");
		}
		System.out.println("------------"+classType);
		PageBean<BookTheme> pageBean = bookThemeService.selectBookThemes(classType,page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		ActionContext.getContext().getValueStack().set("class_type", classType);
		return "booktheme";
	}
	public String select() {
		
		return "selectSuccess";
	}
	

	public String importData() {

		//上传时生成的临时文件保存目录
        String tempPath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/temp");
        File tmpFile = new File(tempPath);
        if (!tmpFile.exists()) {
            //创建临时目录
            tmpFile.mkdir();
        }
        
        HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		MultiPartRequestWrapper multipart = (MultiPartRequestWrapper)request;
		File[] files=multipart.getFiles("fileInput");
		for(File f : files) {
			try {
				//读取Excel文件
				@SuppressWarnings("resource")
				HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(f));
				HSSFSheet sheet = wb.getSheetAt(0);
				
				//获取模板文件
				String path = ServletActionContext.getServletContext().getRealPath("/template");
				path = path + "/" + templateId + ".xml";
				File file = new File(path);
				
				//解析xml模板文件
				SAXBuilder builder = new SAXBuilder();
				Document parse =  builder.build(file);
				Element root = parse.getRootElement();
				Element tbody = root.getChild("tbody");
				Element tr = tbody.getChild("tr");
				@SuppressWarnings("unchecked")
				List<Element> children = tr.getChildren("td");
				//解析excel开始行，开始列
				int firstRow = tr.getAttribute("firstrow").getIntValue();
				int firstCol = tr.getAttribute("firstcol").getIntValue();
				//获取excel最后一行行号
				int lastRowNum = sheet.getLastRowNum();
				//循环每一行处理数据
				for (int i = firstRow; i <= lastRowNum; i++) {
					//读取某行
					HSSFRow row = sheet.getRow(i);
					//判断改行是否为空
					if(ExcelHelper.isEmptyRow(row)){
						continue;
					}
					int lastCellNum = row.getLastCellNum();
					//如果非空行，则取所有单元格的值
					for (int j = firstCol; j <lastCellNum; j++) {
						Element td = children.get(j-firstCol);
						HSSFCell cell = row.getCell(j);
						//如果单元格为null,继续处理下一个cell
						if(cell == null){
							continue;
						}
						//获取单元格属性值
						String value = ExcelHelper.getCellValue(cell,td);
						if(value.endsWith(".0")) {
							value=value.substring(0, value.length()-2);
						}
						switch(j) {
						case 0:
							bookTheme.setTheme_name(value);
							break;
						case 1:
							bookTheme.setClass_type(value);
							break;
						case 2:
							bookTheme.setTerm(value);
							break;
						case 3:
							bookTheme.setTheme_description(value);
							break;
						}
					}
					save();
				}
				
				String str = "{\"status\":\"ok\",\"message\":\"导入成功！\"}";
				response.getWriter().write(str);
			} catch (Exception e) {
				String str = "{\"status\":\"noOk\",\"message\":\"导入失败！\"}";
				try {
					response.getWriter().write(str);
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			}	
		}
        return "importSuccess";
	}
	

    @Override
	public String execute() throws Exception {
		return "downData";
	}
    
    public InputStream getInputStream() throws IOException{

		createTemplate();
		String path = ServletActionContext.getServletContext().getRealPath("/template");
		String filepath = path +"/" + templateName + ".xls";
		File file = new File(filepath);
		
		return FileUtils.openInputStream(file);
	}
	

	public String getDownloadFileName(){
		String downloadFileName = "";
		String filename = templateName + ".xls";
		try {
			downloadFileName = URLEncoder.encode(filename,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return downloadFileName;
	}
	
	@SuppressWarnings("all")
	private void createTemplate() {
		String path = ServletActionContext.getServletContext().getRealPath("/template");
		File file = new File(path,templateDownId+".xml");
		SAXBuilder builder = new SAXBuilder();
		try {
			
			Document parse = builder.build(file);
			HSSFWorkbook wb = new HSSFWorkbook();
			HSSFSheet sheet = wb.createSheet("Sheet0");
			
			Element root = parse.getRootElement();
			templateName = root.getAttribute("name").getValue();
			
			int rownum = 0;
			int column = 0;
			int colCount=0;
			Element colgroup = root.getChild("colgroup");
			setColumnWidth(sheet,colgroup);
			
			Element title = root.getChild("title");
			List<Element> trs = title.getChildren("tr");
			for (int i = 0; i < trs.size(); i++) {
				Element tr = trs.get(i);
				List<Element> tds = tr.getChildren("td");
				HSSFRow row = sheet.createRow(rownum);
				HSSFCellStyle cellStyle = wb.createCellStyle();
				cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
				for(column = 0;column <tds.size();column ++){
					Element td = tds.get(column);
					HSSFCell cell = row.createCell(column);
					Attribute rowSpan = td.getAttribute("rowspan");
					Attribute colSpan = td.getAttribute("colspan");
					colCount=colSpan.getIntValue();
					Attribute value = td.getAttribute("value");
					if(value !=null){
						String val = value.getValue();
						cell.setCellValue(val);
						int rspan = rowSpan.getIntValue() - 1;
						int cspan = colSpan.getIntValue() - 1;
						
						//
						HSSFFont font = wb.createFont();
						font.setFontName("宋体");
						font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);//����Ӵ�
//						font.setFontHeight((short)12);
						font.setFontHeightInPoints((short)12);
						cellStyle.setFont(font);
						cell.setCellStyle(cellStyle);
						//
						sheet.addMergedRegion(new CellRangeAddress(rspan, rspan, 0, cspan));
					}
				}
				rownum ++;
			}
			//
			Element thead = root.getChild("thead");
			trs = thead.getChildren("tr");
			for (int i = 0; i < trs.size(); i++) {
				Element tr = trs.get(i);
				HSSFRow row = sheet.createRow(rownum);
				List<Element> ths = tr.getChildren("th");
				for(column = 0;column < ths.size();column++){
					Element th = ths.get(column);
					Attribute valueAttr = th.getAttribute("value");
					HSSFCell cell = row.createCell(column);
					if(valueAttr != null){
						String value =valueAttr.getValue();
						cell.setCellValue(value);
					}
				}
				rownum++;
			}
			List<BookTheme> ms = bookThemeService.selectBookThemes(classType);
			System.out.println("当前下载的绘本类型为："+classType);
			String temp="";
			for(int i=0;i<ms.size();i++) {
				HSSFRow row = sheet.createRow(rownum);
				for(column=0;column<colCount;column++) {
					HSSFCell cell=row.createCell(column);
					switch(column) {
					case 0:
						temp=ms.get(i).getTheme_name();
						break;
					case 1:
						temp=ms.get(i).getClass_type();
						break;
					case 2:
						temp=ms.get(i).getTerm();
						break;
					case 3:
						temp=ms.get(i).getTheme_description();
						break;
					default:
						break;
					}
					cell.setCellValue(temp);
				}
				rownum++;
			}
			File tempFile = new File(path, templateName + ".xls");
			tempFile.delete();
			tempFile.createNewFile();
			FileOutputStream stream = FileUtils.openOutputStream(tempFile);
			wb.write(stream);
			stream.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	private static void setColumnWidth(HSSFSheet sheet, Element colgroup) {
		List<Element> cols = colgroup.getChildren("col");
		for (int i = 0; i < cols.size(); i++) {
			Element col = cols.get(i);
			Attribute width = col.getAttribute("width");
			String unit = width.getValue().replaceAll("[0-9,\\.]", "");
			String value = width.getValue().replaceAll(unit, "");
			int v=0;
			if(StringUtils.isBlank(unit) || "px".endsWith(unit)){
				v = Math.round(Float.parseFloat(value) * 37F);
			}else if ("em".endsWith(unit)){
				v = Math.round(Float.parseFloat(value) * 267.5F);
			}
			sheet.setColumnWidth(i, v);
		}
	}
}
