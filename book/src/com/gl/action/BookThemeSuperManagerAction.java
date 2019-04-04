package com.gl.action;


import com.gl.model.BookTheme;
import com.gl.service.BookThemeService;
import com.gl.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BookThemeSuperManagerAction extends ActionSupport implements ModelDriven<BookTheme> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private BookTheme bookTheme = new BookTheme();
	@Override
	public BookTheme getModel() {
		// TODO Auto-generated method stub
		return bookTheme;
	}
	private Integer page;
	private BookThemeService bookThemeService;
	
	
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
		return "update";
	}
	public String save() {
		bookThemeService.save(bookTheme);
		return "save";
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
		PageBean<BookTheme> pageBean = bookThemeService.selectBookThemes(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "booktheme";
	}
}
