package com.gl.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gl.model.Dean;
import com.gl.model.SoftwareCode;
import com.gl.utils.PageHibernateCallback;

@SuppressWarnings("all")
public class SoftwareCodeDao extends HibernateDaoSupport {
	
	public void save(SoftwareCode sw) {
		this.getHibernateTemplate().save(sw);
	}
	public void update(SoftwareCode sw) {
		this.getHibernateTemplate().update(sw);
	}
	public void delete(SoftwareCode sw) {
		this.getHibernateTemplate().delete(sw);
	}
	public SoftwareCode findCodeByComputerCode(String code,Integer did) {
		String query="from SoftwareCode where computerCode = ? and did = ?";
		List<SoftwareCode> list=this.getHibernateTemplate().find(query,code,did);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	public SoftwareCode findCodeBySoftwareId(Integer id) {
		return this.getHibernateTemplate().get(SoftwareCode.class, id);
	}
	public List<SoftwareCode> findAllCode(){
		return this.getHibernateTemplate().find("from SoftwareCode");
	}
	public List<SoftwareCode> findAllCode(Integer startIndex,Integer limit){
		String query = "from SoftwareCode";
		return this.getHibernateTemplate().executeFind(new PageHibernateCallback<SoftwareCode>(query,null,null,startIndex,limit));
	}
	public List<SoftwareCode> findCodeByDid(Integer did) {
		String query = "from SoftwareCode where did = ?";
		List<SoftwareCode> list = this.getHibernateTemplate().find(query, did);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}
	public List<SoftwareCode> findAllCodeByDid(Integer did,Integer startIndex,Integer limit){
		String query = "from SoftwareCode where did = :did";
		return this.getHibernateTemplate().executeFind(new PageHibernateCallback<SoftwareCode>(query,new Object[] {did},new String[] {"did"},startIndex,limit));
	}
	public Dean findDeanByName(String name) {
		String query = "from Dean where name = ?";
		List<Dean> dean = this.getHibernateTemplate().find(query, name);
		if(dean!=null&&dean.size()>0) {
			return dean.get(0);
		}
		return null;
	}
}
