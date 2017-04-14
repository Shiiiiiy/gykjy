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
    <link rel="stylesheet" href="${rc.contextPath}/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.min.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.headshrinker.js"></script>
	<script type="text/javascript" src="${rc.contextPath}/plugins/js/rollSlide.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/slider.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/ztree/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/layer/layer.js"></script>
    <!--[if lte IE 9]>
    <script src="${rc.contextPath}/plugins/js/respond.min.js"></script>
    <script src="${rc.contextPath}/plugins/js/html5shiv.js"></script>
    <![endif]-->
	<script>
        function MM_preloadImages() { //v3.0 JF 预加载图片
		    var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
		    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
		    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
		} 
		$(window).load(function() {//配合 预加载图片使用
			var thelength=${(CPLogoLunbo?size)!'0'};
			var data01= new Array(thelength);
			<#if CPLogoLunbo??>
	        <#list CPLogoLunbo as aa>
	        	data01[${aa_index}]="${rc.contextPath}/plugins/images/allImages/${(aa.CP_LOGO)!''}";
	        	MM_preloadImages(data01[${aa_index}]);
	        </#list>
	        </#if>			
        }); 
		
		function searchCompany(){
			var str = $("#searchCompany_text").val();
			if(str==""||str==null){
				return ;
			}else{
				window.location.href="${rc.contextPath}/info/quanSearchCp.do?keyWord="+encodeURI(encodeURI(str))+"&moduleCode=NEWS_A";
			}
		}
		
		document.onkeydown=function(event){
             var e = event || window.event || arguments.callee.caller.arguments[0];
             if(e && e.keyCode==13){ // enter 键
            	 searchCompany();
             }
         }; 
    </script>
    <title>企业信息-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
	<#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;"></div></a>
	<div class="container mainbg mt20">
	<!-- bread -->
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span>企业信息
        </div>
	        <div class="search fr search-xs" >
	            <div class="fl"><input type="text" class="search-text" id="searchCompany_text" value="${keyWord!''}" name="" placeholder="搜企业" /></div>
	            <div class="fr"><button class="search-but" onclick="searchCompany()" ><i class="iconfont f30">&#xe60a;</i></button></div>
	        </div>
    </div>
    <!-- news -->
        <div class="news-box clearfix">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <div class="slider-box">
                    	<!--轮播图--->
                        <ul class="slider-con">
                        	<#if Lunbo??>
                        	<#list Lunbo as aa>
                        	<li><p class="txt">${(aa.FILE_TITLE)!''}</p><a href="${(aa.URL)!'javascript:void(0)'}" <#if aa?? && aa.URL??>target="_blank"<#else> style="cursor:default;"</#if>><img src="${rc.contextPath}/plugins/images/allImages/${(aa.FILE_NAME)!''}" class="img-responsive" alt="" /></a></li>
                        	</#list>
                        	</#if>
                        </ul>
                        <div class="slider-btn btn-white"><a class="prev" href="javascript:void(0);"></a><a class="next" href="javascript:void(0);"></a></div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="border-box stmin">
                    <h2 class="news-t"><span class="more fr"><a href="${rc.contextPath}/info/newsList/NEWS_A">更多 &gt;</a></span><i class="iconfont mr10 f25 blue-n">&#xe613;</i><span class="f16 blue-n fb">企业资讯</span></h2>
                    <dl class="newslist">
                        <dt>
                        <#if NewslistA??>
                        <#list NewslistA as aa>
                        <#if aa_index == 0 && aa.NEWS_TIME??> 
                            <a href="${rc.contextPath}/info/newsDetail/${(aa.ID)!''}" name="${(aa.ID)!''}" title="${((aa.NEWS_TITLE)!'')}">${(aa.NEWS_TITLE)!''}</a>
                            <#if (aa.INTRODUCE)?length gt 80>
                            <span class="fn f12" style="word-break: break-all;" >${((aa.INTRODUCE)!'')?substring(0,79)}...</span><!--最大80-->
                            <#else>
                            <span class="fn f12" style="word-break: break-all;" >${((aa.INTRODUCE)!'')}</span>
                            </#if>
                        </#if>      
                        </#list>
                        </#if>    
                        </dt>
                        <#if NewslistA??>
                        <#list NewslistA as aa>
                        <#if aa_index != 0 && aa.NEWS_TIME??> 
                        <dd><a  href="${rc.contextPath}/info/newsDetail/${(aa.ID)!''}"  name="${(aa.ID)!''}" title="${((aa.NEWS_TITLE)!'')}">
                        <span class="date">${((aa.NEWS_TIME)!"")}</span>${((aa.NEWS_TITLE)!"")}</a></dd>
                        </#if>      
                        </#list>
                        </#if> 
                    </dl>
					</div>
                </div>
            </div>
        </div>
    <!--charts-->
    <div class="mt20">
    	<!--统计图--->
        <div class="row">
            <#if TongJi??>
        	<#list TongJi as aa>
        	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6"><div class="border-box mb20"><img src="${rc.contextPath}/plugins/images/allImages/${(aa.FILE_NAME)!''}" title="${(aa.FILE_TITLE)!''}" class="img-responsive" /></div></div>
        	</#list>
        	</#if>
        </div>
    </div>
    <div class="mt20 mb20" style="padding-left:15px;padding-right:15px;">
        <!-- search-advanced -->
        <div class="gray advanced-box">
            <form id="form1" method="post">
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-3 list-search">
                    <div class="input-group pr">
                        <span class="input-group-addon">所属行业</span><!--选项框版-->
                        <input type="text" id="productType"   name="PRODUCT_TYPE" class="form-control" disabled>
                        <input type="hidden" id="productType01"   name="PRODUCT_TYPE" class="form-control">
                        <button type="button" id="showTree" class="btn btn-primary pa" style="top:0;right:0;z-index:8;"><i class="iconfont">&#xe613;</i></button>
                    </div><!--实际上是can2-->
                    </div>
                    <!--<div class="col-xs-6 col-sm-6 col-md-2 col-lg-3 list-search">
                        <div class="input-group">
                        	<span class="input-group-addon">所属行业</span>
                        	<input type="text" id="can2"  name="can2" class="form-control" placeholder="">
                        </div>
                    </div>-->
                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 list-search">
                        <div class="input-group">
                            <span class="input-group-addon">市场范围</span>
                            <select class="form-control" id="can1" name="can1" >
                            	<option value="">全部</option>
                            	<#if searchkey1??>
                            	<#list searchkey1 as aa>
							    <option value="${((aa.CODE)!'')}">${((aa.NAME)!'')}</option>
								</#list>
								</#if>
						    </select>
                        </div>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 list-search">
                        <div class="input-group">
                            <span class="input-group-addon" >客户类别</span>
                            <select class="form-control" id="can3" name="can3" >
                            	<option value="">全部</option>
                            	<#if searchkey3??>
                            	<#list searchkey3 as aa>
							    <option value="${((aa.CODE)!'')}">${((aa.NAME)!'')}</option>
								</#list>
								</#if>
						    </select>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-3 list-search">
                        <div class="input-group">
                            <span class="input-group-addon" >行政区划</span>
                            <select class="form-control" id="can4" name="can4" >
                            	<option value="">全部</option>
                            	<#if searchkey4??>
                            	<#list searchkey4 as aa>
							    <option value="${((aa.CODE)!'')}">${((aa.NAME)!'')}</option>
								</#list>
								</#if>
						    </select>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 list-search">
	    				<input type="hidden" value="0" id="s_pageStart"/>
	    				<input type="hidden" value="false" id="is_searched"/>
                        <button type="button" id="fbtn" onclick="funny();" class="btn btn-primary btn-block"><i class="iconfont mr5" style="vertical-align:middle">&#xe60f;</i>高级搜索</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- logoScroll logo轮播 -->
        <div class="scroll-logo roll_row pr" id="logoscroll" style="margin-top:15px;padding-bottom:15px;min-height:105px;">
            <ul class="logo-list roll__list clearfix" style="position: absolute; left: 0; top: 0;">
				<#if CPLogoLunbo??>
				<#list CPLogoLunbo as aa>
				<li><a href="${(aa.CP_ADDRESS)!'#'}" target="_blank"><img src="${rc.contextPath}/plugins/images/allImages/${(aa.CP_LOGO)!''}" title="${(aa.CP_NAME)!''}"/></a></li>
				</#list>
				</#if>
            </ul>
            <div class="slider-btn btn-black"><a class="prev" href="javascript:void(0);" style="left:-15px;"></a><a class="next" href="javascript:void(0);" style="right:-15px;"></a></div>
        </div>
        <!-- list -->
        <div class="list-enterprises clearfix">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
                	<!-- card 公司名片展示 模块 -->
                	<input id="hidepageStart" type="hidden" value="${(pageStart)!'0'}"></input>
					<input id="hidepageEnd" type="hidden" value="${(pageEnd)!'0'}"></input>
					<input id="FirstPageSize" type="hidden" value="${(FirstPageSize)!'0'}"></input>
                    <div id="cardImages" class="card-box" style="display:none;">
                        <div class="card-close"><i class="iconfont">&#xe652;</i>关闭</div>
                        <div class="card-con">
                            <h3 id="card-cp-name">[公司名称]</h3>
                            <p class="f14 lh180" id="card-cp-abs">[公司简介]</p>
                        </div>
                    </div>
                    <!-- 产品图片展示 模块 -->
                    <div id="productImages" class="card-box pro-box" style="display:none;">
                        <div class="card-close"><i class="iconfont">&#xe652;</i>关闭</div>
                        <div class="card-scroll  sm-scroll">
                            <ul id="pt" class="card-c sm-c">
                            </ul>
<!--                             <div class="slider-btn btn-black"><a class="prev" href="javascript:void(0);" style="left:-10px;"></a><a class="next" href="javascript:void(0);" style="right:-10px;"></a></div>
 -->                        </div>
                    </div>
                	<!---- 公司列表 --->
                	<div id="listmore">
                	<#if CPList??>
					<#list CPList as aa>
	                    <div class="row list-item" title="${(aa.CP_NAME)!''}">
	                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-2"><img src="${rc.contextPath}/plugins/images/allImages/${(aa.CP_VIEW)!''}" alt="" class="img-responsive" /></div>
	                        <div class="col-xs-12 col-sm-9 col-md-9 col-lg-10 infor mylist-item">
	                            <h3 class="f16 list-title"><span class="date fr f14">${((aa.CREATE_TIME)!'')}</span><span class="fb tt">${(aa.CP_NAME)!''}</span><a href="javascript:void(0);" onclick="showCard('${aa.ID}')" class="card-btn" title="名片"><i class="iconfont f20">&#xe62f;</i></a></h3>
	                            <ul>
	                                <li><label>所属行业</label>${(aa.CP_BELONG)!''}</li>
	                                <li><label>企业性质</label>${(aa.CP_TYPE)!''}</li>
	                                <li><label>所在地区</label>${(aa.CP_LOCATION)!''}</li>
	                                <li><label>经营产品</label><a href="javascript:void(0);"  onclick="showTU(this);"  name="${(aa.ID)!''}" class="card-btn pro-btn" title="产品图片">${(aa.CP_PRODUCT)!''}</a></li>
	                                <li><label>网址</label><a href="${(aa.CP_ADDRESS)!''}" class="link" target="_blank">${(aa.CP_ADDRESS)!''}</a></li>
	                                <li><label>电话</label><span class="font-en">${(aa.CP_PHONE)!''}</span></li>
	                            </ul>
	                            <input type="hidden" value="${(aa.CP_NAME)!''}" id="${'CPNAME'+aa.ID}"/>
	                            <input type="hidden" value="${(aa.CP_ABSTRACT)!''}" id="${'CPABS'+aa.ID}"/>
	                        </div>
	                    </div>
                    </#list>
					</#if>
					</div>
                    <!--page 加载更多--> 
                   <button onclick="GetMore()" <#if CPList?? && CPList?size lt 7>disabled</#if> id="tmore" type="button" class="btn btn-primary btn-block"><#if CPList?? && CPList?size lt 7>没有更多<#else><i class="iconfont mr5" style="vertical-align:middle">&#xe605;</i>加载更多</#if></button>  
                </div>
                
                <div class="col-md-3 col-lg-3 hidden-sm hidden-xs pr tj-r">
				<div id="float-right">
                    <h3 class="f16 mt15"><i class="iconfont mr5">&#xe690;</i>推荐企业</h3>
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
    	//结点树初始化
	    var zTreeObj;
		setting = {
		    data: {  
	                simpleData: {  
	                    enable: true  
	                }  
	        }, 
			view: {
				selectedMulti: false
			},
			callback:{
			    onClick: zTreeOnClick
			},
			async:{
			    enable:true,
			    type:"post",
			    dataType:"json",
			    autoParam:["id"],
			    url:"${rc.contextPath}/info/getBelongTypeTree.do"
			}
			/**获取结点树的方法*/
		}
		var zTreeNodes = [];
		//
        $(function () {
            //focus
            $(".prev,.next").hover(function () {
                $(this).stop().fadeTo("show", 0.9);
            }, function () {
                $(this).stop().fadeTo("show", 0.4);
            });
            jQuery(".slider-box").slide({ mainCell: ".slider-con", effect: "leftLoop", vis: 1, interTime: 4500, delayTime: 700, autoPlay: true });
            //logoScroll
            $('#logoscroll').rollSlide({
                orientation: 'left',
                num: 1,
                v: 1500,
                space: 3000,
                isRoll: true
            });
            //floatNav
            jQuery('.navbg').headshrinker({ fontSize: "14px", mobileMenu: true });
            $(".nav-pc a.mobile-btn").click(function () {
                $(".nav-pc ul").slideToggle();
            });
            //list-item
            $(".list-item").hover(function () {
                $(this).find(".infor").css("height","auto");
            }, function () {
                $(this).find(".infor").css("height", "75px");
            });
            $(".card-close").click(function () {
                $("div.mask").remove();
                $("#cardImages").hide();
                $("#productImages").hide();
            });
			//tj-list-float
            /*$(window).scroll(function () {
			var scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;//scrollTop兼容办法
                if (scrollTop > 1340) {
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
            //节点数
            $("#showTree").click(function(){
	            //弹出层调用
				var index=layer.open({
					  title: '选择行业类别',
					  btn:['确定','取消'],
					  cancel: function(){ 
					    //右上角关闭回调
					    $("#productType").val("");
					    $("#productType01").val("");
					  },
					  btn1:function(){
					      layer.close(index);
					  },
					  btn2:function(){
					      $("#productType").val("");
					      $("#productType01").val("");
					  },
					  content: '<div style="width:350px;height:500px;"><ul id="tree" class="ztree" style="width:340px; overflow:auto;"></ul></div>'
				}); 
				//初始化树形菜单
				zTreeObj = $.fn.zTree.init($("#tree"), setting, zTreeNodes);
            });
        });
        //点击树节点触发事件
        function zTreeOnClick(event, treeId, treeNode){
	       $("#productType").val(treeNode.name);
	       $("#productType01").val(treeNode.id);
	    }
        function showCard(aa){/**展示名片函数*/ 	
    	    $("body").append("<div class='mask'></div>");
            if ($("#cardImages").css("display") == "none") {
            	//用参数改变展示用2个值
            	var id=aa;
            	var name=$("#CPNAME"+id).val();
            	var abs=""+$("#CPABS"+id).val();//最大300
            	if(abs.length > 300){
            		abs=abs.substring(0,300)+"...";
            	}
            	$("#card-cp-name").html(name);
            	$("#card-cp-abs").html(abs);
                $("#cardImages").show();
            } else {
                $("#cardImages").hide();
            }
        }
        function GetMore(){/*获取更多 公司*/
			var pageStart = $("#hidepageStart").val();
			var pageEnd   = $("#hidepageEnd").val();
			pageStart = Number($("#listmore .list-item").length);	
			var can1=$("#can1").val();
	    	var can2=$("#productType01").val();
	    	//alert(can2);
	    	var can3=$("#can3").val();
	    	var can4=$("#can4").val();
	    	//alert(can4);
	        $.post("${rc.contextPath}/info/loadcps.do",{"pageStart":pageStart,"pageEnd":pageEnd,"can1":can1,"can2":can2,"can3":can3,"can4":can4},function(obj) {
	        	var shumu=0;
	            $.each(obj,function(index,value){
	                $("#listmore").append(
	                "<div class='row list-item' title='"+value.CP_NAME+"'>"+
                        "<div class='col-xs-12 col-sm-3 col-md-3 col-lg-2'><img src="+"${rc.contextPath}/plugins/images/allImages/"+ value.CP_VIEW +" class='img-responsive' /></div>"+
                        "<div class='col-xs-12 col-sm-9 col-md-9 col-lg-10 infor mylist-item'>"+
                            "<h3 class='f16 list-title'><span class='date fr f14'>"+value.CREATE_TIME+"</span><span class='fb tt'>"+value.CP_NAME+"</span><a href='javascript:void(0);' onclick=showCard('"+value.ID+"')  class='card-btn' title='名片'><i class='iconfont f20'>&#xe62f;</i></a></h3>"+
                            "<ul>"+
                                "<li><label>所属行业</label>"+value.CP_BELONG+"</li>"+
                                "<li><label>企业性质</label>"+value.CP_TYPE+"</li>"+
                                "<li><label>所在地区</label>"+value.CP_LOCATION+"</li>"+
                                "<li><label>经营产品</label><a title='产品图片' href='javascript:void(0);' onclick='showTU(this);' class='card-btn pro-btn' name="+value.ID+" >"+value.CP_PRODUCT+"</a></li>"+
                                "<li><label>网址</label><a href="+value.CP_ADDRESS+" class='link' target='_blank'>"+value.CP_ADDRESS+"</a></li>"+
                                "<li><label>电话</label><span class='font-en'>"+value.CP_PHONE+"</span></li>"+
                            "</ul>"+
                            "<input type='hidden' value="+value.CP_NAME+"     id='CPNAME"+value.ID+"'/>"+
                            "<input type='hidden' value="+value.CP_ABSTRACT+" id='CPABS"+value.ID+"'/>"+
                        "</div>"+
                    "</div>"
	                );
	                /**新框架加上 hover效果*/
			        $(".list-item").hover(function () {
		                $(this).find(".infor").css("height","auto");
		            }, function () {
		                $(this).find(".infor").css("height", "75px");
		            });
	                shumu=shumu+1;
	            });
	            if(shumu < pageEnd){
	            	$("#tmore").html("没有更多");
	            	$("#tmore").removeAttr("onclick");
	            	$("#tmore").attr("disabled","disabled");
	            }
	            $("#hidepageStart").val(pageStart);
	        },"json");
		}
    </script>
	<script>
	    function funny(){/**高级搜索*/
			var pageStart = 0;
			var pageEnd   = $("#hidepageEnd").val();
	    	var can1=$("#can1").val();
	    	var can2=$("#productType").val();
	    	//alert(can2);
	    	var can3=$("#can3").val();
	    	var can4=$("#can4").val();
	    	$.post("${rc.contextPath}/info/searchcps.do",{"can1":can1,"can2":can2,"can3":can3,"can4":can4,"pageStart":pageStart,"pageEnd":pageEnd},function(obj) {
	            $("#listmore").empty();
	            var shumu=0;
	            $.each(obj,function(index,value){
	                $("#listmore").append(
	                "<div class='row list-item' title='"+value.CP_NAME+"'>"+
                        "<div class='col-xs-12 col-sm-3 col-md-3 col-lg-2'><img src="+"${rc.contextPath}/plugins/images/allImages/"+ value.CP_VIEW +" class='img-responsive' /></div>"+
                        "<div class='col-xs-12 col-sm-9 col-md-9 col-lg-10 infor mylist-item'>"+
                            "<h3 class='f16 list-title'><span class='date fr f14'>"+value.CREATE_TIME+"</span><span class='fb tt'>"+value.CP_NAME+"</span><a href='javascript:void(0);' onclick=showCard('"+value.ID+"')  class='card-btn' title='名片'><i class='iconfont f20'>&#xe62f;</i></a></h3>"+
                            "<ul>"+
                                "<li><label>所属行业</label>"+value.CP_BELONG+"</li>"+
                                "<li><label>企业性质</label>"+value.CP_TYPE+"</li>"+
                                "<li><label>所在地区</label>"+value.CP_LOCATION+"</li>"+
                                "<li><label>经营产品</label><a title='产品图片' href='javascript:void(0);' onclick='showTU(this);' class='card-btn pro-btn' name="+value.ID+" >"+value.CP_PRODUCT+"</a></li>"+
                                "<li><label>网址</label><a href="+value.CP_ADDRESS+" class='link' target='_blank'>"+value.CP_ADDRESS+"</a></li>"+
                                "<li><label>电话</label><span class='font-en'>"+value.CP_PHONE+"</span></li>"+
                            "</ul>"+
                            "<input type='hidden' value="+value.CP_NAME+"     id='CPNAME"+value.ID+"'/>"+
                            "<input type='hidden' value="+value.CP_ABSTRACT+" id='CPABS"+value.ID+"'/>"+
                        "</div>"+
                    "</div>"
	                );
	                shumu=shumu+1;	                
	            });
            	/**新框架加上 hover效果*/
		        $(".list-item").hover(function () {
	                $(this).find(".infor").css("height","auto");
	            }, function () {
	                $(this).find(".infor").css("height", "75px");
	            });
	            if(shumu < pageEnd){
	            	$("#tmore").html("没有更多");
	            	$("#tmore").attr("onclick","javascript:void(0);");
	            	$("#tmore").attr("disabled","disabled");
	            }else{
	            	$("#tmore").html("<i class='iconfont mr5' style='vertical-align:middle'>&#xe605;</i>加载更多");
	            	$("#tmore").attr("onclick","GetMore();");
	            	$("#tmore").removeAttr("disabled");
	            }
	        },"json");
	    }
	    function showTU(aa){/**展示产品图片*/
            $("body").append("<div class='mask'></div>");
            if ($("#productImages").css("display") == "none") {
            	//alert(aa.name);
            	getProductImages(aa.name);
                $("#productImages").show();
            } else {
                $("#productImages").hide();
            }
        }
        function getProductImages(aa){/**获取产品图片 不要修改*/
        	  $("#pt").html("");
              $.post("${rc.contextPath}/industry/getProductImages.do",{"compId":aa},function(objs) {
		        	if(objs=="nomore"){
			             //$("#productImages").hide();
		            }else{
		                 $.each(objs,function(index,value){
			                $("#pt").append(
			                    "<li><p class='txt'>"+value.FILE_TITLE+"</p><img src='${rc.contextPath}/plugins/images/allImages/"+value.FILE_NAME+"' alt='' class='img-responsive' /></li>"
			             );
		            });
	            }
	            
	        },"json");
        }
	</script>
</body>
</html>
