package com.gl.utils;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;


public class PageHibernateCallback<T> implements HibernateCallback<List<T>> {
	private String query=null;
	private Object[] params;
	private String[] args;
	private int startIndex;
	private int findCount;
	
	public PageHibernateCallback(String query,Object[] params,String[] args,int startIndex,int findCount) {
		super();
		this.query=query;
		this.params=params;
		this.args=args;
		this.startIndex=startIndex;
		this.findCount=findCount;
	}
	@Override
	public List<T> doInHibernate(Session session) throws HibernateException, SQLException {
		//执行sql语句
		Query sql = session.createQuery(query);
		if(params!=null) {
			for(int i=0;i<params.length;i++) {
				//System.out.println("当前params名为："+args[i]+"****当前params的值为："+params[i].toString());
				sql.setParameter(args[i], params[i].toString());
			}
		}
		sql.setFirstResult(startIndex);
		sql.setMaxResults(findCount);
		return sql.list();
	}

}
