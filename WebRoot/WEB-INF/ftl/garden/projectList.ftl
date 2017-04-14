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
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span><a href="${rc.contextPath}/garden">产业园区</a><span>&gt;</span>
            <#if garden??><a href="${rc.contextPath}${url1!''}">${(garden.NAME)!""}</a><span>&gt;</span></#if>
            <#if projectType?? && projectType=="BASE"><a href="${rc.contextPath}${url1!''}">园区基础设施建设项目</a><span>&gt;</span><#elseif projectType?? && projectType=="INDUSTRY"><a href="${rc.contextPath}${url1!''}">园区产业项目</a><span>&gt;</span></#if>
            <#if projectStatus??><#if  projectStatus=="PROSTATUS_A">拟建<#elseif projectStatus=="PROSTATUS_B">在建<#elseif projectStatus=="PROSTATUS_C">竣工</#if></#if>
        </div>
	        <div class="search fr search-xs" >
	            <div class="fl"><input type="text" class="search-text" id="searchCompany_text" value="${keyWord!''}" name="" placeholder="搜企业" /></div>
	            <div class="fr"><button class="search-but" onclick="searchCompany()" ><i class="iconfont f30">&#xe60a;</i></button></div>
	        </div>
    </div>
    <!-- list -->
    <div class="white mt20 mb20">
         <div class="row art-con" style="padding:0;">
            <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
                <div class="content-art white table-responsive" style="min-height:850px;">
                    <table id="mytable" class="table table-hover table-striped table-bordered my-table">
                        <thead>
                            <tr>
                            	<th width="7%">序号</th>
                                <th width="20%">项目名称</th>
                                <th width="30%">项目内容</th>
                                <th width="13%">项目启动时间</th>
                                <th width="13%">项目完工时间</th>
                                <th width="18%">投资额度(万元)</th>
                            </tr>
                        </thead>
                        <tbody id="listmore">
                           <#if projectList??>
	                        <#list projectList as rp>
		                            <tr>
		                            	<td>${rp_index+1}</td>
		                                <td>${rp.PRO_NAME}</td>
		                                <td>${(rp.PRO_CONTENT)!""}</td>
		                                <td><#if rp?? && rp.PRO_TIME??>${((rp.PRO_TIME)!"")?string("yyyy-MM-dd")}</#if></td>
		                                <td><#if rp?? && rp.PRO_OVERTIME??>${((rp.PRO_OVERTIME)!"")?string("yyyy-MM-dd")}</#if></td>
		                                <td>${(rp.PRO_INVEST)!"0"}</td>
		                            </tr>
                               </#list>
                          </#if>   
                        </tbody>
                    </table>
                    
                    <button type="button" id="tmore" <#if projectList?? && projectList?size lt 10>disabled</#if> onclick="GetMore()"  class="btn btn-primary btn-block mt20"><#if projectList?? && projectList?size lt 10>没有更多<#else><i class="iconfont mr5" style="vertical-align:middle">&#xe605;</i>加载更多</#if></button>
                </div>
            </div>
            <div class="col-md-3 col-lg-3 hidden-sm hidden-xs pr tj-r">
                <div id="float-right" class="white">
                    <div class="con-r-r">
                        <h3 class="f16"><i class="iconfont mr5 f20">&#xe690;</i>推荐企业</h3>
                        <ul class="tj-list">
                            <#if adImages??>
			                      <#list adImages as ad>
			                              <li><a href="${(ad.URL)!''}" target="_blank"><img src="${rc.contextPath}/plugins/images/allImages/${(ad.FILE_NAME)!''}" alt="${(ad.FILE_TITLE)!''}" class="img-responsive" /></a></li>
			                      </#list>
			                </#if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
     <input id="pageNo" type="hidden" value="${(pageNo)!'0'}"></input> 
	 <input id="projectType" name="projectType" type="hidden" value="${(projectType)!''}"></input>
	 <input id="projectStatus"  name="projectStatus" type="hidden" value="${(projectStatus)!''}"></input>
    
    <!-- footer -->
   <#include "/footerAndHeader/footers.ftl"/>
    <script type="text/javascript">
        $(function () {
            //focus
            $(".prev,.next").hover(function () {
                $(this).stop().fadeTo("show", 0.9);
            }, function () {
                $(this).stop().fadeTo("show", 0.4);
            });
            jQuery(".slider-box").slide({ mainCell: ".slider-con", effect: "leftLoop", vis: 1, interTime: 4500, delayTime: 700, autoPlay: true });
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
        
       
        
        
        function GetMore(){/*获取更多项目*/
			var pageNo = $("#pageNo").val();
			var gardenId ="${(garden.ID)!''}";
			var projectType = $("#projectType").val();
			var projectStatus = $("#projectStatus").val();
			
	        $.post("${rc.contextPath}/garden/getMoreProject.do",{"pageNo":pageNo,"projectType":projectType,"projectStatus":projectStatus,"gardenId":gardenId},function(obj) {
	        
	        	if(obj=="nomore"){
		             $("#tmore").html("没有更多");
		             $("#tmore").removeAttr("onclick");
		             $("#tmore").attr("disabled","true");
	            }else{
	            	var xvhao=$("#listmore tr").length;
	                $.each(obj,function(index,value){
		                $("#mytable tbody").append("<tr><td>"+(index+xvhao+1)+"</td><td>"+value.PRO_NAME+"</td><td>"+value.PRO_CONTENT+"</td><td>"+value.PRO_TIME+"</td><td>"+value.PRO_OVERTIME+"</td><td>"+value.PRO_INVEST+"</td></tr>");
		               
		            });
		            $("#pageNo").val(parseInt(pageNo)+1);
	            }
	            
	        },"json");
		}
    </script>
</body>
</html>
