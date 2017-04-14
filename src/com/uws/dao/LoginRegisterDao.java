package com.uws.dao;
import java.util.*;

import com.uws.model.DemandSupplyModel;
import com.uws.model.ProvideSupplyModel;
import com.uws.model.Recruit;
import com.uws.model.RegisterParamModel;
import com.uws.model.Resume;
/**
 * 注册登录dao接口
 * @author hejin
 *
 */
public interface LoginRegisterDao {
     
	/**
	 * 根据用户名查询用户信息
	 * @param username 用户名
	 * @param usertype 用户类型
	 * @return
	 */
	public Map<String,Object> getUserInfo(String username,String usertype);
	
	/**
	 * 新增用户
	 * @param username 用户名
	 * @param ID 用户id
	 * @param password 密码（加密后的密文）
	 * @param usertype 用户类型
	 */
	public void addUser(String username,String ID,String password,String usertype);
	
	/**
	 * 修改用户密码
	 * @param userId 用户id
	 * @param password
	 */
	public void updateUser(String userId,String password);
	
	/**
	 * 新增个人用户信息
	 * @param param
	 */
	public void addPerson(RegisterParamModel param);
	
	/**
	 * 新增企业信息
	 * @param param
	 */
	public void addCompanyInfo(RegisterParamModel param);
	
	/**
	 * 新增机构信息
	 * @param param
	 */
	public void addInstitution(RegisterParamModel param);

	
	/**
	 * 查询省市区列表
	 * @param parentCode 父编码
	 * @return
	 */
	public List<Map<String, Object>> getAreaList(String parentCode);

	
	/**
	 * 查询所有子节点
	 * @param parentCode 父编码
	 * @return
	 */
	public List<Map<String, Object>> getDicListByParentCode(String parentCode);
	/**
	 * 查询DIC一个实体 通过其CODE
	 * @param Code DIC自身CODE
	 * @return Map<String, Object>
	 */
	public Map<String, Object> getDicOneByCode(String code);
	/**
	 * 查询 用户的信息完善度
	 * @param id 用户id
	 * @return 
	 * */
	public String checkImproveInfo(String id);
	/**
	 * 通过用户ID 查询完整用户 信息
	 * @param id 用户id
	 * @return 
	 * */
	public Map<String, Object> getUserById(String id);
	/**
	 * 通过用户ID 获取用户类型
	 * @param id 用户id
	 * @return 
	 * */
	public String getUserTypeById(String id);
	/**
	 * 通过用户ID 获取用户 相应的招聘信息数目
	 * @param id 用户id
	 * @return 
	 * */
	public String getRecruitNo(String id);
	/**
	 * 通过用户ID 获取用户 相应的简历信息数目
	 * @param id 用户id
	 * @return 
	 * */
	public String getResumeNo(String id);
	/**
	 * 通过用户ID 获取用户 相应的供给信息数目
	 * @param id 用户id
	 * @return 
	 * */
	public String getSupplyNo(String id);
	/**
	 * 通过用户ID 获取用户 相应的需求信息数目
	 * @param id 用户id
	 * @return 
	 * */
	public String getNeedNo(String id);
	/**
	 * 修改指定用户的  密码 
	 * @param id 用户id  password用户原密码   password_new用户新密码
	 * @return  true 修改成功
	 * */
	public String changePwd(String id, String password, String password_new);
	/**
	 * 通过用户ID 查询G_User用户 信息
	 * @param id 用户id
	 * @return 
	 * */
	public Map<String, Object> getG_UserById(String id);
	/**保存 用户简历
	 * @param re 用户简历实体
	 * */
	public String saveResume(Resume re);
	/**获取对应  用户的简历
	 * @param userid 用户的id
	 * */
	public Resume getResumeByUserID(String userid);
	/**获取对应  招聘信息
	 * @param id 招聘信息表id
	 * @return
	 * */
	public Recruit getRecruitByID(String id);
	/**删除 招聘信息
	 * @param id 招聘信息表id
	 * @return
	 * */
	public void deleteRecruitByID(String id);
	/**保存 招聘信息
	 * @param re 招聘实体
	 * @return
	 * */
	public void saveRecruit(Recruit re);
	/**通过用户id获取  用户的招聘信息
	 * @param userid 用户id 
	 * @param pageStart 分页起始值
	 * @param pageSize 分页大小
	 * @return
	 * */
	public List<Map<String, Object>> getRecruitList(String userid,int pageStart, int pageSize);
	
	/**通过用户id获取  用户的需求信息
	 * @param userid 用户id 
	 * @param pageStart 分页起始值
	 * @param pageSize 分页大小
	 * @return
	 * */
	public List<Map<String, Object>> getNeedList(String userid, int pageStart, int pageSize);
	/**获取对应  需求信息
	 * @param id 需求信息表id
	 * @return
	 * */
	public DemandSupplyModel getNeedByID(String id);
	/**删除 需求信息
	 * @param id 需求信息表id
	 * @return
	 * */
	public void deleteNeedByID(String id);
	/**保存 需求信息
	 * @param re 需求实体
	 * @return
	 * */
	public void saveNeed(DemandSupplyModel re);
	/**通过用户id获取  用户的供应信息
	 * @param userid 用户id 
	 * @param pageStart 分页起始值
	 * @param pageSize 分页大小
	 * @return
	 * */
	public List<Map<String, Object>> getSupplyList(String userid, int pageStart, int pageSize);
	/**获取对应  供应信息
	 * @param id 供应信息表id
	 * @return
	 * */
	public ProvideSupplyModel getSupplyByID(String id);
	/**删除 供应信息
	 * @param id 供应信息表id
	 * @return
	 * */
	public void deleteSupplyByID(String id);
	/**保存 供应信息
	 * @param re 供应实体
	 * @return
	 * */
	public void saveSupply(ProvideSupplyModel re);
	/**
	 * 个人用户-信息-保存
	 *  @param pa 用户实体
	 *  @param type 基本信息、详细信息
	 * */
	public void savePersonInfo(RegisterParamModel pa, int type);
	/**
	 * 通过DIC表id 返回该对象所有字典表
	 *  @param dic_id DIC表id
	 * */
	public List<Map<String, Object>> getAreaListByID(String dic_id);
	/**
	 * 通过DIC表id 返回DIC对象
	 *  @param dic_id DIC表id
	 * */
	public Map<String, Object> getDicByID(String dic_id);
	/**
	 * 企业用户-信息-保存
	 *  @param pa 用户实体
	 *  @param tpye 基本信息、详细信息
	 * */
	public void saveCompanyInfo(RegisterParamModel pa, int type);
	/**
	 * 机构用户-信息-保存
	 *  @param pa 用户实体
	 *  @param tpye 基本信息、详细信息
	 * */
	public void saveInstitutionInfo(RegisterParamModel pa, int type);
	/**
	 * 用户基本信息1 修改用户头像
	 *  @param id 用户id
	 *  @param imgname 用户头像
	 * */
	public boolean changeUserImg(String id, String imgname);
	/**
	 *  修改简历头像
	 *  @param id 用户id
	 *  @param imgname 用户简历头像
	 * */
	public boolean changeResumeImg(String id, String imgname);
	/**
	 *  获取用户简历
	 *  @param id 用户简历id
	 * */
	public Map<String, Object> getResumeMapByUserID(String id);
	/**
	 * 获取上一条招聘信息
	 * @param id 招聘表id
	 * */
	public Map<String, Object> getNextRecruitByID(String id);
	/**
	 * 获取下一条招聘信息
	 * @param id 招聘表id
	 * */
	public Map<String, Object> getPreRecruitByID(String id);
}
