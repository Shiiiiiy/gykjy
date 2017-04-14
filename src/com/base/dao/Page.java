package com.base.dao;

import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;

public class Page {
	
	private long pageSize = 10;//每页显示多少条数据
	
	private long page = 1;//当前页数
	
	private long maxPage = 0;//最大页数
	
	private long dataCount = 0;//数据总共有多少条
	
	private long sIndex = 1;//当前页数据开始的条数
	
	private long eIndex = 10;//当前页数据结束的条数
	
	private List<Map> list = null;
	
	private String sql;
	
	
	/**分页构造函数
	* @param sql 包含筛选条件的sql，但不包含分页相关约束，如mysql的limit
	* @param currentPage 当前页
	* @param numPerPage 每页记录数
	* @param jTemplate JdbcTemplate实例
	*/
	public Page(String sql,Object[] paramAry,int pageNum,int pageSize,long dataCount){
		//设置每页显示记录数
		this.pageSize = pageSize;
		//设置要显示的页数
		this.page = pageNum;
		this.sIndex = (this.page-1)*this.getPageSize()+1;
		this.eIndex = this.page*this.pageSize;
		if(eIndex>this.dataCount){
			this.eIndex = dataCount;
		}
		if((this.dataCount % this.pageSize) ==0){
			this.maxPage = this.dataCount / this.pageSize;
		}else{
			this.maxPage =  this.dataCount / this.pageSize+1;
		}
		StringBuffer sb = new StringBuffer("");
		sb.append(sql);
		sb.append(" limit ");
		sb.append(this.sIndex-1);
		sb.append(",");
		sb.append(this.pageSize);
		this.sql = sb.toString();
	}
	
	public long getPageSize() {
		return pageSize;
	}


	public void setPageSize(long pageSize) {
		this.pageSize = pageSize;
	}


	public long getPage() {
		return page;
	}


	public void setPage(long page) {
		this.page = page;
	}


	public long getMaxPage() {
		return maxPage;
	}


	public void setMaxPage(long maxPage) {
		this.maxPage = maxPage;
	}


	public long getDataCount() {
		return dataCount;
	}


	public void setDataCount(long dataCount) {
		this.dataCount = dataCount;
	}


	public List<Map> getList() {
		return list;
	}


	public void setList(List<Map> list) {
		this.list = list;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}
	
	
	
	
}
