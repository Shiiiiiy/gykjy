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
    <title>中关村贵阳科技园产业云平台</title>
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
            <#if moduleCode??><a href="${rc.contextPath}${url1!''}"><#if moduleCode=="NEWS_N">网站公告</#if><#if moduleCode=="NEWS_A">企业信息</#if><#if moduleCode=="NEWS_B">产品服务</#if><#if moduleCode=="NEWS_M">支柱产业</#if><#if moduleCode=="NEWS_L">产业园区</#if><#if moduleCode=="NEWS_C">技术创新</#if><#if moduleCode=="NEWS_D">创新创业</#if><#if moduleCode=="NEWS_E">产品政策</#if><#if moduleCode=="NEWS_K" || moduleCode=="NEWS_P" ||moduleCode=="NEWS_Q" ||moduleCode=="NEWS_R" ||moduleCode=="NEWS_S" || moduleCode=="NEWS_T" >对接服务</#if></a><span>&gt;</span></#if>
            <#if parentCodeName?? && ""!=parentCodeName > 
            <a href="${rc.contextPath}${url3!''}">${parentCodeName!''}</a><span>&gt;</span>
            </#if>
            <a><#if FILE_TYPE??>
                <#if FILE_TYPE=="FILE_E1">产业成功案例</#if>
                <#if FILE_TYPE=="FILE_E2">产业研究报告</#if>
                <#if FILE_TYPE=="FILE_D">培训课件</#if>
                <#if FILE_TYPE=="FILE_E">研究报告</#if>
                <#if FILE_TYPE=="FILE_F">管理案例</#if>
                <#if FILE_TYPE=="FILE_G">技术创新案例</#if>
                <#if FILE_TYPE=="FILE_H">财经评论</#if>
                <#if FILE_TYPE=="FILE_I">其它</#if>
                <#if FILE_TYPE=="FILE_B">产学研合作</#if>
                <#if FILE_TYPE=="FILE_C">技术创新指数</#if>
                <#if FILE_TYPE=="FILE_URL">线上培训</#if>
                <#if FILE_TYPE=="FILE_A">经济运行分析报告</#if>
            </#if></a>
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
                <h3 class="f16"><i class="iconfont mr5 f20">&#xe6c1;</i>
                <#if FILE_TYPE??>
                <#if FILE_TYPE=="FILE_E1">产业成功案例</#if>
                <#if FILE_TYPE=="FILE_E2">产业研究报告</#if>
                <#if FILE_TYPE=="FILE_D">培训课件</#if>
                <#if FILE_TYPE=="FILE_E">研究报告</#if>
                <#if FILE_TYPE=="FILE_F">管理案例</#if>
                <#if FILE_TYPE=="FILE_G">技术创新案例</#if>
                <#if FILE_TYPE=="FILE_H">财经评论</#if>
                <#if FILE_TYPE=="FILE_I">其它</#if>
                <#if FILE_TYPE=="FILE_B">产学研合作</#if>
                <#if FILE_TYPE=="FILE_C">技术创新指数</#if>
                <#if FILE_TYPE=="FILE_URL">线上培训</#if>
                <#if FILE_TYPE=="FILE_A">经济运行分析报告</#if>
                </#if></h3>
                <div class="newslist-con" style="min-height:800px;word-break:break-all;">
                	<ul id="listmore">
					    <#if NewslistM?? >
					    <#if FILE_TYPE?? && FILE_TYPE == 'FILE_URL' >
						    <#list NewslistM as aa>
						       <li title="${(aa.FILE_TITLE)!''}"><a href="${(aa.URL)!''}" target="_blank" ><span class="date">${(aa.CREATE_TIME)!""}</span>${(aa.FILE_TITLE)!''}</a></li>   
						    </#list>
					    <#else>
					    	<#list NewslistM as aa>
						       <li title="${(aa.FILE_TITLE)!''}"><a href="${rc.contextPath}/plugins/images/allFiles/${(aa.FILE_NAME)!''}" target="_blank" ><span class="date">${(aa.CREATE_TIME)!""}</span>${(aa.FILE_TITLE)!''}</a></li>   
						    </#list>
					    </#if>
					    </#if> 
					</ul>

                    <button onclick="GetMore()" <#if NewslistM?? && NewslistM?size lt 10>disabled</#if>  id="tmore" type="button" class="btn btn-primary btn-block  mt10"><#if NewslistM?? && NewslistM?size lt 10>没有更多<#else><i class="iconfont mr5" style="vertical-align:middle">&#xe605;</i>加载更多</#if></button>

                    
                 <input id="pageNo" type="hidden" value="${(pageNo)!'0'}"></input>
                 <form id="myparam" action="${rc.contextPath}/info/onenews.do" method="post">   
                    <input id="moduleCode" name="moduleCode" type="hidden" value="${(moduleCode)!''}"></input>
                    <input id="parentCode"  name="parentCode" type="hidden" value="${(parentCode)!''}"></input>
                    <input id="moduleType"  name="moduleType" type="hidden" value="${(moduleType)!''}"></input>
                    <input id="FILE_TYPE"  name="FILE_TYPE" type="hidden" value="${(FILE_TYPE)!''}"></input>
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
                                   <li><a href="${(ad.URL)!''}" target="_blank" ><img src="${rc.contextPath}/plugins/images/allImages/${(ad.FILE_NAME)!'tj1.jpg'}" alt="" class="img-responsive" /></a></li>
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
        });
        
       
        
        
        function GetMore(){/*获取更多*/
			var pageNo = $("#pageNo").val();
			var moduleCode = $("#moduleCode").val();
			var parentCode = $("#parentCode").val();
			var fmoduleCode = $("#fModuleCode").val();
			var fparentCode = $("#fParentCode").val();
			var FILE_TYPE = $("#FILE_TYPE").val();
			
			
	        $.post("${rc.contextPath}/info/morefiles.do",{"pageNo":pageNo,"fModuleCode":fmoduleCode,"fParentCode":fparentCode,"FILE_TYPE":FILE_TYPE},function(obj) {
	        	var shumu=0;
	        	if(obj=="nomore"){
		             $("#tmore").html("没有更多");
		             $("#tmore").attr("disabled","disabled");
	            }else{
	            	 var shumu=0;
	                 $.each(obj,function(index,value){
	                 	if( FILE_TYPE == "FILE_URL" ){
			                $("#listmore").append(
			                	"<li title="+value.FILE_TITLE+"><a href="+value.URL+" target='_blank'><span class='date'>"+value.CREATE_TIME+"</span>"+value.FILE_TITLE+"</a></li>"  
			                );
			                shumu=shumu+1;
		                }else{
		                	$("#listmore").append(
			                	"<li title="+value.FILE_TITLE+"><a href=${rc.contextPath}/plugins/images/allFiles/"+value.FILE_NAME+" target='_blank'><span class='date'>"+value.CREATE_TIME+"</span>"+value.FILE_TITLE+"</a></li>"  
			                );
			                shumu=shumu+1;
		                }
		            });
			        if(shumu < 10){
		            	$("#tmore").html("没有更多");
		            	$("#tmore").attr("disabled","disabled");
		            }else{
		            	$("#tmore").html("<i class='iconfont mr5' style='vertical-align:middle'>&#xe605;</i>加载更多");
		            	$("#tmore").removeAttr("disabled");
		            }
		            $("#pageNo").val(Number(pageNo)+1);
	            }	            
	        },"json");
		}
    </script>
</body>
</html>