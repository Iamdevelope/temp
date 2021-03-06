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
import com.gl.model.BookType;
import com.gl.service.BookService;
import com.gl.utils.ExcelHelper;
import com.gl.utils.FileHelper;
import com.gl.utils.PageBean;
import com.gl.utils.TimeHelper;
import com.gl.utils.UUIDUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/*
 * 后台管理员管理绘本Action
 * */
public class BookSuperManagerAction extends ActionSupport implements ModelDriven<Book> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final String templateId = "art";
	private Book book=new Book();
	@Override
	public Book getModel() {
		return book;
	}
	private Integer bid;
	public void setBid(Integer bid) {
		System.out.println("----------"+bid);
		this.bid=bid;
	}
	private BookService bookService;
	
	
	public BookService getBookService() {
		return bookService;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	private String book_class;
	private String book_theme;
	
	private String book_type;
	private Integer btype;
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
		book.setType(btype);
		this.btype=btype;
	}

	public void setBclass(Integer bc) {
		System.out.println("当前选择的绘本班级类型为："+bc);
		switch(bc) {
		case 0:
			this.select="大班";
			break;
		case 1:
			this.select="中班";
			break;
		case 2:
			this.select="小班";
			break;
		}
	}
	public String getBook_type() {
		return book_type;
	}
	public void setBook_type(String book_type) {
		System.out.println("设置的绘本类型："+book_type);
		this.book_type = book_type;
	}
	public String getBook_class() {
		return book_class;
	}
	public void setBook_class(String book_class) {
		this.book_class = book_class;
	}
	public String getBook_theme() {
		return book_theme;
	}
	public void setBook_theme(String book_theme) {
		this.book_theme = book_theme;
	}
	public String update() {
		Book temp = bookService.findBookById(book.getBid());
		ServletActionContext.getRequest().getSession().setAttribute("book_type", book.getBook_type());
		ServletActionContext.getRequest().getSession().setAttribute("btype", btype);
		book.setScore(temp.getScore());
		book.setBooktype(temp.getBooktype());
		book.setBooktype(book.getBooktype());
		bookService.update(book);
		return "updateSuccess";
	}
	public String addPage() {
		//System.out.println("当前需要添加的绘本类型为："+book_type);
		ActionContext.getContext().getValueStack().set("type",btype);
		ActionContext.getContext().getValueStack().set("book_type", book_type);
		return "addPage";
	}
	public String delete() {
		System.out.println("正在删除绘本信息："+book_type);
		ServletActionContext.getRequest().getSession().setAttribute("book_type", book_type);
		ServletActionContext.getRequest().getSession().setAttribute("btype", btype);
		bookService.delete(book);
		return "deleteSuccess";
	}
	public String save() {
		Book temp = bookService.findBookByName(book.getName());
		BookType booktype = bookService.findBookTypeByName(book.getBook_type());
		BookTheme booktheme = bookService.findBookThemeByName(book.getBook_theme());
		if(temp==null) {
			if(booktype!=null) {
				book.setBooktype(booktype);
			}
			if(booktheme!=null) {
				book.setBooktheme(booktheme);
			}
			book.setAddtime(TimeHelper.getCurrentTime());
			book.setScore(UUIDUtils.getRandomNum(3, 5));
			book.setBook_used_count(UUIDUtils.getRandomNum(100, 1000));
			String page="\\bookImages\\"+book.getName();
			ServletActionContext.getRequest().getSession().setAttribute("book_type", book.getBook_type());
			ServletActionContext.getRequest().getSession().setAttribute("btype", btype);
			
			book.setBook_path(page);
			bookService.save(book);
		}
		return "saveSuccess";
	}
	public String edit() {
		System.out.println("********"+book.getBid());
		book=bookService.findBookById(book.getBid()); 
		return "editPage";
	}
	public String info() {
		System.out.println("来自详细信息界面*****当前选中的绘本类型为："+book_type+"****以及当前页面为："+page+"****以及btype:"+btype);
		book=bookService.findBookById(book.getBid());
		book.setType(btype);
		ActionContext.getContext().getValueStack().set("book_type", book_type);
		return "infoPage";
	}
	private Integer page;
	public void setPage(Integer page) {
		System.out.println("设置的页面为："+page);
		this.page=page;
	}
	private String select;
	public void setSelect(String select){
		this.select=select;
	}
	public String findBookAll() {
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
		PageBean<Book> pageBean=bookService.findAllBooksByBookTypeOrBookClass(btype,book_type,page);
		if(pageBean.getList()==null) {
			this.addActionError("当前还没有添加绘本，请去添加。");
			return "findBookAll";
		}
		ActionContext.getContext().getValueStack().set("type", btype);
		ActionContext.getContext().getValueStack().set("currentType", book_type);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findBookAll";
	}
	public String select(){
		this.clearActionErrors();//每次运行时，将actionError清空
		if(select==null||select==""){
			this.addActionError("关键字为空：请重新输入！");
			return "findBookAll";
		}
		System.out.println("搜索到了，关键字："+select+"当前页面为："+page);
		PageBean<Book> pageBean = bookService.findAllBooksByBookTypeAndClass(this.book_type,select, page);
		if(pageBean==null){
			this.addActionError("查无结果，请检查关键字是否正确！");
			return "findBookAll";
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		//System.out.println("搜索成功,共有   "+pageBean.getList().size()+"   个结果");
		return "selectSuccess";
	}
	public String find(){
		this.clearActionErrors();//每次运行时，将actionError清空
		if(btype!=null) {
			ActionContext.getContext().getValueStack().set("type", btype);
		}
		if(select==null||select==""){
			this.addActionError("关键字为空：请重新输入！");
			return "findBookAll";
		}
		//System.out.println("搜索到了，关键字："+select+"当前页面为："+page+"当前绘本类型："+book_type);
		PageBean<Book> pageBean = bookService.findAllBooksByBookTypeAndClass(this.book_type,select, page);
		if(pageBean==null){
			this.addActionError("当前还没有添加该类型绘本。");
			return "findBookAll";
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		//System.out.println("搜索成功,共有   "+pageBean.getList().size()+"   个结果");
		return "selectSuccess";
	}
	public String upload() {
		return "upload";
	}
	/*
	 * 绘本预览界面
	 * */
	public String show() {
		System.out.println("来自预览界面*****当前选中的绘本类型为："+book_type+"****以及btype:"+btype);
		
		book=bookService.findBookById(book.getBid());
		book.setType(btype);
		ActionContext.getContext().getValueStack().set("book_type", book_type);
		String p = ServletActionContext.getRequest().getServletContext().getRealPath("bookImages");
		System.out.println("***************this is by show of path:"+p);
		System.out.println("该绘本的id："+bid+"***********通过实体获取的绘本id："+book.getBid()+"*****该绘本图片保存的路径为："+book.getBook_path()+"***该绘本所属类型："+btype);
		List<String> list = FileHelper.traverseFolder(p+"/"+book_type+"/"+book.getName());
		if(list!=null) {
			String path = "";
			for(int i=0;i<list.size();i++) {
				path+=list.get(i)+"|";
			}
			System.out.println("这是截取前的所有绘本路径："+path);
			path = path.substring(0,path.length()-1);
			path = path.trim();
			//System.out.println("这是截取后的所有绘本路径："+path);
			book.setBookImg_path(path);
		}
		return "showPage";
	}
	
	
	public String downData() {
		return "downSuccess";
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
							book.setName(value);
							break;
						case 1:
							book.setBook_class(value);
							break;
						case 2:
							BookType booktype = bookService.findBookTypeByName(value);
							if(booktype!=null) {
								book.setBooktype(booktype);
							}
							book.setBook_type(value);
							break;
						case 3:
							BookTheme booktheme = bookService.findBookThemeByName(value);
							if(booktheme!=null) {
								book.setBooktheme(booktheme);
							}
							book.setBook_theme(value);
							break;
						case 4:
							book.setBook_abstract(value);
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
	
	public String importWordData() throws UnsupportedEncodingException {

		//上传时生成的临时文件保存目录
        String tempPath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/temp");
        File tmpFile = new File(tempPath);
        if (!tmpFile.exists()) {
            //创建临时目录
            tmpFile.mkdir();
        }
        
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
		MultiPartRequestWrapper multipart = (MultiPartRequestWrapper)request;
		File[] files=multipart.getFiles("wordInput");
		for(File f : files) {
			System.out.println("正在上传的文件的名为："+f.getName());
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
			List<Book> ms = bookService.findAllBooksByBookType(book_type);
			System.out.println("当前下载的绘本类型为："+book_type);
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
						temp=ms.get(i).getBook_class();
						break;
					case 2:
						temp=ms.get(i).getBook_type();
						break;
					case 3:
						temp=ms.get(i).getBook_theme();
						break;
					case 4:
						temp=ms.get(i).getBook_abstract();
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
