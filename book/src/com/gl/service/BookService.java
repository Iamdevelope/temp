package com.gl.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.gl.dao.BookDao;
import com.gl.model.Book;
import com.gl.model.BookTheme;
import com.gl.model.BookType;
import com.gl.model.Book_Teacher;
import com.gl.model.Teacher;
import com.gl.utils.PageBean;

@Transactional
public class BookService{
	private final Integer limit = 10;
	private BookDao bookDao;
	public void setBookDao(BookDao bookDao) {
		this.bookDao=bookDao;
	}
	public void update(Book book) {
		bookDao.update(book);
	}
	public void save(Book book) {
		bookDao.save(book);
	}
	public void delete(Book book) {
		bookDao.delete(book);
	}
	public Book findBookByName(String name) {
		return bookDao.findBookByName(name);
	}
	//业务层查询所有书本
	public PageBean<Book> findBookPage(Integer tid,int currentPage){
		PageBean<Book> pages=new PageBean<Book>();
		pages.setPage(currentPage);
		pages.setLimit(limit);
		int totalCount=bookDao.findAllBooks();
		pages.setTotalCount(totalCount);
		int totalPages=0;
		if(totalCount%limit==0) {
			totalPages=totalCount/limit;
		}else {
			totalPages=totalCount/limit+1;
		}
		//System.out.println("查询绘本：当前页面："+currentPage+",总页数："+totalPages+",总数量："+totalCount);
		pages.setTotalPage(totalPages);
		int startIndex=(currentPage-1)*limit;
		List<Book> list = bookDao.findAllBooks(startIndex, limit);
		if(tid!=null){
			List<Book_Teacher> temp=bookDao.findAllBookTeacherByTid(tid);
			for(int i=0;i<list.size();i++){
				for(int j=0;j<temp.size();j++){
					if(isAdd(temp.get(j).getBid(),list.get(i))) {
						list.get(i).setIsadd(0);
						temp.remove(j);
						break;
					}
				}
			}
		}
		pages.setList(list);
		return pages;
	}
	public boolean isAdd(Integer bid,Book book) {
		if(bid==book.getBid()) {
			return true;
		}
		return false;
	}
	public boolean isAdd(Integer bid,Integer tid) {
		Book_Teacher bt = bookDao.findBookIsAdd(bid,tid);
		if(bt!=null) {
			return true;
		}
		return false;
	}
	//业务层查询所有书本
	public PageBean<Book> findBookPage(Integer btype,String book_type,Integer tid,int currentPage){
		PageBean<Book> pages=new PageBean<Book>();
		pages.setPage(currentPage);
		pages.setLimit(limit);
		int startIndex=(currentPage-1)*limit;
		List<Book> list = bookDao.findAllBooksByType(new Object[] {book_type}, new String[] {"book_type"}, startIndex, limit);
		int totalCount=list.size();
		pages.setTotalCount(totalCount);
		int totalPages=0;
		if(totalCount%limit==0) {
			totalPages=totalCount/limit;
		}else {
			totalPages=totalCount/limit+1;
		}
		//System.out.println("查询绘本：当前页面："+currentPage+",总页数："+totalPages+",总数量："+totalCount);
		pages.setTotalPage(totalPages);
		if(tid!=null){
			List<Book_Teacher> temp=bookDao.findAllBookTeacherByTid(tid);
			for(int i=0;i<list.size();i++){
				for(int j=0;j<temp.size();j++){
					if(isAdd(temp.get(j).getBid(),list.get(i))) {
						list.get(i).setType(btype);
						list.get(i).setIsadd(0);
						temp.remove(j);
						break;
					}
				}
			}
		}
		pages.setList(list);
		return pages;
	}
	public PageBean<Book> findAllBooksByBookTypeOrBookClass(Integer type,String key,Integer page){
		PageBean<Book> pages=new PageBean<Book>();
		pages.setPage(page);
		List<Book> list=bookDao.findBookByKey(key);
		if(list!=null) {
			int totalCount=list.size();
			int totalPage=0;
			if(totalCount%10==0) {
				totalPage=totalCount/10;
			}else {
				totalPage=totalCount/10+1;
			}
			pages.setLimit(limit);
			int startIndex=(page-1)*10;
			List<Book> temp = new ArrayList();
			for(int i=startIndex;i<page*10&&i<list.size();i++) {
				list.get(i).setType(type);
				temp.add(list.get(i));
			}
			pages.setTotalCount(totalCount);
			pages.setTotalPage(totalPage);
			pages.setList(temp);
		}
		return pages;
	}
	
	public PageBean<Book> findAllBooksByBookTypeAndClass(String bookType,String bookClass,Integer page){
		//System.out.println("在绘本Service层：绘本类型："+bookType+"****班级类型："+bookClass);
		PageBean<Book> pages=new PageBean<Book>();
		pages.setPage(page);
		List<Book> list=bookDao.findAllBooksByBookTypeAndClass(bookType,bookClass);
		if(list!=null) {
			int totalCount=list.size();
			int totalPage=0;
			if(totalCount%10==0) {
				totalPage=totalCount/10;
			}else {
				totalPage=totalCount/10+1;
			}
			pages.setLimit(limit);
			int startIndex=(page-1)*10;
			List<Book> temp = new ArrayList();
			for(int i=startIndex;i<page*10&&i<list.size();i++) {
				temp.add(list.get(i));
			}
			pages.setTotalCount(totalCount);
			pages.setTotalPage(totalPage);
			pages.setList(temp);
			return pages;
		}
		return null;
	}
	public Book findBookById(Integer bid) {
		return bookDao.findBookById(bid);
	}
	public PageBean<Book> selectBookByKey(String select, Integer page) {
		PageBean<Book> pageBean=new PageBean<Book>();
		pageBean.setPage(page);
		int totalCount=0;
		List<Book> lists=bookDao.findBookByKey(select);
		if(lists==null){
			return null;
		}
		totalCount=lists.size();
		pageBean.setTotalCount(totalCount);
		int totalPage=0;
		if(totalCount%limit==0) {
			totalPage=totalCount/limit;
		}else {
			totalPage=totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		pageBean.setList(lists);
		return pageBean;
	}
	public PageBean<Book> findBookByTidPage(Integer tid, Integer page) {
		PageBean<Book> pages=new PageBean<Book>();
		pages.setPage(page);
		pages.setLimit(limit);
		Teacher teacher = bookDao.findAllBooksByTid(tid);
		int totalCount=teacher.getBook().size();
		if(totalCount<=0) {
			pages.setPage(0);
		}
		pages.setTotalCount(totalCount);
		int totalPages=0;
		if(totalCount%limit==0) {
			totalPages=totalCount/limit;
		}else {
			totalPages=totalCount/limit+1;
		}
		//System.out.println("通过教师id查询绘本：当前页面："+page+",总页数："+totalPages+",总数量："+totalCount);
		pages.setTotalPage(totalPages);
		int startIndex=(page-1)*limit;
		List<Book_Teacher> temp=bookDao.findAllBookTeacherByTid(tid);
		List<Book> list = new ArrayList();
		for(int i=startIndex;i<page*10&&i<temp.size();i++) {
			list.add(bookDao.findBookById(temp.get(i).getBid()));
		}
		//System.out.println("查询成功了，且该教师对应了‘"+list.size()+"’本书.");
		pages.setList(list);
		return pages;
	}
	public List<Book> findAllBooksByBookType(String bookType){
		return bookDao.findBookByKey(bookType);
	}
	public BookType findBookTypeByName(String name) {
		return bookDao.findBookTypeByName(name);
	}
	public BookTheme findBookThemeByName(String name) {
		return bookDao.findBookThemeByName(name);
	}
}