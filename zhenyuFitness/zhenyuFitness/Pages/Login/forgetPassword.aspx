<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/generalMaster.Master" AutoEventWireup="true" CodeBehind="forgetPassword.aspx.cs" Inherits="zhenyuFitness.Pages.Login.forgetPassword" EnableViewState="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>忘记密码</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="row">
                        <div class="col-md-12">
                            <!-- BOX -->
                            <div class="box border pink">
                                <div class="box-title">
                                    <h4><i class="fa fa-bars"></i>取回您的登录密码</h4>
                                    <div class="tools">
                                        <a href="javascript:;" class="collapse">
                                            <i class="fa fa-chevron-up"></i>
                                            
                                        </a>
                                        <a href="javascript:;" class="remove">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="box-body big">
                                    <form role="form">
                                        <div class="form-group">
                                            <label for="content_email">电子邮箱</label>
                                            <input type="text" class="form-control" id="content_email" placeholder="请填写您注册时的电子邮箱地址，我们将向该邮箱发送重置密码的链接">
                                        </div>
                                        <button type="submit" class="btn btn-success" id="submitButton1">提交</button>
                                    </form>

                                    
                                </div>
                            </div>

                            <!-- /BOX -->
                        </div>
                    </div>
    <script>
        jQuery(document).ready(function () {
            App.setPage("forgetPassword");  //Set current page
            App.init(); //Initialise plugins and elements
            FormWizard.init();
            /*bootbox.alert("你好你好你好你好");*/        /*bootbox.dialog({
            title : "修改密码",
            message : "<div class='well ' style='margin-top:25px;'><form class='form-horizontal' role='form'><div class='form-group'><label class='col-sm-3 control-label no-padding-right' for='txtOldPwd'>旧密码</label><div class='col-sm-9'><input type='text' id='txtOldPwd' placeholder='请输入旧密码' class='col-xs-10 col-sm-5' /></div></div><div class='space-4'></div><div class='form-group'><label class='col-sm-3 control-label no-padding-right' for='txtNewPwd1'>新密码</label><div class='col-sm-9'><input type='text' id='txtNewPwd1' placeholder='请输入新密码' class='col-xs-10 col-sm-5' /></div></div><div class='space-4'></div><div class='form-group'><label class='col-sm-3 control-label no-padding-right' for='txtNewPwd2'>确认新密码</label><div class='col-sm-9'><input type='text' id='txtNewPwd2' placeholder='再次输入新密码' class='col-xs-10 col-sm-5' /></div></div></form></div>",
            buttons : {
                "success" : {
                    "label" : "<i class='icon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        var txt1 = $("#txtOldPwd").val();
                        var txt2 = $("#txtNewPwd1").val();
                        var txt3 = $("#txtNewPwd2").val();

                        if(txt1 == "" || txt2 == "" || txt3 == ""){
                            bootbox.alert("密码不能为空");
                            return false;
                        }
                        if(txt2 != txt3 ){
                            bootbox.alert("两次输入新密码不一致，请重新输入!");
                            return false;
                        }
                        var info = {"opt":"changepassword","oldpwd":txt1,"newpwd1":txt2,"newpwd2":txt3};
                        //$.post("../CommonServlet",info,function(data){
                        bootbox.alert("密码更新成功");
                        //},'json');
                    }
                },
                "cancel" : {
                    "label" : "<i class='icon-info'></i> 取消",
                    "className" : "btn-sm btn-danger",
                    "callback" : function() { }
                }
            }
        });*/
        });
    </script>



    <script type="text/javascript">
        $("#submitButton1").click(function () {
            //var v = "dancer81@163.com";//
            var v = $("#content_email").val();
            if (v == "")
            {
                bootbox.alert("请输入您注册时所填写的电子信箱地址!");
                //$("#submitButton1").focus();
                return (false);
            }
            else {
                //对电子邮件的验证
                var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                if (!myreg.test(v)) {
                    bootbox.alert('请输入有效的电子信箱地址！');
                    return (false);
                   // $("#submitButton1").focus();
                }
                else {
                    bootbox.alert('我们已向' + v +'发送重置密码的链接，请进入该邮箱点击链接后重置密码。');
                    return false;
                }
            }
        });

    </script>
</asp:Content>
