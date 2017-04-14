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
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w"  style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;"></div></a>
	<div class="container mainbg mt20">
	<!-- bread -->
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span><a href="${rc.contextPath}/innovate">创新创业</a><span>&gt;</span>创新创业成果
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
                <div class="content-art white table-responsive list-content" style="min-height:850px;padding:20px 30px;">
                    <div class="con-sub">
                        <div class="on-con">
                            <h3 class="f16"><i class="iconfont mr5 f20">&#xe6c1;</i>年度新增创新企业名录</h3>
                            <table id="mytable1" class="table table-hover table-striped table-bordered my-table mt20">
                                <thead>
                                    <tr>
                                        <th width="8%">序号</th>
		                                <th width="15%">企业名称</th>
		                                <th width="11%">行业类别</th>
		                                <th width="12%">核心技术</th>
		                                <th width="11%">投资规模</th>
		                                <th width="10%">联系人</th>
		                                <th width="15%">电话</th>
		                                <th width="18%">公司网址</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <#if compList1??>
			                               <#list compList1 as pt1>
					                            <tr>
					                                <td>${pt1_index+1}</td>
					                                <td>${(pt1.COMP_NAME)!""}</td>
					                                <td>${(pt1.OF_INDUSTRY)!""}</td>
					                                <td>${(pt1.TECHNOLOGY)!""}</td>
					                                <td>${(pt1.SCALE)!"￥ 0"}</td>
					                                <td>${(pt1.LINKMAN)!""}</td>
					                                <td>${(pt1.TEL)!""}</td>
					                                <td><a href="${(pt1.WEBSITE)!''}" target="_blank">${(pt1.WEBSITE)!""}</a></td>
					                            </tr>
			                               </#list>
			                          </#if>  
                                </tbody>
                            </table>
                         
                            <button type="button" id="tmore1" onclick="GetMore('C')" <#if compList1?? && compList1?size lt 10>disabled</#if> class="btn btn-primary btn-block mt20"><#if compList1?? && compList1?size lt 7>没有更多<#else><i class="iconfont mr5" style="vertical-align:middle">&#xe605;</i>加载更多</#if></button>
                            
                        </div>
                        <div class="tabcon">
                            <h3 class="f16"><i class="iconfont mr5 f20">&#xe6c1;</i>年度成功引入风险投资企业名录</h3>
                            <table id="mytable2" class="table table-hover table-striped table-bordered my-table mt20">
                                <thead>
                                    <tr>
                                        <th width="8%">序号</th>
		                                <th width="15%">企业名称</th>
		                                <th width="11%">行业类别</th>
		                                <th width="12%">投资机构</th>
		                                <th width="11%">投资规模</th>
		                                <th width="10%">联系人</th>
		                                <th width="15%">电话</th>
		                                <th width="18%">公司网址</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <#if compList2??>
			                               <#list compList2 as pt2>
					                            <tr>
					                                <td>${pt2_index+1}</td>
					                                <td>${(pt2.COMP_NAME)!""}</td>
					                                <td>${(pt2.OF_INDUSTRY)!""}</td>
					                                <td>${(pt2.INVESTOR)!""}</td>
					                                <td>${(pt2.SCALE)!"￥ 0"}</td>
					                                <td>${(pt2.LINKMAN)!""}</td>
					                                <td>${(pt2.TEL)!""}</td>
					                                <td><a href="${(pt2.WEBSITE)!''}" target="_blank">${(pt2.WEBSITE)!""}</a></td>
					                            </tr>
			                               </#list>
			                          </#if> 
                                </tbody>
                            </table>
                           
                                 <button type="button" id="tmore2" <#if compList2?? && compList2?size lt 10>disabled</#if>  onclick="GetMore('D')" class="btn btn-primary btn-block mt20"><i class="iconfont mr5" style="vertical-align:middle">&#xe605;</i><#if compList2?? && compList2?size lt 7>没有更多<#else>加载更多</#if></button>
                            
                        </div>
                        <div class="tabcon">
                             <h3 class="f16"><i class="iconfont mr5 f20">&#xe6c1;</i>年度新增上市公司名录(含新三板)</h3>
                            <table id="mytable3" class="table table-hover table-striped table-bordered my-table mt20">
                                <thead>
                                    <tr>
                                        <th width="6%">序号</th>
		                                <th width="13%">企业名称</th>
		                                <th width="10%">行业类别</th>
		                                <th width="12%">主板/新三板</th>
		                                <th width="11%">交易所</th>
		                                <th width="11%">上市时间</th>
		                                <th width="9%">联系人</th>
		                                <th width="13%">电话</th>
		                                <th width="15%">公司网址</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <#if compList3??>
			                               <#list compList3 as pt3>
					                            <tr>
					                                <td>${pt3_index+1}</td>
					                                <td>${(pt3.COMP_NAME)!""}</td>
					                                <td>${(pt3.OF_INDUSTRY)!""}</td>
					                                <td>${(pt3.MARKET)!""}</td>
					                                <td>${(pt3.BOURSE)!""}</td>
					                                <td><#if pt3?? && pt3.MARKET_TIME??>${((pt3.MARKET_TIME)!"")?string("yyyy-MM-dd")}</#if></td>
					                                <td>${(pt3.LINKMAN)!""}</td>
					                                <td>${(pt3.TEL)!""}</td>
					                                <td><a href="${(pt3.WEBSITE)!''}" target="_blank">${(pt3.WEBSITE)!""}</a></td>
					                            </tr>
			                               </#list>
			                          </#if> 
                                </tbody>
                            </table>
                      
                            <button type="button" id="tmore3" onclick="GetMore('E')" <#if compList3?? && compList3?size lt 10>disabled</#if> class="btn btn-primary btn-block mt20"><i class="iconfont mr5" style="vertical-align:middle">&#xe605;</i><#if compList3?? && compList3?size lt 7>没有更多<#else>加载更多</#if></button>
                         
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-lg-3 hidden-sm hidden-xs pr tj-r">
                <div id="float-right" class="white">
                    <div class="con-r-r">
                        <h3 class="f16 border-bb pb20"><i class="iconfont blue mr5 f20">&#xe690;</i>技术创新成果</h3>
                        <ul class="tj-list right-sub">
                            <li class="active"><a href="javascript:void(0);"><i class="iconfont mr5">&#xe71b;</i>年度新增创新企业名录</a></li>
                            <li><a href="javascript:void(0);"><i class="iconfont mr5">&#xe71b;</i>年度引入风险投资企业名录</a></li>
                            <li><a href="javascript:void(0);"><i class="iconfont mr5">&#xe71b;</i>年度新增上市公司名录</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
	 </div>
    
    
    <input type="hidden" id="pageNo1" name="pageNo1" value="${(pageNo)!'0'}" />
    <input type="hidden" id="pageNo2" name="pageNo2" value="${(pageNo)!'0'}" />
    <input type="hidden" id="pageNo3" name="pageNo3" value="${(pageNo)!'0'}" />
    <input type="hidden" id="temp1" name="temp1" value="10" />
    <input type="hidden" id="temp2" name="temp2" value="10" />
    <input type="hidden" id="temp3" name="temp3" value="10" />
    
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
            //chartsTab
            $(".right-sub li").click(function () {
                $(".right-sub li").eq($(this).index()).addClass("active").siblings().removeClass('active');
                $(".con-sub div").eq($(".right-sub li").index(this)).removeClass("tabcon").siblings().addClass('tabcon');
                $(".con-sub div").eq($(".right-sub li").index(this)).addClass("on-con").siblings().removeClass('on-con');
            });
        });
        
        
        function GetMore(str){
             var idStr="";
             var tempId="";
             var pageNoStr="";
    	     if(str=="C"){
    	         idStr="tmore1";
    	         tempId="temp1";
    	         pageNoStr="pageNo1";
    	     }else if(str=="D"){
    	         idStr="tmore2";
    	         tempId="temp2";
    	         pageNoStr="pageNo2";
    	     }else if(str=="E"){
    	         idStr="tmore3";
    	         tempId="temp3";
    	         pageNoStr="pageNo3";
    	     }
			var pageNo = $("#"+pageNoStr).val();
	        $.post("${rc.contextPath}/innovate/getMoreTableList.do",{"pageNo":pageNo,"flag":str},function(obj) {
	        
	        	if(obj=="nomore"){
	        	    
		             $("#"+idStr).html("没有更多");
		             $("#"+idStr).removeAttr("onclick");
		             $("#"+idStr).attr("disabled","true");
	            }else{
	                 
	                 $.each(obj,function(index,value){
	                    $("#"+tempId).val(parseInt($("#"+tempId).val())+1);
	                    if(str=="C"){
	                         
	                         $("#mytable1 tbody").append("<tr><td>"+$("#"+tempId).val()+"</td><td>"+value.COMP_NAME+"</td><td>"+value.OF_INDUSTRY+"</td><td>"+value.TECHNOLOGY+"</td><td>"+value.SCALE+"</td><td>"+value.LINKMAN+"</td><td>"+value.TEL+"</td><td><a href='"+value.WEBSITE+"' target='_blank'>"+value.WEBSITE+"</a></td></tr>");
	                    }else if(str=="D"){
	                         $("#mytable2 tbody").append("<tr><td>"+$("#"+tempId).val()+"</td><td>"+value.COMP_NAME+"</td><td>"+value.OF_INDUSTRY+"</td><td>"+value.INVESTOR+"</td><td>"+value.SCALE+"</td><td>"+value.LINKMAN+"</td><td>"+value.TEL+"</td><td><a href='"+value.WEBSITE+"' target='_blank'>"+value.WEBSITE+"</a></td></tr>");
	                    }else if(str=="E"){
	                         $("#mytable3 tbody").append("<tr><td>"+$("#"+tempId).val()+"</td><td>"+value.COMP_NAME+"</td><td>"+value.OF_INDUSTRY+"</td><td>"+value.MARKET+"</td><td>"+value.BOURSE+"</td><td>"+value.MARKET_TIME+"</td><td>"+value.LINKMAN+"</td><td><a href='"+value.WEBSITE+"' target='_blank'>"+value.WEBSITE+"</a></td></tr>");
	                    }
		                
		                               
		            });
		            $("#"+pageNoStr).val(parseInt(pageNo)+1);
		            
	            }
	            
	        },"json");
		}
        
        
    </script>
</body>
</html>
