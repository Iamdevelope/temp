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

import com.gl.model.Manager;
import com.gl.model.Student;
import com.gl.model.Teacher;
import com.gl.service.StudentService;
import com.gl.utils.ExcelHelper;
import com.gl.utils.PageBean;
import com.gl.utils.TimeHelper;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class StudentSuperManagerAction extends ActionSupport implements ModelDriven<Student> {
	private Student student = new Student();
	private final String templateId = "student";
	@Override
	public Student getModel() {
		return student;
	}
	private StudentService studentService;
	public void setStudentService(StudentService studentService) {
		this.studentService=studentService;
	}
	private Integer page;
	public void setPage(Integer page) {
		this.page=page;
	}
	private String select;
	public void setSelect(String select){
		//System.out.println("设置的关键字为："+select);
		this.select=select;
	}
	private String templateName;

	public String getTemplateName() {
		return templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}
	public String findStudentAll() {
		//System.out.println("查找所有学生");
		//String s = (String)ActionContext.getContext().get("select");
		PageBean<Student> pageBean = new PageBean<Student>();
		String s = null;
		if(select!=null) {
			if(select.equals("0")) {
				ServletActionContext.getRequest().getSession().removeAttribute("select");
			}
		}
		s = (String)ServletActionContext.getRequest().getSession().getAttribute("select");
		if(s!=null) {
			//System.out.println("当前需要符合的条件为："+s);
			pageBean=studentService.findStudentByKey(s, page);
		}
		else {
			pageBean=studentService.findStudentByPage(page);
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findStudentAll";
	}
	public String info() {
		student=studentService.findStudentById(student.getSid());
		return "infoPage";
	}
	public String edit() {
		student=studentService.findStudentById(student.getSid());
		return "editPage";
	}
	public String addPage() {
		return "addPage";
	}
	public String save(){
		student.setCreate_time(TimeHelper.getCurrentTime());
		studentService.save(student);
		return "saveSuccess";
	}
	public String delete() {
		student.setIsDelete(1);
		studentService.update(student);
		return "deleteSuccess";
	}
	public String update() {
		student.setTeacher(student.getTeacher());
		studentService.update(student);
		return "updateSuccess";
	}
	public String select(){
		this.clearActionErrors();
		if(select==null||select==""){
			this.addActionError("关键字为空：请重新输入！");
			return "findStudentAll";
		}
		//System.out.println("搜索到了，关键字："+select+"当前页面为："+page);
		ServletActionContext.getRequest().getSession().setAttribute("select", select);
		PageBean<Student> pageBean = studentService.findStudentByKey(select, page);
		if(pageBean==null){
			this.addActionError("查无结果，请检查关键字是否正确！");
			return "findStudentAll";
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		//System.out.println("搜索成功,共有   "+pageBean.getList().size()+"   个结果");
		return "selectSuccess";
	}

	public String importData() {
		//得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
        String savePath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/upload");
        //上传时生成的临时文件保存目录
        String tempPath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/temp");
        File tmpFile = new File(tempPath);
        if (!tmpFile.exists()) {
            //创建临时目录
            tmpFile.mkdir();
        }
        
        //消息提示
        String message = "";
        String info="";
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
							student.setName(value);
							break;
						case 1:
							student.setBirthday(value);
							break;
						case 2:
							if(value.equals("男")) {
								student.setSex(0);
							}else {
								student.setSex(1);
							}
							break;
						case 3:
							student.setFather_name(value);
							break;
						case 4:
							student.setFather_number(value);
							break;
						case 5:
							student.setMother_name(value);
							break;
						case 6:
							student.setMother_number(value);
							break;
						case 7:
							student.setClass_type(value);
							break;
						case 8:
							student.setSchool(value);
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
			List<Student> ms = studentService.findAllStudents();
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
						temp=ms.get(i).getBirthday();
						break;
					case 2:
						if(ms.get(i).getSex()==0) {
							temp="男";
						}else {
							temp="女";
						}
						break;
					case 3:
						temp=ms.get(i).getFather_name();
						break;
					case 4:
						temp=ms.get(i).getFather_number();
						break;
					case 5:
						temp=ms.get(i).getMother_name();
						break;
					case 6:
						temp=ms.get(i).getMother_number();
						break;
					case 7:
						temp=ms.get(i).getClass_type();
						break;
					case 8:
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
