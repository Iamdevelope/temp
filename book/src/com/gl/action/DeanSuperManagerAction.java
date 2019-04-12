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

import com.gl.model.Dean;
import com.gl.model.Manager;
import com.gl.service.DeanService;
import com.gl.utils.ExcelHelper;
import com.gl.utils.PageBean;
import com.gl.utils.TimeHelper;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/*
 * 后台管理员管理院长Action
 * */
public class DeanSuperManagerAction extends ActionSupport implements ModelDriven<Dean> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final String templateId = "dean"; 
	private Dean dean=new Dean();
	@Override
	public Dean getModel() {
		return dean;
	}
	private DeanService deanService;
	public void setDeanService(DeanService deanService) {
		this.deanService=deanService;
	}
	private Integer page;
	public void setPage(Integer page) {
		this.page=page;
	}
	private String select;
	private String templateName;
	
	public String getTemplateName() {
		return templateName;
	}
	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}
	public void setSelect(String select){
		this.select=select;
	}
	public String save() {
		Manager manager=(Manager)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		if(manager==null) {
			this.addActionError("登录过时，请重新登录！");
			return NONE;
		}
		dean.setManager(manager);
		dean.setCreate_time(TimeHelper.getCurrentTime());
		deanService.save(dean);
		return "saveSuccess";
	}
	public String editPage() {
		dean=deanService.findDeanById(dean.getDid());
		return "editPage";
	}
	public String update() {
		//System.out.println("更新院长用户时，院长的名字："+dean.getName());
		dean.setManager(dean.getManager());
		System.out.println("***********"+Long.parseLong(dean.getPhone_number()));
		deanService.update(dean);
		return "updateSuccess";
	}
	public String delete() {
		deanService.delete(dean);
		return "deleteSuccess";
	}
	public String findDeanAll() {
		PageBean<Dean> pageBean=deanService.findAllDean(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findDeanAll";
	}
	public String addPage() {
		List<Dean> dlist = deanService.findAllDean();
		ActionContext.getContext().getValueStack().set("dlist", dlist);
		return "addPage";
	}
	public String importPage() {
		return "importPage";
	}
	public String info() {
		dean=deanService.findDeanById(dean.getDid());
		return "infoPage";
	}
	public String select(){
		this.clearActionErrors();//每次运行时，将actionError清空
		if(select==null||select==""){
			this.addActionError("关键字为空：请重新输入！");
			return "findDeanAll";
		}
		//System.out.println("搜索到了，关键字："+select+"当前页面为："+page);
		PageBean<Dean> pageBean = deanService.selectDeanByKey(select, page);
		if(pageBean==null){
			this.addActionError("查无结果，请检查关键字是否正确！");
			return "findDeanAll";
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		//System.out.println("搜索成功,共有   "+pageBean.getList().size()+"   个结果");
		return "selectSuccess";
	}

	public String importData() {
		//得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
        //String savePath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/upload");
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
		//MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		//MultipartFile multipartFile = multipartRequest.getFile("CHANNEL_PACKAGE_URL");
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
							dean.setName(value);
							break;
						case 1:
							dean.setPassword(value);
							break;
						case 2:
							if(value.equals("男")) {
								dean.setSex(0);
							}else {
								dean.setSex(1);
							}
							break;
						case 3:
							dean.setPhone_number(value);
							break;
						case 4:
							dean.setEmail(value);
							break;
						case 5:
							dean.setSchool(value);
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
		File file = new File(path,templateId+".xml");
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
			List<Dean> ms = deanService.findAllDean();
			String temp="";
			for(int i=0;i<ms.size();i++) {
				HSSFRow row = sheet.createRow(rownum);
				for(column=0;column<colCount;column++) {
					HSSFCell cell=row.createCell(column);
					switch(column) {
					case 0:
						temp=ms.get(i).getName();
						break;
					case 1:
						temp=ms.get(i).getPassword();
						break;
					case 2:
						if(ms.get(i).getSex()==0) {
							temp="男";
						}else {
							temp="女";
						}
						break;
					case 3:
						temp=ms.get(i).getPhone_number();
						break;
					case 4:
						temp=ms.get(i).getEmail();
						break;
					case 5:
						temp=ms.get(i).getSchool();
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
