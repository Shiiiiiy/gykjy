<!-- topbar -->
    <div class="topbar w">
        <div class="container">
            <div class="welcome f12 fl">您好，欢迎来到贵阳科技园产业云平台！&nbsp;&nbsp;<#if userInfo??><font color="red"><a href="javascript:void(0);" onclick="userIndex();">${(userInfo.USERNAME)!""}</a></font>&nbsp;&nbsp;<a  href="javascript:void(0);" onclick="logout()"><font color="red">注销</font></a><#else>请 <a href="${rc.contextPath}/login">[登录]</a> / <a href="${rc.contextPath}/register">注册</a></#if></div>
            <div class="topnav fr f12 hidden-xs"><a href="${rc.contextPath}/cloud"><i class="iconfont">&#xe609;</i>我的产业云</a><a href="${rc.contextPath}/map"><i class="iconfont">&#xe6b5;</i>网站地图</a><a href="${rc.contextPath}"><i class="iconfont">&#xe67f;</i>网站说明</a></div>
        </div>
    </div>
    <!-- nav -->
    <div class="navbg white w">
        <div class="container clearfix pr">
            <div class="logo fl"><a href="${rc.contextPath}/index"><img src="${rc.contextPath}/plugins/images/logo.png" alt="中关村贵阳科技园产业云平台" class="img-responsive" /></a></div>
            <div class="clearfix fr nav-pc">
                <a href="javascript:void(0);" class="mobile-btn"><i class="iconfont mr5">&#xe601;</i>菜单</a>
                <ul class="disp">
                    <li><a href="${rc.contextPath}/index" <#if moduleCode?? && moduleCode=="NEWS_N">class="active"</#if>>首页</a></li>
                    <li><a href="${rc.contextPath}/info" <#if moduleCode?? && moduleCode=="NEWS_A">class="active"</#if> >企业信息</a></li>
                    <li><a href="${rc.contextPath}/industry" <#if moduleCode?? && moduleCode=="NEWS_B">class="active"</#if>>产品服务</a></li>
                    <li><a href="${rc.contextPath}/prop" <#if moduleCode?? && moduleCode=="NEWS_M">class="active"</#if>>支柱产业</a><i class="iconfont new">&#xe615;</i></li>
                    <li><a href="${rc.contextPath}/garden" <#if moduleCode?? && moduleCode=="NEWS_L">class="active"</#if>>产业园区</a></li>
                    <li><a href="${rc.contextPath}/tech" <#if moduleCode?? && moduleCode=="NEWS_C">class="active"</#if>>技术创新</a><i class="iconfont new">&#xe615;</i></li>
                    <li><a href="${rc.contextPath}/innovate" <#if moduleCode?? && moduleCode=="NEWS_D">class="active"</#if>>创新创业</a></li>
                    <li><a href="${rc.contextPath}/policy" <#if moduleCode?? && (moduleCode=="NEWS_E" || moduleCode=="NEWS_F" || moduleCode=="NEWS_G"|| moduleCode=="NEWS_H"|| moduleCode=="NEWS_I")>class="active"</#if>>产业政策</a></li>
                    <li><a href="${rc.contextPath}/forum" <#if moduleCode?? && moduleCode=="NEWS_K" || moduleCode=="NEWS_P" || moduleCode=="NEWS_Q" || moduleCode=="NEWS_R" || moduleCode=="NEWS_S" || moduleCode=="NEWS_T" >class="active"</#if>>对接服务</a></li>
                </ul>
            </div>
        </div>
    </div>

<script type="text/javascript">
       
       function logout(){
             $.ajax({
			        type:"post",
			        dataType: "text",
			        url:"${rc.contextPath}/loginRegister/logout.do",
				    data:{},
				    success: function(msg) {
				       <#if userInfo??>
		                  window.location.reload();              
		               </#if> 
				    }
			   });
       }
       function userIndex(){//进入用户中心
       		window.location.href="${rc.contextPath}/user/index";
       }
       
	   function searchCompany(){//全局搜索函数
			var str = $("#searchCompany_text").val();
			//var moduleCode = $("#moduleCode").val(); 
			var moduleCode="NEWS_A";
			if(str==""||str==null){
				return ;
			}else{
				window.location.href="${rc.contextPath}/info/quanSearchCp.do?keyWord="+encodeURI(encodeURI(str))+"&moduleCode="+moduleCode;
			}
		} 
</script>