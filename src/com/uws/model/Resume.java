package com.uws.model;
import com.base.model.BaseModel;
/**
 * 用户简历 实体
 * @author wangjun
 *
 */
public class Resume extends BaseModel{
	private static final long serialVersionUID = 7678836033100423265L;
	/**用户ID  */
	private String USER_ID ;
	/**姓名  */
	private String NAME ;
	/**性别  */
	private String GENDER ;
	/**名族  */
	private String NATION ;
	/**出生年月  */
	private String BIRTHDAY ;
	/**教育程度  */
	private String EDUCATION_LEVEL ;
	/**毕业院校  */
	private String SCHOOL ;
	/**专业  */
	private String MAJOR ;
	/**毕业时间  */
	private String GRADUATION ;
	/**外语水平  */
	private String LANGUAGE_LEVEL ;
	/**婚姻状况  */
	private String MARRY ;
	/**现所在城市  */
	private String LIVECITY ;
	/**户口所在地  */
	private String HOUSEHOLD ;
	/**证件类型  */
	private String CERTIFICATE_TYPE ;
	/**证件号码  */
	private String CERTIFICATE_NO ;
	/**求职意向  */
	private String JOB_INTENSION ;
	/**期望薪酬  */
	private String SALARY ;
	/**邮箱  */
	private String MAIL ;
	/**电话  */
	private String PHONE ;
	/**教育背景  */
	private String EDUCATION_BG ;
	/**工作经历  */
	private String WORK_EXP ;
	/**专业技能  */
	private String SKILL ;
	/**项目经验  */
	private String PROJECT_EXP ;
	/**爱好专长自我评价  */
	private String HOBBY ;
	/**简历头像  */
	private String RESUME_IMAGE ;
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getGENDER() {
		return GENDER;
	}
	public void setGENDER(String gENDER) {
		GENDER = gENDER;
	}
	public String getNATION() {
		return NATION;
	}
	public void setNATION(String nATION) {
		NATION = nATION;
	}
	public String getBIRTHDAY() {
		return BIRTHDAY;
	}
	public void setBIRTHDAY(String bIRTHDAY) {
		BIRTHDAY = bIRTHDAY;
	}
	public String getEDUCATION_LEVEL() {
		return EDUCATION_LEVEL;
	}
	public void setEDUCATION_LEVEL(String eDUCATION_LEVEL) {
		EDUCATION_LEVEL = eDUCATION_LEVEL;
	}
	public String getSCHOOL() {
		return SCHOOL;
	}
	public void setSCHOOL(String sCHOOL) {
		SCHOOL = sCHOOL;
	}
	public String getMAJOR() {
		return MAJOR;
	}
	public void setMAJOR(String mAJOR) {
		MAJOR = mAJOR;
	}
	public String getGRADUATION() {
		return GRADUATION;
	}
	public void setGRADUATION(String gRADUATION) {
		GRADUATION = gRADUATION;
	}
	public String getLANGUAGE_LEVEL() {
		return LANGUAGE_LEVEL;
	}
	public void setLANGUAGE_LEVEL(String lANGUAGE_LEVEL) {
		LANGUAGE_LEVEL = lANGUAGE_LEVEL;
	}
	public String getMARRY() {
		return MARRY;
	}
	public void setMARRY(String mARRY) {
		MARRY = mARRY;
	}
	public String getLIVECITY() {
		return LIVECITY;
	}
	public void setLIVECITY(String lIVECITY) {
		LIVECITY = lIVECITY;
	}
	public String getHOUSEHOLD() {
		return HOUSEHOLD;
	}
	public void setHOUSEHOLD(String hOUSEHOLD) {
		HOUSEHOLD = hOUSEHOLD;
	}
	public String getCERTIFICATE_TYPE() {
		return CERTIFICATE_TYPE;
	}
	public void setCERTIFICATE_TYPE(String cERTIFICATE_TYPE) {
		CERTIFICATE_TYPE = cERTIFICATE_TYPE;
	}
	public String getCERTIFICATE_NO() {
		return CERTIFICATE_NO;
	}
	public void setCERTIFICATE_NO(String cERTIFICATE_NO) {
		CERTIFICATE_NO = cERTIFICATE_NO;
	}
	public String getJOB_INTENSION() {
		return JOB_INTENSION;
	}
	public void setJOB_INTENSION(String jOB_INTENSION) {
		JOB_INTENSION = jOB_INTENSION;
	}
	public String getSALARY() {
		return SALARY;
	}
	public void setSALARY(String sALARY) {
		SALARY = sALARY;
	}
	public String getMAIL() {
		return MAIL;
	}
	public void setMAIL(String mAIL) {
		MAIL = mAIL;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getEDUCATION_BG() {
		return EDUCATION_BG;
	}
	public void setEDUCATION_BG(String eDUCATION_BG) {
		EDUCATION_BG = eDUCATION_BG;
	}
	public String getWORK_EXP() {
		return WORK_EXP;
	}
	public void setWORK_EXP(String wORK_EXP) {
		WORK_EXP = wORK_EXP;
	}
	public String getSKILL() {
		return SKILL;
	}
	public void setSKILL(String sKILL) {
		SKILL = sKILL;
	}
	public String getPROJECT_EXP() {
		return PROJECT_EXP;
	}
	public void setPROJECT_EXP(String pROJECT_EXP) {
		PROJECT_EXP = pROJECT_EXP;
	}
	public String getHOBBY() {
		return HOBBY;
	}
	public void setHOBBY(String hOBBY) {
		HOBBY = hOBBY;
	}
	public String getRESUME_IMAGE() {
		return RESUME_IMAGE;
	}
	public void setRESUME_IMAGE(String rESUME_IMAGE) {
		RESUME_IMAGE = rESUME_IMAGE;
	}

	
}
