package com.gl.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gl.model.Book;
import com.gl.model.BookTheme;
import com.gl.model.BookType;
import com.gl.model.Book_Teacher;
import com.gl.model.Teacher;
import com.gl.utils.PageHibernateCallback;

public class BookDao extends HibernateDaoSupport {
	//更新绘本信息
	public void update(Book book) {
		this.getHibernateTemplate().update(book);
	}
	//增加绘本
	public void save(Book book) {
		this.getHibernateTemplate().save(book);
	}
	public void delete(Book book) {
		this.getHibernateTemplate().delete(book);
	}
	
	//获取所有绘本数量
	public int findAllBooks() {
		String query="Select count(*) from Book";
		List<Long> list = this.getHibernateTemplate().find(query);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	public Book findBookByName(String name) {
		String query = "from Book where name = ?";
		List<Book>	list = this.getHibernateTemplate().find(query, name);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	public Teacher findAllBooksByTid(Integer tid){
		return this.getHibernateTemplate().get(Teacher.class, tid);
	}
	public List<Book_Teacher> findAllBookTeacherByTid(Integer tid){
		return this.getHibernateTemplate().find("from Book_Teacher where tid = ?", tid);
	}
	//获取指定限制页面内的绘本
	public List<Book> findAllBooks(int startIndex,int limit){
		String query="from Book";
		return this.getHibernateTemplate().execute(new PageHibernateCallback<Book>(query,null,null,startIndex,limit));
	}
	public List<Book> findAllBooksByType(Object[] params,String[] args,int startIndex,int limit){
		String query = "from Book where book_type = :book_type";
		return this.getHibernateTemplate().execute(new PageHibernateCallback<Book>(query,params,args,startIndex,limit));
	}
	//获取相应绘本类型且满足班级类型的绘本
	public List<Book> findAllBooksByBookTypeAndClass(String bookType,String bookClass){
		String query="from Book where book_type = ? and book_class = ?";
		List<Book> list = this.getHibernateTemplate().find(query, bookType,bookClass);
		if(list!=null&&list.size()>0) {
			return list;
		}
		String queryByName="from Book where book_type = ? and name = ?";
		list = this.getHibernateTemplate().find(queryByName, bookType,bookClass);
		if(list!=null&&list.size()>0){
			return list;
		}
		String queryByType="from Book where book_type = ? and book_type = ?";
		list = this.getHibernateTemplate().find(queryByType, bookType,bookClass);
		if(list!=null&&list.size()>0){
			return list;
		}
		String queryByTheme="from Book where book_type = ? and book_theme = ?";
		list = this.getHibernateTemplate().find(queryByTheme, bookType,bookClass);
		if(list!=null&&list.size()>0){
			return list;
		}
		return null;
	}
	public Book findBookById(Integer bid) {
		return this.getHibernateTemplate().get(Book.class, bid);
	}
	@SuppressWarnings("unchecked")
	public List<Book> findBookByKey(String select) {
		String query="from Book where book_class = ?";
		List<Book> list = this.getHibernateTemplate().find(query,select);
		if(list!=null&&list.size()>0){
			return list;
		}
		String queryByName="from Book where name = ?";
		list = this.getHibernateTemplate().find(queryByName, select);
		if(list!=null&&list.size()>0){
			return list;
		}
		String queryByType="from Book where book_type = ?";
		list = this.getHibernateTemplate().find(queryByType, select);
		if(list!=null&&list.size()>0){
			return list;
		}
		String queryByTheme="from Book where book_theme = ?";
		list = this.getHibernateTemplate().find(queryByTheme, select);
		if(list!=null&&list.size()>0){
			return list;
		}
		return null;
	}
	public Book_Teacher findBookIsAdd(Integer bid, Integer tid) {
		String query = "from Book_Teacher where bid = ? and tid = ?";
		List<Book_Teacher> list = this.getHibernateTemplate().find(query, bid,tid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	public BookType findBookTypeByName(String name) {
		String query = "from BookType where book_type_name = ?";
		List<BookType> list = this.getHibernateTemplate().find(query, name);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	public BookTheme findBookThemeByName(String name) {
		String query = "from BookTheme where theme_name = ?";
		List<BookTheme> list = this.getHibernateTemplate().find(query, name);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
}
