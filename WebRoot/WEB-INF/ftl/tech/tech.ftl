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
	<script type="text/javascript" src="${rc.contextPath}/plugins/js/rollSlide.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/slider.js"></script>
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
			var thelength=${(ManList?size)!'0'};
			var data01= new Array(thelength);
			<#if ManList??>
	        <#list ManList as aa>
	        	data01[${aa_index}]="${rc.contextPath}/plugins/images/allImages/${(aa.PS_IMAGE)!''}";
	        	MM_preloadImages(data01[${aa_index}]);
	        </#list>
	        </#if>			
        }); 
    </script>
    <title>技术创新-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
    <!-- topbar -->
	<#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;"></div></a>
    <!-- bread -->
	<div class="container mainbg mt20">
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span>技术创新
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
                            <#if Lunbo??><!--轮播图--->
	                        	<#list Lunbo as aa>
	                        	<li><p class="txt">${(aa.FILE_TITLE)!''}</p><a href="${(aa.URL)!'javascript:void(0)'}" <#if aa?? && aa.URL??>target="_blank"<#else> style="cursor:default;"</#if>><img src="${rc.contextPath}/plugins/images/allImages/${(aa.FILE_NAME)!''}" class="img-responsive" alt="" /></a></li>
	                        	</#list>
                        	</#if>
                        </ul>
                        <div class="slider-btn btn-white"><a class="prev" href="javascript:void(0);"></a><a class="next" href="javascript:void(0);"></a></div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<div class="border-box dtmin">
                    <h2 class="news-t"><span class="more fr"><a href="${rc.contextPath}/tech/newsList/NEWS_C">更多 &gt;</a></span><i class="iconfont mr10 f25 blue-n">&#xe613;</i><span class="f16 blue-n fb">技术创新动态</span></h2>
                    <dl class="newslist">
                        <dt>
                        <#if NewslistA??>
                        <#list NewslistA as aa>
                        <#if aa_index == 0 && aa.NEWS_TIME??> 
                            <a href="${rc.contextPath}/tech/newsDetail/${(aa.ID)!''}" name="${(aa.ID)!''}" title="${((aa.NEWS_TITLE)!'')}">${(aa.NEWS_TITLE)!''}</a>
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
                        <dd><a  href="${rc.contextPath}/tech/newsDetail/${(aa.ID)!''}"  name="${(aa.ID)!''}" title="${((aa.NEWS_TITLE)!'')}">
                        <span class="date">${((aa.NEWS_TIME)!"")}</span>${((aa.NEWS_TITLE)!"")}</a></dd>
                        </#if>      
                        </#list>
                        </#if> 
                    </dl>
				</div>
                </div>
            </div>
        </div>
    <!--results-->
    <div class="mt20">
        <h2 class="f25 fb title-p"><small class="caps f12 fr"><a href="${rc.contextPath}/tech/tables/table1" class="ml5">更多+</a></small><span class="txt blue-b">技术创新成果</span><span class="line border-c"></span></h2>
        <div class="row cxcg-list">
            <#if Tu1??><!--技术创新成果---->
        	<#list Tu1 as aa>
        	<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3" title="${(aa.FILE_TITLE)!''}">
                <img src="${rc.contextPath}/plugins/images/allImages/${(aa.FILE_NAME)!''}" alt="" class="img-responsive" />
                <p class="tc lh180"><#if aa.FILE_TITLE?? && aa.FILE_TITLE?length gt 15>${((aa.FILE_TITLE)!"")?substring(0,15)}<#else>${(aa.FILE_TITLE)!""}</#if>
                </p>
            </div>
        	</#list>
        	</#if>
        </div>
    </div>
    <!-- platforms -->
    <div class="mt20">
        <h2 class="f25 fb title-p"><small class="caps f12 fr"><a href="${rc.contextPath}/tech/tables/table2" class="ml5">更多+</a></small><span class="txt blue-b">技术创新平台</span><span class="line border-c"></span></h2>
        <div class="row cxcg-list">
            <#if Tu2??><!--技术创新平台---->
        	<#list Tu2 as aa>
        	<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3" title="${(aa.FILE_TITLE)!''}">
                <img src="${rc.contextPath}/plugins/images/allImages/${(aa.FILE_NAME)!''}" alt="" class="img-responsive" />
                <p class="tc lh180"><#if aa.FILE_TITLE?? && aa.FILE_TITLE?length gt 15>${((aa.FILE_TITLE)!"")?substring(0,15)}<#else>${(aa.FILE_TITLE)!""}</#if></p>
            </div>
        	</#list>
        	</#if>
        </div>
    </div>
    <!-- card 弹出人物卡片-->
    <div class="card-box rw-box" style="display:none;">
        <div class="card-close"><i class="iconfont">&#xe652;</i>关闭</div>
        <div class="card-scroll sm-scroll">
            <div class="fl rw-img p10"><img id="p06" src="${rc.contextPath}/plugins/images/allImages/r1.jpg" class="img-responsive" alt="" /><p id="p01" class="tc lh200"></p></div>
            <div class="fl rw-jj">
                <ul class="rw-list p15">
                    <li><label>姓名</label><span id="p02"></span></li>
                    <li><label>职务</label><span id="p04"></span></li>
                    <li><label>所在单位</label><span id="p03"></span></li>
                    <li><label>联系方式</label><span id="p09"></span></li>
                </ul>
                <p class="lh180 mt10" id="p05"></p>
            </div>
        </div>
    </div>
   
    <!--talents-->
    <div class="mt20">
        <h2 class="f25 fb title-p"><span class="txt blue-b">创新人才与创新投入</span><span class="line border-c"></span></h2>
        <div class="scroll-logo roll_row pr" id="logoscroll" style="margin-top:15px;padding-bottom:15px;min-height:192px;">
            <ul class="logo-list human_list roll__list clearfix" style="position: absolute; left: 0; top: 0;">
            <#if ManList??><!--人像图---->
        	<#list ManList as aa>
        	<li title="${(aa.PS_NAME)!''}">
        	<a href="javascript:void(0);" name="${(aa.ID)!''}" class="card-233" onclick="newShowCard(this);">
        	<img src="${rc.contextPath}/plugins/images/allImages/${(aa.PS_IMAGE)!''}"/></a>
            <input type="hidden" value="${(aa.PS_NAME)!''}"  id="${'PS_NAME'+aa.ID}"/>
            <input type="hidden" value="${(aa.PS_BELONG)!''}"   id="${'PS_BELONG'+aa.ID}"/>
            <input type="hidden" value="${(aa.PS_JOB)!''}" id="${'PS_JOB'+aa.ID}"/>
            <input type="hidden" value="${(aa.PS_TEL)!''}" id="${'PS_TEL'+aa.ID}"/>
            <input type="hidden" value="${(aa.PS_INTRODUCE)!''}" id="${'PS_INTRODUCE'+aa.ID}"/>
            <input type="hidden" value="${(aa.PS_IMAGE)!''}" id="${'PS_IMAGE'+aa.ID}"/>
            </li>
        	</#list>
        	</#if>
            </ul>
            <div class="slider-btn btn-black"><a class="prev" href="javascript:void(0);" style="left:-15px;"></a><a class="next" href="javascript:void(0);" style="right:-15px;"></a></div>
        </div>
        <div class="row charts" style="padding:20px 0 0 0;">
            <#if TongJi??><!--统计图---->
        	<#list TongJi as aa>
        		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6"><div class="border-box mb20"><img src="${rc.contextPath}/plugins/images/allImages/${(aa.FILE_NAME)!''}" title="${(aa.FILE_TITLE)!''}" class="img-responsive" /></div></div>
        	</#list>
        	</#if>
        </div>
    </div>
    <!-- cooperation  -->
    <div class="mt20 mb20 clearfix">
        <h2 class="f25 fb title-p"><span class="txt blue-b">产学研合作</span><span class="line border-c"></span></h2>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mb10">
		<div class="border-box" style="min-height:320px;">
            <h3 class="f16 f-bar"><span class="more-s f12"><a href="${rc.contextPath}/tech/fileList/FILE_B">更多&gt;</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe63e;</i>产学研合作示范工程</span></h3>
            <ul class="download-list mt10">
	            <#if XiaZai1??><!--下载1---->
	        	<#list XiaZai1 as aa>
	        		<li title="${(aa.FILE_TITLE)!''}"><a href="${rc.contextPath}/plugins/images/allFiles/${(aa.FILE_NAME)!''}" target="_blank"><span class="date">${(aa.CREATE_NAME)!''}</span>${(aa.FILE_TITLE)!''}</a></li>
	        	</#list>
	        	</#if>
            </ul>
		</div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"><!---统计图--->
			<div class="charts-box-new pr">
				<ul class="charts-scroll">
					<#if TongJi1??><!--旁边配图----> 
		        	<#list TongJi1 as aa>
		        		<li><a href="${(aa.URL)!'javascript:void(0)'}" <#if aa?? && aa.URL??>target="_blank"<#else> style="cursor:default;"</#if>><img src="${rc.contextPath}/plugins/images/allImages/${(aa.FILE_NAME)!''}" class="img-responsive" alt="" /></a></li>
		        	</#list>
		        	</#if>
				</ul>
				<div class="slider-btn btn-black"><a class="prev" href="javascript:void(0);" style="left:-10px;"></a><a class="next" href="javascript:void(0);" style="right:-10px;"></a></div>
			</div>
		</div>
    </div>
    <!-- Innovation index 注意 这个不显示
    <div class="container white mt20 mb20 spacing" style="display:none;" >
        <h2 class="tc f25 fb title-p"><span class="txt">技术创新指数<br /><small class="caps f12">Innovation index</small></span><span class="line"></span></h2>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mb10">
            <h3 class="f16"><i class="iconfont f20 mr5">&#xe71b;</i>创新指数报告<a href="${rc.contextPath}/tech/fileList/FILE_C" class="fr" style="text-decoration:underline;">更多&gt;</a></h3>
            <ul class="download-list mt10">
	            <#if XiaZai2??>
	        	<#list XiaZai2 as aa>
	        		<li title="${(aa.FILE_TITLE)!''}"><a href="${rc.contextPath}/plugins/images/allFiles/${(aa.FILE_NAME)!''}" target="_blank"><span class="date">${(aa.CREATE_NAME)!''}</span>${(aa.FILE_TITLE)!''}</a></li>
	        	</#list>
	        	</#if>
            </ul>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
        	<#if TongJi2??>
        	<#list TongJi2 as aa>
        		<img src="${rc.contextPath}/plugins/images/allImages/${(aa.FILE_NAME)!''}" title="${(aa.FILE_TITLE)!''}" class="img-responsive" />
        	</#list>
        	</#if>
        </div>
    </div>-->
    
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
            jQuery(".charts-box-new").slide({ mainCell: ".charts-scroll", effect: "fade", vis: 1, interTime: 4500, delayTime: 500, autoPlay: true });
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
            jQuery('.navbg').headshrinker({ fontSize: "14px", mobileMenu: true});
            $(".nav-pc a.mobile-btn").click(function () {
                $(".nav-pc ul").slideToggle();
            });
            //classify
            $(".square-box").hover(function () {
                $(this).find(".con-img").fadeIn(100);
                $(this).find(".con-icon").fadeOut(100);
            }, function () {
                $(this).find(".con-img").fadeOut(100);
                $(this).find(".con-icon").fadeIn(100);
            });
            //card名片卡 有bug禁用了 使用newShowCard方法
            /*$(".logo-list a.card-233").click(function () {
                $("body").append("<div class='mask'></div>");
                if ($(".card-box").css("display") == "none") {
                    getPerson(this);
                    $(".card-box").show();
                } else {
                    $(".card-box").hide();
                }
            });*/
            $(".card-close").click(function () {
                $("div.mask").remove();
                $(".card-box").hide();
            });
        });
        function newShowCard(obj){
    	    $("body").append("<div class='mask'></div>");
            if ($(".card-box").css("display") == "none") {
                getPerson(obj);
                $(".card-box").show();
            } else {
                $(".card-box").hide();
            }
        }
     
        function getPerson(objs){
            var id=$(objs).attr("name");
            $("#p01").text($("#PS_NAME"+id).val());
            $("#p02").html($("#PS_NAME"+id).val());
            $("#p03").html($("#PS_BELONG"+id).val() );
            $("#p04").html($("#PS_JOB"+id).val());
            $("#p09").html($("#PS_TEL"+id).val());
            $("#p06").attr("src","${rc.contextPath}/plugins/images/allImages/"+$("#PS_IMAGE"+id).val() );         
            var abs=""+$("#PS_INTRODUCE"+id).val();//最大300
        	if(abs.length > 300){
        		abs=abs.substring(0,300)+"...";
        	}
            $("#p05").text(abs);
        }
    </script>
</body>
</html>
