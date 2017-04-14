<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="keywords" content="中关村贵阳科技园,贵阳科技园">
    <link href="${rc.contextPath}/plugins/images/favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" href="${rc.contextPath}/plugins/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/base.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/iconfont.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/header.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/footer.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/content.css" />
    <link rel="stylesheet" href="${rc.contextPath}/plugins/style/animate-custom.css">
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.headshrinker.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/slider.js"></script>
    <!--[if lte IE 9]>
    <script src="${rc.contextPath}/plugins/js/respond.min.js"></script>
    <script src="${rc.contextPath}/plugins/js/html5shiv.js"></script>
    <![endif]-->
    <title>中关村贵阳科技园</title>
</head>
<body class="con_main_bg">
   <#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;"></div></a>
	<div class="container mainbg mt20">
	<!-- bread -->
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span><a href="${rc.contextPath}/forum" >对接服务</a><span>&gt;</span><a href="${rc.contextPath}/forum/recruitlist/">招聘信息</a>
            
        </div>
        	<div class="search fr search-xs" >
	            <div class="fl"><input type="text" class="search-text" id="searchCompany_text" value="${keyWord!''}" name="" placeholder="搜企业" /></div>
	            <div class="fr"><button class="search-but" onclick="searchCompany()" ><i class="iconfont f30">&#xe60a;</i></button></div>
	        </div>
    </div>
    <!-- list -->
    <div class="mt20 mb20">
        <div class="row art-con" style="padding:0;">
            <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                <div class="content-art white" >
                    <h2 class="f30 tc">${(NewsOne.JOB_NAME)!''}</h2>
                    <p class="tc f12 xx">发布时间：<#if NewsOne?? && NewsOne.createTime??>${((NewsOne.createTime)!"")}</#if> &nbsp;&nbsp;</p>
                    <div class="con">
					<form id="register" name="register"  >
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">岗位名称</span>
                                            <input type="text"  readonly  name="JOB_NAME" value="${(NewsOne.JOB_NAME)!''}" class="form-control" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">薪酬福利</span>
                                            <input type="text"  readonly  name="SALARY" value="${(NewsOne.SALARY)!''}" class="form-control"  >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">工作性质</span>
                                            <input type="text"  readonly  name="WORK_PROPERTY" value="${(NewsOne.WORK_PROPERTY)!''}" class="form-control"  >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">工作地点</span>
                                            <input type="text"  readonly  name="WORK_LOCATION" value="${(NewsOne.WORK_LOCATION)!''}" class="form-control"  >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">招聘人数</span>
                                            <input type="text"  readonly  name="NEED_NO" value="${(NewsOne.NEED_NO)!''}" class="form-control" " >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">投递邮箱</span>
                                            <input type="text"  readonly  name="MAIL" value="${(NewsOne.MAIL)!''}" class="form-control"  >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">联&nbsp;&nbsp;系&nbsp;&nbsp;人</span>
                                            <input type="text"  readonly  name="LINK_MAN" value="${(NewsOne.LINK_MAN)!''}" class="form-control"  >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:55px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话</span>
                                            <input type="text"  readonly  name="PHONE" value="${(NewsOne.PHONE)!''}" class="form-control" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:120px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">主要职责</span>
                                            <textarea  readonly  name="DUTY"  class="form-control"  rows="4">${(NewsOne.DUTY)!''}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:120px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">资格要求</span>
                                            <textarea  readonly  name="TCONDITION"  class="form-control"  rows="4">${(NewsOne.TCONDITION)!''}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:120px;">
                                        <div class="input-group mb15">
                                            <span class="input-group-addon">公司介绍</span>
                                            <textarea  readonly  name="CP_BRIEF"  class="form-control"  rows="4">${(NewsOne.CP_BRIEF)!''}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </form>
                    </div>
                </div>
                <div class="white mt15 p30 more-item" style="background:#eaeaea">
                    <#if NewsPre??>
						
						<a href="${rc.contextPath}/forum/recruitOne/${(NewsPre.ID)!''}" title="${(NewsPre.JOB_NAME)!'' }" class="mt10"><span>上一条</span>${(NewsPre.JOB_NAME)!"" }</a>
					<#else>
					    <!--没有上一条-->
					</#if>
					<#if NewsNext??>
						
						<a href="${rc.contextPath}/forum/recruitOne/${(NewsNext.ID)!''}" title="${(NewsNext.JOB_NAME)!'' }" class="mt10"><span>下一条</span>${(NewsNext.JOB_NAME)!''}</a>
					<#else>
					    <!--没有下一条-->
					</#if>
                </div>
            </div>
            <div class="col-md-3 col-lg-3 hidden-sm hidden-xs pr tj-r">
                <div id="float-right" class="white">
                    <div class="con-r-r">
                        <h3 class="f16"><i class="iconfont mr5 f20">&#xe690;</i>推荐企业</h3>
                        <ul class="tj-list">
                        
                            <#if adImages??>
	                             <#list adImages as ad>
	                                   <li><a href="${(ad.URL)!''}" target="_blank"><img src="${rc.contextPath}/plugins/images/allImages/${(ad.FILE_NAME)!'tj1.jpg'}" alt="" class="img-responsive" /></a></li>
	                             </#list>
                            </#if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
	</div>
    <!-- footer -->
    <#include "/footerAndHeader/footers.ftl"/>
    <script type="text/javascript">
        $(function () {
            //floatNav
            jQuery('.navbg').headshrinker({ fontSize: "14px", mobileMenu: true});
            $(".nav-pc a.mobile-btn").click(function () {
                $(".nav-pc ul").slideToggle();
            });
            //tj-list-float
            /*$(window).scroll(function () {
			var scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;//scrollTop兼容办法
                if (scrollTop > 250) {
                    $('#float-right').addClass('mfixed');
                }
                else {
                    $('#float-right').removeClass('mfixed');
                }
            });*/
            var boxW = $(".tj-r").width();
            $("#float-right").width(boxW);
            $(window).resize(function () {
                var boxW = $(".tj-r").width();
                $("#float-right").width(boxW);
            });
        });
        
        
        
        function getNewsList(){
            
            $("#myparam").attr("action","${rc.contextPath}/info/morenews.do");
            $("#myparam").submit();
        }
        
        function getNewsDetail(obj){
            
            var articleId=$(obj).attr("name");
            $("#myparam").children("input[name='articleId']").val(articleId);
            $("#myparam").attr("action","${rc.contextPath}/info/onenews.do");
            $("#myparam").submit();
        }
        
        
    </script>
</body>
</html>
