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
    <title>新闻列表-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
    <#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;"></div></a> 
	<div class="container mainbg mt20">
	<!-- bread -->
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span>
            <#if moduleCode??><a href="${rc.contextPath}${url1!''}"><#if moduleCode=="NEWS_N">网站公告</#if><#if moduleCode=="NEWS_A">企业信息<span>&gt;</span></#if><#if moduleCode=="NEWS_B">产品服务<span>&gt;</span></#if><#if moduleCode=="NEWS_M">支柱产业<span>&gt;</span></#if><#if moduleCode=="NEWS_L">产业园区<span>&gt;</span></#if><#if moduleCode=="NEWS_C">技术创新<span>&gt;</span></#if><#if moduleCode=="NEWS_D">创新创业<span>&gt;</span></#if><#if moduleCode=="NEWS_E" || moduleCode=="NEWS_F" || moduleCode=="NEWS_G"|| moduleCode=="NEWS_H"|| moduleCode=="NEWS_I" >产业政策<span>&gt;</span></#if><#if moduleCode=="NEWS_K" || moduleCode=="NEWS_P" ||moduleCode=="NEWS_Q" ||moduleCode=="NEWS_R" ||moduleCode=="NEWS_S" || moduleCode=="NEWS_T" >对接服务<span>&gt;</span></#if></a></a></#if>
            <#if parentCodeName?? && ""!=parentCodeName><a href="${rc.contextPath}${url2!''}">${parentCodeName!""}</a><span>&gt;</span></#if><#if moduleCode??><#if moduleCode=="NEWS_A">企业风采</#if><#if moduleCode=="NEWS_B" && parentCode=="NO" >产品资讯</#if><#if moduleCode=="NEWS_B" && parentCode!="NO" >产品资讯</#if><#if moduleCode=="NEWS_M">产业动态</#if><#if moduleCode=="NEWS_L" && parentCode=="NO">园区动态</#if><#if moduleCode=="NEWS_L" && parentCode!="NO" && moduleType?? && moduleType=="GARDEN_A">园区动态</#if><#if moduleCode=="NEWS_L" && parentCode!="NO" && moduleType?? && moduleType=="GARDEN_B">园区政策</#if><#if moduleCode=="NEWS_C">技术创新动态</#if><#if moduleCode=="NEWS_D">创新创业动态</#if><#if moduleCode=="NEWS_E">政策动态</#if><#if moduleCode=="NEWS_F">国家政策</#if><#if moduleCode=="NEWS_G">省级政策</#if><#if moduleCode=="NEWS_H">本市政策</#if><#if moduleCode=="NEWS_I">政策解读</#if><#if moduleCode=="NEWS_K">产业成功案例</#if><#if moduleCode=="NEWS_P">线下培训</#if><#if moduleCode=="NEWS_Q">职位发布</#if><#if moduleCode=="NEWS_R">简历投递</#if><#if moduleCode=="NEWS_S">诚信认证服务机构</#if><#if moduleCode=="NEWS_T">行业协会</#if></#if>
        </div>
	        <div class="search fr search-xs" >
	            <div class="fl"><input type="text" class="search-text" id="searchCompany_text" value="${keyWord!''}" name="" placeholder="搜企业" /></div>
	            <div class="fr"><button class="search-but" onclick="searchCompany()" ><i class="iconfont f30">&#xe60a;</i></button></div>
	        </div>
    </div>
    <!-- list -->
    <div class="white mt20 mb20">
        <div class="row list-content">
            <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
                <h3 class="f16"><i class="iconfont mr5 f20">&#xe6c1;</i><#if moduleCode??><#if moduleCode=="NEWS_N">网站公告</#if><#if moduleCode=="NEWS_A">企业风采</#if><#if moduleCode=="NEWS_B" && parentCode=="NO" >产品资讯</#if><#if moduleCode=="NEWS_B" && parentCode!="NO" >产品资讯</#if><#if moduleCode=="NEWS_M">产业动态</#if><#if moduleCode=="NEWS_L" && parentCode=="NO">园区动态</#if><#if moduleCode=="NEWS_L" && parentCode!="NO" && moduleType?? && moduleType=="GARDEN_A">园区动态</#if><#if moduleCode=="NEWS_L" && parentCode!="NO" && moduleType?? && moduleType=="GARDEN_B">园区政策</#if><#if moduleCode=="NEWS_C">技术创新动态</#if><#if moduleCode=="NEWS_D">创新创业动态</#if><#if moduleCode=="NEWS_E">政策动态</#if><#if moduleCode=="NEWS_F">国家政策</#if><#if moduleCode=="NEWS_G">省级政策</#if><#if moduleCode=="NEWS_H">本市政策</#if><#if moduleCode=="NEWS_I">政策解读</#if><#if moduleCode=="NEWS_K">产业成功案例</#if><#if moduleCode=="NEWS_P">线下培训</#if><#if moduleCode=="NEWS_Q">职位发布</#if><#if moduleCode=="NEWS_R">简历投递</#if><#if moduleCode=="NEWS_S">诚信认证服务机构</#if><#if moduleCode=="NEWS_T">行业协会</#if></#if></h3>
                <div class="newslist-con" style="min-height:800px;word-break:break-all;">
                	<ul id="listmore">
					    <#if NewslistM?? >
						    <#list NewslistM as aa>
						       <li><a href="${rc.contextPath}${url4!''}${(aa.ID)!''}" title="${(aa.NEWS_TITLE)!''}"><span class="date">${((aa.NEWS_TIME)!"")?string("yyyy-MM-dd")}</span>${(aa.NEWS_TITLE)!''}</a></li>   
						    </#list>
					    </#if> 
					</ul>  
	                <button onclick="GetMore()" <#if NewslistM?? && NewslistM?size lt 10>disabled</#if> id="tmore" type="button" class="btn btn-primary btn-block mt10"><#if NewslistM?? && NewslistM?size lt 10>没有更多<#else><i class="iconfont mr5" style="vertical-align:middle">&#xe605;</i>加载更多</#if></button>
	                        
                    
                 <input id="pageNo" type="hidden" value="${(pageNo)!'0'}"></input>
                 <form id="myparam" action="${rc.contextPath}/info/onenews.do" method="post">   
                    <input id="moduleCode" name="moduleCode" type="hidden" value="${(moduleCode)!''}"></input>
                    <input id="parentCode"  name="parentCode" type="hidden" value="${(parentCode)!''}"></input>
                    <input id="moduleType"  name="moduleType" type="hidden" value="${(moduleType)!''}"></input>
                    <input id="fModuleCode"  name="fModuleCode" type="hidden" value="${(fModuleCode)!''}"></input>
                    <input id="fParentCode"  name="fParentCode" type="hidden" value="${(fParentCode)!''}"></input>
                    <input id="url1"  name="url1" type="hidden" value="${(url1)!''}"></input>
                    <input id="url2"  name="url2" type="hidden" value="${(url2)!''}"></input>
                    <input id="url3"   name="url3" type="hidden" value="${(url3)!''}"></input>
                    <input id="articleId" name="articleId"   type="hidden" value=""></input>
                 </form> 
                 
                  
                </div>
            </div>
            <div class="col-md-3 col-lg-3 hidden-sm hidden-xs pr tj-r">
                <div id="float-right">
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
            NoCilck();
        });
        function NoCilck(){//追加 不可点新闻判断
            var zhi="${(moduleCode)!''}";
            if("NEWS_S"==zhi ){
            	$("#listmore a").attr("href","javascript:void(0);");
            	$("#listmore a").css("cursor","default");
            }
        }
        function GetMore(){/*获取更多新闻*/
			var pageNo = $("#pageNo").val();
			var moduleCode = $("#moduleCode").val();
			var parentCode = $("#parentCode").val();
			var moduleType = $("#moduleType").val();
			if("NO"==parentCode){parentCode="N";}
			if("NO"==moduleType){moduleType="N";}
	        $.post("${rc.contextPath}/info/loadnews.do",{"pageNo":pageNo,"moduleCode":moduleCode,"parentCode":parentCode,"moduleType":moduleType},function(obj) {
	        	var shumu=0;
	        	if(obj=="nomore"){
		             $("#tmore").html("没有更多");
		             $("#tmore").attr("disabled","disabled");
	            }else{
	                 $.each(obj,function(index,value){
		                $("#listmore").append(
		                	"<li><a href=${rc.contextPath}${url4!''}"+value.ID+" title="+ value.NEWS_TITLE +"><span class='date'>"+value.NEWS_TIME+"</span>"+value.NEWS_TITLE+"</a></li>"
		                );
		             });
		             $("#pageNo").val(Number(pageNo)+1);
		             NoCilck();
	            }
	        },"json");
		}
    </script>
</body>
</html>
