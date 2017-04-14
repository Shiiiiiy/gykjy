<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="${rc.contextPath}/plugins/favicon.ico" rel="shortcut icon">
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
	<script type="text/javascript" src="${rc.contextPath}/plugins/js/user.js"></script>
	
    <!--[if lte IE 9]>
    <script src="${rc.contextPath}/plugins/js/respond.min.js"></script>
    <script src="${rc.contextPath}/plugins/js/html5shiv.js"></script>
    <![endif]-->
    <title>用户中心-中关村贵阳科技园产业云平台</title>
</head>
<body style="background:#f5f5f5;">
    <!-- topbar -->
	<#include "/footerAndHeader/headers.ftl"/>
    <!-- banner -->
    <div class="banner w banner_user">
        <div class="container">
            <div class="fr hidden-xs"><span class="f36 fb user-by">创新创业 共赢发展</span></div>
        </div>
    </div>
    <!-- bread -->
    <div class="container clearfix mt10">
        <div class="bread-nav fl mt10">
            您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span><a href="${rc.contextPath}/user/index">用户中心</a><span>&gt;</span>修改密码
        </div>
    </div>
    <!-- user -->
    <div class="container mt20" style="min-height:500px">
        <div class="row">
        	<#include "leftmenu.ftl"/>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-11">
                <div class="user-box-w tab-box mb20">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#1" aria-controls="1" role="tab" data-toggle="tab">修改密码</a></li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="1">
									<form id="register" name="register" class="basic">
									<input type="hidden" name="id" value="${(userInfo.ID)!''}">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7 mb15" style="height:45px;">
                                                <div class="input-group">
                                                    <span class="input-group-addon">原&nbsp;&nbsp;密&nbsp;&nbsp;码<font color="red">*</font></span>
                                                    <input type="password" name="PASSWORD" class="form-control" placeholder="请输入原密码">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7 mb15" style="height:45px;">
                                                <div class="input-group">
                                                    <span class="input-group-addon">新&nbsp;&nbsp;密&nbsp;&nbsp;码<font color="red">*</font></span>
                                                    <input type="password" name="PASSWORD_NEW" class="form-control" placeholder="请输入新密码">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7 mb15" style="height:45px;">
                                                <div class="input-group">
                                                    <span class="input-group-addon">确认密码<font color="red">*</font></span>
                                                    <input type="password" name="PASSWORD_NEW2" class="form-control" id="contacts" placeholder="请输入确认密码">
                                                </div>
                                            </div>
                                        </div>
										<button type="button" class="btn btn-primary" onclick="subRegisterInfo()">确认</button>
										<button type="button" class="btn btn-primary" onclick="theEsc()">取消</button>
										<B color="red" id="errorMsg" style="display:none;color:red;">原密码错误</B>
                                    </form>
                                </div>
                            </div>
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
            //
            var users="${(userInfo.USERNAME)!''}";
            if(""==users){
        	   window.location.href="${rc.contextPath}/login";	
            }
        });
    </script>
        
    <script type="text/javascript">
        //校验     
        jQuery.validator.addMethod("checkPassword", function(value,element) {
			if(value!=$("input[name='PASSWORD']").val()){
				return true;
			}else{
				return false;
			}
		}, "<font color='red'>新密码与原密码相同,请重新输入!</font>");	  
	    jQuery.validator.addMethod("checkPassword2", function(value,element) {
			if(value==$("input[name='PASSWORD_NEW']").val()){
				return true;
			}else{
				return false;
			}
		}, "<font color='red'>新密码与确认密码不一致,请重新输入!</font>");				
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
					PASSWORD:{
						minlength:6,
						maxlength:16,
						required:true
					},
					PASSWORD_NEW:{
						minlength:6,
						maxlength:16,
						required:true,
						checkPassword:true,
					},
					PASSWORD_NEW2:{
						minlength:6,
						maxlength:16,
						required:true,
						checkPassword2:true
					}
				},
				messages: {
					PASSWORD:{required:"<font color='red'>原密码为必填项</font>",minlength:"<font color='red'>原密码长度不得少于6位字符!</font>",maxlength:"<font color='red'>原密码长度不得超过16位字符!</font>"},
					PASSWORD_NEW:{required:"<font color='red'>新密码为必填项</font>",minlength:"<font color='red'>新密码长度不得少于6位字符!</font>",maxlength:"<font color='red'>新密码长度不得超过16位字符!</font>"},
					PASSWORD_NEW2:{required:"<font color='red'>确认密码为必填项</font>",minlength:"<font color='red'>确认密码长度不得少于6位字符!</font>",maxlength:"<font color='red'>确认密码长度不得超过16位字符!</font>"}
				}
        });
        function subRegisterInfo(){
             var data=$("#register").serialize();
             if($("#register").valid()){//主动验证
	              $.ajax({
				        type:"post",
				        dataType: "text",
				        url:"${rc.contextPath}/user/changePwd.do",
					    data:data,
					    success: function(msg) {
					        if(msg.indexOf("true")>-1){
			                    window.location="${rc.contextPath}/user/index";              
			                }else if(msg.indexOf("false")>-1){
			                    $("#errorMsg").show();
			                    $("input[name='PASSWORD']").val("");
			                    $("input[name='PASSWORD_NEW']").val("");
			                    $("input[name='PASSWORD_NEW2']").val("");
			                }
					    }
				   });  
		    }
        }
        function theEsc(){
        	window.location="${rc.contextPath}/user/index";
        }
    </script>
    
</body>
</html>
