package com.uws.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.uws.model.RegisterParamModel;
import com.uws.service.LoginRegisterService;
import com.uws.util.ImageUtil;
import com.uws.util.RandomCode;
import com.uws.util.Util;

/**
 * 登录注册Controller
 * @author hejin
 *
 */
@Controller
@RequestMapping("/loginRegister")
public class LoginAndRegisterController {

	
	@Resource(name="loginRegisterService")
	private LoginRegisterService loginRegisterService;
	
	/**
	 * 进入登录页面
	 * @param model
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unused")
	@RequestMapping("/login")
	public String login(HttpServletRequest request,HttpSession session) { 
		if(session.getAttribute("userInfo")!=null){
			return "redirect:index.html";
		}
		
		return "loginRegister/login";
	}
	
	
    /**
	 * 绘制图形验证码和校验
	 * 
	 * @return void
	 */
	@RequestMapping("/checkCode")
	public void checkCode(HttpServletRequest req,
			HttpServletResponse resp,HttpSession session) {
		
		String refresh = req.getParameter("refresh");
		
		if (refresh==null || refresh.contains("y")) {
			String rnd = RandomCode.getRandomCharAndNumr(4);
			
			try {
				//System.out.println("验证码:"+rnd);
				session.setAttribute("checkCode", rnd);
				//将验证码图片发送到客户端
				BufferedImage bi = ImageUtil.createAuthcodeImage(rnd);
				ImageIO.write(bi, "JPEG", resp.getOutputStream());
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else if(!Util.isNull(refresh) && refresh.equals("submit")){
			String checkStr=req.getParameter("checkStr");
			try {
				
				//从缓存中读取验证码字符串				
				String rnd=(String)session.getAttribute("checkCode");
				//System.out.println("session验证码是:"+rnd);
				if(rnd.equalsIgnoreCase(checkStr)){
					
					resp.getWriter().println("ok");
				} else {
					resp.getWriter().println("error");
				
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}


	}
	
	
	
	/**
	 * 提交登录信息
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/subLoginInfo")
	public void subLoginInfo(HttpServletRequest request,HttpServletResponse resp,HttpSession session) { 
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String usertype=request.getParameter("usertype");
		Map<String,Object> userInfo=loginRegisterService.getUserInfo(username,usertype);
		
		if(userInfo!=null && userInfo.size()>0 && userInfo.get("ID")!=null && userInfo.get("ID")!=""){
			String str=(String)userInfo.get("PASSWORD");
			if(str.equals(Util.encryptMD5(password))){
				
				session.setAttribute("userInfo", userInfo);
				session.setAttribute("userCode", password);
				try {
					resp.getWriter().println("ok");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				//密码错误
				try {
					resp.getWriter().println("error");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}else{
			//用户名不存在
			try {
				resp.getWriter().println("error");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
	}
	
	
	/**
	 * 进入注册页面
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/register")
	public String  register(HttpServletRequest request,Model model,HttpSession session) { 		
		//注册类型（个人，企业，机构）
		String usertype=request.getParameter("usertype");
		
		List<Map<String,Object>> mylist=loginRegisterService.getAreaList("PLACE");
		model.addAttribute("mylist", mylist);
		
		if("PERSON".equals(usertype)){//个人
			return "loginRegister/registerA";
		}else if("COMPANY".equals(usertype)){//企业
			return "loginRegister/registerB";
		}else if("INSTITUTION".equals(usertype)){//机构
			return "loginRegister/registerC";
		}
		
		
		
		return "loginRegister/registerA";
	}
	
	
	/**
	 * 提交注册信息
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/subRegisterInfo")
	public void  subRegisterInfo(HttpServletRequest request,RegisterParamModel param,HttpServletResponse resp,HttpSession session) { 	
		
		     Map<String, Object> map=loginRegisterService.getUserInfo(param.getUSERNAME(),"");
			 if(map!=null && map.size()>0 && map.get("ID")!=null && (String)map.get("ID")!=""){
				    try {
						resp.getWriter().println("error");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			 }else{
					//生成32位id
					param.setID(UUID.randomUUID().toString().replace("-", ""));
					
					//注册类型（个人，企业，机构）
					String usertype=param.getUSERTYPE();
					if("PERSON".equals(usertype)){//个人
						
						param.setPersonId(UUID.randomUUID().toString().replace("-", ""));
						loginRegisterService.addRegister(param);
						
					}else if("COMPANY".equals(usertype)){//企业
						
						param.setCompanyId(UUID.randomUUID().toString().replace("-", ""));
						loginRegisterService.addRegister(param);
					}else if("INSTITUTION".equals(usertype)){//机构
						
						param.setInstitutionId(UUID.randomUUID().toString().replace("-", ""));
						loginRegisterService.addRegister(param);
					}
			
			 
				   try {
						resp.getWriter().println("ok");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		 }
		
		
		
	}
	
	/**
	 * 获取市/区列表
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/getCityOrArea")
	public void getCityOrArea(HttpServletRequest request,HttpServletResponse resp){
		String parentCode=request.getParameter("parentCode");
		
		List<Map<String,Object>> mylist=loginRegisterService.getAreaList(parentCode);
		
		ObjectMapper mapper= new ObjectMapper();
		resp.setCharacterEncoding("UTF-8");
		
		boolean stat=true;
		
		if(mylist!=null && mylist.size()>0){
			
		}else{
			stat=false;
		}
		try {
			if(stat){
				resp.getWriter().write(mapper.writeValueAsString(mylist));
			}else{
				resp.getWriter().write(mapper.writeValueAsString("nomore"));
			}
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	
	/**
	 * 校验是否用户名已存在
	 * @param model
	 * @param request
	 * @param resp
	 * @return
	 */
	@RequestMapping("/isExistUser.do")
	public void isExistUser(HttpServletRequest request,String username,HttpServletResponse resp){
		 Map<String, Object> map=loginRegisterService.getUserInfo(username,"");
		 if(map!=null && map.size()>0 && map.get("ID")!=null && (String)map.get("ID")!=""){
			    try {
					resp.getWriter().println("error");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		 }else{
			 
			   try {
					resp.getWriter().println("ok");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		 }
		
	}
	
	
	
	/**
	 * 上传文件
	 */
	public String getFileName(HttpServletRequest request){
        // 创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        

        //新文件名列表
        List<String> fileNameList=new ArrayList();
        System.out.println("进入文件上传方法111-----------");
        // 判断 request 是否有文件上传,即多部分请求
        if (multipartResolver.isMultipart(request)) {
        	System.out.println("发现有文件上传！-----------------");
            // 转换成多部分request
        	 MultipartHttpServletRequest multipartRequest = multipartResolver.resolveMultipart(request);
                     
            // 取得request中的所有文件名
            Iterator<String> iter = multipartRequest.getFileNames();
            String newFileName=null;
            //图片保存路径 
            String uploadPath =request.getSession().getServletContext().getRealPath("/")+"plugins/upload/";
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
                                System.out.println(myFileName);
                                // 重命名上传后的文件名
                                // String fileName= file.getOriginalFilename();
                                // 获取图片的扩展名
                                String extensionName = myFileName
                                        .substring(myFileName.lastIndexOf(".") + 1);
                                // 文件名（扩展名之前的名字）
                                //String fileName = myFileName.substring(0,
                                       // myFileName.lastIndexOf("."));
                                // 新的图片文件名 = 获取时间戳+"."图片扩展名
                                // String newFileName = fileName +
                                // String.valueOf(System.nanoTime())
                                // + "." + extensionName;
                                newFileName = UUID.randomUUID()
                                        .toString() + "." + extensionName;
                                try {
									file.transferTo(new File(uploadPath+newFileName));
									fileNameList.add(newFileName);
									System.out.println("已上传成功文件："+newFileName);
								} catch (IllegalStateException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IOException e) {
									System.out.println("文件保存失败！---注册");
									// TODO Auto-generated catch block
									e.printStackTrace();
								}  
                               
                                
                                
                            }
                        }
                    }
                }
            }
            
        }
		
        if(fileNameList==null || fileNameList.size()==0){
        	return "";
        }else{
        	return fileNameList.get(0);
        }
		
		
	}
	
	
	
	
	
	/**
	 * 返回注册成功页面
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/registerSuccess")
	public String  registerSuccess(HttpServletRequest request) { 	
		
		
		return "loginRegister/registerOk";
	}
	
	
	/**
	 * 注销
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/logout")
	public void  logout(HttpServletRequest request,HttpServletResponse resp,HttpSession session) { 	
		
		session.removeAttribute("userInfo");
		session.removeAttribute("userCode");
		try {
			resp.getWriter().println("ok");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	
}
