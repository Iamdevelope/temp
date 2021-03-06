package com.gl.action;


import com.gl.model.BookType;
import com.gl.service.BookTypeService;
import com.gl.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BookTypeSuperManagerAction extends ActionSupport implements ModelDriven<BookType> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private BookType bookType = new BookType();
	@Override
	public BookType getModel() {
		// TODO Auto-generated method stub
		return bookType;
	}
	private Integer page;
	private BookTypeService bookTypeService;
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public BookTypeService getBookTypeService() {
		return bookTypeService;
	}
	public void setBookTypeService(BookTypeService bookTypeService) {
		this.bookTypeService = bookTypeService;
	}
	public String booktype() {
		PageBean<BookType> pageBean = bookTypeService.selectBookTypes(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "booktype";
	}
	public String update() {
		bookTypeService.update(bookType);
		return "update";
	}
	public String save() {
		BookType temp = bookTypeService.findBookTypeByName(bookType.getBook_type_name());
		if(temp==null) {
			bookTypeService.save(bookType);
		}
		return "save";
	}
	public String addBookTypePage() {
		
		return "addBookTypePage";
	}
	public String editBookTypePage() {
		bookType=bookTypeService.selectBookTypeById(bookType.getIdbooktype());
		return "editBookTypePage";
	}
	public String infoBookTypePage() {
		bookType=bookTypeService.selectBookTypeById(bookType.getIdbooktype());
		return "infoBookTypePage";
	}
}
