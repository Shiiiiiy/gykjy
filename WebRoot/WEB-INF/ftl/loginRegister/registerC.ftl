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
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/slider.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/jquery.validate.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/layer/layer.js"></script>
    <!--[if lte IE 9]>
    <script src="${rc.contextPath}/plugins/js/respond.min.js"></script>
    <script src="${rc.contextPath}/plugins/js/html5shiv.js"></script>
    <![endif]-->
    <title>机构注册-中关村贵阳科技园产业云平台</title>
</head>
<body class="con_main_bg">
    <!-- topbar -->
    <div class="topbar w">
        <div class="container">
            <div class="welcome f12 fl">您好，欢迎来到贵阳科技园产业云平台！请<a href="${rc.contextPath}/login" target="_blank">[登录]</a> / <a href="${rc.contextPath}/register">注册</a></div>
            <div class="topnav fr f12 hidden-xs"><a href="${rc.contextPath}/cloud"><i class="iconfont">&#xe609;</i>我的产业云</a><a href="${rc.contextPath}/map"><i class="iconfont">&#xe6b5;</i>网站地图</a><a href="${rc.contextPath}"><i class="iconfont">&#xe67f;</i>网站说明</a></div>
        </div>
    </div>
    <!-- nav -->
    <div class="navbg white w">
        <div class="container clearfix pr">
            <div class="logo fl"><a href="${rc.contextPath}/index"><img src="${rc.contextPath}/plugins/images/logo.png" alt="中关村贵阳科技园产业云平台" class="img-responsive" /></a></div>
        </div>
    </div>
    <!-- banner -->
    <div class="banner w banner_01"></div>
    <div class="container mainbg mt20">
    <!-- bread -->
    <div class="clearfix mt20 nav_new">
        <div class="bread-nav fl">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span>注册
        </div>
        <div class="search fr search-xs" style="display:none;">
            <div class="fl"><input type="text" class="search-text" name="" placeholder="搜企业、找产品、查资料、看报告" /></div>
            <div class="fr"><button class="search-but"><i class="iconfont f30">&#xe60a;</i></button></div>
        </div>
    </div>
    <!-- register -->
    <div class="mt20 mb20" style="padding-bottom:20px;">
        <div class="row reg-list" style="padding-left:15px;padding-right:15px;">
            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 reg-item">
                <a href="${rc.contextPath}/register/PERSON" class="f25 tc"><i class="iconfont mr10">&#xec4d;</i>个人注册</a>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 reg-item">
                <a href="${rc.contextPath}/register/COMPANY" class="f25 tc"><i class="iconfont mr10">&#xe611;</i>企业注册</a>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 reg-item">
                <a href="${rc.contextPath}/register/INSTITUTION" class="f25 tc active"><i class="iconfont mr10">&#xe722;</i>机构注册</a>
            </div>
        </div>
        <h2 class="f25 fb title-p"><span class="txt">机构注册</span><span class="line border-c"></span></h2>
        <form  id="register" name="register">
        
            <input type="hidden" id="USERTYPE" name="USERTYPE" value="INSTITUTION" />
           
            <div class="box-reg">
                <h3 class="f20 lh200 mb20">机构资料</h3>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" style="height:60px;">
                        <div class="input-group">
                            <span class="input-group-addon"><font color="red">*</font>用&nbsp;&nbsp;户&nbsp;&nbsp;名</span>
                            <input type="text" name="USERNAME" class="form-control" placeholder="请输入用户名(必填项)">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" style="height:60px;">
                        <div class="input-group">
                            <span class="input-group-addon"><font color="red">*</font>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</span>
                            <input type="password" name="PASSWORD" class="form-control" placeholder="请输入6-16位密码(必填项)">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" style="height:60px;">
                        <div class="input-group">
                            <span class="input-group-addon"><font color="red">*</font>确&nbsp;认&nbsp;密&nbsp;码</span>
                            <input type="password" name="PASSWORD_agin" class="form-control" placeholder="请输入确认密码(必填项)">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" style="height:60px;">
                        <div class="input-group">
                            <span class="input-group-addon"><font color="red">*</font>机构名称</span>
                            <input type="text" name="NAME_IN" class="form-control" placeholder="请输入机构名称(必填项)">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" style="height:60px;">
                        <div class="input-group">
                            <span class="input-group-addon"><font color="red">*</font>机构联系人</span>
                            <input type="text" name="LINKMAN" class="form-control" placeholder="请输入机构联系人(必填项)">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" style="height:60px;">
                        <div class="input-group">
                            <span class="input-group-addon"><font color="red">*</font>联系人邮箱</span>
                            <input type="text" name="EMAIL_IN" class="form-control" placeholder="请输入联系人邮箱(必填项)">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" style="height:60px;">
                        <div class="input-group">
                            <span class="input-group-addon">&nbsp;手机号码</span>
                            <input type="text" name="TEL_IN" class="form-control" placeholder="请输入手机号码">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" style="height:60px;">
                        <div class="input-group">
                            <span class="input-group-addon">&nbsp;座&nbsp;机&nbsp;号&nbsp;码&nbsp;</span>
                            <input type="text" name="PHONE_IN" class="form-control" placeholder="请输入座机号码">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:60px;">
                        <div class="input-group">
                            <span class="input-group-addon">&nbsp;组织机构代码</span>
                            <input type="text" name="ORGCODE" class="form-control" placeholder="请输入组织机构代码">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:60px;">
                        <div class="input-group">
                            <span class="input-group-addon">&nbsp;社会信用代码</span>
                            <input type="text" name="SOCIALCODE" class="form-control" placeholder="请输入社会信用代码">
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:60px;">
                        <div class="input-group">
                            <span class="input-group-addon">&nbsp;注&nbsp;&nbsp;册&nbsp;&nbsp;地&nbsp;&nbsp;区&nbsp;</span>
                            <select class="form-control" style="width:33.33%;" name="PROVINCE" id="CP_PROVINCE" onchange="getCityOrArea('A','CP_PROVINCE');">
                                <option value="">请选择</option>
                                <#if mylist??>
                                    <#list mylist as mt>
                                        <option value="${(mt.ID)!''}" grade="${(mt.CODE)!''}"  >${(mt.NAME)!""}</option>
                                    </#list>
                                </#if>
                            </select>
                            <select class="form-control" style="width:33.33%;" name="CITY" id="CP_CITY" onchange="getCityOrArea('B','CP_CITY');">
                                <option value="">请选择</option>
                            </select>
                            <select class="form-control" style="width:33.33%;" name="AREA">
                                <option value="">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:60px;">
                        <div class="input-group">
                            <span class="input-group-addon">&nbsp;所&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地&nbsp;</span>
                            <input type="text" name="ADDRESS" class="form-control" placeholder="请输入所在地">
                        </div>
                    </div>
                </div>
            </div>
            
            <br/>
          	<span style="margin-left:40%;margin-right:40%;"><input type="checkbox" checked id="xieyi"/>&nbsp;我同意《<a href="#" style="color:red;">平台协议</a>》</span>
            
            <button type="button" class="btn btn-primary btn-block mt20 reg-btn" onclick="subRegisterInfo()" >注册</button>
            <font color="red" id="errorMsg" style="display:none;">用户名已存在，请换一个试试！</font>
            <font color="red" id="errorMsg1" style="display:none;">第二次输入密码不正确！</font>
            
        </form>
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
            //tj-list-float
            $(window).scroll(function () {
                if ($("body").scrollTop() > 250) {
                    $('#float-right').addClass('mfixed');
                }
                else {
                    $('#float-right').removeClass('mfixed');
                }
            });
            var boxW = $(".tj-r").width();
            $("#float-right").width(boxW);
            $(window).resize(function () {
                var boxW = $(".tj-r").width();
                $("#float-right").width(boxW);
            });
        });
        
        
          jQuery.validator.addMethod("checkPassword", function(value,element) {
			if(value!=$("input[name='PASSWORD']").val()){
				
				return false;
			}else{
				return true;
			}
		}, "<font color='red'>两次输入的密码不一致,请重新输入!</font>");
		// 手机号码验证       
		jQuery.validator.addMethod("isMobile", function(value, element) {       
		     var length = value.length;   
		      var mobile =/^[1][3-8]+\d{9}$/;   
		   return this.optional(element) || (length == 11 && mobile.test(value));       
		}, "<font color='red'>请正确填写您的手机号码</font>");       
		
		 // 电话号码验证       
		jQuery.validator.addMethod("isTel", function(value, element) {       
		     var tel = /^\d{3,4}-?\d{7,9}$/;    //电话号码格式010-12345678   
		    return this.optional(element) || (tel.test(value));       
		}, "<font color='red'>请正确填写您的电话号码</font>"); 
        
        
        
          $("#register").validate({
				onkeyup: false,
				errorClass: 'error',
				validClass: 'valid',
				focusCleanup:true,
				focusInvalid:false,
				highlight: function(element) {
					$(element).closest('div').addClass("f_error");
				},
				unhighlight: function(element) {
					$(element).closest('div').removeClass("f_error");
				},
                errorPlacement: function(error, element) {
                    $(element).closest('div').append(error);
                },
                rules: {
					USERNAME:{
						minlength:2,
						required:true,
						maxlength:20
					},
					PASSWORD:{
						minlength:6,
						required:true,
						maxlength:16
					},
					PASSWORD_agin:{
						minlength:6,
						maxlength:16,
						required:true,
						checkPassword:true
					},
					NAME_IN:{
						minlength:2,
						required:true,
						maxlength:20
					},
					LINKMAN:{
						minlength:2,
						required:true,
						maxlength:20
					},
					EMAIL_IN:{
						email:true,
						required:true
					},
					TEL_IN:{
					    isMobile:true
					},
					PHONE_IN:{
					    isTel:true
					},
					ORGCODE:{
					    minlength:10,
						maxlength:40
					},
					SOCIALCODE:{
					    minlength:10,
						maxlength:40
					},
					ADDRESS:{
					    minlength:2,
						maxlength:50
					}
				},
				messages: {
					USERNAME:{required:"<font color='red'>此项必填!</font>",minlength:"<font color='red'>用户名长度不得少于2位字符!</font>",maxlength:"<font color='red'>用户名长度不得超过20位字符!</font>"},
					PASSWORD:{required:"<font color='red'>此项必填!</font>",minlength:"<font color='red'>密码长度不得少于6位字符!</font>",maxlength:"<font color='red'>密码长度不得超过16位字符!</font>"},
					PASSWORD_agin:{required:"<font color='red'>此项必填!</font>",minlength:"<font color='red'>密码长度不得少于6位字符!</font>",maxlength:"<font color='red'>密码长度不得超过16位字符!</font>"},
					NAME_IN:{required:"<font color='red'>此项必填!</font>",minlength:"<font color='red'>机构名称长度不得少于2位字符!</font>",maxlength:"<font color='red'>机构名称长度不得超过20位字符!</font>"},
				    LINKMAN:{required:"<font color='red'>此项必填!</font>",minlength:"<font color='red'>联系人名字长度不得少于2位字符!</font>",maxlength:"<font color='red'>联系人名字不得超过20位字符!</font>"},
				    EMAIL_IN:{email:"<font color='red'>请填入正确格式的邮箱号!</font>",required:"<font color='red'>此项必填!</font>"},
				    ORGCODE:{minlength:"<font color='red'>组织机构代码长度不得少于10位字符!</font>",maxlength:"<font color='red'>组织机构代码长度不得超过40位字符!</font>"},
				    SOCIALCODE:{minlength:"<font color='red'>社会信用代码长度不得少于10位字符!</font>",maxlength:"<font color='red'>社会信用代码长度不得超过40位字符!</font>"},
				    ADDRESS:{minlength:"<font color='red'>所在地长度不得少于2位字符!</font>",maxlength:"<font color='red'>所在地长度不得超过50位字符!</font>"}
				    
					
				}
        });
        
        
	    function getCityOrArea(str,objs){//三级
	        var zhi=$("#"+objs+" option:selected").attr("grade");
	        var parentCode=zhi;
	        $.ajax({
	            type:"post",
	            dataType: "json",
	            url:"${rc.contextPath}/loginRegister/getCityOrArea.do?parentCode="+parentCode,
	            success: function(msg) {
	                var oj;
	                var stat="";
	                if(str=="A"){
	                    oj=$("select[name='CITY']");
	                    $("select[name='AREA']").html("<option value=''>请选择</option>");
	                }else if(str=="B"){
	                    oj=$("select[name='AREA']");
	                }
	                $(oj).html("<option value=''>请选择</option>");
	                if(msg!="nomore"){
	
	                    $.each(msg,function(index,value){
	                        $(oj).append(
	                              "<option value='"+value.ID+"' grade='"+value.CODE+"' "+stat+">"+value.NAME+"</option>"
	                        );
	                    });
	                }
	            }
	        });
	    }
        
        
        function subRegisterInfo(){
              var data=$("#register").serialize();
              
              if($("#register").valid()){//主动验证
                 if($("#xieyi").is(":checked")){  
	              $.ajax({
				        type:"post",
				        dataType: "text",
				        url:"${rc.contextPath}/loginRegister/subRegisterInfo.do",
					    data:data,
					    success: function(msg) {
					        if(msg.indexOf("ok")>-1){
			                    window.location="${rc.contextPath}/registerOk";              
			                }else if(msg.indexOf("error")>-1){
			                    $("#errorMsg").show();
			                }
					    
					    }
				   });  
				}else{
				       //弹出层调用
					  var index=layer.open({
						  title: '温馨提示',
						  btn:['确定'],
						  content: '请同意平台协议！'
					  });
				 }
		    }
             
        }
        
        
        
    </script>
</body>
</html>
