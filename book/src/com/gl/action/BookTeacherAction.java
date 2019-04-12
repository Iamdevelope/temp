package com.gl.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.gl.model.Book;
import com.gl.model.Book_Teacher;
import com.gl.model.Teacher;
import com.gl.model.TeachingPlan;
import com.gl.service.BookService;
import com.gl.service.BookTeacherService;
import com.gl.service.TeacherBookService;
import com.gl.service.TeachingPlanService;
import com.gl.utils.FileHelper;
import com.gl.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BookTeacherAction extends ActionSupport implements ModelDriven<Book> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Book book = new Book();

	@Override
	public Book getModel() {
		// TODO Auto-generated method stub
		return book;
	}
	private Integer bid;
	public void setBid(Integer bid) {
		this.bid=bid;
	}

	private String book_type;
	private String book_class;
	private String book_theme;
	private Integer btype;
	
	public void setBtype(Integer type) {
		System.out.println("传过来的绘本类型为："+type);
		switch(type) {
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
		this.btype=type;
	}
	
	public void setBclass(Integer bc) {
		//System.out.println("当前选择的绘本班级类型为："+bc);
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
	private BookService bookService;
	public void setBookService(BookService bookService) {
		this.bookService=bookService;
	}
	private BookTeacherService bookTeacherService;
	public void setBookTeacherService(BookTeacherService bookTeacherService) {
		this.bookTeacherService=bookTeacherService;
	}
	private TeacherBookService teacherBookService;
	public void setTeacherBookService(TeacherBookService teacherBookService) {
		this.teacherBookService=teacherBookService;
	}
	private TeachingPlanService teachingPlanService;
	
	public TeachingPlanService getTeachingPlanService() {
		return teachingPlanService;
	}

	public void setTeachingPlanService(TeachingPlanService teachingPlanService) {
		this.teachingPlanService = teachingPlanService;
	}

	public String add() {
		//System.out.println("需要添加的绘本的id："+book.getBid());
		Teacher teacher = (Teacher)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		if(teacher==null) {
			this.addActionError("登录超时，请重新登录！");
			return NONE;
		}
		if(!bookService.isAdd(book.getBid(), teacher.getTid())) {
			Book_Teacher bt = new Book_Teacher();
			bt.setBid(book.getBid());
			bt.setTid(teacher.getTid());
			bookTeacherService.save(bt);
		}
		return "addSuccess";
	}
	public String delete() {
		//System.out.println("需要删除的绘本id："+book.getBid());
		Book_Teacher bt = bookTeacherService.findByBid(book.getBid());
		bookTeacherService.delete(bt);
		return "deleteSuccess";
	}
	public String info() {
		//System.out.println("来自详细信息界面*****当前选中的绘本类型为："+book_type+"****以及当前页面为："+page+"****以及btype:"+btype);
		book=bookService.findBookById(book.getBid());
		book.setType(btype);
		//System.out.println("当前绘本的详细信息中是否已经添加："+book.getIsadd());
		return "infoPage";
	}
	private Integer page;
	public void setPage(Integer page) {
		this.page=page;
	}
	private String select;
	public void setSelect(String select){
		this.select=select;
	}
	public String findBookAll() {
		Teacher	teacher = (Teacher)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		
		if(book_type==null) {
			Integer tempPage = (Integer)ServletActionContext.getRequest().getSession().getAttribute("page");
			String tempType = (String)ServletActionContext.getRequest().getSession().getAttribute("type");
			System.out.println("上一次显示的页面为："+tempPage);
			if(tempPage!=null) {
				page=tempPage;
			}
			if(tempType!=null) {
				book_type=tempType;
			}
		}
		if(teacher==null) {
			this.addActionError("登录过期，请重新登录!");
			return NONE;
		}
		System.out.println("找到了所有的绘本"+btype+"------------"+book_type);
		PageBean<Book> pageBean=bookService.findBookPage(btype,book_type,teacher.getTid(),page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		ServletActionContext.getRequest().getSession().setAttribute("page", page);
		ActionContext.getContext().getValueStack().set("type", btype);
		ServletActionContext.getRequest().getSession().setAttribute("type", book_type);
		return "findBookAll";
	}
	
	/*
	 * 绘本教案
	 * */
	public String findTeachingPlan() {
		PageBean<TeachingPlan> pageBean = teachingPlanService.findAllTeachingPlanByBookTypeId(btype, page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		return "findTeachingPlan";
	}
	
	public String findSelfAllBook() {
		Teacher	teacher = (Teacher)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		if(teacher==null) {
			this.addActionError("登录过期，请重新登录!");
			return NONE;
		}
		//System.out.println("找到了自己添加的所有绘本");
		PageBean<Book> pageBean = bookService.findBookByTidPage(teacher.getTid(),page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findSelfAllBook";
	}
	public String select(){
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
		Teacher teacher = (Teacher)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		book=bookService.findBookById(book.getBid());
		if(bookService.isAdd(book.getBid(), teacher.getTid())) {
			book.setIsadd(0);
		}
		ActionContext.getContext().getValueStack().set("book_type", book_type);
		String p = ServletActionContext.getRequest().getServletContext().getRealPath("bookImages");
		//System.out.println("***************this is by show of path:"+p);
		//System.out.println("该绘本的id："+bid+"***********通过实体获取的绘本id："+book.getBid()+"*****该绘本图片保存的路径为："+book.getBook_path()+"***该绘本所属类型："+btype);
		List<String> list = FileHelper.traverseFolder(p+"\\"+book.getName());
		if(list!=null) {
			String path = "";
			for(int i=0;i<list.size();i++) {
				
				path+=list.get(i)+"|";
			}
			//System.out.println("绘本是否添加："+book.getIsadd());
			path = path.substring(0,path.length()-1).trim();
			//System.out.println("这是截取后的所有绘本路径："+path);
			book.setBookImg_path(path);
		}
		return "showPage";
	}
	public String bookForum() {
		return "forumPage";
	}
	public String findSelfNotes() {
		return "selfNotesPage";
	}
}
