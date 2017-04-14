package com.uws.model;

import java.io.Serializable;
import java.util.Date;

import com.base.model.BaseModel;
/**
 * 供应 实体
 * @author wangjun
 *
 */
public class ProvideSupplyModel extends BaseModel implements Serializable {
	private static final long serialVersionUID = -5015463927281522020L;
	/**用户id*/
	private String USER_ID;
	/**供应方名称*/
	private String NAME;	
	/**销售内容*/
	private String DETAIL;	
	/**计划销售时间*/
	private String START_TIME;
	/**联系人*/
	private String LINKMAN;	
	/**联系方式*/
	private String PHONE;
	/**手机*/
	private String TEL;
	/**邮箱*/
	private String MAIL;
	/**状态*/
	private String STATUS;
	
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
	public String getDETAIL() {
		return DETAIL;
	}
	public void setDETAIL(String dETAIL) {
		DETAIL = dETAIL;
	}
	public String getSTART_TIME() {
		return START_TIME;
	}
	public void setSTART_TIME(String sTART_TIME) {
		START_TIME = sTART_TIME;
	}
	public String getLINKMAN() {
		return LINKMAN;
	}
	public void setLINKMAN(String lINKMAN) {
		LINKMAN = lINKMAN;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getTEL() {
		return TEL;
	}
	public void setTEL(String tEL) {
		TEL = tEL;
	}
	public String getMAIL() {
		return MAIL;
	}
	public void setMAIL(String mAIL) {
		MAIL = mAIL;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
}
