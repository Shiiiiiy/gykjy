package com.uws.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.metamodel.relational.Size;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.base.model.BaseModel;
import com.uws.dao.LoginRegisterDao;
import com.uws.model.DemandSupplyModel;
import com.uws.model.ProvideSupplyModel;
import com.uws.model.Recruit;
import com.uws.model.RegisterParamModel;
import com.uws.model.Resume;
import com.uws.util.Constants;
import com.uws.util.Util;

/**
 * 注册登录dao实现类
 * @author hejin
 *
 */
@Repository("loginRegisterDao")
public class LoginRegisterDaoImpl extends BaseDAOImpl implements LoginRegisterDao{

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * 根据用户名查询用户信息
	 * @param username 用户名
	 * @param usertype 用户类型
	 * @return
	 */
	@Override
	public Map<String, Object> getUserInfo(String username,String usertype) {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer(" SELECT * FROM G_USER N WHERE 1=1 ");
		List<Object> values=new ArrayList<Object>();
		//2期
		sql.append(" AND N.STATUS = ? ");
		values.add(Constants.GYMANAGER_ENABLE);
		//
		if(!"".equals(usertype) && usertype!=null ){
			sql.append(" AND N.USERTYPE=? ");
			values.add(usertype);
		}
		
		if(!"".equals(username) && username!=null ){
			sql.append(" AND N.USERNAME=? ");
			values.add(username);
		}else{
			return null;
		}
		List<Map<String, Object>> list=jdbcTemplate.queryForList(sql.toString(),values.toArray());
		
		return (list!=null && list.size()>0)?list.get(0):null;
	}

	/**
	 * 新增用户
	 * @param username 用户名
	 * @param ID 用户id
	 * @param password 密码（加密后的密文）
	 * @param usertype 用户类型
	 */
	@Override
	public void addUser(String username,String ID, String password, String usertype) {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer(" INSERT INTO G_USER (ID,USERNAME,PASSWORD,USERTYPE,CREATETIME,UPDATETIME,STATUS) VALUES (?,?,?,?,?,?,?) ");
		List<Object> values=new ArrayList<Object>();

		
		if(!"".equals(ID) && ID!=null ){
			values.add(ID);
		}
		if(!"".equals(username) && username!=null ){
			values.add(username);
		}
		if(!"".equals(password) && password!=null ){
			values.add(password);
		}
		
		if(!"".equals(usertype) && usertype!=null ){
			values.add(usertype);
		}
		values.add(new Date());
		values.add(new Date());
		values.add(Constants.GYMANAGER_ENABLE);
		jdbcTemplate.update(sql.toString(), values.toArray());
		
	}

	/**
	 * 修改用户密码
	 * @param userId 用户id
	 * @param password
	 */
	@Override
	public void updateUser(String userId, String password) {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer(" UPDATE  G_USER SET PASSWORD=?,UPDATETIME=? WHERE 1=1 ");
		List<Object> values=new ArrayList<Object>();
		if(!"".equals(userId) && userId!=null && !"".equals(password) && password!=null ){
			
			sql.append(" AND ID=? ");
			values.add(password);
			values.add(new Date());
			values.add(userId);
			jdbcTemplate.update(sql.toString(), values.toArray());
		}else{
			return ;
		}
		
		
	}

	/**
	 * 新增个人用户信息
	 * @param param
	 */
	@Override
	public void addPerson(RegisterParamModel param) {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer(" INSERT INTO PERSON (ID,USERID,NAME,GENDER,TEL,PHONE,EMAIL,CARDTYPE,CARDNUM,ADD_PROVINCE,ADD_CITY,ADD_AREA," +
				"LINK_ADDRESS,CREATETIME,UPDATETIME,STATUS) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");
		List<Object> values=new ArrayList<Object>();
		values.add(param.getPersonId());
		values.add(param.getID());
		values.add(param.getNAME());
		values.add(param.getGENDER());
		values.add(param.getTEL());
		values.add(param.getPHONE());
		values.add(param.getEMAIL());
		values.add(param.getCARDTYPE());
		values.add(param.getCARDNUM());
		values.add(param.getADD_PROVINCE());
		values.add(param.getADD_CITY());
		values.add(param.getADD_AREA());
		values.add(param.getLINK_ADDRESS());
		values.add(new Date());
		values.add(new Date());
		values.add(Constants.GYMANAGER_ENABLE);
		jdbcTemplate.update(sql.toString(), values.toArray());
		
		
		
	}

	/**
	 * 新增企业信息
	 * @param param
	 */
	@Override
	public void addCompanyInfo(RegisterParamModel param) {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer(" INSERT INTO COMPANY_INFO (ID,USERID,CP_NAME,CP_LINKMAN,CP_LINKEMAIL,CP_LINKTEL,CP_PHONE,CP_ORGCODE,CP_SOCIALCODE,CP_LOCATION,CP_PROVINCE,CP_CITY,CP_AREA," +
				"CREATE_TIME,UPDATE_TIME,STATUS,IS_SHOW) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");
		List<Object> values=new ArrayList<Object>(); 
		values.add(param.getCompanyId());
		values.add(param.getID());
		values.add(param.getCP_NAME());
		values.add(param.getCP_LINKMAN());
		values.add(param.getCP_LINKEMAIL());
		values.add(param.getCP_LINKTEL());
		values.add(param.getCP_PHONE());
		values.add(param.getCP_ORGCODE());
		values.add(param.getCP_SOCIALCODE());
		values.add(param.getCP_LOCATION());
		values.add(param.getCP_PROVINCE());
		values.add(param.getCP_CITY());
		values.add(param.getCP_AREA());
		values.add(new Date());
		values.add(new Date());
		values.add(Constants.GYMANAGER_ENABLE);//启用
		values.add(0);//不展示
		jdbcTemplate.update(sql.toString(), values.toArray());
	}

	/**
	 * 新增机构信息
	 * @param param
	 */
	@Override
	public void addInstitution(RegisterParamModel param) {
		// TODO Auto-generated method stub
		StringBuffer sql=new StringBuffer(" INSERT INTO INSTITUTION (ID,USERID,NAME,LINKMAN,PHONE,TEL,EMAIL,ORGCODE,SOCIALCODE,ADDRESS,PROVINCE,CITY,AREA," +
				"CREATETIME,UPDATETIME,STATUS) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");
		List<Object> values=new ArrayList<Object>();
		values.add(param.getInstitutionId());
		values.add(param.getID());
		values.add(param.getNAME_IN());
		values.add(param.getLINKMAN());
		values.add(param.getPHONE_IN());
		values.add(param.getTEL_IN());
		values.add(param.getEMAIL_IN());
		values.add(param.getORGCODE());
		values.add(param.getSOCIALCODE());
		values.add(param.getADDRESS());
		values.add(param.getPROVINCE());
		values.add(param.getCITY());
		values.add(param.getAREA());
		values.add(new Date());
		values.add(new Date());
		values.add(Constants.GYMANAGER_ENABLE);
		jdbcTemplate.update(sql.toString(), values.toArray());
	}

	/**
	 * 查询省市区列表
	 * @param parentCode 父编码
	 * @return
	 */
	@Override
	public List<Map<String,Object>> getAreaList(String parentCode){
		StringBuffer sql=new StringBuffer(" SELECT D.CODE,D.NAME,D.ID FROM DIC D WHERE 1=1 ");
		List<Object> values=new ArrayList<Object>();
		if(!Util.isNull(parentCode)){
			sql.append(" AND D.PARENTCODE=? ");
			
			values.add(parentCode);
			sql.append(" AND D.STATUS =  ? ");
			values.add("1");
			
		}else{
			
			return null;
		}		
		
		return jdbcTemplate.queryForList(sql.toString(),values.toArray());
	}
	
	
	/**
	 * 查询所有子节点
	 * @param parentCode 父编码
	 * @return
	 */
	@Override
	public List<Map<String,Object>> getDicListByParentCode(String parentCode){
		StringBuffer sql=new StringBuffer(" SELECT D.CODE as id,D.NAME as name FROM DIC D WHERE 1=1 ");
		List<Object> values=new ArrayList<Object>();
		if(!Util.isNull(parentCode)){
			sql.append(" AND D.PARENTCODE=? ");
			
			values.add(parentCode);
			sql.append(" AND D.STATUS =  ? ");
			values.add("1");
			
		}else{
			
			return null;
		}		
		
		return jdbcTemplate.queryForList(sql.toString(),values.toArray());
	}
	/**
	 * 查询DIC一个实体 通过其CODE
	 * @param Code DIC自身CODE
	 * @return Map<String, Object>
	 */
	@Override
	public Map<String, Object> getDicOneByCode(String code) {
		StringBuffer sql=new StringBuffer(" SELECT * FROM DIC D WHERE 1=1 ");
		List<Object> values=new ArrayList<Object>();
		if(!Util.isNull(code)){
			sql.append(" AND D.CODE = ? ");
			values.add(code);
			sql.append(" AND D.STATUS =  ? ");
			values.add("1");
		}else{
			return null;
		}
		Map<String, Object> maps=null;
		try {
			List<Map<String, Object>> list=jdbcTemplate.queryForList(sql.toString(),values.toArray());
			if(null!=list && list.size()>=1){  maps=list.get(0); }
		} catch (Exception e) {}
		return maps;
	}
	/**
	 * 查询 用户的信息完善度
	 * @param id 用户id
	 * @return 
	 * */
	@Override
	public String checkImproveInfo(String id) {
		String str="50%";
		Map<String, Object> map=getUserById(id);
		String USERTYPE=getUserTypeById(id);
		if(map==null){return str;}
		if("PERSON".equals(USERTYPE)){//个人用户
			if(!Util.isNull((String)map.get("NAME")) && !Util.isNull((String)map.get("GENDER")) && !Util.isNull((String)map.get("TEL")) && !Util.isNull((String)map.get("PHONE"))
			&& !Util.isNull((String)map.get("EMAIL")) && !Util.isNull((String)map.get("CARDNUM")) && !Util.isNull((String)map.get("LINK_ADDRESS")) && !Util.isNull((String)map.get("ADD_PROVINCE")) 
					){return "80%";}
		}else if("COMPANY".equals(USERTYPE)){//企业用户
			if(!Util.isNull((String)map.get("CP_NAME")) && !Util.isNull((String)map.get("CP_LINKMAN")) && !Util.isNull((String)map.get("CP_LINKEMAIL")) && !Util.isNull((String)map.get("CP_LINKTEL"))
			&& !Util.isNull((String)map.get("CP_PHONE")) && !Util.isNull((String)map.get("CP_ORGCODE")) && !Util.isNull((String)map.get("CP_SOCIALCODE")) && !Util.isNull((String)map.get("CP_LOCATION"))
			&& !Util.isNull((String)map.get("CP_PROVINCE"))
					){return "80%";}
		}else if("INSTITUTION".equals(USERTYPE)){//机构用户
			if(!Util.isNull((String)map.get("NAME")) && !Util.isNull((String)map.get("LINKMAN")) && !Util.isNull((String)map.get("PHONE")) && !Util.isNull((String)map.get("TEL"))
			&& !Util.isNull((String)map.get("EMAIL")) && !Util.isNull((String)map.get("ORGCODE")) && !Util.isNull((String)map.get("SOCIALCODE")) && !Util.isNull((String)map.get("ADDRESS"))
			&& !Util.isNull((String)map.get("PROVINCE"))
					){return "80%";}
		}
		return str;
	}
	/**
	 * 通过用户ID 查询完整用户 信息
	 * @param id 用户id
	 * @return 
	 * */
	@Override
	public Map<String, Object> getUserById(String id) {
		StringBuffer sql=new StringBuffer(" SELECT * FROM G_USER N WHERE 1=1 ");
		List<Object> values=new ArrayList<Object>();
		//2期
		//sql.append(" AND N.STATUS = ? ");
		//values.add(Constants.GYMANAGER_ENABLE);
		//
		if(!"".equals(id) && id!=null ){
			sql.append(" AND N.ID = ? ");
			values.add(id);
		}else{
			return null;
		}
		List<Map<String, Object>> list=jdbcTemplate.queryForList(sql.toString(),values.toArray());
		Map<String, Object> G_USER=list.get(0);
		String USERTYPE=(String) G_USER.get("USERTYPE");
		StringBuffer tsql=new StringBuffer();
		List<Object> tvalue=new ArrayList<Object>();
		if("PERSON".equals(USERTYPE)){//个人用户
			tsql=new StringBuffer(" SELECT * FROM PERSON N WHERE 1=1 ");
			tsql.append(" AND N.USERID = ? ");
			tvalue.add(id);
		}else if("COMPANY".equals(USERTYPE)){//企业用户
			tsql=new StringBuffer(" SELECT * FROM COMPANY_INFO N WHERE 1=1 ");
			tsql.append(" AND N.USERID = ? ");
			tvalue.add(id);
		}else if("INSTITUTION".equals(USERTYPE)){//机构用户
			tsql=new StringBuffer(" SELECT * FROM INSTITUTION N WHERE 1=1 ");
			tsql.append(" AND N.USERID = ? ");
			tvalue.add(id);
		}
		List<Map<String, Object>> ll=jdbcTemplate.queryForList(tsql.toString(),tvalue.toArray());
		return (ll!=null && ll.size()>0)?ll.get(0):null;
	}
	/**
	 * 通过用户ID 获取用户类型
	 * @param id 用户id
	 * @return 
	 * */
	@Override
	public String getUserTypeById(String id) {
		StringBuffer sql=new StringBuffer(" SELECT N.USERTYPE FROM G_USER N WHERE 1=1 ");
		List<Object> values=new ArrayList<Object>();
		if(!"".equals(id) && id!=null ){
			sql.append(" AND N.ID = ? ");
			values.add(id);
		}else{
			return "";
		}
		String str=(String)jdbcTemplate.queryForMap(sql.toString(),values.toArray()).get("USERTYPE");
		return str;
	}
	/**
	 * 通过用户ID 获取用户 相应的招聘信息数目
	 * @param id 用户id
	 * @return 
	 * */
	@Override
	public String getRecruitNo(String id) {
		List<Map<String, Object>> ll=getRecruitList(id, 0, 0);
		if(ll!=null){return ll.size()+"";}
		return "0";
	}
	/**
	 * 通过用户ID 获取用户 相应的简历信息数目
	 * @param id 用户id
	 * @return 
	 * */
	@Override
	public String getResumeNo(String id) {
		Resume re=this.getResumeByUserID(id);
		if(null!=re && !Util.isNull(re.getNAME())){return "1";}
		return "0";
	}
	/**
	 * 通过用户ID 获取用户 相应的供给信息数目
	 * @param id 用户id
	 * @return 
	 * */
	@Override
	public String getSupplyNo(String id) {
		List<Map<String, Object>> ll=getSupplyList(id, 0, 0);
		if(ll!=null){return ll.size()+"";}
		return "0";
	}
	/**
	 * 通过用户ID 获取用户 相应的需求信息数目
	 * @param id 用户id
	 * @return 
	 * */
	@Override
	public String getNeedNo(String id) {
		List<Map<String, Object>> ll=getNeedList(id, 0, 0);
		if(ll!=null){return ll.size()+"";}
		return "0";
	}
	/**
	 * 修改指定用户的  密码 
	 * @param id 用户id  password用户原密码   password_new用户新密码
	 * @return  true 修改成功
	 * */
	@Override
	public String changePwd(String id, String password, String password_new) {
		String bl="false";
		Map<String, Object> map=getG_UserById(id);
		String str=(String) map.get("PASSWORD");
		if(!Util.isNull(password) && str.equals(Util.encryptMD5(password))){//原密码正确
			StringBuffer sql=new StringBuffer(" UPDATE G_USER SET PASSWORD = ? WHERE ID = ? ");
			List<Object> values=new ArrayList<Object>();
			if(!Util.isNull(id) && !Util.isNull(password_new)){
				values.add(Util.encryptMD5(password_new));
				values.add(id);
				jdbcTemplate.update(sql.toString(), values.toArray());
				return "true";
			}
		}
		return bl;
	}
	/**
	 * 通过用户ID 查询G_User用户 信息
	 * @param id 用户id
	 * @return 
	 * */
	@Override
	public Map<String, Object> getG_UserById(String id) {
		StringBuffer sql=new StringBuffer(" SELECT * FROM G_USER N WHERE 1=1 ");
		List<Object> values=new ArrayList<Object>();
		if(!"".equals(id) && id!=null ){
			sql.append(" AND N.ID = ? ");
			values.add(id);
		}else{return null;}
		List<Map<String, Object>> list=jdbcTemplate.queryForList(sql.toString(),values.toArray());
		if(list!=null && list.size()>=1){
			return list.get(0);}
		else{
			return null;
		}
		
	}
	/**保存 用户简历
	 * @param re 用户简历实体
	 * */
	@Override
	public String saveResume(Resume re) {
		String se="false";
		re.setUpdateTime(new Date());
		if(Util.isNull(re.getId())){re.setCreateTime(new Date());}
		try {
			this.saveOrUpdate(re);
			se="true";
		} catch (Exception e) {}
		return se;
	}
	/**获取对应  用户的简历
	 * @param userid 用户的id
	 * */
	@Override
	public Resume getResumeByUserID(String userid) {
		List<String> parm = new ArrayList<String>();
		String hql = " FROM Resume D WHERE D.USER_ID = ? ";
		parm.add(userid);
		List<Resume> list = find(hql,parm.toArray());
		if(list==null || list.size()<=0){return null;}
		return list.get(0);
	}
	/**获取对应  招聘信息
	 * @param id 招聘信息表id
	 * @return
	 * */
	@Override
	public Recruit getRecruitByID(String id) {
		if(Util.isNull(id)){return null;}
		List<String> parm = new ArrayList<String>();
		String hql = " FROM Recruit D WHERE D.id = ? ";
		parm.add(id);
		List<Recruit> list = find(hql,parm.toArray());
		if(list==null || list.size()<=0){return null;}
		return list.get(0);
	}
	/**删除 招聘信息
	 * @param id 招聘信息表id
	 * @return
	 * */
	@Override
	public void deleteRecruitByID(String id) {
		if(Util.isNull(id)){return;}
		delete(getRecruitByID(id));
	}
	/**保存 招聘信息
	 * @param re 招聘实体
	 * @return
	 * */
	@Override
	public void saveRecruit(Recruit re){
		re.setUpdateTime(new Date());
		if(Util.isNull(re.getId())){re.setCreateTime(new Date());}
		try {
			saveOrUpdate(re);
		} catch (Exception e) {}
	}
	/**通过用户id获取  用户的招聘信息
	 * @param userid 用户id 
	 * @param pageStart 分页起始值
	 * @param pageSize 分页大小
	 * @return
	 * */
	@Override
	public List<Map<String, Object>> getRecruitList(String userid,
			int pageStart, int num) {
        StringBuffer sql=new StringBuffer(" SELECT * FROM RECRUIT N WHERE 1=1 ");
        List<Object> values=new ArrayList();
        if(Util.isNull(userid)){return null;}else{
        	sql.append(" AND N.USER_ID = ? ");
        	values.add(userid);
        }
		sql.append(" ORDER BY N.REC_TIME DESC ");
		if(pageStart>=0 && num>0){
			sql.append(" LIMIT ?,? ");
			values.add(pageStart);
			values.add(num);
		}
		List<Map<String,Object>> list=jdbcTemplate.queryForList(sql.toString(), values.toArray());
		return list;
	}
	/**通过用户id获取  用户的需求信息
	 * @param userid 用户id 
	 * @param pageStart 分页起始值
	 * @param pageSize 分页大小
	 * @return
	 * */
	@Override
	public List<Map<String, Object>> getNeedList(String userid, int pageStart,
			int num) {
        StringBuffer sql=new StringBuffer(" SELECT * FROM DEMAND_SUPPLY N WHERE 1=1 ");
        List<Object> values=new ArrayList();
        if(Util.isNull(userid)){return null;}else{
        	sql.append(" AND N.USER_ID = ? ");
        	values.add(userid);
        }
		sql.append(" ORDER BY N.CREATE_TIME DESC ");
		if(pageStart>=0 && num>0){
			sql.append(" LIMIT ?,? ");
			values.add(pageStart);
			values.add(num);
		}
		List<Map<String,Object>> list=jdbcTemplate.queryForList(sql.toString(), values.toArray());
		return list;
	}
	/**获取对应  需求信息
	 * @param id 需求信息表id
	 * @return
	 * */
	@Override
	public DemandSupplyModel getNeedByID(String id) {
		if(Util.isNull(id)){return null;}
		List<String> parm = new ArrayList<String>();
		String hql = " FROM DemandSupplyModel D WHERE D.id = ? ";
		parm.add(id);
		List<DemandSupplyModel> list = find(hql,parm.toArray());
		if(list==null || list.size()<=0){return null;}
		return list.get(0);
	}
	/**删除 需求信息
	 * @param id 需求信息表id
	 * @return
	 * */
	@Override
	public void deleteNeedByID(String id) {
		if(Util.isNull(id)){return;}
		delete(getNeedByID(id));
	}
	/**保存 需求信息
	 * @param re 需求实体
	 * @return
	 * */
	@Override
	public void saveNeed(DemandSupplyModel re) {
		re.setUpdateTime(new Date());
		//2期
		re.setSTATUS(Constants.GYMANAGER_ENABLE+"");
		if(Util.isNull(re.getId())){re.setCreateTime(new Date());}
		try {
			saveOrUpdate(re);
		} catch (Exception e) {}
		
	}
	/**通过用户id获取  用户的供应信息
	 * @param userid 用户id 
	 * @param pageStart 分页起始值
	 * @param pageSize 分页大小
	 * @return
	 * */
	@Override
	public List<Map<String, Object>> getSupplyList(String userid,
			int pageStart, int num) {
        StringBuffer sql=new StringBuffer(" SELECT * FROM PROVIDE_SUPPLY N WHERE 1=1 ");
        List<Object> values=new ArrayList();
        if(Util.isNull(userid)){return null;}else{
        	sql.append(" AND N.USER_ID = ? ");
        	values.add(userid);
        }
		sql.append(" ORDER BY N.CREATE_TIME DESC ");
		if(pageStart>=0 && num>0){
			sql.append(" LIMIT ?,? ");
			values.add(pageStart);
			values.add(num);
		}
		List<Map<String,Object>> list=jdbcTemplate.queryForList(sql.toString(), values.toArray());
		return list;
	}
	/**获取对应  供应信息
	 * @param id 供应信息表id
	 * @return
	 * */
	@Override
	public ProvideSupplyModel getSupplyByID(String id) {
		if(Util.isNull(id)){return null;}
		List<String> parm = new ArrayList<String>();
		String hql = " FROM ProvideSupplyModel D WHERE D.id = ? ";
		parm.add(id);
		List<ProvideSupplyModel> list = find(hql,parm.toArray());
		if(list==null || list.size()<=0){return null;}
		return list.get(0);
	}
	/**删除 供应信息
	 * @param id 供应信息表id
	 * @return
	 * */
	@Override
	public void deleteSupplyByID(String id) {
		if(Util.isNull(id)){return;}
		delete(getSupplyByID(id));
	}
	/**保存 供应信息
	 * @param re 供应实体
	 * @return
	 * */
	@Override
	public void saveSupply(ProvideSupplyModel re) {
		re.setUpdateTime(new Date());
		//2期
		re.setSTATUS(Constants.GYMANAGER_ENABLE+"");
		if(Util.isNull(re.getId())){re.setCreateTime(new Date());}
		try {
			saveOrUpdate(re);
		} catch (Exception e) {}
	}
	/**
	 * 个人用户-信息-保存
	 *  @param pa 用户实体
	 *  @param type 基本信息、详细信息
	 * */
	@Override
	public void savePersonInfo(RegisterParamModel pa, int type) {
		if(1==type){//基本信息
			StringBuffer sql=new StringBuffer(" UPDATE PERSON SET EMAIL = ?,TEL = ?,PHONE = ? WHERE 1=1 AND USERID = ? ");
			List<Object> values=new ArrayList<Object>();
			if(!Util.isNull(pa.getID()) ){
				values.add(pa.getEMAIL());
				values.add(pa.getTEL());
				values.add(pa.getPHONE());
				values.add(pa.getID());
				jdbcTemplate.update(sql.toString(), values.toArray());
			}
		}else if(2==type){//详细信息
			StringBuffer sql=new StringBuffer(" UPDATE PERSON SET NAME = ?,GENDER = ?,CARDTYPE = ?" +
					" ,CARDNUM =? ,ADD_PROVINCE =? ,ADD_CITY =? ,ADD_AREA =? ,LINK_ADDRESS = ?  WHERE 1=1 AND USERID = ? ");
			List<Object> values=new ArrayList<Object>();
			if(!Util.isNull(pa.getID()) ){
				values.add(pa.getNAME());
				values.add(pa.getGENDER());
				values.add(pa.getCARDTYPE());
				values.add(pa.getCARDNUM());
				values.add(pa.getCP_PROVINCE());//注意
				values.add(pa.getCP_CITY());//注意
				values.add(pa.getCP_AREA());//注意
				values.add(pa.getLINK_ADDRESS());
				values.add(pa.getID());//注意
				jdbcTemplate.update(sql.toString(), values.toArray());
			}
		}
	}
	/**
	 * 通过DIC表id 返回该对象所有字典表
	 *  @param dic_id DIC表id
	 * */
	@Override
	public List<Map<String, Object>> getAreaListByID(String dic_id) {
		List<Map<String, Object>> list=null;
		StringBuffer sql=new StringBuffer(" SELECT D.CODE,D.NAME,D.ID FROM DIC D WHERE 1=1 ");
		List<Object> values=new ArrayList<Object>();
		if(!Util.isNull(dic_id)){
			sql.append(" AND D.PARENTCODE=? ");
			if(getDicByID(dic_id)==null){return null;}
			values.add(getDicByID(dic_id).get("CODE"));
			sql.append(" AND D.STATUS =  ? ");
			values.add("1");
			sql.append(" ORDER BY D.CREATETIME DESC ");
			try {list = jdbcTemplate.queryForList(sql.toString(), values.toArray());
		} catch (Exception e) {}}
		return list;
	}
	/**
	 * 通过DIC表id 返回DIC对象
	 *  @param dic_id DIC表id
	 * */
	@Override
	public Map<String, Object> getDicByID(String dic_id) {
		Map<String, Object> list=null;
		StringBuffer sql=new StringBuffer(" SELECT * FROM DIC D WHERE 1=1 ");
		List<Object> values=new ArrayList<Object>();
		if(!Util.isNull(dic_id)){
			sql.append(" AND D.ID=? ");
			values.add(dic_id);
			sql.append(" ORDER BY D.CREATETIME DESC ");
			try {List<Map<String, Object>> ll = jdbcTemplate.queryForList(sql.toString(), values.toArray());
				if(ll!=null){list=ll.get(0);}
			} catch (Exception e) {}
		}
		return list;
	}
	/**
	 * 企业用户-信息-保存
	 *  @param pa 用户实体
	 *  @param tpye 基本信息、详细信息
	 * */
	@Override
	public void saveCompanyInfo(RegisterParamModel pa, int type) {
		if(1==type){//基本信息
			StringBuffer sql=new StringBuffer(" UPDATE COMPANY_INFO SET CP_NAME = ?,CP_LINKMAN = ?,CP_LINKEMAIL = ? WHERE 1=1 AND USERID = ? ");
			List<Object> values=new ArrayList<Object>();
			if(!Util.isNull(pa.getID()) ){
				values.add(pa.getCP_NAME());
				values.add(pa.getCP_LINKMAN());
				values.add(pa.getCP_LINKEMAIL());
				values.add(pa.getID());//重要
				jdbcTemplate.update(sql.toString(), values.toArray());
			}
		}else if(2==type){//详细信息
			StringBuffer sql=new StringBuffer(" UPDATE COMPANY_INFO SET CP_LINKTEL = ?,CP_PHONE = ?,CP_ORGCODE = ?" +
					" ,CP_SOCIALCODE =? ,CP_PROVINCE =? ,CP_CITY =? ,CP_AREA =? ,CP_LOCATION = ?  WHERE 1=1 AND USERID = ? ");
			List<Object> values=new ArrayList<Object>();
			if(!Util.isNull(pa.getID()) ){
				values.add(pa.getCP_LINKTEL());
				values.add(pa.getCP_PHONE());
				values.add(pa.getCP_ORGCODE());
				values.add(pa.getCP_SOCIALCODE());
				values.add(pa.getCP_PROVINCE());//注意
				values.add(pa.getCP_CITY());//注意
				values.add(pa.getCP_AREA());//注意
				values.add(pa.getCP_LOCATION());
				values.add(pa.getID());//注意
				jdbcTemplate.update(sql.toString(), values.toArray());
			}
		}
	}
	/**
	 * 机构用户-信息-保存
	 *  @param pa 用户实体
	 *  @param tpye 基本信息、详细信息
	 * */
	@Override
	public void saveInstitutionInfo(RegisterParamModel pa, int type) {
		if(1==type){//基本信息
			StringBuffer sql=new StringBuffer(" UPDATE INSTITUTION SET NAME = ?,LINKMAN = ?,EMAIL = ? WHERE 1=1 AND USERID = ? ");
			List<Object> values=new ArrayList<Object>();
			if(!Util.isNull(pa.getID()) ){
				values.add(pa.getNAME_IN());
				values.add(pa.getLINKMAN());
				values.add(pa.getEMAIL_IN());
				values.add(pa.getID());//重要
				jdbcTemplate.update(sql.toString(), values.toArray());
			}
		}else if(2==type){//详细信息
			StringBuffer sql=new StringBuffer(" UPDATE INSTITUTION SET TEL = ?,PHONE = ?,ORGCODE = ?" +
					" ,SOCIALCODE =? ,PROVINCE =? ,CITY =? ,AREA =? ,ADDRESS = ?  WHERE 1=1 AND USERID = ? ");
			List<Object> values=new ArrayList<Object>();
			if(!Util.isNull(pa.getID()) ){
				values.add(pa.getTEL_IN());
				values.add(pa.getPHONE_IN());
				values.add(pa.getORGCODE());
				values.add(pa.getSOCIALCODE());
				values.add(pa.getCP_PROVINCE());//注意
				values.add(pa.getCP_CITY());//注意
				values.add(pa.getCP_AREA());//注意
				values.add(pa.getADDRESS());
				values.add(pa.getID());//注意
				jdbcTemplate.update(sql.toString(), values.toArray());
			}
		}
	}
	/**
	 * 用户基本信息1 修改用户头像
	 *  @param id 用户id
	 *  @param imgname 用户头像
	 * */
	@Override
	public boolean changeUserImg(String id, String imgname) {
		boolean bl=false;
		StringBuffer sql=new StringBuffer(" UPDATE  G_USER SET IMAGE = ? WHERE 1=1 ");
		List<Object> values=new ArrayList<Object>();
		if(!Util.isNull(id) && !Util.isNull(imgname) ){
			sql.append(" AND ID = ? ");
			values.add(imgname);
			values.add(id);
			jdbcTemplate.update(sql.toString(), values.toArray());bl=true;
		}
		return bl;
	}
	/**
	 *  修改简历头像
	 *  @param id 用户id
	 *  @param imgname 用户简历头像
	 * */
	@Override
	public boolean changeResumeImg(String id, String imgname) {
		boolean bl=false;
		StringBuffer sql=new StringBuffer(" UPDATE RESUME SET RESUME_IMAGE = ? WHERE 1=1 ");
		List<Object> values=new ArrayList<Object>();
		if(!Util.isNull(id) && !Util.isNull(imgname) ){
			sql.append(" AND USER_ID = ? ");
			values.add(imgname);
			values.add(id);
			jdbcTemplate.update(sql.toString(), values.toArray());bl=true;
		}
		return bl;
	}
	/**
	 *  获取用户简历
	 *  @param id 用户简历id
	 * */
	@Override
	public Map<String, Object> getResumeMapByUserID(String id) {
        StringBuffer sql=new StringBuffer(" SELECT * FROM RESUME N WHERE 1=1 ");
        List<Object> values=new ArrayList();
        if(Util.isNull(id)){return null;}else{
        	sql.append(" AND N.ID = ? ");
        	values.add(id);
        }
		sql.append(" ORDER BY N.REC_TIME DESC ");
		List<Map<String,Object>> list=jdbcTemplate.queryForList(sql.toString(), values.toArray());
		if(null==list||list.size()<=0){return null;}
		return list.get(0);
	}
	/**
	 * 获取下一条招聘信息
	 * @param id 招聘表id
	 * */
	@Override
	public Map<String, Object> getNextRecruitByID(String id) {
		StringBuffer sql=new StringBuffer(" SELECT * FROM RECRUIT N WHERE 1=1 ");
		List<Object> values=new ArrayList<Object>();
		if(!"".equals(id) && id!=null ){
			Recruit newsOne=getRecruitByID(id);
			if(newsOne!=null && newsOne.getCreateTime()!=null){
				sql.append(" AND N.REC_TIME < ? ");
				values.add(newsOne.getCreateTime());
			}
			sql.append(" ORDER BY N.REC_TIME DESC ");
			sql.append(" LIMIT ?,? ");
			values.add(0);
			values.add(1);
			List<Map<String,Object>> list=jdbcTemplate.queryForList(sql.toString(), values.toArray());
			if(list.size()==0){return null;}
			return list.get(0);
		}
		return null;
	}
	/**
	 * 获取上一条招聘信息
	 * @param id 招聘表id
	 * */
	@Override
	public Map<String, Object> getPreRecruitByID(String id) {
		StringBuffer sql=new StringBuffer(" SELECT * FROM RECRUIT N WHERE 1=1 ");
		List<Object> values=new ArrayList<Object>();
		if(!"".equals(id) && id!=null ){
			Recruit newsOne=getRecruitByID(id);
			if(newsOne!=null && newsOne.getCreateTime()!=null){
				sql.append(" AND N.REC_TIME > ? ");
				values.add(newsOne.getCreateTime());
			}
			sql.append(" ORDER BY N.REC_TIME ");
			sql.append(" LIMIT ?,? ");
			values.add(0);
			values.add(1);
			List<Map<String,Object>> list=jdbcTemplate.queryForList(sql.toString(), values.toArray());
			if(list.size()==0){return null;}
			return list.get(0);
		}
		return null;
	}
}
