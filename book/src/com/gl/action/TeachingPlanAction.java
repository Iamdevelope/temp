package com.gl.action;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
import org.apache.poi.xwpf.converter.xhtml.XWPF2XHTMLConverter;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;
import org.jdom.Attribute;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gl.model.Book;
import com.gl.model.BookTheme;
import com.gl.model.BookType;
import com.gl.model.TeachingPlan;
import com.gl.service.TeachingPlanService;
import com.gl.utils.ExcelHelper;
import com.gl.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TeachingPlanAction extends ActionSupport implements ModelDriven<TeachingPlan> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final String templateId = "teachingplan";
	private TeachingPlan teachingPlan = new TeachingPlan();
	@Override
	public TeachingPlan getModel() {
		// TODO Auto-generated method stub
		return teachingPlan;
	}
	private TeachingPlanService teachingPlanService;
	
	private String book_type;
	private Integer btype;
	private Integer page;
	private Integer idteaching_plan;
	private String templateName;

	private String templateDownId;
	
	public String getTemplateDownId() {
		return templateDownId;
	}
	public void setTemplateDownId(String templateDownId) {
		this.templateDownId = templateDownId;
	}
	public String getTemplateName() {
		return templateName;
	}
	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}
	public Integer getIdteaching_plan() {
		return idteaching_plan;
	}
	public void setIdteaching_plan(Integer idteaching_plan) {
		this.idteaching_plan = idteaching_plan;
	}
	public String getBook_type() {
		return book_type;
	}
	public void setBook_type(String book_type) {
		this.book_type = book_type;
	}
	public Integer getBtype() {
		return btype;
	}
	public void setBtype(Integer btype) {
		System.out.println("传过来的绘本类型为："+btype);
		switch(btype) {
		case 1:
			this.book_type="社会";
			break;
		case 2:
			this.book_type="数学";
			break;
		case 3:
			this.book_type="探究";
			break;
		case 4:
			this.book_type="美术";
			break;
		case 5:
			this.book_type="音乐";
			break;
		case 6:
			this.book_type="健康";
			break;
		case 7:
			this.book_type="语言";
			break;
		}
		this.btype = btype;
	}
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public TeachingPlan getTeachingPlan() {
		return teachingPlan;
	}
	public void setTeachingPlan(TeachingPlan teachingPlan) {
		this.teachingPlan = teachingPlan;
	}
	public TeachingPlanService getTeachingPlanService() {
		return teachingPlanService;
	}
	public void setTeachingPlanService(TeachingPlanService teachingPlanService) {
		this.teachingPlanService = teachingPlanService;
	}
	public String findTeachingPlans() {
		String temp = (String)ServletActionContext.getRequest().getSession().getAttribute("book_type");
		if(temp!=null) {
			book_type=temp;
			System.out.println("新增绘本的类型为："+book_type);
			ServletActionContext.getRequest().getSession().removeAttribute("book_type");
		}
		Integer i = (Integer)ServletActionContext.getRequest().getSession().getAttribute("btype");
		if(i!=null) {
			System.out.println("新增绘本的类型id："+i);
			btype = i;
			ServletActionContext.getRequest().getSession().removeAttribute("btype");
		}
		System.out.println("当前选中的绘本类型为："+book_type+"****以及当前页面为："+page+"****以及btype:"+btype);
		PageBean<TeachingPlan> pageBean=teachingPlanService.findAllTeachingPlanByBookTypeId(btype,page);
		if(pageBean.getList()==null) {
			this.addActionError("当前还没有添加教案，请去添加。");
			return "findAllTeachingPlan";
		}
		ActionContext.getContext().getValueStack().set("type", btype);
		ActionContext.getContext().getValueStack().set("currentType", book_type);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAllTeachingPlan";
	}
	public String delete() {
		System.out.println("正在删除绘本信息："+book_type);
		ServletActionContext.getRequest().getSession().setAttribute("book_type", book_type);
		ServletActionContext.getRequest().getSession().setAttribute("btype", btype);
		teachingPlanService.delete(teachingPlan);
		return "deleteSuccess";
	}
	public String save() {
//		teachingPlan.setAddtime(TimeHelper.getCurrentTime());
//		teachingPlan.setScore(UUIDUtils.getRandomNum(3, 5));
//		teachingPlan.setBook_used_count(UUIDUtils.getRandomNum(100, 1000));
		ServletActionContext.getRequest().getSession().setAttribute("book_type", book_type);
		ServletActionContext.getRequest().getSession().setAttribute("btype", btype);
		System.out.println("当前需要添加的绘本教案："+teachingPlan.getTeaching_plan_name());
		TeachingPlan temp = teachingPlanService.findTeachingPlanByName(teachingPlan.getTeaching_plan_name());
		if(temp==null) {
			String page="\\bookImages\\"+teachingPlan.getTeaching_plan_name();
			//page = page.replaceAll("\\", "/");
			teachingPlan.setTeaching_path(page);
			teachingPlanService.save(teachingPlan);
		}
		return "saveSuccess";
	}
	public String edit() {
		System.out.println("********"+teachingPlan.getIdteaching_plan());
		teachingPlan=teachingPlanService.findTeachingPlanById(teachingPlan.getIdteaching_plan()); 
		return "editPage";
	}
	public String info() {
		System.out.println("来自详细信息界面*****当前选中的绘本类型为："+book_type+"****以及当前页面为："+page+"****以及btype:"+btype);
		teachingPlan=teachingPlanService.findTeachingPlanById(teachingPlan.getIdteaching_plan());
//		teachingPlan.setType(btype);
		ActionContext.getContext().getValueStack().set("book_type", book_type);
		return "infoPage";
	}
	
	public String upload() {
		return "upload";
	}
	
	@SuppressWarnings("unused")
	public String importData() {

		//上传时生成的临时文件保存目录
        String tempPath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/temp");
        File tmpFile = new File(tempPath);
        if (!tmpFile.exists()) {
            //创建临时目录
            tmpFile.mkdir();
        }
        ServletActionContext.getRequest().getSession().setAttribute("book_type", book_type);
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
						System.out.println(value);
						switch(j) {
						case 0:
							teachingPlan.setTeaching_plan_name(value);
							value="";
							break;
						case 1:
							teachingPlan.setBook_class(value);
							value="";
							break;
						case 2:
							if(!value.startsWith("#0001")) {
								Book book = teachingPlanService.findBookByName(value);				
								teachingPlan.setBook(book);
							}else {
								Book book = teachingPlanService.findBookByName(teachingPlan.getTeaching_plan_name());
								teachingPlan.setBook(book);
							}
							value="";
							break;
						case 3:
							if(!value.startsWith("#0001")) {
								BookType bookType = teachingPlanService.findBookTypeByName(value);
								teachingPlan.setBooktype(bookType);
							}
							value="";
							break;
						case 4:
							if(!value.startsWith("#0001")) {
								BookTheme bookTheme = teachingPlanService.findBookThemeByName(value);
								teachingPlan.setBooktheme(bookTheme);								
							}
							value="";
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
	
	@RequestMapping("importWordData")
	public String importWordData(@RequestParam("wordInput")MultipartFile[] mfs) throws UnsupportedEncodingException {
		//HttpServletRequest request = ServletActionContext.getRequest();
		//request.setCharacterEncoding("utf-8");
		//MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		//MultipartHttpServletRequest mtRequest = resolver.resolveMultipart(request);
		//List<MultipartFile> mfs = mtRequest.getFiles("wordInput");
		for(MultipartFile mf:mfs) {
			System.out.println("正在上传的文件的原名："+mf.getOriginalFilename());
		}
        return "importSuccess";
	}
	
	public static String Word2007ToHtml(MultipartFile file) throws IOException {
		String outputFile = ServletActionContext.getServletContext().getRealPath("WEB-INF/word");
        if (file.isEmpty() || file.getSize() <= 0) {
            return null;
        } else {
            if (file.getOriginalFilename().endsWith(".docx") || file.getOriginalFilename().endsWith(".DOCX")) {

                // 1) 加载word文档生成 XWPFDocument对象
                InputStream in = file.getInputStream();
                XWPFDocument document = new XWPFDocument(in);

                // 也可以使用字符数组流获取解析的内容
                OutputStream out = new FileOutputStream(new File(outputFile));
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                XWPF2XHTMLConverter.getInstance().convert(document, baos, null);
                String content = baos.toString();
                baos.close();
                return content;
            } else {

                return null;
            }
        }
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
			List<TeachingPlan> ms = teachingPlanService.findAllTeachingPlans();
			System.out.println("当前下载的绘本类型为："+book_type);
			String temp="";
			for(int i=0;i<ms.size();i++) {
				HSSFRow row = sheet.createRow(rownum);
				for(column=0;column<colCount;column++) {
					HSSFCell cell=row.createCell(column);
					switch(column) {
					case 0:
						temp=ms.get(i).getTeaching_plan_name();
						break;
					case 1:
						temp=ms.get(i).getBook_class();
						break;
					case 2:
						temp=ms.get(i).getTeaching_plan_name();
						break;
					case 3:
						temp=ms.get(i).getBooktype().getBook_type_name();
						break;
					case 4:
						temp=ms.get(i).getBooktheme().getTheme_name();
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