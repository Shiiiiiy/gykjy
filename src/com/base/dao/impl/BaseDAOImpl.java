package com.base.dao.impl;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.base.dao.BaseDAO;
import com.base.dao.Page;


@SuppressWarnings("all")
@Repository
public class BaseDAOImpl<T> implements BaseDAO<T> {

	private SessionFactory sessionFactory;
	
	private JdbcTemplate jdbcTemplate;

	
	
	
	
	
	
/*******************************************************************************************Hibernate***********************************************************************************************/	
	public Serializable save(T o) {
		return this.getCurrentSession().save(o);
	}

	public void delete(T o) {
		this.getCurrentSession().delete(o);
	}

	public void update(T o) {
		this.getCurrentSession().update(o);
	}

	public void saveOrUpdate(T o) {
		this.getCurrentSession().saveOrUpdate(o);
	}

	public List<T> find(String hql) {
		return this.getCurrentSession().createQuery(hql).list();
	}

	public List<T> find(String hql, Object[] param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.list();
	}

	public List<T> find(String hql, List<Object> param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.list();
	}

	public List<T> find(String hql, Object[] param, Integer page, Integer rows) {
		if (page == null || page < 1) {
			page = 1;
		}
		if (rows == null || rows < 1) {
			rows = 10;
		}
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}

	public List<T> find(String hql, List<Object> param, Integer page, Integer rows) {
		if (page == null || page < 1) {
			page = 1;
		}
		if (rows == null || rows < 1) {
			rows = 10;
		}
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}

	public T get(Class<T> c, Serializable id) {
		return (T) this.getCurrentSession().get(c, id);
	}

	public T get(String hql, Object[] param) {
		List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			return l.get(0);
		} else {
			return null;
		}
	}

	public T get(String hql, List<Object> param) {
		List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			return l.get(0);
		} else {
			return null;
		}
	}

	public Long count(String hql) {
		return new Long((long)this.getCurrentSession().createQuery(hql).list().size());
	}

	public Long count(String hql, Object[] param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		int size = q.list().size();
		return new Long((long)size);
	}

	public Long count(String hql, List<Object> param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		int size = q.list().size();
		return new Long((long)size);
	}

	public Integer executeHql(String hql) {
		return this.getCurrentSession().createQuery(hql).executeUpdate();
	}

	public Integer executeHql(String hql, Object[] param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.executeUpdate();
	}

	public Integer executeHql(String hql, List<Object> param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.executeUpdate();
	}

	
	
	
/*************************************************************************************************SQL操作***************************************************************************/	
	
	/**
	 * 计算总记录数
	 * @param sql 查询语句SQL
	 * @param paramAry 查询语句SQL的参数
	 */
	public long countDataBySql(String sql,Object[] paramAry){
		//计算总记录数
		StringBuffer totalSQL = new StringBuffer(" SELECT COUNT(*) FROM ( ");
		totalSQL.append(sql);
		totalSQL.append(" ) TOTALTABLE ");
		return jdbcTemplate.queryForLong(totalSQL.toString(),paramAry);
	}

	/**
	 * SQL分页查询
	 * @param sql 查询语句
	 * @param paramAry 查询条件
	 * @param pageNum 页数
	 * @param pageSize 每页大小
	 * @return
	 */
	public Page queryBySql(String sql,Object[] paramAry,int pageNum,int pageSize){
		long countData = this.countDataBySql(sql, paramAry);
		Page page = new Page(sql, paramAry, pageNum, pageSize,countData);
		List list = jdbcTemplate.queryForList(page.getSql(), paramAry, String.class);
		page.setList(list);
		return page;
	}
	
	/**
	 * 批量执行SQL
	 * @param sql
	 * @return
	 */
	public int[] batchUpdateBySql(String[] sql){
		return jdbcTemplate.batchUpdate(sql);
	}
	

	/**
	 * 执行SQL
	 * @param sql
	 */
	public void execute(String sql){
		jdbcTemplate.execute(sql);
	}
	
	
	
	
	
	
	
	
	
	
	
	
/*************************************************************************************************END***************************************************************************/	
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}


	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}		
}