package com.uws.controller;


import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.base.dao.Page;
import com.uws.model.DemandSupplyModel;
import com.uws.model.ProvideSupplyModel;
import com.uws.model.Recruit;
import com.uws.model.RegisterParamModel;
import com.uws.model.Resume;
import com.uws.service.CompanyInfoService;
import com.uws.service.LoginRegisterService;
import com.uws.service.ProductInfoService;
import com.uws.service.NewsFileService;
import com.uws.util.Util;
import com.uws.util.excel.ExcelUtil;
import com.uws.util.excel.ValidateException;
import com.uws.util.word.WordUtil;
/**
 * 首页 & 用户的 控制层
 * @author hejin wangjun
 *
 */
@Controller
public class UserController {
    /**新闻管理服务层*/
	@Resource(name="NewsFileService")
	private NewsFileService newsFileService;
	/**企业信息管理服务层*/
	@Resource
	private CompanyInfoService companyInfoService;
	/**产品服务管理服务层*/
	@Resource(name="productInfoService")
	private ProductInfoService productInfoService;
	/**用户管理服务层*/
	@Resource(name="loginRegisterService")
	private LoginRegisterService loginRegisterService;
    @InitBinder
    protected void initBinder(HttpServletRequest request,ServletRequestDataBinder binder) throws Exception {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        CustomDateEditor dateEditor = new CustomDateEditor(format, true);
        binder.registerCustomEditor(Date.class, dateEditor);//这种是注册 所有日期类的属性
    }
	/**
	 * 个人中心 首页统计信息0 
	 * @param userModel
	 */
	@RequestMapping("/user/index")
	public String userIndex(HttpServletRequest request,Model model,
			HttpSession session ,String name,String type ) { 
		/*--------------------------------------------*/
		/*try {//快速登录   测试代码  PERSON  COMPANY  	INSTITUTION 
			Map<String, Object> userInfo;
			userInfo = loginRegisterService.getUserInfo(name,type);
			if(!Util.isNull(type)){
				session.removeAttribute("userInfo");
				session.setAttribute("userInfo", userInfo);
				session.setAttribute("userCode", "123456");
			}
		} catch (Exception e) {}
		//测试代码*/
		/*--------------------------------------------*/
		try {
			String str = (String) session.getAttribute("userCode");
			/**安全性评估*/
			String para1=checkSecurity(str);
			model.addAttribute("para1",para1);
			Map<String,Object> userInfo =  (Map<String, Object>) session.getAttribute("userInfo");
			/**信息完善度*/
			String para2=loginRegisterService.checkImproveInfo((String)userInfo.get("ID"));
			model.addAttribute("para2",para2);
			/**招聘信息 数目*/
			String msgN1=loginRegisterService.getRecruitNo((String)userInfo.get("ID"));
			model.addAttribute("msgN1",msgN1);
			/**简历信息 数目*/
			String msgN2=loginRegisterService.getResumeNo((String)userInfo.get("ID"));
			model.addAttribute("msgN2",msgN2);
			/**需求信息 数目*/
			String msgN3=loginRegisterService.getNeedNo((String)userInfo.get("ID"));
			model.addAttribute("msgN3",msgN3);
			/**供应信息 数目*/
			String msgN4=loginRegisterService.getSupplyNo((String)userInfo.get("ID"));
			model.addAttribute("msgN4",msgN4);
		} catch (Exception e) {}
		model.addAttribute("moduleCode","NEWS_N");
	    return "user/index";  
	}  
	/**
	 * 用户基本信息1
	 *  @param
	 * */
	@RequestMapping("/user/info")
	public String userInfo(HttpServletRequest request,Model model,HttpSession session) { 
		String address="user/index";
		String mylist2para="";
		String mylist3para="";
		try {
			Map<String, Object> userInfo =  (Map<String, Object>) session.getAttribute("userInfo");
			String type=(String) userInfo.get("USERTYPE");
			String userid=(String) userInfo.get("ID");
			if("PERSON".equals(type)){
				address="user/infoA";
				Map<String, Object> ObjectA=loginRegisterService.getUserById(userid);
				mylist2para=(String) ObjectA.get("ADD_PROVINCE");
				mylist3para=(String) ObjectA.get("ADD_CITY");
				model.addAttribute("ObjectA",ObjectA);
			}
			else if("COMPANY".equals(type)){
				address="user/infoB";
				Map<String, Object> ObjectB=loginRegisterService.getUserById(userid);
				mylist2para=(String) ObjectB.get("CP_PROVINCE");
				mylist3para=(String) ObjectB.get("CP_CITY");
				model.addAttribute("ObjectB",ObjectB);
			}
			else if("INSTITUTION".equals(type)){
				address="user/infoC";
				Map<String, Object> ObjectC=loginRegisterService.getUserById(userid);
				mylist2para=(String) ObjectC.get("PROVINCE");
				mylist3para=(String) ObjectC.get("CITY");
				model.addAttribute("ObjectC",ObjectC);
			}
		} catch (Exception e) {}
		List<Map<String,Object>> mylist=loginRegisterService.getAreaList("PLACE");
		model.addAttribute("mylist", mylist);//省
		List<Map<String,Object>> mylist2=loginRegisterService.getAreaListByID(mylist2para);
		model.addAttribute("mylist2", mylist2);//市
		List<Map<String,Object>> mylist3=loginRegisterService.getAreaListByID(mylist3para);
		model.addAttribute("mylist3", mylist3);//区
		model.addAttribute("moduleCode","NEWS_N");
	    return address;  
	}
	/**
	 * 用户基本信息1 个人用户-基本信息-保存
	 *  @param
	 * */
	@RequestMapping("/user/infoA1Save")
	public String infoA1Save(HttpServletRequest request,Model model,HttpSession session
			,RegisterParamModel pa) { 
		this.loginRegisterService.savePersonInfo(pa,1);
		model.addAttribute("moduleCode","NEWS_N");
	    return  "redirect:/user/info.do";
	}
	/**
	 * 用户基本信息1 个人用户-详细信息-保存
	 *  @param
	 * */
	@RequestMapping("/user/infoA2Save")
	public String infoA2Save(HttpServletRequest request,Model model,HttpSession session
			,RegisterParamModel pa) { 
		this.loginRegisterService.savePersonInfo(pa,2);
		model.addAttribute("moduleCode","NEWS_N");
	    return "redirect:/user/info.do";
	}
	/**
	 * 用户基本信息1 企业用户-基本信息-保存
	 *  @param
	 * */
	@RequestMapping("/user/infoB1Save")
	public String infoB1Save(HttpServletRequest request,Model model,HttpSession session
			,RegisterParamModel pa) { 
		this.loginRegisterService.saveCompanyInfo(pa,1);
		model.addAttribute("moduleCode","NEWS_N");
	    return  "redirect:/user/info.do";
	}
	/**
	 * 用户基本信息1 企业用户-详细信息-保存
	 *  @param
	 * */
	@RequestMapping("/user/infoB2Save")
	public String infoB2Save(HttpServletRequest request,Model model,HttpSession session
			,RegisterParamModel pa) { 
		this.loginRegisterService.saveCompanyInfo(pa,2);
		model.addAttribute("moduleCode","NEWS_N");
	    return "redirect:/user/info.do";
	}
	/**
	 * 用户基本信息1 机构用户-基本信息-保存
	 *  @param
	 * */
	@RequestMapping("/user/infoC1Save")
	public String infoC1Save(HttpServletRequest request,Model model,HttpSession session
			,RegisterParamModel pa) { 
		this.loginRegisterService.saveInstitutionInfo(pa,1);
		model.addAttribute("moduleCode","NEWS_N");
	    return  "redirect:/user/info.do";
	}
	/**
	 * 用户基本信息1 机构用户-详细信息-保存
	 *  @param
	 * */
	@RequestMapping("/user/infoC2Save")
	public String infoC2Save(HttpServletRequest request,Model model,HttpSession session
			,RegisterParamModel pa) { 
		this.loginRegisterService.saveInstitutionInfo(pa,2);
		model.addAttribute("moduleCode","NEWS_N");
	    return "redirect:/user/info.do";
	}
	/**
	 * 用户基本信息1 修改用户头像
	 *  @param id 用户id
	 *  @param imgname 用户头像
	 * */
	@RequestMapping("/user/changeUserImg")
	@ResponseBody
	public String changeUserImg(HttpServletRequest request,HttpSession session,Model model,String imgname,String id) { 
		boolean bl=this.loginRegisterService.changeUserImg(id,imgname);
		Map<String, Object> userInfo =  (Map<String, Object>) session.getAttribute("userInfo");
		userInfo.put("IMAGE", imgname);
		session.setAttribute("userInfo", userInfo);
	    return bl+"";
	}
	/**
	 * 用户密码修改2
	 * @param
	 * */
	@RequestMapping("/user/pwd")
	public String userPwd(HttpServletRequest request,Model model) { 
		model.addAttribute("moduleCode","NEWS_N");
	    return "user/pwd";  
	}
	/**用户密码修改2    修改用户密码操作 
	 * @param PASSWORD 旧密码 PASSWORD_NEW新密码  id用户id
	 * */
	@RequestMapping("/user/changePwd")
	public void changePwd(HttpServletRequest request,Model model,HttpServletResponse resp,HttpSession session,
			String PASSWORD,String PASSWORD_NEW,String id) { 
		String str=loginRegisterService.changePwd(id,PASSWORD,PASSWORD_NEW);
		if("true".equals(str)){session.setAttribute("userCode", PASSWORD_NEW);}
		try {
			resp.getWriter().println(str);
		} catch (IOException e) {
			
		} 
	}
	/**
	 * 招聘信息3  list页面
	 * @param
	 * */
	@RequestMapping("/user/recruit")
	public String userRecruit(HttpServletRequest request,Model model,HttpSession session) { 
		//加载list
		String userid="";
		try {
			Map<String, Object> userInfo=(Map<String, Object>) session.getAttribute("userInfo");
			userid=(String) userInfo.get("ID");
		} catch (Exception e) {}
		List<Map<String, Object>> RecruitList=loginRegisterService.getRecruitList(userid,0,0);
		model.addAttribute("RecruitList",RecruitList);
		model.addAttribute("moduleCode","NEWS_N");
	    return "user/recruit";  
	}
	/***
	 * 招聘信息3  进入新增/修改页面
	 * @param id 招聘信息表id
	 * */
	@RequestMapping("/user/recruitEdit")
	public String userRecruitEdit(HttpServletRequest request,Model model,String id) { 
		Recruit res=loginRegisterService.getRecruitByID(id);
		if(null!=res){
			model.addAttribute("RecruitOne",res);//编辑页面
		}
		model.addAttribute("moduleCode","NEWS_N");
	    return "user/recruitEdit";  
	}

	/**招聘信息3   查看招聘信息
	 * @param id 招聘信息表id
	 * */
	@RequestMapping("/user/recruitView")
	public String recruitView(HttpServletRequest request,Model model,HttpServletResponse resp,String id) { 
		Recruit res=loginRegisterService.getRecruitByID(id);
		model.addAttribute("RecruitOne",res);//查看页面
		model.addAttribute("ToView","ture");//查看标识
		model.addAttribute("moduleCode","NEWS_N");
	    return "user/recruitEdit";  
	}
	/**招聘信息3   删除 招聘信息
	 * @param id 招聘信息表id
	 * */
	@RequestMapping("/user/delRecruit")
	public String delRecruit(HttpServletRequest request,Model model,HttpServletResponse resp,String id) { 
		loginRegisterService.deleteRecruitByID(id);
		model.addAttribute("moduleCode","NEWS_N");
		return "redirect:/user/recruit.do";
	}
	
	/**招聘信息3   保存 招聘信息
	 * @param re 招聘实体
	 * */
	@RequestMapping("/user/saveRecruit")
	public String saveRecruit(HttpServletRequest request,Model model,HttpServletResponse resp,Recruit re) { 		
		loginRegisterService.saveRecruit(re);
		return "redirect:/user/recruit.do";
	}
	/**简历信息4*/
	@RequestMapping("/user/resume")
	public String userResume(HttpServletRequest request,Model model,HttpSession session) { 
		Map<String, Object> userInfo;
		try {
			userInfo = (Map<String, Object>) session.getAttribute("userInfo");
			Resume res=loginRegisterService.getResumeByUserID((String)userInfo.get("ID"));
			if(null!=res){model.addAttribute("RseumeOne",res);}
		} catch (Exception e) {
		}
		//
		model.addAttribute("moduleCode","NEWS_N");
	    return "user/resume";  
	}
	/**简历信息4  保存 用户简历
	 * @param re 用户简历实体
	 * */
	@RequestMapping("/user/saveResume")
	public void saveResume(HttpServletRequest request,Model model,HttpServletResponse resp,
			Resume re) { 
		String str=loginRegisterService.saveResume(re);
		try {
			resp.getWriter().println(str);
		} catch (IOException e) {
			
		} 
	}
	/**
	 * 简历信息4 修改简历头像
	 *  @param id 用户id
	 *  @param imgname 用户简历头像
	 * */
	@RequestMapping("/user/changeResumeImg")
	@ResponseBody
	public String changeResumeImg(HttpServletRequest request,Model model,String imgname,String id) { 
		boolean bl=this.loginRegisterService.changeResumeImg(id,imgname);
	    return bl+"";
	}
	/**
	 * 需求信息5  list页面
	 * @param
	 * */
	@RequestMapping("/user/need")
	public String userNeed(HttpServletRequest request,Model model,HttpSession session) { 
		//加载list
		String userid="";
		try {
			Map<String, Object> userInfo=(Map<String, Object>) session.getAttribute("userInfo");
			userid=(String) userInfo.get("ID");
		} catch (Exception e) {}
		List<Map<String, Object>> TableList=loginRegisterService.getNeedList(userid,0,0);
		model.addAttribute("TableList",TableList);
		model.addAttribute("moduleCode","NEWS_N");
	    return "user/need";  
	}
	/***
	 * 需求信息5  进入新增/修改页面
	 * @param id 需求信息表id
	 * */
	@RequestMapping("/user/needEdit")
	public String userneedEdit(HttpServletRequest request,Model model,String id) { 
		DemandSupplyModel res=loginRegisterService.getNeedByID(id);
		if(null!=res){
			model.addAttribute("ObjectOne",res);//编辑页面
		}
		model.addAttribute("moduleCode","NEWS_N");
	    return "user/needEdit";  
	}

	/**需求信息5   查看需求信息
	 * @param id 需求信息表id
	 * */
	@RequestMapping("/user/needView")
	public String needView(HttpServletRequest request,Model model,HttpServletResponse resp,String id) { 
		DemandSupplyModel res=loginRegisterService.getNeedByID(id);
		model.addAttribute("ObjectOne",res);//查看页面
		model.addAttribute("ToView","ture");//查看标识
		model.addAttribute("moduleCode","NEWS_N");
	    return "user/needEdit";  
	}
	/**需求信息5   删除 需求信息
	 * @param id 需求信息表id
	 * */
	@RequestMapping("/user/delNeed")
	public String delNeed(HttpServletRequest request,Model model,HttpServletResponse resp,String id) { 
		loginRegisterService.deleteNeedByID(id);
		model.addAttribute("moduleCode","NEWS_N");
		return "redirect:/user/need.do";
	}
	
	/**需求信息5   保存 需求信息
	 * @param re 需求实体
	 * */
	@RequestMapping("/user/saveNeed")
	public String saveNeed(HttpServletRequest request,Model model,HttpServletResponse resp,DemandSupplyModel re) { 		
		loginRegisterService.saveNeed(re);
		return "redirect:/user/need.do";
	}
	
	/**
	 * 供应信息6  list页面
	 * @param
	 * */
	@RequestMapping("/user/supply")
	public String userSupply(HttpServletRequest request,Model model,HttpSession session) { 
		//加载list
		String userid="";
		try {
			Map<String, Object> userInfo=(Map<String, Object>) session.getAttribute("userInfo");
			userid=(String) userInfo.get("ID");
		} catch (Exception e) {}
		List<Map<String, Object>> TableList=loginRegisterService.getSupplyList(userid,0,0);
		model.addAttribute("TableList",TableList);
		model.addAttribute("moduleCode","NEWS_N");
	    return "user/supply";  
	}
	/***
	 * 供应信息6  进入新增/修改页面
	 * @param id 供应信息表id
	 * */
	@RequestMapping("/user/supplyEdit")
	public String usersupplyEdit(HttpServletRequest request,Model model,String id) { 
		ProvideSupplyModel res=loginRegisterService.getSupplyByID(id);
		if(null!=res){
			model.addAttribute("ObjectOne",res);//编辑页面
		}
		model.addAttribute("moduleCode","NEWS_N");
	    return "user/supplyEdit";  
	}

	/**供应信息6   查看供应信息
	 * @param id 供应信息表id
	 * */
	@RequestMapping("/user/supplyView")
	public String supplyView(HttpServletRequest request,Model model,HttpServletResponse resp,String id) { 
		ProvideSupplyModel res=loginRegisterService.getSupplyByID(id);
		model.addAttribute("ObjectOne",res);//查看页面
		model.addAttribute("ToView","ture");//查看标识
		model.addAttribute("moduleCode","NEWS_N");
	    return "user/supplyEdit";  
	}
	/**供应信息6  删除 供应信息
	 * @param id 供应信息表id
	 * */
	@RequestMapping("/user/delSupply")
	public String delSupply(HttpServletRequest request,Model model,HttpServletResponse resp,String id) { 
		loginRegisterService.deleteSupplyByID(id);
		model.addAttribute("moduleCode","NEWS_N");
		return "redirect:/user/supply.do";
	}
	
	/**供应信息6   保存 供应信息
	 * @param re 供应实体
	 * */
	@RequestMapping("/user/saveSupply")
	public String saveSupply(HttpServletRequest request,Model model,HttpServletResponse resp,ProvideSupplyModel re) { 		
		loginRegisterService.saveSupply(re);
		return "redirect:/user/supply.do";
	}
	
	
	
	
	
	/**
	 * 招聘信息3   导出招聘信息 excel
	 * */
	@RequestMapping("/user/recruitExport")
	public void recruitExport(HttpServletRequest request,HttpServletResponse response
			,String id) throws ValidateException, IOException, Exception{
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Content-Disposition", "attachment;filename=export.xls");
		Recruit re1=this.loginRegisterService.getRecruitByID(id) ;//
		List<Map<Integer,Object>> listresult = new ArrayList<Map<Integer,Object>>();
		Map<Integer,Object> mapresult = new HashMap<Integer,Object>();
		mapresult.put(0,1);
		mapresult.put(1,re1.getJOB_NAME());
		mapresult.put(2,re1.getSALARY());
		mapresult.put(3,re1.getWORK_PROPERTY());
		mapresult.put(4,re1.getWORK_LOCATION());
		mapresult.put(5,re1.getNEED_NO());
		mapresult.put(6,re1.getMAIL());
		mapresult.put(7,re1.getLINK_MAN());
		mapresult.put(8,re1.getPHONE());
		mapresult.put(9,re1.getDUTY());
		mapresult.put(10,re1.getTCONDITION());
		mapresult.put(11,re1.getCP_BRIEF());
		listresult.add(mapresult);
		String[] headers = new String[]{"序号","岗位名称","薪酬福利","工作性质","工作地点","招聘人数","简历投递邮箱","联系人","电话","主要职责","任职资格要求","公司介绍"};
		ExcelUtil.write(headers, listresult, response.getOutputStream());
	}
	/**
	 * 简历信息3   导出简历信息 为word
	 * @param id 用户id
	 * */
	@RequestMapping("/user/resumeExports")
	public void resumeExports2(HttpServletRequest request,HttpServletResponse response,String id) throws ValidateException, IOException, Exception{
        Map<String, Object> map2=this.loginRegisterService.getResumeMapByUserID(id);
		WordUtil.exportWord(request, response, "resume", "resumeExport", map2, null);
	}
	/**
	 * 简历信息3   导出简历信息 为excel
	 * @param id 用户id
	 * */
	@RequestMapping("/user/resumeExport")
	public void resumeExport(HttpServletRequest request,HttpServletResponse response
			,String id) throws ValidateException, IOException, Exception{
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Content-Disposition", "attachment;filename=export.xls");
		Resume re1=this.loginRegisterService.getResumeByUserID(id);
		List<Map<Integer,Object>> listresult = new ArrayList<Map<Integer,Object>>();
		Map<Integer,Object> mapresult = new HashMap<Integer,Object>();
		mapresult.put(0,1);
		mapresult.put(1,re1.getNAME());
		mapresult.put(2,re1.getGENDER());
		mapresult.put(3,re1.getNATION());
		mapresult.put(4,re1.getBIRTHDAY());
		mapresult.put(5,re1.getEDUCATION_LEVEL());
		mapresult.put(6,re1.getSCHOOL());
		mapresult.put(7,re1.getMAJOR());
		mapresult.put(8,re1.getGRADUATION());
		mapresult.put(9,re1.getLANGUAGE_LEVEL());
		mapresult.put(10,re1.getMARRY());
		mapresult.put(11,re1.getLIVECITY());
		mapresult.put(12,re1.getHOUSEHOLD());
		mapresult.put(13,re1.getCERTIFICATE_TYPE());
		mapresult.put(14,re1.getCERTIFICATE_NO());
		mapresult.put(15,re1.getJOB_INTENSION());
		mapresult.put(16,re1.getSALARY());
		mapresult.put(17,re1.getMAIL());
		mapresult.put(18,re1.getPHONE());
		mapresult.put(19,re1.getEDUCATION_BG());
		mapresult.put(20,re1.getWORK_EXP());
		mapresult.put(21,re1.getSKILL());
		mapresult.put(22,re1.getPROJECT_EXP());
		mapresult.put(23,re1.getHOBBY());
		listresult.add(mapresult);
		String[] headers = new String[]{"序号","姓名","性别","民族","出生年月","教育程度","毕业院校","专业",
				"毕业时间","外语水平","婚姻状况","现所在城市","户口所在地","证件类型","证件号码","求职意向",
				"期望薪酬","邮箱","电话","教育背景","工作经历","专业技能","项目经验","自我评价"};
		ExcelUtil.write(headers, listresult, response.getOutputStream());
	}
	@RequestMapping("/files/uploadFiles")
	@ResponseBody
	public void uploadFiles(HttpServletRequest request,HttpServletResponse response){
        // 创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //新文件名列表
        List<String> fileNameList=new ArrayList();
        // 判断 request 是否有文件上传,即多部分请求
        if (multipartResolver.isMultipart(request)) {
            // 转换成多部分request
        	MultipartHttpServletRequest multipartRequest = multipartResolver.resolveMultipart(request);       
            // 取得request中的所有文件名
            Iterator<String> iter = multipartRequest.getFileNames();
            String newFileName=null;
            //图片保存路径 
            String uploadPath =request.getSession().getServletContext().getRealPath("/")+"plugins/images/allImages/";
            while (iter.hasNext()) {
                // 取得上传文件
                List<MultipartFile> files = multipartRequest.getFiles(iter.next());
                if (!CollectionUtils.isEmpty(files)) {
                    for (MultipartFile file : files) {
                        if (file != null) {
                            // 取得当前上传文件的文件名称
                            String myFileName = file.getOriginalFilename();
                            // 如果名称不为“”,说明该文件存在，否则说明该文件不存在
                            if (!Util.isNull(myFileName)) {
                            	//获取拓展名
                                String extensionName = myFileName.substring(myFileName.lastIndexOf(".") + 1);
                                if(!isPicFile(extensionName.toLowerCase())){break;}
                        		//防止上传同名文件造成文件覆盖
                                newFileName = UUID.randomUUID().toString().replaceAll("-", "").concat(".") + 
                        				DigestUtils.md5DigestAsHex(myFileName.getBytes()).concat(".") + extensionName;
                                try {
									file.transferTo(new File(uploadPath+newFileName));
									fileNameList.add(newFileName);
									//System.out.println("已上传成功文件："+newFileName);
									//
					                String res = "{ imgurl:'" + uploadPath+newFileName + "', imgname:'" + newFileName +"'}";
							        response.setCharacterEncoding("UTF-8");
							        response.getWriter().print(res);
								} catch (Exception e) {
									//失败
								}   
                            }
                        }
                    }
                }
            }
        }
	}
	/**工具方法 检查密码的安全性系数*/
	private  String checkSecurity(String str) {
		if(Util.isNull(str)){return "弱";}
		if(str.matches("^.*[a-zA-Z]+.*$") && str.matches("^.*[0-9]+.*$") && str.matches("^.*[/^/$/.//,;:'!@#%&/*/|/?/+/(/)/[/]/{/}]+.*$")
				){return "高";//“高”指数字+字母+特殊字符的组合 3种都有
		}else if(str.matches("^.*[a-zA-Z]+.*$") && str.matches("^.*[0-9]+.*$")
				){return "较高";//“较高”指包含数字+字母的组合 2种组合
		}else if(str.matches("^.*[a-zA-Z]+.*$") || str.matches("^.*[0-9]+.*$")
				){return "弱";}//“弱”是指密码 全为数字 或 全为字母  
		return "弱";
	}
	/**方法 判断文件拓展名 是否是图片*/
	private boolean isPicFile(String fileExtName){
		String[] picTypeArr = 
				new String[]{"bmp","dib","gif","jfif","jpe","jpeg",
				"jpg","png","tif","tiff","ico"};
		for (String ext : picTypeArr) {
			if(ext.equals(fileExtName))
				return true;
		}
		return false;
	}
	/******************************************************************************/
	/**
	 * 首页
	 * @param userModel
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unused")
	@RequestMapping("/firstPage/index")
	public String index(HttpServletRequest request,Model model) {  
        //网站公告新闻列表
		List<Map<String,Object>> list1=newsFileService.getNews("NEWS_N", "N", "N", 0, 0);
		//首页企业风采列表
		List<Map<String,Object>> list2=newsFileService.getNews("NEWS_A", "N", "N", 0, 3);
		//首页产品服务列表
		List<Map<String,Object>> list3=newsFileService.getNews("NEWS_B", "N", "N", 0, 3);
		//首页支柱产业列表
		List<Map<String,Object>> list4=newsFileService.getNews("NEWS_M", "N", "N", 0, 3);   
		//首页产业园区列表
		List<Map<String,Object>> list5=newsFileService.getNews("NEWS_L", "N", "GARDEN_A",0, 3);
		//首页技术创新列表
		List<Map<String,Object>> list6=newsFileService.getNews("NEWS_C", "N", "N", 0, 3);
		//首页创新创业列表
		List<Map<String,Object>> list7=newsFileService.getNews("NEWS_D", "N", "N", 0, 3);
		//首页产业政策列表
		List<Map<String,Object>> list8=newsFileService.getNews("NEWS_E", "N", "N", 0, 3);
		//首页产业论坛列表
		List<Map<String,Object>> list9=newsFileService.getFiles("MODULE_J", "MODULE_J_MAIN", "FILE_E2", 0, 3);
		
		//企业总数
		int compTotal=companyInfoService.getCompCount();
		//产品总数
		int productTotal=productInfoService.getProductCount();
		
		
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("list5", list5);
		model.addAttribute("list6", list6);
		model.addAttribute("list7", list7);
		model.addAttribute("list8", list8);
		model.addAttribute("list9", list9);
		model.addAttribute("productTotal", productTotal);
		model.addAttribute("compTotal", compTotal);
		model.addAttribute("moduleCode","NEWS_N");
	    return "index";  
	 } 
	/**
	 * 首页 动画页
	 * @param userModel
	 * @param request
	 * @return
	 */
	@RequestMapping("/firstPage/indexes")
	public String indexes(HttpServletRequest request,Model model) {  
	    return "indexes";  
	}  
	/**
	 * 网站云图 页
	 * @param userModel
	 * @param request
	 * @return
	 */
	@RequestMapping("/firstPage/cloud")
	public String mycloud(HttpServletRequest request,Model model) { 
		model.addAttribute("moduleCode","NEWS_N");
	    return "mycloud";  
	}
	/**
	 * 网站map 页
	 * @param userModel
	 * @param request
	 * @return
	 */
	@RequestMapping("/firstPage/map")
	public String mymap(HttpServletRequest request,Model model) {
		model.addAttribute("moduleCode","NEWS_N");
	    return "sitemap";  
	}
	/**
	 * 网站about 页
	 * @param userModel
	 * @param request
	 * @return
	 */
	@RequestMapping("/firstPage/about")
	public String myabout(HttpServletRequest request,Model model) {
		model.addAttribute("moduleCode","NEWS_N");
	    return "about";  
	}
	/**
	 * 网站contact 页
	 * @param userModel
	 * @param request
	 * @return
	 */
	@RequestMapping("/firstPage/contact")
	public String mycontact(HttpServletRequest request,Model model) {
		model.addAttribute("moduleCode","NEWS_N");
	    return "contact";  
	}
	/**
	 * 网站notice 页
	 * @param userModel
	 * @param request
	 * @return
	 */
	@RequestMapping("/firstPage/notice")
	public String mynotice(HttpServletRequest request,Model model) {
		model.addAttribute("moduleCode","NEWS_N");
	    return "notice";  
	}
	/**
	 * 网站privacy 页
	 * @param userModel
	 * @param request
	 * @return
	 */
	@RequestMapping("/firstPage/privacy")
	public String myprivacy(HttpServletRequest request,Model model) {
		model.addAttribute("moduleCode","NEWS_N");
	    return "privacy";  
	}
	
}
