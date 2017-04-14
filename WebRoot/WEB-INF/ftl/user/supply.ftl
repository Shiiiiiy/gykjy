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
        您的位置：<a href="${rc.contextPath}/index">首页</a><span>&gt;</span><a href="${rc.contextPath}/user/index">用户中心</a><span>&gt;</span>供应信息
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
                            <li role="presentation" class="active"><a href="#1" aria-controls="1" role="tab" data-toggle="tab">供应信息列表</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="1">
                                <div class="border_b pb15"><button type="button" class="btn btn-primary" onclick="ToNew();">发布</button></div>
                                <div class="table-responsive mt15">
                                    <table class="table table-hover table-striped table-bordered my-table">
                                        <thead>
                                        <tr><th width='5%'>序号</th>
                                            <th width='10%'>供应方名称</th>
                                            <th width='8%'>销售内容</th>
                                            <th width='16%'>计划执行销售时间</th>
                                            <th width='8%'>联系人</th>
                                            <th width='8%'>电话</th>
                                            <th width='8%'>手机</th>
                                            <th width='8%'>邮箱</th>
                                            <th width='18%'>操作</th></tr>
                                        </thead>
                                        <tbody id="listmore">
                                        <#if TableList??>
                                            <#list TableList as aa>
                                                <tr>
                                                    <td>${aa_index+1}</td>
                                                    <td><div class="zjh">${(aa.NAME)!""}</div></td>
                                                    <td><div class="zjh">${(aa.DETAIL)!""}</div></td>
                                                    <td>${(aa.START_TIME)!""}</td>
                                                    <td><div class="zjh">${(aa.LINKMAN)!""}</div></td>
                                                    <td><div class="zjh">${(aa.PHONE)!""}</div></td>
                                                    <td><div class="zjh">${(aa.TEL)!""}</div></td>
                                                    <td><div class="zjh">${(aa.MAIL)!""}</div></td>
                                                    <td class="operation">
                                                    <a href="javascript:void(0);" onclick="ToNew('${aa.ID}')" title="编辑"><i class="iconfont">&#xe618;</i></a>
                                                    <a href="javascript:void(0);" onclick="ToView('${aa.ID}')" title="查看"><i class="iconfont">&#xe7fb;</i></a>
                                                    <a href="javascript:void(0);" onclick="Delete('${aa.ID}')" title="删除"><i class="iconfont">&#xe64a;</i></a>
                                                    </td>
                                                </tr>
                                            </#list>
                                        </#if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="margin-top:100px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title fb" id="myModalLabel">提示</h4>
            </div>
            <div class="modal-body">
               	是否删除此项
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" name="" id="todelete" onclick="ToDelete()">是</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">否</button>
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
        //
        var users="${(userInfo.USERNAME)!''}";
        if(""==users){
            window.location.href="${rc.contextPath}/login";
        }
    });
</script>
<script>
    function ToNew(O){//编辑和新增
        if(""==(O+"") || undefined == O){
            window.location.href="${rc.contextPath}/user/supplyEdit.do";
        }else{
            window.location.href="${rc.contextPath}/user/supplyEdit.do?id="+O;
        }
    }
    function ToView(O){//查看
        O=O+"";
        if(""!=O){
            window.location.href="${rc.contextPath}/user/supplyView.do?id="+O;
        }
    }
    function Delete(O){//删除弹窗
        O=O+"";
        if(""!=O){
        	$("#todelete").attr("name",O);
        	$('#myModal').modal('show')
        }
    }
    function ToDelete(){//删除
    	var O=$("#todelete").attr("name");
        O=O+"";
        if(""!=O){
            window.location.href="${rc.contextPath}/user/delSupply.do?id="+O;
        }
    }
    function GetMore(){//

    }
</script>
</body>
</html>
