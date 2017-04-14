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
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/slider.js"></script>
	<script type="text/javascript" src="${rc.contextPath}/plugins/js/rollSlide.js"></script>
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
			var thelength=${(compLogoList?size)!'0'};
			var data01= new Array(thelength);
			<#if compLogoList??>
	        <#list compLogoList as aa>
	        	data01[${aa_index}]="${rc.contextPath}/plugins/images/allImages/${(aa.CP_LOGO)!''}";
	        	MM_preloadImages(data01[${aa_index}]);
	        </#list>
	        </#if>			
        }); 
    </script>
    <title>${(industry.NAME)!""}-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
   <#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;">
        <div class="container top-txt">
            <p class="f14 fb">+<#if industry?? && industry.INDUSTRY_TYPE?? && industry.INDUSTRY_TYPE=="INDUSTRY_A">工业产品<#elseif industry?? && industry.INDUSTRY_TYPE?? && industry.INDUSTRY_TYPE=="INDUSTRY_B">生产服务</#if>+</p>
            <h2 class="f30 fb">${(industry.NAME)!""}</h2><small class="caps"></small>
        </div>
    </div></a>
	<div class="container mainbg mt20">
    <!-- bread -->
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span><a href="${rc.contextPath}/industry">产品服务</a><span>&gt;</span>${(industry.NAME)!""}
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
                          <#if sliderImages??>
                            <#list sliderImages as si>
                                <li><p class="txt">${(si.FILE_TITLE)!""}</p><a href="${(si.URL)!'javascript:void(0)'}" <#if si?? && si.URL??>target="_blank"<#else> style="cursor:default;"</#if>><img src="${rc.contextPath}/plugins/images/allImages/${(si.FILE_NAME)!''}" class="img-responsive" alt="" /></a></li>
                            </#list>
                          </#if> 
                        </ul>
                        <div class="slider-btn btn-white"><a class="prev" href="javascript:void(0);"></a><a class="next" href="javascript:void(0);"></a></div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="border-box dtmin">
                    <h2 class="news-t"><span class="more fr"><a href="${rc.contextPath}/industry/newsList/${(industry.ID)!''}/NEWS_B">更多 &gt;</a></span><i class="iconfont mr10 f25 blue-n">&#xe613;</i><span class="f16 blue-n fb">产品资讯</span></h2>
                    <dl class="newslist">
                        <#if newsList??>
	                        <#list newsList as nl>
	                             <#if nl_index==0>
			                        <dt>
			                            <a href="${rc.contextPath}/industry/newsDetail/${(industry.ID)!''}/${(nl.ID)!''}"  title="${(nl.NEWS_TITLE)!''}" >${(nl.NEWS_TITLE)!""}</a>
			                            <span class="fn f12" style="word-break: break-all;" ><#if nl.INTRODUCE?? && nl.INTRODUCE?length gt 79>${((nl.INTRODUCE)!"")?substring(0,79)}...<#else>${(nl.INTRODUCE)!""}</#if></span>
			                        </dt>
			                     <#else>   
			                        <dd><a href="${rc.contextPath}/industry/newsDetail/${(industry.ID)!''}/${(nl.ID)!''}"  title="${(nl.NEWS_TITLE)!''}" ><span class="date">${((nl.NEWS_TIME)!"")?string("yyyy-MM-dd")}</span>${(nl.NEWS_TITLE)!""}</a></dd>
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
        <div class="row">
                <#if statistImages??>
		            <#list statistImages as st>
		                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6"><div class="border-box mb20"><img src="${rc.contextPath}/plugins/images/allImages/${(st.FILE_NAME)!''}" alt="" class="img-responsive" /></div></div>
		            </#list>
	            </#if>
        </div>
    </div>
    <div class="mt20 mb20" style="padding-left:15px;padding-right:15px;">
        <!-- search-advanced -->
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
                <#if compLogoList??>
                      <#list compLogoList as co>
                           
                              <li><a href="${(co.CP_ADDRESS)!''}" target="_blank" title="${(co.CP_NAME)!''}"><img src="${rc.contextPath}/plugins/images/allImages/${(co.CP_LOGO)!''}" alt="${(co.CP_NAME)!''}" /></a></li>
                           
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
                               <div class="row list-item">
                                  <div class="col-xs-12 col-sm-3 col-md-3 col-lg-2"><img src="${rc.contextPath}/plugins/images/allImages/${(cs.CP_VIEW)!''}" alt="" class="img-responsive" /></div>
			                        <div class="col-xs-12 col-sm-9 col-md-9 col-lg-10 infor mylist-item">
			                            <h3 class="f16 list-title"><span class="date fr f14"><#if cs?? && cs.CREATE_TIME?? >${((cs.CREATE_TIME)!"")?string("yyyy-MM-dd")}</#if></span><span class="fb tt">${(cs.CP_NAME)!''}</span></h3>
			                            <ul>
			                                <li><label>经营产品</label><a href="javascript:void(0);"   name="${(cs.ID)!''}" class="card-btn pro-btn" title="产品图片">${(cs.CP_PRODUCT)!''}</a></li>
			                                <li><label>网址</label><a href="${(cs.CP_ADDRESS)!''}" class="link" target="_blank">${(cs.CP_ADDRESS)!''}</a></li>
			                                <li><label>电话</label><span class="font-en">${(cs.CP_PHONE)!''}</span></li>
			                            </ul>
			                        </div>
			                    </div>
                       </#list>
                   </#if>
        
                    <button type="button" <#if compList?? && compList?size lt 7>disabled</#if> class="btn btn-primary btn-block mt20" onclick="GetMore()" id="tmore"><#if compList?? && compList?size lt 7>没有更多<#else><i class="iconfont mr5" style="vertical-align:middle">&#xe605;</i>加载更多</#if></button>
                    
                </div>
                
                
                
                <div class="col-md-3 col-lg-3 hidden-sm hidden-xs pr tj-r">
                    <div id="float-right">
                        <h3 class="f16 mt15"><i class="iconfont mr5">&#xe690;</i>推荐企业</h3>
                        <ul class="tj-list">
                            <#if adList??>
			                      <#list adList as ad>
			                              <li><a href="${(ad.URL)!''}" target="_blank" ><img src="${rc.contextPath}/plugins/images/allImages/${(ad.FILE_NAME)!''}" alt="" class="img-responsive" /></a></li>
			                      </#list>
			                </#if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
   <input name="pageNo" id="pageNo" type="hidden" value="${(pageNo)!'0'}" />
   <!-- 企业信息 -->
   <form id="myparam" action="" method="post">   
                    <input name="articleId"  type="hidden" value=""></input>
                    <input name="moduleCode" type="hidden" value="NEWS_B"></input>
                    <input name="parentCode" type="hidden" value="${(industry.ID)!''}"></input>
                    <input name="fModuleCode" type="hidden" value="MODULE_D"></input>
                    <input name="fParentCode" type="hidden" value="${(industry.ID)!''}"></input>
                    <input name="url1" type="hidden" value="/industry"></input>
                    <input name="url2" type="hidden" value="/industry/getEveryIndustry.do?industryId=${(industry.ID)!''}"></input>
                    
   </form>
    </div>
    
        <!-- card -->
                    <div id="productImages" class="card-box pro-box" style="display:none;">
                        <div class="card-close"><i class="iconfont">&#xe652;</i>关闭</div>
                        <div class="card-scroll sm-scroll">
                            <ul id="pt" class="card-c sm-c">
                            </ul>
                            <!--<div class="slider-btn btn-black"><a class="prev" href="javascript:void(0);" style="left:-10px;"></a><a class="next" href="javascript:void(0);" style="right:-10px;"></a></div>-->
                        </div>
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
            //cardScroll
            //jQuery(".card-scroll").slide({ mainCell: ".card-c", effect: "fade", vis: 1, interTime: 4500, delayTime: 500, autoPlay: false });
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
            $(".list-item a.card-btn").click(function () {
                $("body").append("<div class='mask'></div>");
                if ($(".card-box").css("display") == "none") {
                    getProductImages(this);
                    $(".card-box").show();
                } else {
                    $(".card-box").hide();
                   
                }
            });
            $(".card-close").click(function () {
                $("div.mask").remove();
                $(".card-box").hide();
                $("#pt").html("");
            });
            //tj-list-float
            /*$(window).scroll(function () {
			var scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;//scrollTop兼容办法
                if (scrollTop > 1150) {
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


        
        function GetMore(){
            
			var pageNo = $("#pageNo").val();
			var industryId = "${(industry.ID)!''}";
			var productCapacity = $("#PRODUCT_CAPACITY").val();
			var productName = $("#PRODUCT_NAME").val();
			var productType = $("#productType01").val();
	        $.post("${rc.contextPath}/industry/getMoreCompanies.do",{"pageNo":pageNo,"industryId":industryId,"productCapacity":productCapacity,"productName":productName,"productType":productType},function(obj) {
	        	
	        	if(obj=="nomore"){
		             $("#tmore").html("没有更多");
		             $("#tmore").removeAttr("onclick");
		             $("#tmore").attr("disabled","true");
	            }else{
	                 $.each(obj,function(index,value){
		                
		                      $("#tmore").before("<div class='row list-item'>"+
			                        "<div class='col-xs-12 col-sm-3 col-md-3 col-lg-2'><img src='${rc.contextPath}/plugins/images/allImages/"+value.CP_VIEW+"' alt='' class='img-responsive' /></div>"+
			                        "<div class='col-xs-12 col-sm-9 col-md-9 col-lg-10 infor mylist-item'>"+
			                            "<h3 class='f16 list-title'><span class='date fr f14'>"+value.CREATE_TIME+"</span><span class='fb tt'>"+value.CP_NAME+"</span></h3>"+
			                            "<ul>"+
			                                "<li><label>经营产品</label><a href='javascript:void(0);' onclick='getProductImages(this)' name='"+value.ID+"' class='card-btn pro-btn' title='产品图片'>"+value.CP_PRODUCT+"</a></li>"+
			                                "<li><label>网址</label><a href='"+value.CP_ADDRESS+"' class='link' target='_blank'>"+value.CP_ADDRESS+"</a></li>"+
			                                "<li><label>电话</label><span class='font-en'>"+value.CP_PHONE+"</span></li>"+
			                            "</ul>"+
			                        "</div>"+
			                    "</div>");
		                   
		               
		            });
		            
		            
		            $("#pageNo").val(parseInt(pageNo)+1);
		            
	            }
	            
	        },"json");
		}
        
        
        function getProductImages(obj){
              
              $.post("${rc.contextPath}/industry/getProductImages.do",{"compId":$(obj).attr("name")},function(objs) {
	        	
	        	if(objs=="nomore"){
	        	     $("#pt").html("");
	        	     $("body").append("<div class='mask'></div>");
		             $(".card-box").show();
		             
	            }else{
	                 $("#pt").html("");
	                 $("body").append("<div class='mask'></div>");
	                 var length=objs.length;
	                 
	                 for(var i=0;i<length;i++){
	                    $("#pt").append("<li><p class='txt'></p><img src='' alt='' class='img-responsive' /></li>");
	                 }
	                 $.each(objs,function(index,value){
		                      $("#pt").find("li:eq("+index+") p").text(value.FILE_TITLE);
		                      $("#pt").find("li:eq("+index+") img").attr("src","${rc.contextPath}/plugins/images/allImages/"+value.FILE_NAME);
		                      
		               
		            });
		            $(".card-box").show();
		            
	            }
	            
	        },"json");
        }
        
        
        function serchCompanies(){
            
			var industryId = "${(industry.ID)!''}";
			var productCapacity = $("#PRODUCT_CAPACITY").val();//产品功能
			var productName = $("#PRODUCT_NAME").val();//产品名称
			var productType = $("#productType01").val();//产品分类
			//alert(" "+ productName+" "+productCapacity +" "+productType);
	        $.post("${rc.contextPath}/industry/serchCompanies.do",{"industryId":industryId,"productCapacity":productCapacity,"productName":productName,"productType":productType},function(obj) {
	        	$("#compList").html("");
	        	$("#pageNo").val("0");
	        	if(obj=="nomore"){
		            
	            }else{
	                 
	                 $.each(obj,function(index,value){
		                     
		                      $("#compList").append("<div class='row list-item'>"+
			                        "<div class='col-xs-12 col-sm-3 col-md-3 col-lg-2'><img src='${rc.contextPath}/plugins/images/allImages/"+value.CP_VIEW+"' alt='' class='img-responsive' /></div>"+
			                        "<div class='col-xs-12 col-sm-9 col-md-9 col-lg-10 infor mylist-item'>"+
			                            "<h3 class='f16 list-title'><span class='date fr f14'>"+value.CREATE_TIME+"</span><span class='fb tt'>"+value.CP_NAME+"</span></h3>"+
			                            "<ul>"+
			                                "<li><label>经营产品</label><a href='javascript:void(0);' onclick='getProductImages(this)' name='"+value.ID+"' class='card-btn pro-btn' title='产品图片'>"+value.CP_PRODUCT+"</a></li>"+
			                                "<li><label>网址</label><a href='"+value.CP_ADDRESS+"' class='link'>"+value.CP_ADDRESS+"</a></li>"+
			                                "<li><label>电话</label><span class='font-en'>"+value.CP_PHONE+"</span></li>"+
			                            "</ul>"+
			                        "</div>"+
			                    "</div>");
		                   
		               
		            });
		             
		            $("#compList").append("<button type='button' class='btn btn-primary btn-block mt20' onclick='GetMore()' id='tmore'><i class='iconfont mr5' style='vertical-align:middle'>&#xe605;</i>加载更多</button>");
	            }
	            
	        },"json");
        }
        
        
    </script>
</body>
</html>