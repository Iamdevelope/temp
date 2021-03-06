package com.gl.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.gl.model.Book;
import com.gl.service.BookService;
import com.gl.utils.FileHelper;
import com.gl.utils.PageBean;
import com.gl.utils.TimeHelper;
import com.gl.utils.UUIDUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BookDeanAction extends ActionSupport implements ModelDriven<Book> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Book book=new Book();
	@Override
	public Book getModel() {
		return book;
	}
	private BookService bookService;
	public void setBookService(BookService bookService) {
		this.bookService=bookService;
	}
	
	private String book_type;
	private String book_class;
	private String book_theme;
	
	private Integer btype;
	
	public void setBtype(Integer btype) {
		//System.out.println("传过来的绘本类型为："+btype);
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
	public String getBook_type() {
		return book_type;
	}
	public void setBook_type(String book_type) {
		//System.out.println("设置的绘本类型："+book_type);
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
		
		return "deleteSuccess";
	}
	public String save() {
		book.setAddtime(TimeHelper.getCurrentTime());
		book.setScore(UUIDUtils.getRandomNum(3, 5));
		bookService.save(book);
		return "saveSuccess";
	}
	public String edit() {
		book=bookService.findBookById(book.getBid());
		return "editPage";
	}
	public String info() {
		//System.out.println("来自详细信息界面*****当前选中的绘本类型为："+book_type+"****以及当前页面为："+page+"****以及btype:"+btype);
		book=bookService.findBookById(book.getBid());
		book.setType(btype);
		return "infoPage";
	}
	private Integer page;
	public void setPage(Integer page) {
		//System.out.println("设置的页面为："+page);
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
			//System.out.println("新增绘本的类型为："+book_type);
			ServletActionContext.getRequest().getSession().removeAttribute("book_type");
		}
		Integer i = (Integer)ServletActionContext.getRequest().getSession().getAttribute("btype");
		if(i!=null) {
			//System.out.println("新增绘本的类型id："+i);
			btype = i;
			ServletActionContext.getRequest().getSession().removeAttribute("btype");
		}
		//System.out.println("当前选中的绘本类型为："+book_type+"****以及当前页面为："+page+"****以及btype:"+btype);
		PageBean<Book> pageBean=bookService.findAllBooksByBookTypeOrBookClass(btype,book_type,page);
		ActionContext.getContext().getValueStack().set("type", btype);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findBookAll";
	}
	public String select(){
		this.clearActionErrors();//每次运行时，将actionError清空
		if(select==null||select==""){
			this.addActionError("关键字为空：请重新输入！");
			return "findBookAll";
		}
		//System.out.println("搜索到了，关键字："+select+"当前页面为："+page);
		PageBean<Book> pageBean = bookService.selectBookByKey(select, page);
		if(pageBean==null){
			this.addActionError("查无结果，请检查关键字是否正确！");
			return "findBookAll";
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		//System.out.println("搜索成功,共有   "+pageBean.getList().size()+"   个结果");
		return "selectSuccess";
	}
	/*
	 * 绘本预览界面
	 * */
	public String show() {
		//System.out.println("来自预览界面*****当前选中的绘本类型为："+book_type+"****以及btype:"+btype);
		
		book=bookService.findBookById(book.getBid());
		book.setType(btype);
		ActionContext.getContext().getValueStack().set("book_type", book_type);
		String p = ServletActionContext.getRequest().getServletContext().getRealPath("bookImages");
		System.out.println("***************this is by show of path:"+p);
		System.out.println("***********通过实体获取的绘本id："+book.getBid()+"*****该绘本图片保存的路径为："+book.getBook_path()+"***该绘本所属类型："+btype);
		List<String> list = FileHelper.traverseFolder(p+"\\"+book.getName());
		if(list!=null) {
			String path = "";
			for(int i=0;i<list.size();i++) {
				path+=list.get(i)+"|";
			}
			//System.out.println("这是截取前的所有绘本路径："+path);
			path = path.substring(0,path.length()-1);
			path = path.trim();
			//System.out.println("这是截取后的所有绘本路径："+path);
			book.setBookImg_path(path);
		}
		return "showPage";
	}
}
