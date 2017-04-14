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
        <#assign tNameSave=(PropOne.Name)!'' />
    </script>
    
    <title>${(tNameSave)!''} 中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
    <!-- topbar -->
	<#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;">
       <div class="container top-txt">
            <p class="f14 fb">+支柱产业+</p>
            <h2 class="f30 fb">${(tNameSave)!''}</h2><small class="caps"></small>
        </div>
    </div></a> 
	<div class="container mainbg mt20">
    <!-- bread -->
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span><a href="${rc.contextPath}/prop">支柱产业</a><span>&gt;</span>${(tNameSave)!''}
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
                        <ul class="slider-con">
                            <#if LunboOne??><!--轮播图--->
	                        	<#list LunboOne as aa>
	                        	<li><p class="txt">${(aa.FILE_TITLE)!''}</p><a href="${(aa.URL)!'javascript:void(0)'}" <#if aa?? && aa.URL??>target="_blank"<#else> style="cursor:default;"</#if>><img src="${rc.contextPath}/plugins/images/allImages/${(aa.FILE_NAME)!''}" class="img-responsive" alt="" /></a></li>
	                        	</#list>
                        	</#if>
                        </ul>
                        <div class="slider-btn btn-white"><a class="prev" href="javascript:void(0);"></a><a class="next" href="javascript:void(0);"></a></div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="border-box dtmin">
                    <h2 class="news-t"><span class="more fr">
                    <a href="${rc.contextPath}/prop/newsList/${(PropOne.ID)!''}/NEWS_M">更多 &gt;</a></span><i class="iconfont mr10 f25 blue-n">&#xe613;</i><span class="f16 blue-n fb">产业动态</span></h2>
                    <dl class="newslist">
                        <#if newsList??>
	                        <#list newsList as nl>
	                             <#if nl_index==0>
			                        <dt>
			                            <a href="${rc.contextPath}/prop/newsDetail/${(PropOne.ID)!''}/${(nl.ID)!''}" >${(nl.NEWS_TITLE)!""}</a>
			                            <span class="fn f12" style="word-break: break-all;" ><#if nl.INTRODUCE?? && nl.INTRODUCE?length gt 79>${((nl.INTRODUCE)!"")?substring(0,79)}...<#else>${(nl.INTRODUCE)!""}</#if></span>
			                        </dt>
			                     <#else>   
			                        <dd><a href="${rc.contextPath}/prop/newsDetail/${(PropOne.ID)!''}/${(nl.ID)!''}" ><span class="date">${((nl.NEWS_TIME)!"")?string("yyyy-MM-dd")}</span>${(nl.NEWS_TITLE)!""}</a></dd>
			                     </#if>   
	                        </#list>
	                    </#if>
                    </dl>
					</div>
                </div>
            </div>
        </div>
    <!--about-->
    <div class="mt20">
        <div class="row about">
            <h2 class="f25 fb title-p"><span class="txt blue-b">产业概况</span><span class="line border-c"></span></h2>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div style="padding:10px 30px;"><div style="max-height:500px;overflow:hidden;/*overflow-y:auto;*/"><img src="${rc.contextPath}/plugins/images/allImages/${(PropOne.STATUS)!''}" alt="" width="40%" style="margin-left:10px;display:inline;float:right; margin-bottom:3px;" />${(PropOne.INTRODUCE)!""}</div></div>
			</div>
        </div>
    </div>
    <!-- quality -->
    <div class=" mt20">
        <h2 class="f25 fb title-p"><span class="txt blue-b">产业优质企业</span><span class="line border-c"></span></h2>
        <div class="row cxcg-list" style="min-height:150px;">
            <#if CPList??>
			<#list CPList as aa>
            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-3" title="${(aa.CP_NAME)!''}">
                <a href="javascript:void(0);" onclick="showCard('${aa.ID}')" ><img src="${rc.contextPath}/plugins/images/allImages/${(aa.CP_VIEW)!''}" alt="" class="img-responsive" /></a>
                <p class="tc lh180"><#if (aa.CP_NAME)?? && (aa.CP_NAME)?length gt 11>${((aa.CP_NAME)!'')?substring(0,11)}<#else>${(aa.CP_NAME)!''}</#if></p><!--11字符 -->
	            <input type="hidden" value="${(aa.CP_NAME)!''}" id="${'CPNAME'+aa.ID}"/>
	            <input type="hidden" value="${(aa.CP_ABSTRACT)!''}" id="${'CPABS'+aa.ID}"/>
            </div>
            </#list>
			</#if>
        </div>
        <!-- card 公司名片展示 模块 -->
    	<input id="hidepageStart" type="hidden" value="${(pageStart)!'0'}"></input>
		<input id="hidepageEnd" type="hidden" value="${(pageEnd)!'0'}"></input>
		<input id="FirstPageSize" type="hidden" value="${(FirstPageSize)!'0'}"></input>
        <div id="card233" class="card-box" style="display:none;">
            <div class="card-close"><i class="iconfont">&#xe652;</i>关闭</div>
            <div class="card-con">
                <h3 id="card-cp-name">[公司名称]</h3>
                <p class="f14 lh180" id="card-cp-abs">[公司简介]</p>
            </div>
        </div>
    </div>
    <!-- operation  -->
    <div class="mt20 clearfix">
        <h2 class="f25 fb title-p"><span class="txt blue-b">产业运行统计</span><span class="line border-c"></span></h2>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mb10">
		<div class="border-box" style="min-height:308px;">
            <h3 class="f16 f-bar"><span class="more-s f12"><a href="${rc.contextPath}/prop/fileList/${(PropOne.ID)!''}/FILE_A">更多</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe606;</i>经济运行分析报告</span></h3>
            <ul class="download-list mt10">
	            <#if XiaZai1??><!--下载1---->
	        	<#list XiaZai1 as aa>
	        		<li title="${(aa.FILE_TITLE)!''}"><a href="${rc.contextPath}/plugins/images/allFiles/${(aa.FILE_NAME)!''}" target="_blank"><span class="date">${(aa.CREATE_NAME)!''}</span>${(aa.FILE_TITLE)!''}</a></li>
	        	</#list>
	        	</#if>
            </ul>
			</div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="charts-box-new pr">
				<ul class="charts-scroll">
					<#if STATISTu??><!--旁边配图----> 
		        	<#list STATISTu as aa>
		        		<li><a href="${(aa.URL)!'javascript:void(0)'}" <#if aa?? && aa.URL??>target="_blank"<#else> style="cursor:default;"</#if>><img src="${rc.contextPath}/plugins/images/allImages/${(aa.FILE_NAME)!''}" class="img-responsive" alt="" /></a></li>
		        	</#list>
		        	</#if>
				</ul>
				<div class="slider-btn btn-black"><a class="prev" href="javascript:void(0);" style="left:-10px;"></a><a class="next" href="javascript:void(0);" style="right:-10px;"></a></div>
			</div>
		</div>
    </div>
    <div class="mt20 mb20" style="padding-left:15px;padding-right:15px;">
        <!-- search-advanced 高级搜索-->
        <div class="gray advanced-box">
            <form action="">
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 list-search">
                        <div class="input-group">
                            <span class="input-group-addon">产品名称</span>
                            <input type="text" id="PRODUCT_NAME"  name="PRODUCT_NAME" class="form-control" >
                        </div>
                    </div>
                    
                    <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 list-search">
                        <div class="input-group">
                            <span class="input-group-addon">产品功能</span>
                            <input type="text" id="PRODUCT_CAPACITY"   name="PRODUCT_CAPACITY" class="form-control" >
                        </div>
                    </div>
                    
                    <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 list-search">
                        <div class="input-group pr">
                            <span class="input-group-addon">产品分类</span>
                            <input type="text" id="productType"   name="PRODUCT_TYPE" class="form-control" disabled>
                            <input type="hidden" id="productType01"   name="PRODUCT_TYPE" class="form-control">
                            <button type="button" id="showTree" class="btn btn-primary pa" style="top:0;right:0;z-index:8;"><i class="iconfont">&#xe613;</i></button>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-2 col-lg-3 list-search fr">
                        <button type="button" onclick="serchCompanies()" class="btn btn-primary btn-block"><i class="iconfont mr5" style="vertical-align:middle">&#xe60f;</i>高级搜索</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- logoScroll -->
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
                <div id="compList" class="col-xs-12 col-sm-12 col-md-9 col-lg-9" style="min-height:850px;">
                   
                   <#if compList??>
                       <#list compList as cs>
                               <div id="canshu23" class="row list-item">
                                  <div class="col-xs-12 col-sm-3 col-md-3 col-lg-2"><img src="${rc.contextPath}/plugins/images/allImages/${(cs.CP_VIEW)!''}" alt="" class="img-responsive" /></div>
			                        <div class="col-xs-12 col-sm-9 col-md-9 col-lg-10 infor mylist-item">
			                            <h3 class="f16 list-title"><span class="date fr f14">${(cs.CREATE_TIME)?string("yyyy-MM-dd")}</span><span class="fb tt">${(cs.CP_NAME)!''}</span></h3>
			                            <ul>
			                                <li><label>经营产品</label><a href="javascript:void(0);"  onclick="showTU(this);"  name="${(cs.ID)!''}" class="card-btn pro-btn" title="产品图片">${(cs.CP_PRODUCT)!''}</a></li>
			                                <li><label>网址</label><a href="${(cs.CP_ADDRESS)!''}" class="link" target='_blank'>${(cs.CP_ADDRESS)!''}</a></li>
			                                <li><label>电话</label><span class="font-en">${(cs.CP_PHONE)!''}</span></li>
			                            </ul>
			                        </div>
			                    </div>
                       </#list>
                   </#if>
                    
                    <button type="button" <#if compList?? && compList?size lt 7>disabled</#if> class="btn btn-primary btn-block mt20" onclick="GetMore()" id="tmore"><#if compList?? && compList?size lt 7>没有更多<#else><i class="iconfont mr5" style="vertical-align:middle">&#xe605;</i>加载更多</#if></button>
                    
                </div>
                
                <!-- card -->
                    <div id="productImages" class="card-box pro-box" style="display:none;">
                        <div class="card-close"><i class="iconfont">&#xe652;</i>关闭</div>
                        <div class="card-scroll sm-scroll">
                            <ul id="pt" class="card-c sm-c">
                            </ul>
<!--                             <div class="slider-btn btn-black"><a class="prev" href="javascript:void(0);" style="left:-10px;"></a><a class="next" href="javascript:void(0);" style="right:-10px;"></a></div>
 -->                        </div>
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
        <input id="pageNo" type="hidden" value="${(pageNo)!'0'}" />
		</div>
        <!-- footer -->
		<#include "/footerAndHeader/footers.ftl"/>
        <script type="text/javascript">
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
				    url:"${rc.contextPath}/industry/getProductTypeTree.do"
				}
			}
			
			var zTreeNodes = [];
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
				jQuery(".charts-box-new").slide({ mainCell: ".charts-scroll", effect: "fade", vis: 1, interTime: 4500, delayTime: 500, autoPlay: true });
                //floatNav
                jQuery('.navbg').headshrinker({ fontSize: "14px", mobileMenu: true });
                $(".nav-pc a.mobile-btn").click(function () {
                    $(".nav-pc ul").slideToggle();
                });
                //list-item
                $(".list-item").hover(function () {
                    $(this).find(".infor").css("height", "auto");
                }, function () {
                    $(this).find(".infor").css("height", "75px");
                });
                $(".card-close").click(function () {
                    $("div.mask").remove();
                    $("#productImages").hide();
                    $("#card233").hide();
                });
                //tj-list-float
                /*$(window).scroll(function () {
				var scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;//scrollTop兼容办法
                    if (scrollTop > 1800) {
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
                //
             $("#showTree").click(function(){
            
	            //弹出层调用
				var index=layer.open({
					  title: '选择产品类别',
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
        </script>
        <script>

            function GetMore(){/**加载更多企业*/
				//alert( Number($("#compList .list-item").length) );
			var pageNo	= Number($("#compList .list-item").length);
			var industryId = "${(PropOne.ID)!''}";
			var productCapacity = $("#PRODUCT_CAPACITY").val();
			var productName = $("#PRODUCT_NAME").val();
			var productType = $("#productType01").val();
			
			//alert(pageNo);
	        $.post("${rc.contextPath}/prop/getMoreCompanies.do",{"pageNo":pageNo,"industryId":industryId,"productCapacity":productCapacity,"productName":productName,"productType":productType},function(obj) {	
	        	if(obj=="nomore"){
		             $("#tmore").html("没有更多");
		             $("#tmore").removeAttr("onclick");
		             $("#tmore").attr("disabled","disabled");
	            }else{
	                 var shumu=0;
	                 $.each(obj,function(index,value){
	                      $("#tmore").before("<div id='canshu23' class='row list-item'>"+
		                        "<div class='col-xs-12 col-sm-3 col-md-3 col-lg-2'><img src='${rc.contextPath}/plugins/images/allImages/"+value.CP_VIEW+"' alt='' class='img-responsive' /></div>"+
		                        "<div class='col-xs-12 col-sm-9 col-md-9 col-lg-10 infor mylist-item'>"+
		                            "<h3 class='f16 list-title'><span class='date fr f14'>"+value.CREATE_TIME+"</span><span class='fb tt'>"+value.CP_NAME+"</span></h3>"+
		                            "<ul>"+
		                                "<li><label>经营产品</label><a href='javascript:void(0);' class='card-btn pro-btn' onclick='showTU(this)' name="+ value.ID+ " title='产品图片'>"+value.CP_PRODUCT+"</a></li>"+
		                                "<li><label>网址</label><a href='http://www.baidu.com' class='link' target='_blank'>"+value.CP_ADDRESS+"</a></li>"+
		                                "<li><label>电话</label><span class='font-en'>"+value.CP_PHONE+"</span></li>"+
		                            "</ul>"+
		                        "</div>"+
		                   "</div>");
		                  shumu=shumu+1; 
		            });
		            if(shumu < 7){
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
		function showCard(aa){/**展示名片函数*/ 	
    	    $("body").append("<div class='mask'></div>");
            if ($("#card233").css("display") == "none") {
            	//用参数改变展示用2个值
            	var id=aa;
            	var name=$("#CPNAME"+id).val();
            	var abs=""+$("#CPABS"+id).val();//最大300
            	if(abs.length > 300){
            		abs=abs.substring(0,300)+"...";
            	}
            	$("#card-cp-name").html(name);
            	$("#card-cp-abs").html(abs);
                $("#card233").show();
            } else {
                $("#card233").hide();
            }
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
        function serchCompanies(){/**hj 高级搜索方法*/
        	var pageNo = 0;
			var industryId = "${(PropOne.ID)!''}";
			var productCapacity = $("#PRODUCT_CAPACITY").val();
			var productName = $("#PRODUCT_NAME").val();
			var productType = $("#productType01").val();
			
	        $.post("${rc.contextPath}/prop/getMoreCompanies.do",{"pageNo":pageNo,"industryId":industryId,"productCapacity":productCapacity,"productName":productName,"productType":productType},function(obj) {
	        	$("#compList").html("");
	        	$("#pageNo").val("0");
	        	if(obj=="nomore"){
	            }else{
	                 var shumu=0;
	                 $.each(obj,function(index,value){
	                      $("#compList").append("<div class='row list-item'>"+
		                        "<div class='col-xs-12 col-sm-3 col-md-3 col-lg-2'><img src='${rc.contextPath}/plugins/images/allImages/"+value.CP_VIEW+"' alt='' class='img-responsive' /></div>"+
		                        "<div class='col-xs-12 col-sm-9 col-md-9 col-lg-10 infor mylist-item'>"+
		                            "<h3 class='f16 list-title'><span class='date fr f14'>"+value.CREATE_TIME+"</span><span class='fb tt'>"+value.CP_NAME+"</span></h3>"+
		                            "<ul>"+
		                                "<li><label>经营产品</label><a href='javascript:void(0);' onclick='showTU(this)' name="+ value.ID+ " title='产品图片'>"+value.CP_PRODUCT+"</a></li>"+
		                                "<li><label>网址</label><a href='http://www.baidu.com' class='link' target='_blank' >"+value.CP_ADDRESS+"</a></li>"+
		                                "<li><label>电话</label><span class='font-en'>"+value.CP_PHONE+"</span></li>"+
		                            "</ul>"+
		                        "</div>"+
		                  "</div>");
		                  shumu=shumu+1;
		            });
		            if(shumu < 7){
		            	$("#compList").append("<button disabled='disabled' type='button' class='btn btn-primary btn-block mt20' onclick='GetMore()' id='tmore'><i class='iconfont mr5' style='vertical-align:middle'></i>没有更多</button>");
		            }else{
		            	$("#compList").append("<button type='button' class='btn btn-primary btn-block mt20' onclick='GetMore()' id='tmore'><i class='iconfont mr5' style='vertical-align:middle'>&#xe605;</i>加载更多</button>");
		            }
		            
	            }
	        },"json");
        }
    	</script>
</body>
</html>
