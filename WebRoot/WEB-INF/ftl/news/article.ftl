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
    <title>${(NewsOne.NEWS_TITLE)!''}</title>
</head>
<body class="con_main_bg">
   <#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;"></div></a>
	<div class="container mainbg mt20">
	<!-- bread -->
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index" >首页</a><span>&gt;</span>
            <#if moduleCode??><a href="${rc.contextPath}${url1!''}"><#if moduleCode=="NEWS_N">网站公告</#if><#if moduleCode=="NEWS_A">企业信息<span>&gt;</span></#if><#if moduleCode=="NEWS_B">产品服务<span>&gt;</span></#if><#if moduleCode=="NEWS_M">支柱产业<span>&gt;</span></#if><#if moduleCode=="NEWS_L">产业园区<span>&gt;</span></#if><#if moduleCode=="NEWS_C">技术创新<span>&gt;</span></#if><#if moduleCode=="NEWS_D">创新创业<span>&gt;</span></#if><#if moduleCode=="NEWS_E" || moduleCode=="NEWS_F" || moduleCode=="NEWS_G"|| moduleCode=="NEWS_H"|| moduleCode=="NEWS_I" >产业政策<span>&gt;</span></#if><#if moduleCode=="NEWS_K" || moduleCode=="NEWS_P" ||moduleCode=="NEWS_Q" ||moduleCode=="NEWS_R" ||moduleCode=="NEWS_S" || moduleCode=="NEWS_T">对接服务<span>&gt;</span></#if></a></#if>
            <#if parentCodeName?? &&""!=parentCodeName><a href="${rc.contextPath}${url2!''}">${parentCodeName!""}</a><span>&gt;</span></#if><#if moduleCode??><#if moduleCode=="NEWS_A"><a href="${rc.contextPath}${url3!''}">企业风采</a></#if><#if moduleCode=="NEWS_B" && parentCode=="NO" ><a href="${rc.contextPath}${url3!''}" >产品资讯</a></#if><#if moduleCode=="NEWS_B" && parentCode!='NO' ><a href="${rc.contextPath}${url3!''}" >产品资讯</a></#if><#if moduleCode=="NEWS_M"><a href="${rc.contextPath}${url3!''}" >产业动态</a></#if><#if moduleCode=="NEWS_L" && parentCode=="NO"><a href="${rc.contextPath}${url3!''}" >园区动态</a></#if><#if moduleCode=="NEWS_L" && parentCode!="NO" && moduleType?? && moduleType=="GARDEN_A"><a href="${rc.contextPath}${url3!''}" >园区动态</a></#if><#if moduleCode=="NEWS_L" && parentCode!="NO" && moduleType?? && moduleType=="GARDEN_B"><a href="${rc.contextPath}${url3!''}" >园区政策</a></#if><#if moduleCode=="NEWS_C"><a href="${rc.contextPath}${url3!''}" >技术创新动态</a></#if><#if moduleCode=="NEWS_D"><a href="${rc.contextPath}${url3!''}" >创新创业动态</a></#if><#if moduleCode=="NEWS_E"><a href="${rc.contextPath}${url3!''}" >政策动态</a></#if><#if moduleCode=="NEWS_F"><a href="${rc.contextPath}${url3!''}" >国家政策</a></#if><#if moduleCode=="NEWS_G"><a href="${rc.contextPath}${url3!''}" >省级政策</a></#if><#if moduleCode=="NEWS_H"><a href="${rc.contextPath}${url3!''}" >本市政策</a></#if><#if moduleCode=="NEWS_I"><a href="${rc.contextPath}${url3!''}" >政策解读</a></#if><#if moduleCode=="NEWS_K"><a href="${rc.contextPath}${url3!''}" >产业成功案例</a></#if><#if moduleCode=="NEWS_P">线下培训</#if><#if moduleCode=="NEWS_Q">职位发布</#if><#if moduleCode=="NEWS_R">简历投递</#if><#if moduleCode=="NEWS_S">诚信认证服务机构</#if><#if moduleCode=="NEWS_T">行业协会</#if></#if>
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
                <div class="content-art white" style="min-height:800px;">
                    <h2 class="f30 tc">${(NewsOne.NEWS_TITLE)!''}</h2>
                    <p class="tc f12 xx">发布时间：<#if NewsOne?? && NewsOne.NEWS_TIME??>${((NewsOne.NEWS_TIME)!"")?string("yyyy-MM-dd HH:mm:ss")}</#if> &nbsp;&nbsp;来源：${(NewsOne.COMMENTS)!""}</p>
                    <div class="con">
                        ${(NewsOne.NEWS_CONTENT)!""}
                    </div>
                </div>
                <div class="white mt15 p30 more-item" style="background:#eaeaea">
                    <#if NewsPre??>
						
						<a href="${rc.contextPath}${url4!''}${(NewsPre.ID)!''}" title="${(NewsPre.NEWS_TITLE)!'' }"><span>上一条</span>${(NewsPre.NEWS_TITLE)!"" }</a>
					<#else>
					    <!--没有上一条-->
					</#if>
					<#if NewsNext??>
						
						<a href="${rc.contextPath}${url4!''}${(NewsNext.ID)!''}" title="${(NewsNext.NEWS_TITLE)!'' }" class="mt10"><span>下一条</span>${(NewsNext.NEWS_TITLE)!''}</a>
					<#else>
					    <!--没有下一条-->
					</#if>
                </div>
            </div>
            
            <form id="myparam" action="${rc.contextPath}/info/morenews.do" method="post"> 
                    <input id="articleId" name="articleId"   type="hidden" value=""></input>  
                    <input id="moduleCode" name="moduleCode" type="hidden" value="${(moduleCode)!''}"></input>
                    <input id="parentCode" name="parentCode" type="hidden" value="${(parentCode)!''}"></input>
                    <input id="moduleType" name="moduleType" type="hidden" value="${(moduleType)!''}"></input>
                    <input id="fModuleCode" name="fModuleCode" type="hidden" value="${(fModuleCode)!''}"></input>
                    <input id="fParentCode" name="fParentCode" type="hidden" value="${(fParentCode)!''}"></input>
                    <input id="url1" name="url1"  type="hidden" value="${(url1)!''}"></input>
                    <input id="url2" name="url2"  type="hidden" value="${(url2)!''}"></input>
                    <input id="url3" name="url3"  type="hidden" value="${(url3)!''}"></input>
            </form>
            
            
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
