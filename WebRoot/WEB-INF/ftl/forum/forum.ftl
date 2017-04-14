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
			var thelength=${(CPLogoLunbo?size)!'0'};
			var data01= new Array(thelength);
			<#if CPLogoLunbo??>
	        <#list CPLogoLunbo as aa>
	        	data01[${aa_index}]="${rc.contextPath}/plugins/images/allImages/${(aa.FILE_NAME)!''}";
	        	MM_preloadImages(data01[${aa_index}]);
	        </#list>
	        </#if>			
            //alert(data01);
            //MM_preloadImages(data01);
        }); 
    </script>
    <title>对接服务-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
	<#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <a href="javascript:void(0)" style="cursor:default;"><div class="banner w" style="background: url(${rc.contextPath}/plugins/images/allImages/${(bannerImages.FILE_NAME)!''}) top center no-repeat;"></div></a>
    <div class="container mainbg mt20">
	<!-- bread -->
    <div class="clearfix mt10 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span>对接服务
        </div>
	        <div class="search fr search-xs" >
	            <div class="fl"><input type="text" class="search-text" id="searchCompany_text" value="${keyWord!''}" name="" placeholder="搜企业" /></div>
	            <div class="fr"><button class="search-but" onclick="searchCompany()" ><i class="iconfont f30">&#xe60a;</i></button></div>
	        </div>
    </div>
    <!-- report -->
    <div class="mt20" id="float1">
	<h2 class="f25 fb title-p"><span class="txt blue-b">产业研究</span><span class="line border-c"></span></h2>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mb20">
				<div class="border-box">
                    <h3 class="f16 f-bar"><span class="more-s f12">
                    <a href="${rc.contextPath}/forum/fileList/FILE_E2">更多&gt;</a></span><span class="fr"><a href="#" style="display:none;">投稿 +</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe678;</i>产业研究报告</span></h3>
                    <!--<p class="mt10"><img src="${rc.contextPath}/plugins/images/news.jpg" alt="" class="img-responsive" /></p>-->
                    <ul class="download-list mt10">
                    <#if XiaZai2??>
                    <#list XiaZai2 as aa> 
                        <li title="${((aa.FILE_TITLE)!"")}"><a href="${rc.contextPath}/plugins/images/allFiles/${(aa.FILE_NAME)!''}" target="_blank"><span class="date">${((aa.CREATE_TIME)!"")}</span>${((aa.FILE_TITLE)!"")}</a></li>
                    </#list>
                    </#if> 
                    </ul>
					</div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mb20">
				<div class="border-box">
                    <h3 class="f16 f-bar"><span class="more-s f12">
                    <a href="${rc.contextPath}/forum/fileList/FILE_E1">更多&gt;</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe633;</i>产业成功案例</span></h3>
                    <!--<p class="mt10"><img src="${rc.contextPath}/plugins/images/news.jpg" alt="" class="img-responsive" /></p>-->
                    <ul class="download-list mt10">
                    <#if XiaZai1??>
                    <#list XiaZai1 as aa> 
                        <li title="${((aa.FILE_TITLE)!"")}"><a href="${rc.contextPath}/plugins/images/allFiles/${(aa.FILE_NAME)!''}" target="_blank"><span class="date">${((aa.CREATE_TIME)!"")}</span>${((aa.FILE_TITLE)!"")}</a></li>
                    </#list>
                    </#if> 
                    </ul>
					</div>
                </div>
            </div>
    </div>
    <!-- 横幅广告1-->
	<#if bannerAd?? && bannerAd[0]??>
	<a <#if bannerAd[0].URL??> href="${(bannerAd[0].URL)!'javascript:void(0);'}" target="_blank"<#else>style="cursor:default;"</#if>><div class="w" style="height:100px;background: url(${rc.contextPath}/plugins/images/allImages/${(bannerAd[0].FILE_NAME)!''}) center top no-repeat;background-size:cover;"></div></a> 
	</#if>    
	<!-- Training  -->
    <div class="mt20" id="float2">
        <h2 class="f25 fb title-p"><span class="txt blue-b">培训学习</span><span class="line border-c"></span></h2>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mb20">
			<div class="border-box">
                <h3 class="f16 f-bar"><span class="more-s f12">
                <a href="${rc.contextPath}/forum/fileList/FILE_URL">更多&gt;</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe68e;</i>线上培训</span></h3>
                <!--<p class="mt10"><img src="${rc.contextPath}/plugins/images/news.jpg" alt="" class="img-responsive" /></p>-->
                <ul class="download-list mt10">
                    <#if Links??>
                    <#list Links as aa> 
                    <li title="本平台所有线上培训暂只提供第三方平台培训视频链接地址"><a href="${(aa.URL)!''}" target="_blank"><span class="date">${((aa.CREATE_TIME)!"")}</span>${((aa.FILE_TITLE)!"")}</a></li>
                    </#list>
                    </#if> 
                </ul>
			</div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mb20">
			<div class="border-box">
                <h3 class="f16 f-bar"><span class="more-s f12">
                <a href="${rc.contextPath}/forum/newsList/NEWS_P">更多&gt;</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe748;</i>线下培训</span></h3>
                <!--<p class="mt10"><img src="${rc.contextPath}/plugins/images/news.jpg" alt="" class="img-responsive" /></p>-->
                <ul class="download-list mt10">
                    <#if NewslistA1??>
                    <#list NewslistA1 as aa> 
                    <li title="${((aa.NEWS_TITLE)!"")}"><a href="${rc.contextPath}/forum/newsDetail/NEWS_P/${(aa.ID)!''}"><span class="date">${((aa.NEWS_TIME)!"")}</span>${((aa.NEWS_TITLE)!"")}</a></li>
                    </#list>
                    </#if> 
                </ul>
			</div>
            </div>
        </div>
    </div>
	<!-- 横幅广告2-->
	<#if bannerAd?? && bannerAd[1]??>
	<a <#if bannerAd[1].URL??> href="${(bannerAd[1].URL)!'javascript:void(0);'}" target="_blank"<#else>style="cursor:default;"</#if>><div class="w" style="height:100px;background: url(${rc.contextPath}/plugins/images/allImages/${(bannerAd[1].FILE_NAME)!''}) center top no-repeat;background-size:cover;"></div></a> 
	</#if>
    <!-- recruit -->
    <div class="mt20" id="float3">
            <h2 class="f25 fb title-p"><span class="txt blue-b">招聘服务</span><span class="line border-c"></span></h2>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mb20">
                    <div class="tc back-n">
                        <a href="http://www.apesk.com/mbti/dati.asp" target="_blank"><h3 class="f30 fb">人格测评</h3></a>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mb20">
                    <div class="tc back-n back-t">
                        <a href="http://www.zhiyeguihua.com/" target="_blank"><h3 class="f30 fb">职业生涯规划</h3></a>
                    </div>
                </div>
            </div>
            <!-- logoScroll -->
            <div class="scroll-logo roll_row pr" id="logoscroll" style="margin-top:15px;padding-bottom:15px;min-height:105px;">
            <ul class="logo-list roll__list logo-list-dj clearfix" style="position: absolute; left: 0; top: 0;">
				<#if CPLogoLunbo??>
				<#list CPLogoLunbo as aa>
				<li><a href="${(aa.URL)!'#'}" target="_blank"><img src="${rc.contextPath}/plugins/images/allImages/${(aa.FILE_NAME)!''}" title="${(aa.FILE_TITLE)!''}"/></a></li>
				</#list>
				</#if>
                </ul>
                <div class="slider-btn btn-black"><a class="prev" href="javascript:void(0);" style="left:-15px;"></a><a class="next" href="javascript:void(0);" style="right:-15px;"></a></div>
            </div>
            <div class="row mt20">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mb20">
				<div class="border-box">
                    <h3 class="f16 f-bar"><span class="more-s f12">
                    <a href="${rc.contextPath}/forum/recruitlist">更多&gt;</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe668;</i>职位信息</span></h3>
                    <!-- <p class="mt10"><img src="${rc.contextPath}/plugins/images/news.jpg" alt="" class="img-responsive" /></p> -->
                    <ul class="download-list mt10">
                    <#if NewslistA2??>
                    <#list NewslistA2 as aa> 
                    <li title="${((aa.NEWS_TITLE)!"")}"><a href="${rc.contextPath}/forum/recruitOne/${(aa.ID)!''}"><span class="date">${((aa.REC_TIME)!"")}</span>${((aa.JOB_NAME)!"缺省")}</a></li>
                    </#list>
                    </#if> 
                    </ul>
				</div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 mb20">
				<div class="border-box">
                    <h3 class="f16 f-bar"><span class="more-s f12">
                    <a href="${rc.contextPath}/forum/resumelist">更多&gt;</a></span><span class="fr"><a href="#" style="display:none;">投递信息</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe660;</i>简历投递</span></h3>
                    <!-- <p class="mt10"><img src="${rc.contextPath}/plugins/images/news.jpg" alt="" class="img-responsive" /></p> -->
                    <ul class="download-list mt10">
                    <#if NewslistA3??>
                    <#list NewslistA3 as aa> 
                    <li title="${((aa.NEWS_TITLE)!"")}"><a href="${rc.contextPath}/user/resumeExports.do?id=${(aa.ID)!''}"><span class="date">${((aa.REC_TIME)!"")}</span>个人简历-${((aa.NAME)!"缺省")}</a></li>
                    </#list>
                    </#if> 
                    </ul>
				</div>
                </div>
            </div>
    </div>
    <!-- 横幅广告3-->
	<#if bannerAd?? && bannerAd[2]??>
	<a <#if bannerAd[2].URL??> href="${(bannerAd[2].URL)!'javascript:void(0);'}" target="_blank"<#else>style="cursor:default;"</#if>><div class="w" style="height:100px;background: url(${rc.contextPath}/plugins/images/allImages/${(bannerAd[2].FILE_NAME)!''}) center top no-repeat;background-size:cover;"></div></a> 
	</#if>   
    <div class="mt20" id="float4">
	<h2 class="f25 fb title-p"><span class="txt blue-b">对接服务</span><span class="line border-c"></span></h2>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="border-box mb20">
                <h3 class="f16 f-bar"><span class="more-s f12">
                <a href="${rc.contextPath}/forum/tableList/table1">更多&gt;</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe6c6;</i>诚信认证服务机构</span></h3>
                <!-- <p class="mt10"><img src="${rc.contextPath}/plugins/images/news.jpg" alt="" class="img-responsive" /></p> -->
				<!-- logoScroll logo轮播 -->
		<div class="scroll-logo-small roll_row pr" id="logoscroll-small" style="margin-top:15px;padding-bottom:15px;min-height:70px;">
            <ul class="logo-list-small roll__list clearfix" style="position: absolute; left: 0; top: 0;">
                <#if chengxinlogo??>
                <#list chengxinlogo as aa> 
                <li><a href="${(aa.URL)!'#'}" target="_blank"><img src="${rc.contextPath}/plugins/images/allImages/${(aa.FILE_NAME)!''}" title="${(aa.FILE_TITLE)!''}" class="img-responsive"/></a></li>
                </#list>
                </#if> 
            </ul>
            <div class="slider-btn btn-black"><a class="prev" href="javascript:void(0);" style="left:-15px;"></a><a class="next" href="javascript:void(0);" style="right:-15px;"></a></div>
        </div>
                <ul class="download-list mt10"><!--[诚信认证服务机构]-->
                    <#if NewslistA4??>
                    <#list NewslistA4 as aa> 
                    <li title="${((aa.NAME)!"")}"><span class="date">${((aa.CREATE_TIME)!"")}</span>${((aa.NAME)!"")}</li>
                    </#list>
                    </#if> 
                </ul>
			</div>
			<div class="border-box mb20">
                <h3 class="f16 f-bar"><span class="more-s f12">
                <a href="${rc.contextPath}/forum/tableList/table2">更多&gt;</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe60d;</i>行业协会</span></h3>
                <!-- <p class="mt10"><img src="${rc.contextPath}/plugins/images/news.jpg" alt="" class="img-responsive" /></p> -->
                <ul class="download-list mt10"><!--[行业协会]-->
                    <#if NewslistA5??>
                    <#list NewslistA5 as aa> 
                    <li title="${((aa.NAME)!"")}"><span class="date">${((aa.CREATE_TIME)!"")}</span>${((aa.NAME)!"")}</li>
                    </#list>
                    </#if> 
                </ul>
			</div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
			<div class="border-box mb20">
                <h3 class="f16 f-bar"><span class="more-s f12">
                <a href="${rc.contextPath}/forum/needslist">更多&gt;</a></span><span class="more-s f12"><a href="${rc.contextPath}/user/need">发布信息 +</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe6a0;</i>需求信息</span></h3>
                <ul class="download-list mt10"><!--[需求信息]-->
                 	<#if NeedsList?? >
					    <#list NeedsList as aa>
					       <li><a href="${rc.contextPath}/forum/needsview/${(aa.ID)!''}" title="${(aa.NAME)!''}"><span class="date">${((aa.CREATE_TIME)!"")}</span>${(aa.NAME)!''}</a></li>   
					    </#list>
				    </#if> 
                </ul>
			</div>
			<div class="border-box mb20">
                <h3 class="f16 f-bar"><span class="more-s f12">
                <a href="${rc.contextPath}/forum/supplylist">更多&gt;</a></span><span class="more-s f12"><a href="${rc.contextPath}/user/supply">发布信息 +</a></span><span class="name-bor"><i class="iconfont f20 mr5">&#xe68c;</i>供应信息</span></h3>
                <!-- <p class="mt10"><img src="${rc.contextPath}/plugins/images/news.jpg" alt="" class="img-responsive" /></p> -->
                <ul class="download-list mt10"><!--[供应信息]-->
                    <#if SupplyList?? >
					    <#list SupplyList as aa>
					       <li><a href="${rc.contextPath}/forum/supplyview/${(aa.ID)!''}" title="${(aa.NAME)!''}"><span class="date">${((aa.CREATE_TIME)!"")}</span>${(aa.NAME)!''}</a></li>   
					    </#list>
				    </#if> 
                </ul>
			</div>
            </div>
        </div>
    </div>
	<!-- 横幅广告4-->
	<#if bannerAd?? && bannerAd[3]??>
	<a <#if bannerAd[3].URL??> href="${(bannerAd[3].URL)!'javascript:void(0);'}" target="_blank"<#else>style="cursor:default;"</#if>><div class="w" style="height:100px;background: url(${rc.contextPath}/plugins/images/allImages/${(bannerAd[3].FILE_NAME)!''}) center top no-repeat;background-size:cover;"></div></a> 
	</#if>       
	<!-- download -->
    <div class="mt20 mb20" id="float5">
        <h2 class="f25 fb title-p"><span class="txt blue-b">下载专区</span><span class="line border-c"></span></h2>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                <div class="tabnav-charts dowanload-nav">
                    <ul>
                        <li class="active"><a href="javascript:void(0);">培训课件</a></li>
                        <li><a href="javascript:void(0);">研究报告</a></li>
                        <li><a href="javascript:void(0);">管理案例</a></li>
                        <li><a href="javascript:void(0);">技术创新案例</a></li>
                        <!--<li><a href="javascript:void(0);">财经评论</a></li>-->
                        <li><a href="javascript:void(0);">其它</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10">
                
                <div class="con-charts download-c">
                    
                    <div class="on-con"><!-- --->
                        <ul class="download-list" style="min-height:150px;">
	                    <#if XiaZai3??>
	                    <#list XiaZai3 as aa> 
	                        <li title="${((aa.FILE_TITLE)!"")}"><a href="${rc.contextPath}/plugins/images/allFiles/${(aa.FILE_NAME)!''}"   target="_blank"><span class="date">${((aa.CREATE_TIME)!"")}</span>${((aa.FILE_TITLE)!"")}</a></li>
	                    </#list>
	                    </#if> 
                        </ul>
                       <p class="down-btn"><a href="${rc.contextPath}/forum/fileList/FILE_D">更多 &gt;</a></p>
                    </div>
                    <div class="tabcon"><!-- --->
                        <ul class="download-list" style="min-height:150px;">
	                    <#if XiaZai4??>
	                    <#list XiaZai4 as aa> 
	                        <li title="${((aa.FILE_TITLE)!"")}"><a href="${rc.contextPath}/plugins/images/allFiles/${(aa.FILE_NAME)!''}" target="_blank"><span class="date">${((aa.CREATE_TIME)!"")}</span>${((aa.FILE_TITLE)!"")}</a></li>
	                    </#list>
	                    </#if> 
                        </ul>
						<p class="down-btn"><a href="${rc.contextPath}/forum/fileList/FILE_E">更多 &gt;</a></p>
                    </div>
                    <div class="tabcon"><!-- --->
                        <ul class="download-list" style="min-height:150px;">
	                    <#if XiaZai5??>
	                    <#list XiaZai5 as aa> 
	                        <li title="${((aa.FILE_TITLE)!"")}"><a href="${rc.contextPath}/plugins/images/allFiles/${(aa.FILE_NAME)!''}" target="_blank"><span class="date">${((aa.CREATE_TIME)!"")}</span>${((aa.FILE_TITLE)!"")}</a></li>
	                    </#list>
	                    </#if> 
                        </ul>
						<p class="down-btn"><a href="${rc.contextPath}/forum/fileList/FILE_F">更多 &gt;</a></p>
                    </div>
                    <div class="tabcon"><!-- --->
                        
                        <ul class="download-list" style="min-height:150px;">
	                    <#if XiaZai6??>
	                    <#list XiaZai6 as aa> 
	                        <li title="${((aa.FILE_TITLE)!"")}"><a href="${rc.contextPath}/plugins/images/allFiles/${(aa.FILE_NAME)!''}" target="_blank"><span class="date">${((aa.CREATE_TIME)!"")}</span>${((aa.FILE_TITLE)!"")}</a></li>
	                    </#list>
	                    </#if> 
                        </ul>
						<p class="down-btn"><a href="${rc.contextPath}/forum/fileList/FILE_G">更多 &gt;</a></p>
                    </div>
                    <!--财经评论不要了 <div class="tabcon">
                        <ul class="download-list" style="min-height:150px;">
	                    <#if XiaZai7??>
	                    <#list XiaZai7 as aa> 
	                        <li title="${((aa.FILE_TITLE)!"")}"><a href="${rc.contextPath}/plugins/images/allFiles/${(aa.FILE_NAME)!''}" target="_blank"><span class="date">${((aa.CREATE_TIME)!"")}</span>${((aa.FILE_TITLE)!"")}</a></li>
	                    </#list>
	                    </#if> 
                        </ul>
						<p class="down-btn"><a href="${rc.contextPath}/forum/fileList/FILE_H">更多 &gt;</a></p>
                    </div> -->
                    <div class="tabcon"><!-- --->
                        <ul class="download-list" style="min-height:150px;">
	                    <#if XiaZai8??>
	                    <#list XiaZai8 as aa> 
	                        <li title="${((aa.FILE_TITLE)!"")}"><a href="${rc.contextPath}/plugins/images/allFiles/${(aa.FILE_NAME)!''}" target="_blank"><span class="date">${((aa.CREATE_TIME)!"")}</span>${((aa.FILE_TITLE)!"")}</a></li>
	                    </#list>
	                    </#if> 
                        </ul>
						<p class="down-btn"><a href="${rc.contextPath}/forum/fileList/FILE_I">更多 &gt;</a></p>
                    </div>                                       
                </div>
            </div>
        </div>
    </div>
	</div>
    <!--floatNav-->
    <div class="floatNav" style="display:none;">
        <ul>
            <li><a href="javascript:void(0);" title="产业研究"><i class="iconfont">&#xe633;</i></a></li>
            <li><a href="javascript:void(0);" title="培训学习"><i class="iconfont">&#xe60d;</i></a></li>
            <li><a href="javascript:void(0);" title="招聘服务"><i class="iconfont">&#xe660;</i></a></li>
            <li><a href="javascript:void(0);" title="对接服务"><i class="iconfont">&#xe6c6;</i></a></li>
            <li><a href="javascript:void(0);" title="下载中心"><i class="iconfont">&#xe606;</i></a></li>
        </ul>
        <p class="back-top" title="返回顶部"><a href="javascript:void(0);"><i class="iconfont">&#xe610;</i></a></p>
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
            //logoScroll
            $('#logoscroll').rollSlide({
                orientation: 'left',
                num: 1,
                v: 1500,
                space: 3000,
                isRoll: true
            });
			//logoScroll
            $('#logoscroll-small').rollSlide({
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
            //chartsTab
            $(".tabnav-charts li").click(function () {
                $(".tabnav-charts li").eq($(this).index()).addClass("active").siblings().removeClass('active');
                $(".con-charts div").eq($(".tabnav-charts li").index(this)).removeClass("tabcon").siblings().addClass('tabcon');
                $(".con-charts div").eq($(".tabnav-charts li").index(this)).addClass("on-con").siblings().removeClass('on-con');
            });
            //floatNav-right
            $(window).scroll(function () {
			var scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;//scrollTop兼容办法
                if (scrollTop > 250) {
                    $('.floatNav').fadeIn(100);
                }
                else {
                    $('.floatNav').fadeOut(100);
                }
            });
            $('div.floatNav li a').click(function () {
                var ind = $('div.floatNav a').index(this) + 1;
                var topVal = $('#float' + ind).offset().top;
                $('body,html').animate({ scrollTop: topVal-100}, 500)
            });
            $('div.floatNav .back-top a').click(function () {
                $('body,html').animate({ scrollTop: 0 }, 500)
            });
        });
    </script>
</body>
</html>
