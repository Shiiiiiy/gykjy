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
    <title>需求供应-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
    <#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;"></div></a> 
	<div class="container mainbg mt20">
	<!-- bread -->
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
                您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;&nbsp;&nbsp;<a href="${rc.contextPath}/forum">对接服务</a><span>&gt;</span>供应信息
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
                <h3 class="f16"><i class="iconfont mr5 f20">&#xe6c1;</i>供应信息</h3>
                <div class="newslist-con" style="min-height:800px;">
                	<ul id="listmore"><!--需求供应表格-->
					    <#if NeedsList?? >
						    <#list NeedsList as aa>
						       <li><a href="${rc.contextPath}/forum/supplyview/${(aa.ID)!''}" title="${(aa.NAME)!''}"><span class="date">${((aa.CREATE_TIME)!"")}</span>${(aa.NAME)!''}</a></li>   
						    </#list>
					    </#if> 
					</ul>  
	                <button onclick="GetMore()" <#if NeedsList?? && NeedsList?size lt 10>disabled</#if> id="tmore" type="button" class="btn btn-primary btn-block mt10"><#if NeedsList?? && NeedsList?size lt 10>没有更多<#else><i class="iconfont mr5" style="vertical-align:middle">&#xe605;</i>加载更多</#if></button>
              
                  
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
        });
        function GetMore(){/*获取更多*/
			var pageNo = Number($("#listmore li").length);
			//alert(pageNo);
	        $.post("${rc.contextPath}/forum/loadsupply.do",{"pageNo":pageNo},function(obj) {
	        	var shumu=0;
	        	if(obj=="nomore"){
		             $("#tmore").html("没有更多");
		             $("#tmore").attr("disabled","disabled");
	            }else{
	                 $.each(obj,function(index,value){
		                $("#listmore").append(
		                	"<li><a href=${rc.contextPath}/forum/supplyview/"+value.ID+" title="+ value.NAME +"><span class='date'>"+value.CREATE_TIME+"</span>"+value.NAME+"</a></li>"
		                );
		                shumu=shumu+1;
		             });
		             if(shumu < 10){
		            	$("#tmore").html("没有更多");
		            	$("#tmore").attr("disabled","disabled");
		             }else{
		            	$("#tmore").html("<i class='iconfont mr5' style='vertical-align:middle'>&#xe605;</i>加载更多");
		            	$("#tmore").removeAttr("disabled");
		             }
	            }
	        },"json");
		}
    </script>
</body>
</html>
