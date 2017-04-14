<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="${rc.contextPath}/plugins/favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" href="${rc.contextPath}/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/base.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/iconfont.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/header.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/footer.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/content.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/animate-custom.css">
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/slider.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/user.js"></script>
    <!--[if lte IE 9]>
    <script src="${rc.contextPath}/plugins/js/respond.min.js"></script>
    <script src="${rc.contextPath}/plugins/js/html5shiv.js"></script>
    <![endif]-->
    <title>用户中心-中关村贵阳科技园产业云平台</title>
</head>
<body style="background:#f5f5f5;">
    <!-- topbar -->
	<#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <div class="banner w banner_user">
        <div class="container">
            <div class="fl"></div>
            <div class="fr hidden-xs"><span class="f36 fb user-by">创新创业 共赢发展</span></div>
        </div>
    </div>
    <!-- bread -->
    <div class="container clearfix mt10">
        <div class="bread-nav fl mt10">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span><a href="${rc.contextPath}/user/index">用户中心</a>
        </div>
    </div>
    <!-- user -->
    <div class="container mt20" style="min-height:510px;">
        <div class="row">
			<#include "leftmenu.ftl"/>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-11">
                <div class="userinfo-header clearfix">
                    <div class="row">
                        <div class="hidden-xs col-sm-3 col-md-5 col-lg-4">
                            <div class="user-info-l clearfix">
                                <span class="idot idot-top"></span><span class="idot idot-bottom"></span>
                                <div class="fl user-head">
									<#if (userInfo.IMAGE)?? && (userInfo.IMAGE+"")!="" >
										<img src="${rc.contextPath+'/plugins/images/allImages/'+(userInfo.IMAGE)!'/defaultUser.jpg'}"  alt="" class="img-circle" width="100" height="100"/>
									<#else>	
										<img src="${rc.contextPath}/plugins/images/allImages/defaultUser.jpg" alt="" class="img-circle" width="100" height="100"/>
									</#if>  
								</div>
                                <div class="fl user-txt hidden-sm">
                                    <p class="name f16">${(userInfo.USERNAME)!''}</p>
                                    <p class="user-type">
                                    <#if (userInfo.USERTYPE)?? >
                                    <#if (userInfo.USERTYPE+"")== ("PERSON") >
                                    <i class="iconfont f12">&#xec4d;</i><span class="f12 blue">个人用户</span>
                                    <#elseif (userInfo.USERTYPE+"")==("COMPANY") >
                                    <i class="iconfont f12">&#xe611;</i><span class="f12 blue">企业用户</span>
                                    <#elseif (userInfo.USERTYPE+"")== ("INSTITUTION") >
                                    <i class="iconfont f12">&#xe611;</i><span class="f12 blue">机构用户</span>
                                    <#else>
                                    <i class="iconfont f12">&#xec4d;</i><span class="f12 blue">用户</span>
                                    </#if>     
                                    </#if>                	
                                    </p>
                                    <p><span class="blue">账户安全:</span>
                                    <#if para1?? && (para1+"")=="弱" ><span class="red ml10"><#else><span class="green ml10"></#if>${(para1)!'弱'}</span></p>
                                    <p><span class="blue">信息完善:</span><span class="percent ml10"><i class="percent-num" style="width:${(para2)!'70%'};"></i></span><span class="green ml10 f12">${(para2)!'50%'}</span></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-9 col-md-7 col-lg-8">
                            <div class="row">
                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                    <div class="user-con tc">
                                        <a href="${rc.contextPath}/user/recruit">
                                            <span>${(msgN1)!'0'}</span><i class="iconfont">&#xe668;</i><h3>招聘信息</h3>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                    <div class="user-con tc">
                                        <a href="${rc.contextPath}/user/resume">
                                            <span>${(msgN2)!'0'}</span><i class="iconfont">&#xe660;</i><h3>简历信息</h3>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                    <div class="user-con tc">
                                        <a href="${rc.contextPath}/user/need">
                                            <span>${(msgN3)!'0'}</span><i class="iconfont">&#xe654;</i><h3>需求信息</h3>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                    <div class="user-con tc">
                                        <a href="${rc.contextPath}/user/supply">
                                            <span>${(msgN4)!'0'}</span><i class="iconfont">&#xe621;</i><h3>供应信息</h3>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="userinfo-r hidden-xs hidden-sm"></div>
                </div>
                <div class="row mt20" style="background:white;">
					
                </div>
            </div>
        </div>
    </div>	
    <!-- footer -->
    <#include "/footerAndHeader/footers.ftl"/>
    <script type="text/javascript">
        $(function () {
          
            //
            var users="${(userInfo.USERNAME)!''}";
            if(""==users){
        	   window.location.href="${rc.contextPath}/login";	
            }
        });
    </script>
</body>
</html>
