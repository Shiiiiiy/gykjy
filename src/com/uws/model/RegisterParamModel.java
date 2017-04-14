package com.uws.model;

import java.io.Serializable;
import java.util.Date;
/**
 * 注册传参实体
 * @author hejin
 *
 */
public class RegisterParamModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3736504317369585641L;
	//id
	private String ID;
	
	//个人用户id
	private String personId;
	
	//企业信息id
	private String companyId;
	
	//机构信息id
	private String institutionId;
	
	/**----------------------G_USER------------------**/
	//用户名
	private String USERNAME;
	
	//用户密码
	private String PASSWORD;
	
	//用户类型
	private String USERTYPE;
	
	//用户头像
	private String IMAGE;	//所有用户都有的头像
	
	/**----------------------G_USER------------------**/
	
	
	/**----------------------PERSON------------------**/
	
	//个人用户真实姓名
	private String NAME;
	
	//个人用户性别
	private String GENDER;
	
	//个人用户手机
	private String TEL;
	
	//个人用户座机
    private String PHONE;
		
    //个人用户联系邮箱
    private String EMAIL;
    
    //个人用户证件类型
    private String CARDTYPE;
    
    
    //个人用户证件号码
    private String CARDNUM;
    
    //个人用户所在省
    private String ADD_PROVINCE;
    
    //个人用户所在市
    private String ADD_CITY;
		
    //个人用户所在县区
    private String ADD_AREA;	
		
    //个人用户通讯地址
    private String LINK_ADDRESS;
    

    
    
    /**----------------------PERSON------------------**/
    
    /**----------------------COMPANY------------------**/
    //企业名称
    private String CP_NAME;
    
    //企业联系人
    private String CP_LINKMAN;
    
    //企业联系人邮箱
    private String CP_LINKEMAIL;
    
    //企业联系人手机号
    private String CP_LINKTEL;
    
    //企业座机号
    private String CP_PHONE;
    
    //企业组织机构代码
    private String CP_ORGCODE;
    
    //企业社会信用代码
    private String CP_SOCIALCODE;
    
    //企业所在地
    private String CP_LOCATION;
    
    //企业注册地（省）
    private String CP_PROVINCE;
    
    //企业注册地（市）
    private String CP_CITY;
    
    //企业注册地（区）
    private String CP_AREA;
    
    
    /**----------------------COMPANY------------------**/
    
    /**----------------------INSTITUTION------------------**/
    //机构名称
    private String NAME_IN;
    
    //机构联系人
    private String LINKMAN;
    
    //机构座机
    private String PHONE_IN;
    
    //联系人手机号
    private String TEL_IN;
    
    //联系人邮箱
    private String EMAIL_IN;
    
    //组织机构代码
    private String ORGCODE;
    
    //社会信用代码
    private String SOCIALCODE;
    
    //所在地
    private String ADDRESS;
    
    //注册地（省）
    private String PROVINCE;
    
    //注册地（市）
    private String CITY;
    
    //注册地（县/区）
    private String AREA;
    
    
    /**----------------------INSTITUTION------------------**/
	
	//创建时间
	private Date CREATETIME;
	
	//修改时间
	private Date UPDATETIME;

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getPersonId() {
		return personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getInstitutionId() {
		return institutionId;
	}

	public void setInstitutionId(String institutionId) {
		this.institutionId = institutionId;
	}

	public String getUSERNAME() {
		return USERNAME;
	}

	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}

	public String getPASSWORD() {
		return PASSWORD;
	}

	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}

	public String getUSERTYPE() {
		return USERTYPE;
	}

	public void setUSERTYPE(String uSERTYPE) {
		USERTYPE = uSERTYPE;
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

	public String getTEL() {
		return TEL;
	}

	public void setTEL(String tEL) {
		TEL = tEL;
	}

	public String getPHONE() {
		return PHONE;
	}

	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getCARDTYPE() {
		return CARDTYPE;
	}

	public void setCARDTYPE(String cARDTYPE) {
		CARDTYPE = cARDTYPE;
	}

	public String getCARDNUM() {
		return CARDNUM;
	}

	public void setCARDNUM(String cARDNUM) {
		CARDNUM = cARDNUM;
	}

	public String getADD_PROVINCE() {
		return ADD_PROVINCE;
	}

	public void setADD_PROVINCE(String aDD_PROVINCE) {
		ADD_PROVINCE = aDD_PROVINCE;
	}

	public String getADD_CITY() {
		return ADD_CITY;
	}

	public void setADD_CITY(String aDD_CITY) {
		ADD_CITY = aDD_CITY;
	}

	public String getADD_AREA() {
		return ADD_AREA;
	}

	public void setADD_AREA(String aDD_AREA) {
		ADD_AREA = aDD_AREA;
	}

	public String getLINK_ADDRESS() {
		return LINK_ADDRESS;
	}

	public void setLINK_ADDRESS(String lINK_ADDRESS) {
		LINK_ADDRESS = lINK_ADDRESS;
	}

	
	

	public String getCP_NAME() {
		return CP_NAME;
	}

	public void setCP_NAME(String cP_NAME) {
		CP_NAME = cP_NAME;
	}

	public String getCP_LINKMAN() {
		return CP_LINKMAN;
	}

	public void setCP_LINKMAN(String cP_LINKMAN) {
		CP_LINKMAN = cP_LINKMAN;
	}

	public String getCP_LINKEMAIL() {
		return CP_LINKEMAIL;
	}

	public void setCP_LINKEMAIL(String cP_LINKEMAIL) {
		CP_LINKEMAIL = cP_LINKEMAIL;
	}

	public String getCP_LINKTEL() {
		return CP_LINKTEL;
	}

	public void setCP_LINKTEL(String cP_LINKTEL) {
		CP_LINKTEL = cP_LINKTEL;
	}

	public String getCP_PHONE() {
		return CP_PHONE;
	}

	public void setCP_PHONE(String cP_PHONE) {
		CP_PHONE = cP_PHONE;
	}

	public String getCP_ORGCODE() {
		return CP_ORGCODE;
	}

	public void setCP_ORGCODE(String cP_ORGCODE) {
		CP_ORGCODE = cP_ORGCODE;
	}

	public String getCP_SOCIALCODE() {
		return CP_SOCIALCODE;
	}

	public void setCP_SOCIALCODE(String cP_SOCIALCODE) {
		CP_SOCIALCODE = cP_SOCIALCODE;
	}

	public String getCP_LOCATION() {
		return CP_LOCATION;
	}

	public void setCP_LOCATION(String cP_LOCATION) {
		CP_LOCATION = cP_LOCATION;
	}

	public String getCP_PROVINCE() {
		return CP_PROVINCE;
	}

	public void setCP_PROVINCE(String cP_PROVINCE) {
		CP_PROVINCE = cP_PROVINCE;
	}

	public String getCP_CITY() {
		return CP_CITY;
	}

	public void setCP_CITY(String cP_CITY) {
		CP_CITY = cP_CITY;
	}

	public String getCP_AREA() {
		return CP_AREA;
	}

	public void setCP_AREA(String cP_AREA) {
		CP_AREA = cP_AREA;
	}

	public String getNAME_IN() {
		return NAME_IN;
	}

	public void setNAME_IN(String nAME_IN) {
		NAME_IN = nAME_IN;
	}

	public String getLINKMAN() {
		return LINKMAN;
	}

	public void setLINKMAN(String lINKMAN) {
		LINKMAN = lINKMAN;
	}



	public String getPHONE_IN() {
		return PHONE_IN;
	}

	public void setPHONE_IN(String pHONE_IN) {
		PHONE_IN = pHONE_IN;
	}

	public String getTEL_IN() {
		return TEL_IN;
	}

	public void setTEL_IN(String tEL_IN) {
		TEL_IN = tEL_IN;
	}

	public String getEMAIL_IN() {
		return EMAIL_IN;
	}

	public void setEMAIL_IN(String eMAIL_IN) {
		EMAIL_IN = eMAIL_IN;
	}

	public String getORGCODE() {
		return ORGCODE;
	}

	public void setORGCODE(String oRGCODE) {
		ORGCODE = oRGCODE;
	}

	public String getSOCIALCODE() {
		return SOCIALCODE;
	}

	public void setSOCIALCODE(String sOCIALCODE) {
		SOCIALCODE = sOCIALCODE;
	}

	public String getADDRESS() {
		return ADDRESS;
	}

	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}

	public String getPROVINCE() {
		return PROVINCE;
	}

	public void setPROVINCE(String pROVINCE) {
		PROVINCE = pROVINCE;
	}

	public String getCITY() {
		return CITY;
	}

	public void setCITY(String cITY) {
		CITY = cITY;
	}

	public String getAREA() {
		return AREA;
	}

	public void setAREA(String aREA) {
		AREA = aREA;
	}

	public Date getCREATETIME() {
		return CREATETIME;
	}

	public void setCREATETIME(Date cREATETIME) {
		CREATETIME = new Date();
	}

	public Date getUPDATETIME() {
		return UPDATETIME;
	}

	public void setUPDATETIME(Date uPDATETIME) {
		UPDATETIME = new Date();
	}

	public String getIMAGE() {
		return IMAGE;
	}

	public void setIMAGE(String iMAGE) {
		IMAGE = iMAGE;
	}






	
      
}
