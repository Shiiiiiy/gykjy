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
    <title>技术创新成果-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
    <#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;"></div></a>  
	<div class="container mainbg mt20">
	<!-- bread -->
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span><a href="${rc.contextPath}/innovate">创新创业</a><span>&gt;</span>创新创业平台
		</div>
	        <div class="search fr search-xs" >
	            <div class="fl"><input type="text" class="search-text" id="searchCompany_text" value="${keyWord!''}" name="" placeholder="搜企业" /></div>
	            <div class="fr"><button class="search-but" onclick="searchCompany()" ><i class="iconfont f30">&#xe60a;</i></button></div>
	        </div>
    </div>
    <!-- list -->
    <div class="mt20 mb20">
        <div class="row art-con" style="padding:0;">
            <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
                <div class="content-art white table-responsive" style="min-height:850px;">
                    <table id="mytable" class="table table-hover table-striped table-bordered my-table">
                        <thead>
                            <tr>
                                <th width="10%">序号</th>
                                <th width="20%">名称</th>
                                <th width="20%">类型</th>
                                <th width="20%">投资主体</th>
                                <th width="15%">级别</th>
                                <th width="15%">成立时间</th>
                            </tr>
                        </thead>
                        <tbody>
                          <#if platformList??>
                               <#list platformList as pt>
		                            <tr>
		                                <td>${pt_index+1}</td>
		                                <td>${(pt.PLAT_NAME)!""}</td>
		                                <td>${(pt.PLAT_TYPE)!""}</td>
		                                <td>${(pt.INVESTOR)!""}</td>
		                                <td>${(pt.PLAT_LEVEL)!""}</td>
		                                <td><#if pt?? && pt.PLAT_TIME??>${((pt.PLAT_TIME)!"")?string("yyyy-MM-dd")}</#if></td>
		                            </tr>
                               </#list>
                          </#if>   
                        </tbody>
                    </table>
                
                    <button type="button" id="tmore" onclick="GetMore()" <#if platformList?? && platformList?size lt 10>disabled</#if>  class="btn btn-primary btn-block mt20"><#if platformList?? && platformList?size lt 7>没有更多<#else><i class="iconfont mr5" style="vertical-align:middle">&#xe605;</i>加载更多</#if></button>
              
                </div>
            </div>
            <div class="col-md-3 col-lg-3 hidden-sm hidden-xs pr tj-r">
                <div id="float-right" class="white">
                    <div class="con-r-r">
                        <h3 class="f16"><i class="iconfont mr5 f20">&#xe690;</i>推荐企业</h3>
                        <ul class="tj-list">
                            <#if adList??>
			                      <#list adList as ad>
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
    
    <input type="hidden" id="pageNo" name="pageNo" value="${(pageNo)!'0'}" />
     <input type="hidden" id="temp" name="temp" value="10" />
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
        
        
        
         function GetMore(){
			var pageNo = $("#pageNo").val();
	        $.post("${rc.contextPath}/innovate/getMoreTableList.do",{"pageNo":pageNo,"flag":"A"},function(obj) {
	        
	        	if(obj=="nomore"){
		             $("#tmore").html("没有更多");
		             $("#tmore").removeAttr("onclick");
		             $("#tmore").attr("disabled","true");
	            }else{
	                 $.each(obj,function(index,value){
	                    $("#temp").val(parseInt($("#temp").val())+1);
		                $("#mytable tbody").append("<tr><td>"+$("#temp").val()+"</td><td>"+value.PLAT_NAME+"</td><td>"+value.PLAT_TYPE+"</td><td>"+value.INVESTOR+"</td><td>"+value.PLAT_LEVEL+"</td><td>"+value.PLAT_TIME+"</td></tr>");
		                               
		            });
		            $("#pageNo").val(parseInt(pageNo)+1);
	            }
	            
	        },"json");
		}
        
        
    </script>
</body>
</html>
