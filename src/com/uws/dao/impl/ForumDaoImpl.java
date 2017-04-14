package com.uws.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.uws.dao.ForumDao;
import com.uws.model.DemandSupplyModel;
import com.uws.model.ProvideSupplyModel;
@Repository
public class ForumDaoImpl implements ForumDao {
	@Resource(name = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	@Override
	public void addDemandSupply(DemandSupplyModel param) {
		//保存到数据库
		StringBuffer sql=new StringBuffer(" INSERT INTO DEMAND_SUPPLY (ID,NAME,DETAIL,START_TIME,LINKMAN,PHONE,TEL,MAIL,CREATE_TIME,UPDATE_TIME )" +
				"VALUES (?,?,?,?,?,?,?,?,?,?) ");
		List<Object> values=new ArrayList<Object>();
		values.add(param.getId());
		values.add(param.getNAME());
		values.add(param.getDETAIL());
		values.add(param.getSTART_TIME());
		values.add(param.getLINKMAN());
		values.add(param.getPHONE());
		values.add(param.getTEL());
		values.add(param.getMAIL());
		values.add(new Date());	
		values.add(new Date());	
		jdbcTemplate.update(sql.toString(), values.toArray());
	}
	@Override
	public Map<String, Object> getDemandSupplyById(String id) {
		Map<String, Object> map=new HashMap<String, Object>();
		List<Object> values=new ArrayList<Object>();
		StringBuffer sql=new StringBuffer(" SELECT * FROM DEMAND_SUPPLY N WHERE 1=1 ");
		if("".endsWith(id)){return map;}
		sql.append(" AND N.ID = ? ");
		values.add(id);
		sql.append(" ORDER BY N.CREATE_TIME DESC ");
		try{map = jdbcTemplate.queryForMap(sql.toString(),values.toArray());
		}catch (Exception e) {}
		return map;
	}
	@Override
	public void addProvideSupply(ProvideSupplyModel param) {
		//保存到数据库
		StringBuffer sql=new StringBuffer(" INSERT INTO PROVIDE_SUPPLY (ID,NAME,DETAIL,START_TIME,LINKMAN,PHONE,TEL,MAIL,CREATE_TIME,UPDATE_TIME )" +
				"VALUES (?,?,?,?,?,?,?,?,?,?) ");
		List<Object> values=new ArrayList<Object>();
		values.add(param.getId());
		values.add(param.getNAME());
		values.add(param.getDETAIL());
		values.add(param.getSTART_TIME());
		values.add(param.getLINKMAN());
		values.add(param.getPHONE());
		values.add(param.getTEL());
		values.add(param.getMAIL());
		values.add(new Date());	
		values.add(new Date());	
		jdbcTemplate.update(sql.toString(), values.toArray());
	}
	@Override
	public Map<String, Object> getProvideSupplyById(String id) {
		Map<String, Object> map=new HashMap<String, Object>();
		List<Object> values=new ArrayList<Object>();
		StringBuffer sql=new StringBuffer(" SELECT * FROM PROVIDE_SUPPLY N WHERE 1=1 ");
		if("".endsWith(id)){return map;}
		sql.append(" AND N.ID = ? ");
		values.add(id);
		sql.append(" ORDER BY N.CREATE_TIME DESC ");
		try{map = jdbcTemplate.queryForMap(sql.toString(),values.toArray());
		}catch (Exception e) {}
		return map;
	}
}
