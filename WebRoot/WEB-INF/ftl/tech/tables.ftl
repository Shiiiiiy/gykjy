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
    <title>成果展示-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
    <!-- topbar -->
	<#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;"></div></a>
	<div class="container mainbg mt20">
	<!-- bread -->
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span><a href="${rc.contextPath}/tech">技术创新</a><span>&gt;</span>
        <#if tablename=="table1" >技术创新成果</#if><#if tablename=="table2" >技术创新平台</#if>
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
                <div class="content-art white table-responsive" style="min-height:850px;padding:20px 30px;">
                	<input id="tablename"  type="hidden" value="${(tablename)!''}"></input>  
                    <#if tablename=="table1" && Tables1??>
                    <h3 class="f16"><i class="iconfont mr5 f20">&#xe6c1;</i>贵阳市专利申请明星企业</h3><br/>
                    <table class="table table-hover table-striped table-bordered my-table">
                        <thead>
                            <tr><th width='4%'>序号</th>
                            <th width='24%'>企业名称</th>
                            <th width='8%'>归属</th>
                            <th width='8%'>认证等级</th>
                            <th width='8%'>认证时间</th>
                            <th width='8%'>有效期</th></tr>                     
                        </thead>
                        <tbody id="listmore1">
                            <#list Tables1 as aa>
                            <tr>
                            	<td>${aa_index+1}</td>
                                <td>${(aa.NAME)!""}</td>
                                <td>${(aa.BELONG)!""}</td>
                                <td>${(aa.LEVEL)!""}</td>
                                <td>${(aa.CERT_TIME)!""}</td>
                                <td>${(aa.EFFECT_TIME)!""}</td>
                            </tr>
                            </#list>    
                        </tbody>
                    </table>
                    <input id="pageNo1"  type="hidden" value="${(pageNo1)!''}"></input>
                    <button type="button" <#if Tables1?? && Tables1?size lt 5>disabled</#if> id="tmore1" onclick="GetMore('TYPE_A');" class="btn btn-primary btn-block mt20"><#if Tables1?? && Tables1?size lt 5>没有更多<#else><i class="iconfont mr5" style="vertical-align:middle">&#xe605;</i>加载更多</#if></button>  
                    </#if>
                    <br/><hr><br/>
                    <#if tablename=="table1" && Tables2??>
                    <h3 class="f16"><i class="iconfont mr5 f20">&#xe6c1;</i>贵阳市知识产权优势培育企业</h3><br/>
                    <table class="table table-hover table-striped table-bordered my-table">
                        <thead>
                            <tr><th width='4%'>序号</th>
                            <th width='24%'>企业名称</th>
                            <th width='8%'>归属</th>
                            <th width='8%'>认证等级</th>
                            <th width='8%'>认证时间</th>
                            <th width='8%'>有效期</th></tr>                      
                        </thead>
                        <tbody id="listmore2">
                            <#list Tables2 as aa>
                            <tr>
                            	<td>${aa_index+1}</td>
                                <td>${(aa.NAME)!""}</td>
                                <td>${(aa.BELONG)!""}</td>
                                <td>${(aa.LEVEL)!""}</td>
                                <td>${(aa.CERT_TIME)!""}</td>
                                <td>${(aa.EFFECT_TIME)!""}</td>
                            </tr>
                            </#list>    
                        </tbody>
                    </table>
                    <input id="pageNo2"  type="hidden" value="${(pageNo2)!''}"></input>
                    <button type="button" <#if Tables2?? && Tables2?size lt 5>disabled</#if> id="tmore2" onclick="GetMore('TYPE_B');" class="btn btn-primary btn-block mt20"><#if Tables2?? && Tables2?size lt 5>没有更多<#else><i class="iconfont mr5" style="vertical-align:middle">&#xe605;</i>加载更多</#if></button>  
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
			                              <li><a href="${(ad.URL)!''}" target="_blank" ><img src="${rc.contextPath}/plugins/images/allImages/${(ad.FILE_NAME)!''}" alt="" class="img-responsive" /></a></li>
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
        function GetMore(zhi){/*获取更多*/
        	var type = zhi;
        	var pageNo = 0;
        	var add ="";
        	if(zhi=="TYPE_A"){
        		pageNo = $("#pageNo1").val();
        		add="1";
        	}else if(zhi=="TYPE_B"){
        		pageNo = $("#pageNo2").val();
        		add="2";
        	}
			var tablename = $("#tablename").val();
	        $.post("${rc.contextPath}/tech/moretables.do",{"tablename":tablename,"type":type,"pageNo":pageNo},function(obj) {
	        	if(obj=="nomore"){
		             $("#tmore"+add).html("没有更多");
		             $("#tmore"+add).removeAttr("onclick");
		             $("#tmore"+add).attr("disabled",true);
	            }else{
	            	var xvhao=$("#listmore"+add).children("tr").length;
	            	var shumu=0;
	            	var kong1="";
	            	var zhi2="";
	            	var zhi3="";
	            	var zhi5="";
	                $.each(obj,function(index,value){
		                zhi2=value.BELONG+"";
		                zhi3=value.LEVEL+"";
	                	zhi5=value.EFFECT_TIME+"";
	                	if("null"==zhi2){zhi2="";}
                		if("null"==zhi3){zhi3="";}
                		if("null"==zhi5){zhi5="";}
	                	
	                	$("#listmore"+add).append(
	                	    "<tr><td>"+(1+index+xvhao)+"</td>"+
	                	    "<td>"+value.NAME+"</td>"+
                            "<td>"+zhi2+"</td>"+
                            "<td>"+zhi3+"</td>"+
                            "<td>"+value.CERT_TIME+"</td>"+
                            "<td>"+zhi5+"</td></tr>"
		                );
		                shumu=shumu+1;
		            });	            
		            if(shumu < 5){
			             $("#tmore"+add).html("没有更多");
			             $("#tmore"+add).removeAttr("onclick");
			             $("#tmore"+add).attr("disabled",true);
		            }
		            
		            $("#pageNo"+add).val(Number(pageNo)+1);
	            }	            
	        },"json");
		}
    </script>
    </script>
</body>
</html>
