package com.uws.model;
import com.base.model.BaseModel;
/**
 * 招聘信息  实体
 * @author wangjun
 *
 */
public class Recruit extends BaseModel{
	private static final long serialVersionUID = 3333527058590020262L;
	/**用户ID*/ 
	private String USER_ID  ;
	/**岗位名称*/ 
	private String JOB_NAME  ;
	/**薪酬福利*/ 
	private String SALARY  ;
	/**工作性质*/ 
	private String WORK_PROPERTY  ;
	/**工作地点*/ 
	private String WORK_LOCATION  ;
	/**招聘人数*/ 
	private String NEED_NO  ;
	/**简历投递邮箱*/ 
	private String MAIL  ;
	/**联系人*/ 	
	private String LINK_MAN  ;
	/**电话*/ 	
	private String PHONE  ;
	/**主要职责*/    
	private String DUTY  ;
	/**任职资格要求*/ 
	private String TCONDITION  ;
	/**公司介绍*/    
	private String CP_BRIEF  ;
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getJOB_NAME() {
		return JOB_NAME;
	}
	public void setJOB_NAME(String jOB_NAME) {
		JOB_NAME = jOB_NAME;
	}
	public String getSALARY() {
		return SALARY;
	}
	public void setSALARY(String sALARY) {
		SALARY = sALARY;
	}
	public String getWORK_PROPERTY() {
		return WORK_PROPERTY;
	}
	public void setWORK_PROPERTY(String wORK_PROPERTY) {
		WORK_PROPERTY = wORK_PROPERTY;
	}
	public String getWORK_LOCATION() {
		return WORK_LOCATION;
	}
	public void setWORK_LOCATION(String wORK_LOCATION) {
		WORK_LOCATION = wORK_LOCATION;
	}
	public String getNEED_NO() {
		return NEED_NO;
	}
	public void setNEED_NO(String nEED_NO) {
		NEED_NO = nEED_NO;
	}
	public String getMAIL() {
		return MAIL;
	}
	public void setMAIL(String mAIL) {
		MAIL = mAIL;
	}
	public String getLINK_MAN() {
		return LINK_MAN;
	}
	public void setLINK_MAN(String lINK_MAN) {
		LINK_MAN = lINK_MAN;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getDUTY() {
		return DUTY;
	}
	public void setDUTY(String dUTY) {
		DUTY = dUTY;
	}
	public String getCP_BRIEF() {
		return CP_BRIEF;
	}
	public void setCP_BRIEF(String cP_BRIEF) {
		CP_BRIEF = cP_BRIEF;
	}
	public String getTCONDITION() {
		return TCONDITION;
	}
	public void setTCONDITION(String tCONDITION) {
		TCONDITION = tCONDITION;
	}
}
