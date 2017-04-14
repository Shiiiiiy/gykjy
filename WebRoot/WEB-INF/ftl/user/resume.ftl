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

    <script type="text/javascript" src="${rc.contextPath}/plugins/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/js/user.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/plugins/bootstrap/bootstrap.min.js"></script>
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
        您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span><a href="${rc.contextPath}/user/index">用户中心</a><span>&gt;</span>简历信息
    </div>
</div>
<!-- user -->
<div class="container mt20">
    <div class="row">
        <#include "leftmenu.ftl"/>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-11">
            <div class="user-box-w tab-box mb20">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#1" aria-controls="1" role="tab" data-toggle="tab">简历信息</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="1">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                        <!---form--->
                                        <form id="register" name="register">
                                            <input type="hidden" id="RseumeOne_ID" value="${(RseumeOne.id)!''}">
                                            <input type="hidden" name="USER_ID" value="${(userInfo.ID)!''}">
                                            <input type="hidden" name="createTime" value="${(RseumeOne.createTime)!''}">
                                            <input type="hidden" name="RESUME_IMAGE" id="RESUME_IMAGE_ID" value="${(RseumeOne.RESUME_IMAGE)!''}">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:45px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名<font color="red">*</font></span>
                                                        <input type="text" name="NAME" value="${(RseumeOne.NAME)!''}" class="form-control" placeholder="请输入姓名" >
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别<font color="red">*</font></span>
		                                                <select class="form-control" name="GENDER">
		                                                    <option value="男" <#if (RseumeOne.GENDER)?? && (RseumeOne.GENDER+"")=="男">selected="true"</#if>	 >男</option>
		                                                    <option value="女" <#if (RseumeOne.GENDER)?? && (RseumeOne.GENDER+"")=="女">selected="true"</#if>  >女</option>
		                                                </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族<font color="red">*</font></span>
                                                        <input type="text" name="NATION" value="${(RseumeOne.NATION)!''}" class="form-control" placeholder="请输入民族" >
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">出生年月<font color="red">*</font></span>
                                                        <input type="text" name="BIRTHDAY" value="${(RseumeOne.BIRTHDAY)!''}" class="form-control" placeholder="请输入出生年月" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">教育程度<font color="red">*</font></span>
                                                        <input type="text" name="EDUCATION_LEVEL" value="${(RseumeOne.EDUCATION_LEVEL)!''}" class="form-control" placeholder="请输入教育程度" >
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">毕业院校<font color="red">*</font></span>
                                                        <input type="text" name="SCHOOL" value="${(RseumeOne.SCHOOL)!''}" class="form-control" placeholder="请输入毕业院校" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业<font color="red">*</font></span>
                                                        <input type="text" name="MAJOR" value="${(RseumeOne.MAJOR)!''}" class="form-control" placeholder="请输入专业" >
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">毕业时间<font color="red">*</font></span>
                                                        <input type="text" name="GRADUATION" value="${(RseumeOne.GRADUATION)!''}" class="form-control" placeholder="请输入毕业时间" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">外语水平<font color="red">*</font></span>
                                                        <input type="text" name="LANGUAGE_LEVEL" value="${(RseumeOne.LANGUAGE_LEVEL)!''}" class="form-control" placeholder="请输入外语水平" >
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">婚姻状况<font color="red">*</font></span>
                                                        <input type="text" name="MARRY" value="${(RseumeOne.MARRY)!''}" class="form-control" placeholder="请输入婚姻状况" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">所在城市<font color="red">*</font></span>
                                                        <input type="text" name="LIVECITY" value="${(RseumeOne.LIVECITY)!''}" class="form-control" placeholder="请输入所在城市" >
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">户籍地址<font color="red">*</font></span>
                                                        <input type="text" name="HOUSEHOLD" value="${(RseumeOne.HOUSEHOLD)!''}" class="form-control" placeholder="请输入户籍地址" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">证件类型<font color="red">*</font></span>
                                                        <input type="text" name="CERTIFICATE_TYPE" value="${(RseumeOne.CERTIFICATE_TYPE)!''}" class="form-control" placeholder="请输入证件类型" >
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">证件号码<font color="red">*</font></span>
                                                        <input type="text" name="CERTIFICATE_NO" value="${(RseumeOne.CERTIFICATE_NO)!''}" class="form-control" placeholder="请输入证件号码" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">求职意向<font color="red">*</font></span>
                                                        <input type="text" name="JOB_INTENSION" value="${(RseumeOne.JOB_INTENSION)!''}" class="form-control" placeholder="请输入求职意向" >
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">期望薪酬<font color="red">*</font></span>
                                                        <input type="text" name="SALARY" value="${(RseumeOne.SALARY)!''}" class="form-control" placeholder="请输入期望薪酬" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱<font color="red">*</font></span>
                                                        <input type="text" name="MAIL" value="${(RseumeOne.MAIL)!''}" class="form-control" placeholder="请输入邮箱" >
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="height:55px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机<font color="red">*</font></span>
                                                        <input type="text" name="PHONE" value="${(RseumeOne.PHONE)!''}" class="form-control" placeholder="请输入手机" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:120px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">教育背景<font color="red">*</font></span>
                                                        <textarea  name="EDUCATION_BG"  class="form-control" placeholder="请输入教育背景" rows="4">${(RseumeOne.EDUCATION_BG)!''}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:120px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">工作经历<font color="red">*</font></span>
                                                        <textarea  name="WORK_EXP"  class="form-control" placeholder="请输入工作经历" rows="4">${(RseumeOne.WORK_EXP)!''}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:120px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">专业技能<font color="red">*</font></span>
                                                        <textarea  name="SKILL"  class="form-control" placeholder="请输入专业技能" rows="4">${(RseumeOne.SKILL)!''}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:120px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">项目经验<font color="red">*</font></span>
                                                        <textarea  name="PROJECT_EXP"  class="form-control" placeholder="请输入项目经验" rows="4">${(RseumeOne.PROJECT_EXP)!''}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="height:120px;">
                                                    <div class="input-group mb15">
                                                        <span class="input-group-addon">自我评价<font color="red">*</font></span>
                                                        <textarea  name="HOBBY"  class="form-control" placeholder="请输入自我评价" rows="4">${(RseumeOne.HOBBY)!''}</textarea>
                                                    </div>
                                                </div>
                                            </div>

                                            <button type="button" class="btn btn-primary" onclick="subRegisterInfo()"><#if RseumeOne?? || (RseumeOne.id)??>保存<#else>保存</#if></button>
                                            <a type="button" class="btn btn-primary" target="_blank" href="${rc.contextPath}/user/resumeExports.do?id=${(RseumeOne.id)!''}">导出</a>
                                            <!-- <a type="button" class="btn btn-primary" target="_blank" onclick="toExport();">导出</a>-->
                                            <B color="red" id="errorMsg" style="display:none;color:red;">保存失败</B>

                                        </form>
                                    </div>
                                    <div class="col-sm-4 col-md-3 col-lg-3 hidden-xs">
                                        <div class="tc user-img" style="border-color:#ddd;">
                                            <p>
                                                <#if (RseumeOne.RESUME_IMAGE)?? && (RseumeOne.RESUME_IMAGE+"")!="" >
                                                    <img src="${rc.contextPath+'/plugins/images/allImages/'+(RseumeOne.RESUME_IMAGE)!'/defaultUser.jpg'}"  id="img1" class="img-circle" width="100" height="100"/>
                                                    <#else>
                                                        <img src="${rc.contextPath}/plugins/images/allImages/defaultUser.jpg" id="img1" class="img-circle" width="100" height="100"/>
                                                </#if>
                                            </p>
                                            <div class="pr btn-img">
                                                <input type="file" id="file1" name="file" class="btn" style="display:none;" onchange="ajaxFileUpload();"/>
                                                <a class="btn btn-primary" id="" onclick="xuanze();" href="javascript:void(0);">上传头像</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--<form id="myex" method="post" action="${rc.contextPath}/user/resumeExports.do" target="_blank">
                                    	<textarea name="texts"></textarea>
                                    </form>-->
                                </div>
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
        var users="${(userInfo.USERNAME)!''}";
        if(""==users){
            window.location.href="${rc.contextPath}/login";
        }
    });
    function toExport(){//测试中
    	 var texts=$("#register").html();
    	 $('#myex textarea').html(texts);
    	 $('#myex').submit();
    }	
	function xuanze(){
		$("#file1").click();
	}
    //上传
    function ajaxFileUpload() {
        var id="${(RseumeOne.id)!''}";
        if(""==id){
            alert('请先填写简历信息');
        }else{
            $.ajaxFileUpload
            (
                    {
                        url: '${rc.contextPath}/files/uploadFiles.do', //用于文件上传的服务器端请求地址
                        secureuri: false, //是否需要安全协议，一般设置为false
                        async:false,
                        fileElementId: 'file1', //文件上传域的ID
                        dataType: 'json', //返回值类型 一般设置为json
                        success: function (data, status)  //服务器成功响应处理函数
                        {
                            $("#img1").attr("src", "${rc.contextPath}"+"/plugins/images/allImages/"+data.imgname);
                            $("#RESUME_IMAGE_ID").val(data.imgname);
                            changeUserImg( "${(userInfo.ID)!''}", data.imgname );
                        },
                        error: function (data, status)//服务器响应失败处理函数
                        {
                            //alert(12);
                        }
                    }
            )
            return false;
        }
    }
    function changeUserImg(id,imgname){
        $.ajax({
            type:"post",
            dataType: "json",
            async:false,
            data:{"id":id,"imgname":imgname},
            url:"${rc.contextPath}/user/changeResumeImg.do",
            success: function(msg) {
                //alert('已更新');
                $("#RESUME_IMAGE_ID").val(data.imgname);
            }
        });
    }
</script>

<script type="text/javascript">
    //校验
    jQuery.validator.addMethod("checkPassword2", function(value,element) {
        if(value==$("input[name='PASSWORD_NEW']").val()){
            return true;
        }else{
            return false;
        }
    }, "<font color='red'>新密码与确认密码不一致,请重新输入!</font>");
    // 性别校验
    jQuery.validator.addMethod("isSex", function(value, element) {
        return (value+""=="男" || value+""=="女");
    }, "<font color='red'>请正确填写性别</font>");
    // 手机号码验证   - 手机
    jQuery.validator.addMethod("isMobile", function(value, element) {
        var length = value.length;
        var mobile =/^[1][3-8]+\d{9}$/;
        return this.optional(element) || (length == 11 && mobile.test(value));
    }, "<font color='red'>请正确填写您的手机号码</font>");
    // 电话号码验证   - 联系方式
    jQuery.validator.addMethod("isTel", function(value, element) {
        var tel = /^\d{3,4}-?\d{7,9}$/;    //电话号码格式010-12345678
        return this.optional(element) || (tel.test(value));
    }, "<font color='red'>请正确填写您的电话号码</font>");
    // 日期验证   - 联系方式
    jQuery.validator.addMethod("checkTIME", function(value, element) {
        var tel = /^\d{4}-?\d{2}-?\d{2}$/;    //格式2001-01-01
        return this.optional(element) || (tel.test(value));
    }, "<font color='red'>日期格式:1990-01-01</font>");
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
            NAME:{minlength:1,maxlength:32,required:true,},
            NATION:{minlength:1,maxlength:32,required:true,},
			
            MAJOR	:{minlength:1,maxlength:32,required:true,},
            BIRTHDAY	:{checkTIME:true,minlength:1,maxlength:32,required:true,},
            EDUCATION_LEVEL	:{minlength:1,maxlength:32,required:true,},
            SCHOOL	:{minlength:1,maxlength:32,required:true,},
            GRADUATION	:{checkTIME:true,minlength:1,maxlength:32,required:true,},
            LANGUAGE_LEVEL	:{minlength:1,maxlength:32,required:true,},
            MARRY	:{minlength:1,maxlength:32,required:true,},
            LIVECITY	:{minlength:1,maxlength:32,required:true,},
            HOUSEHOLD	:{minlength:1,maxlength:32,required:true,},
            CERTIFICATE_TYPE	:{minlength:1,maxlength:32,required:true,},
            CERTIFICATE_NO	:{minlength:1,maxlength:32,required:true,},
            JOB_INTENSION	:{minlength:1,maxlength:32,required:true,},
            SALARY	:{minlength:1,maxlength:200,required:true,},
            MAIL	:{email:true,minlength:1,maxlength:32,required:true,},
            PHONE	:{isMobile:true,minlength:1,maxlength:300,required:true,},
            EDUCATION_BG	:{minlength:1,maxlength:300,required:true,},
            WORK_EXP	:{minlength:1,maxlength:300,required:true,},
            SKILL	:{minlength:1,maxlength:300,required:true,},
            PROJECT_EXP	:{minlength:1,maxlength:300,required:true,},
            HOBBY	:{minlength:1,maxlength:200,required:true,},
			
        },
        messages: {
            NAME:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过32位字符!</font>"},
            NATION:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过32位字符!</font>"},
            BIRTHDAY	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过32位字符!</font>"},
            EDUCATION_LEVEL	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过32位字符!</font>"},
            SCHOOL	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过32位字符!</font>"},
            MAJOR	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过32位字符!</font>"},
            GRADUATION	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过32位字符!</font>"},
            LANGUAGE_LEVEL	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过32位字符!</font>"},
            MARRY	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过32位字符!</font>"},
            LIVECITY	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过32位字符!</font>"},
            HOUSEHOLD	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过32位字符!</font>"},
            CERTIFICATE_TYPE	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过32位字符!</font>"},
            CERTIFICATE_NO	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过32位字符!</font>"},
            JOB_INTENSION	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过32位字符!</font>"},
            SALARY	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过200位字符!</font>"},
            MAIL	:{email:"<font color='red'>请填写正确的邮箱地址</font>",required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过32位字符!</font>"},
            PHONE	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过300位字符!</font>"},
            EDUCATION_BG	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过300位字符!</font>"},
            WORK_EXP	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过300位字符!</font>"},
            SKILL	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过300位字符!</font>"},
            PROJECT_EXP	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过300位字符!</font>"},
            HOBBY	:{required:"<font color='red'>此项为必填项</font>",minlength:"<font color='red'>长度不得少于1位字符!</font>",maxlength:"<font color='red'>长度不得超过200位字符!</font>"},
        }
    });
    function subRegisterInfo(){
        var id="${(RseumeOne.id)!''}";
        if(""!=id){
            $("#RseumeOne_ID").attr("name","id");
        }
        var data=$("#register").serialize();
        if($("#register").valid()){//主动验证
            $.ajax({
                type:"post",
                dataType: "text",
                url:"${rc.contextPath}/user/saveResume.do",
                data:data,
                success: function(msg) {
                    if(msg.indexOf("true")>-1){//保存成功
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
