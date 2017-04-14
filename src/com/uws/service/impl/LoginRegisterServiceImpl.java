package com.uws.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.uws.dao.LoginRegisterDao;
import com.uws.model.DemandSupplyModel;
import com.uws.model.ProvideSupplyModel;
import com.uws.model.Recruit;
import com.uws.model.RegisterParamModel;
import com.uws.model.Resume;
import com.uws.service.LoginRegisterService;
import com.uws.util.Util;

/**
 * 注册登录service实现类
 * @author hejin
 *
 */
@Service("loginRegisterService")
public class LoginRegisterServiceImpl implements LoginRegisterService{

	@Resource(name="loginRegisterDao")
	private LoginRegisterDao loginRegisterDao;
	/**
	 * 根据用户名查询用户信息
	 * @param username 用户名
	 * @return Map<String,Object>
	 */
	@Override
	public Map<String, Object> getUserInfo(String username,String usertype) {
		// TODO Auto-generated method stub
		
		return loginRegisterDao.getUserInfo(username,usertype);
	}
	/**
	 * 新增用户
	 * @param username 用户名
	 * @param ID 用户id
	 * @param password 密码（加密后的密文）
	 * @param usertype 用户类型
	 * @return void
	 */
	@Override
	public void addUser(String username, String ID, String password,
			String usertype) {
		// TODO Auto-generated method stub
		loginRegisterDao.addUser(username, ID, password, usertype);
	}
	
	/**
	 * 注册新增用户及相关信息
	 * @param param
	 * @return void
	 */
	@Override
	public void addRegister(RegisterParamModel param){
		
		
		addUser(param.getUSERNAME(), param.getID(), Util.encryptMD5(param.getPASSWORD()),param.getUSERTYPE());
		 
		if("PERSON".equals(param.getUSERTYPE())){
			
			addPerson(param);		
		}else if("COMPANY".equals(param.getUSERTYPE())){
			addCompanyInfo(param);
		}else if("INSTITUTION".equals(param.getUSERTYPE())){
			addInstitution(param);
		}
		
		
		
	}
	
	/**
	 * 修改用户密码
	 * @param userId 用户id
	 * @param password
	 * @return void
	 */
	@Override
	public void updateUser(String userId, String password) {
		// TODO Auto-generated method stub
		loginRegisterDao.updateUser(userId, password);
	}
	/**
	 * 新增个人用户信息
	 * @param param
	 * @return void
	 */
	@Override
	public void addPerson(RegisterParamModel param) {
		// TODO Auto-generated method stub
		loginRegisterDao.addPerson(param);
	}
	/**
	 * 新增企业信息
	 * @param param
	 * @return void
	 */
	@Override
	public void addCompanyInfo(RegisterParamModel param) {
		// TODO Auto-generated method stub
		loginRegisterDao.addCompanyInfo(param);
	}
	/**
	 * 新增机构信息
	 * @param param
	 * @return void
	 */
	@Override
	public void addInstitution(RegisterParamModel param) {
		// TODO Auto-generated method stub
		loginRegisterDao.addInstitution(param);
	}
	/**
	 * 查询省市区列表
	 * @param parentCode 父编码
	 * @return List<Map<String, Object>>
	 */
	@Override
	public List<Map<String, Object>> getAreaList(String parentCode) {
		// TODO Auto-generated method stub
		return loginRegisterDao.getAreaList(parentCode);
	}
	
	/**
	 * 查询所有子节点
	 * @param parentCode 父编码
	 * @return
	 */
	@Override
	public List<Map<String, Object>> getDicListByParentCode(String parentCode){
		return loginRegisterDao.getDicListByParentCode(parentCode);
	}
	/**
	 * 查询DIC一个实体 通过其CODE
	 * @param Code DIC自身CODE
	 * @return Map<String, Object>
	 */
	@Override
	public Map<String, Object> getDicOneByCode(String Code) {
		return loginRegisterDao.getDicOneByCode(Code);
	}
	/**
	 * 查询 用户的信息完善度
	 * @param id 用户id
	 * @return 
	 * */
	@Override
	public String checkImproveInfo(String id) {
		return loginRegisterDao.checkImproveInfo(id);
	}
	/**
	 * 通过用户ID 查询完整用户 信息
	 * @param id 用户id
	 * @return 
	 * */
	@Override
	public Map<String, Object> getUserById(String id) {
		return loginRegisterDao.getUserById(id);
	}
	/**
	 * 通过用户ID 获取用户类型
	 * @param id 用户id
	 * @return 
	 * */
	@Override
	public String getUserTypeById(String id) {
		return loginRegisterDao.getUserTypeById(id);
	}
	/**
	 * 通过用户ID 获取用户 相应的招聘信息数目
	 * @param id 用户id
	 * @return 
	 * */
	@Override
	public String getRecruitNo(String id) {
		return loginRegisterDao.getRecruitNo(id);
	}
	/**
	 * 通过用户ID 获取用户 相应的简历信息数目
	 * @param id 用户id
	 * @return 
	 * */
	@Override
	public String getResumeNo(String id) {
		return loginRegisterDao.getResumeNo(id);
	}
	/**
	 * 通过用户ID 获取用户 相应的供给信息数目
	 * @param id 用户id
	 * @return 
	 * */
	@Override
	public String getSupplyNo(String id) {
		return loginRegisterDao.getSupplyNo(id);
	}
	/**
	 * 通过用户ID 获取用户 相应的需求信息数目
	 * @param id 用户id
	 * @return 
	 * */
	@Override
	public String getNeedNo(String id) {
		return loginRegisterDao.getNeedNo(id);
	}
	/**
	 * 修改指定用户的  密码 
	 * @param id 用户id  password用户原密码   password_new用户新密码
	 * @return  true 修改成功
	 * */
	@Override
	public String changePwd(String id, String password, String password_new) {
		return loginRegisterDao.changePwd(id,password,password_new);
	}
	/**
	 * 通过用户ID 查询G_User用户 信息
	 * @param id 用户id
	 * @return 
	 * */
	@Override
	public Map<String, Object> getG_UserById(String id) {
		return loginRegisterDao.getG_UserById(id);
	}
	/**保存 用户简历
	 * @param re 用户简历实体
	 * */
	@Override
	public String saveResume(Resume re) {
		return loginRegisterDao.saveResume(re);
	}
	/**获取对应  用户的简历
	 * @param userid 用户的id
	 * */
	@Override
	public Resume getResumeByUserID(String userid) {
		return loginRegisterDao.getResumeByUserID(userid);
	}
	/**获取对应  招聘信息
	 * @param id 招聘信息表id
	 * @return
	 * */
	@Override
	public Recruit getRecruitByID(String id) {
		return loginRegisterDao.getRecruitByID(id);
	}
	/**删除 招聘信息
	 * @param id 招聘信息表id
	 * @return
	 * */
	@Override
	public void deleteRecruitByID(String id) {
		loginRegisterDao.deleteRecruitByID(id);
	}
	/**保存 招聘信息
	 * @param re 招聘实体
	 * @return
	 * */
	@Override
	public void saveRecruit(Recruit re) {
		loginRegisterDao.saveRecruit(re);
	}
	/**通过用户id获取  用户的招聘信息
	 * @param userid 用户id 
	 * @param pageStart 分页起始值
	 * @param pageSize 分页大小
	 * @return
	 * */
	@Override
	public List<Map<String, Object>> getRecruitList(String userid,
			int pageStart, int pageSize) {
		return loginRegisterDao.getRecruitList(userid,pageStart,pageSize);
	}
	/**通过用户id获取  用户的需求信息
	 * @param userid 用户id 
	 * @param pageStart 分页起始值
	 * @param pageSize 分页大小
	 * @return
	 * */
	@Override
	public List<Map<String, Object>> getNeedList(String userid, int pageStart,
			int pageSize) {
		return loginRegisterDao.getNeedList(userid,pageStart,pageSize);
	}
	/**获取对应  需求信息
	 * @param id 需求信息表id
	 * @return
	 * */
	@Override
	public DemandSupplyModel getNeedByID(String id) {
		return loginRegisterDao.getNeedByID(id);
	}
	/**删除 需求信息
	 * @param id 需求信息表id
	 * @return
	 * */
	@Override
	public void deleteNeedByID(String id) {
		loginRegisterDao.deleteNeedByID(id);
		
	}
	/**保存 需求信息
	 * @param re 需求实体
	 * @return
	 * */
	@Override
	public void saveNeed(DemandSupplyModel re) {
		loginRegisterDao.saveNeed(re);
		
	}
	/**通过用户id获取  用户的供应信息
	 * @param userid 用户id 
	 * @param pageStart 分页起始值
	 * @param pageSize 分页大小
	 * @return
	 * */
	@Override
	public List<Map<String, Object>> getSupplyList(String userid,
			int pageStart, int pageSize) {
		return loginRegisterDao.getSupplyList(userid,pageStart,pageSize);
	}
	/**获取对应  供应信息
	 * @param id 供应信息表id
	 * @return
	 * */
	@Override
	public ProvideSupplyModel getSupplyByID(String id) {
		return loginRegisterDao.getSupplyByID(id);
	}
	/**删除 供应信息
	 * @param id 供应信息表id
	 * @return
	 * */
	@Override
	public void deleteSupplyByID(String id) {
		loginRegisterDao.deleteSupplyByID(id);
		
	}
	/**保存 供应信息
	 * @param re 供应实体
	 * @return
	 * */
	@Override
	public void saveSupply(ProvideSupplyModel re) {
		loginRegisterDao.saveSupply(re);
	}
	/**
	 * 个人用户-信息-保存
	 *  @param pa 用户实体
	 *  @param type 基本信息、详细信息
	 * */
	@Override
	public void savePersonInfo(RegisterParamModel pa, int type) {
		loginRegisterDao.savePersonInfo(pa,type);
	}
	/**
	 * 通过DIC表id 返回该对象所有字典表
	 *  @param dic_id DIC表id
	 * */
	@Override
	public List<Map<String, Object>> getAreaListByID(String dic_id) {
		return loginRegisterDao.getAreaListByID(dic_id);
	}
	/**
	 * 通过DIC表id 返回DIC对象
	 *  @param dic_id DIC表id
	 * */
	@Override
	public Map<String, Object> getDicByID(String dic_id) {
		return loginRegisterDao.getDicByID(dic_id);
	}
	/**
	 * 企业用户-信息-保存
	 *  @param pa 用户实体
	 *  @param tpye 基本信息、详细信息
	 * */
	@Override
	public void saveCompanyInfo(RegisterParamModel pa, int type) {
		loginRegisterDao.saveCompanyInfo(pa,type);
	}
	/**
	 * 机构用户-信息-保存
	 *  @param pa 用户实体
	 *  @param tpye 基本信息、详细信息
	 * */
	@Override
	public void saveInstitutionInfo(RegisterParamModel pa, int type) {
		loginRegisterDao.saveInstitutionInfo(pa,type);
	}
	/**
	 * 用户基本信息1 修改用户头像
	 *  @param id 用户id
	 *  @param imgname 用户头像
	 * */
	@Override
	public boolean changeUserImg(String id, String imgname) {
		return loginRegisterDao.changeUserImg(id,imgname);
	}
	/**
	 *  修改简历头像
	 *  @param id 用户id
	 *  @param imgname 用户简历头像
	 * */
	@Override
	public boolean changeResumeImg(String id, String imgname) {
		return loginRegisterDao.changeResumeImg(id,imgname);
	}
	/**
	 *  获取用户简历
	 *  @param id 用户简历id
	 * */
	@Override
	public Map<String, Object> getResumeMapByUserID(String id) {
		return loginRegisterDao.getResumeMapByUserID(id);
	}
	/**
	 * 获取上一条招聘信息
	 * @param id 招聘表id
	 * */
	@Override
	public Map<String, Object> getPreRecruitByID(String id) {
		return loginRegisterDao.getPreRecruitByID(id);
	}
	/**
	 * 获取下一条招聘信息
	 * @param id 招聘表id
	 * */
	@Override
	public Map<String, Object> getNextRecruitByID(String id) {
		return loginRegisterDao.getNextRecruitByID(id);
	}

}
