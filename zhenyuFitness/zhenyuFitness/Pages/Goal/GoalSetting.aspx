<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/generalMaster.Master" CodeBehind="GoalSetting.aspx.cs" Inherits="zhenyuFitness.Pages.Goal.GoalSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>健身目标设定</title>
    <!-- WIZARD -->
    <link rel="stylesheet" type="text/css" href="../../js/bootstrap-wizard/wizard.css" />
    <!-- WIZARD -->
    <script src="../../js/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <!-- WIZARD -->
    <script src="../../js/jquery-validate/jquery.validate.js"></script>
    <script src="../../js/jquery-validate/additional-methods.min.js"></script>
    <script src="../..//js/custom/goal.js"></script>

    <link href="../../css/Hover_css/normalize.css" rel="stylesheet" />
    <link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../css/inputcomponent.css" rel="stylesheet" />
    <style>
        .bgcolor-1 {
            background: #FFFFF;
        }

        .inputcontainer {
            background: #f9f7f6;
            font-weight: 500;
            font-size: 1.05em;
            font-family: 'Raleway', Arial, sans-serif;
            margin: 0 auto;
            text-align: center;
            overflow: hidden;
        }

        .inputcontent {
            font-size: 150%;
            padding: 3em 0;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="row">
        <div class="col-md-12">
            <!-- BOX -->
            <div class="box border red" id="formWizard">
                <div class="box-title">
                    <h4><i class="fa fa-bars"></i>健身目标设定 - <span class="stepHeader"> 1 / 9</span></h4>
                    <div class="tools hidden-xs">

                        <a href="javascript:;" class="collapse">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a href="javascript:;" class="remove">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="box-body form">
                    <form id="registerForm" action="#" class="form-horizontal" method="post">
                        <div class="wizard-form">
                            <div class="wizard-content">
                                <ul class="nav nav-pills nav-justified steps" style="display: none">
                                    <li>
                                        <a href="#bodystats" data-toggle="tab" class="wiz-step">
                                            <%-- <span class="step-number">1</span>--%>
                                            <span class="step-name" style="font-family: 楷体"><i class="fa fa-check"></i>输入身体数据</span>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="#yourbodyfat" data-toggle="tab" class="wiz-step active">
                                            <%--<span class="step-number">2</span>--%>
                                            <span class="step-name"><i class="fa fa-check"></i>您的体脂率</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#confirm" data-toggle="tab" class="wiz-step">
                                            <%--<span class="step-number">3</span>--%>
                                            <span class="step-name"><i class="fa fa-check"></i>目标体格</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#confirm" data-toggle="tab" class="wiz-step">
                                            <%--  <span class="step-number">4</span>--%>
                                            <span class="step-name"><i class="fa fa-check"></i>目标身体数据</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#confirm" data-toggle="tab" class="wiz-step">
                                            <%-- <span class="step-number">4</span>--%>
                                            <span class="step-name"><i class="fa fa-check"></i>健身历史</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#confirm" data-toggle="tab" class="wiz-step">
                                            <%-- <span class="step-number">4</span>--%>
                                            <span class="step-name"><i class="fa fa-check"></i>目标实现日期</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#confirm" data-toggle="tab" class="wiz-step">
                                            <%--  <span class="step-number">4</span>--%>
                                            <span class="step-name"><i class="fa fa-check"></i>设置提醒</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#confirm" data-toggle="tab" class="wiz-step">
                                            <%-- <span class="step-number">4</span>--%>
                                            <span class="step-name"><i class="fa fa-check"></i>目标设置完成</span>
                                        </a>
                                    </li>
                                </ul>
                                <div class="nav nav-pills nav-justified steps" style="height: 60px; text-align: center; background-color: #4d4848"><span id="currentStep" style="color: white; font-size: 25px">请输入当前的身体数据</span></div>
                                <div id="bar" class="progress progress-striped progress-sm active" role="progressbar">
                                    <div class="progress-bar progress-bar-warning"></div>
                                </div>
                                <div class="tab-content">
                                    <div class="alert alert-danger display-none">
                                        <a class="close" aria-hidden="true" href="#" data-dismiss="alert">×</a>
                                        <span id="error-span-top"></span>请修改后继续。
                                                       
                                   
                                    </div>
                                    <div class="alert alert-success display-none">
                                        <a class="close" aria-hidden="true" href="#" data-dismiss="alert">×</a>
                                        Your form validation is successful!
                                                       
                                   
                                    </div>
                                    <div class="tab-pane active" id="bodystats">

                                        <div class="inputcontainer">
                                            <section class="inputcontent bgcolor-1">
                                                <span class="input input--haruki">
                                                    <input class="input__field input__field--haruki" type="text" id="input-1">
                                                    <label class="input__label input__label--haruki" for="input-1">
                                                        <span class="input__label-content input__label-content--haruki"><span style="font-size:25px">身 高</span></span>
                                                    </label>
                                                </span>
                                                <span class="input input--haruki">
                                                    <input class="input__field input__field--haruki" type="text" id="input-2">
                                                    <label class="input__label input__label--haruki" for="input-2">
                                                        <span class="input__label-content input__label-content--haruki"><span style="font-size:25px">体 重</span></span>
                                                    </label>
                                                </span>
                                                <span class="input input--haruki">
                                                    <input class="input__field input__field--haruki" type="text" id="input-3">
                                                    <label class="input__label input__label--haruki" for="input-3">
                                                        <span class="input__label-content input__label-content--haruki"><span style="font-size:25px">腰 围</span></span>
                                                    </label>
                                                </span>
                                            </section>
                                            <!---->


                                        </div>
                                        <!-- /container -->

                                        <%--<div class="form-group">
                                                                <label class="control-label col-md-3">电子邮箱<span class="required">*</span></label>
                                                                <div class="col-md-4">
                                                                    <input type="text" class="form-control" name="email" placeholder="请提供您的电子邮箱地址" />
                                                                    <span class="error-span"></span>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3">密码<span class="required">*</span></label>
                                                                <div class="col-md-4">
                                                                    <input type="password" class="form-control" name="password" placeholder="请提供您的密码，密码长度为6-12位" id="password" />
                                                                    <span class="error-span"></span>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3">再次输入密码<span class="required">*</span></label>
                                                                <div class="col-md-4">
                                                                    <input type="password" class="form-control" name="confirmpassword" placeholder="请再次输入密码" />
                                                                    <span class="error-span"></span>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3">用户名<span class="required">*</span></label>
                                                                <div class="col-md-4">
                                                                    <input type="text" class="form-control" name="name" placeholder="在FitSpace社区里，您希望其他会员对您的称呼" />
                                                                    <span class="error-span"></span>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3">所在省份<span class="required">*</span></label>
                                                                <div class="col-md-4">
                                                                    <select name="province" id="province_select" class="col-md-12 full-width-fix">
                                                                        <option value=""></option>
                                                                        <option value="北京市">北京市</option>
                                                                        <option value="浙江省">浙江省</option>
                                                                        <option value="天津市">天津市</option>
                                                                        <option value="安徽省">安徽省</option>
                                                                        <option value="上海市">上海市</option>
                                                                        <option value="福建省">福建省</option>
                                                                        <option value="重庆市">重庆市</option>
                                                                        <option value="江西省">江西省</option>
                                                                        <option value="山东省">山东省</option>
                                                                        <option value="河南省">河南省</option>
                                                                        <option value="湖北省">湖北省</option>
                                                                        <option value="湖南省">湖南省</option>
                                                                        <option value="广东省">广东省</option>
                                                                        <option value="海南省">海南省</option>
                                                                        <option value="山西省">山西省</option>
                                                                        <option value="青海省">青海省</option>
                                                                        <option value="江苏省">江苏省</option>
                                                                        <option value="辽宁省">辽宁省</option>
                                                                        <option value="吉林省">吉林省</option>
                                                                        <option value="台湾省">台湾省</option>
                                                                        <option value="河北省">河北省</option>
                                                                        <option value="贵州省">贵州省</option>
                                                                        <option value="四川省">四川省</option>
                                                                        <option value="云南省">云南省</option>
                                                                        <option value="陕西省">陕西省</option>
                                                                        <option value="甘肃省">甘肃省</option>
                                                                        <option value="黑龙江省">黑龙江省</option>
                                                                        <option value="香港特别行政区">香港特别行政区</option>
                                                                        <option value="澳门特别行政区">澳门特别行政区</option>
                                                                        <option value="广西壮族自治区">广西壮族自治区</option>
                                                                        <option value="宁夏回族自治区">宁夏回族自治区</option>
                                                                        <option value="新疆维吾尔自治区">新疆维吾尔自治区</option>
                                                                        <option value="内蒙古自治区">内蒙古自治区</option>
                                                                        <option value="西藏自治区">西藏自治区</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label col-md-3">联系电话</label>
                                                                <div class="col-md-4">
                                                                    <input type="text" class="form-control" name="phone" placeholder="您的联系电话" />
                                                                    <span class="error-span"></span>
                                                                </div>
                                                            </div>--%>
                                    </div>
                                    <div class="tab-pane" id="bodystats1">

                                        <div class="form-group">
                                            <label class="control-label col-md-3"><span style="font-size: 22px">身高</span></label>
                                            <div class="col-md-4">
                                                <input type="text" placeholder="请输入您的身高（厘米）" class="form-control" name="height" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">体重<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <input type="text" placeholder="请输入您的体重（千克）" class="form-control" name="weight" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">健身历史<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="0" data-title="level1" class="uniform" checked="checked" />
                                                    1-2年
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="1" data-title="level2" class="uniform" />
                                                    2-4年
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="2" data-title="level3" class="uniform" />
                                                    4年以上
                                                                   
                                               
                                                </label>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="tab-pane" id="payment">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">性别<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <label class="radio">
                                                    <input type="radio" name="gender" value="0" data-title="Male" class="uniform" checked="checked" />
                                                    男士
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="gender" value="1" data-title="Female" class="uniform" />
                                                    女士
                                                                   
                                               
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">出生年月<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <input type="date" class="form-control" name="birthday" placeholder="adsfasdf" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>




                                        <div class="form-group">
                                            <label class="control-label col-md-3">身高<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <input type="text" placeholder="请输入您的身高（厘米）" class="form-control" name="height" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3">体重<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <input type="text" placeholder="请输入您的体重（千克）" class="form-control" name="weight" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">健身历史<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="0" data-title="level1" class="uniform" checked="checked" />
                                                    1-2年
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="1" data-title="level2" class="uniform" />
                                                    2-4年
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="2" data-title="level3" class="uniform" />
                                                    4年以上
                                                                   
                                               
                                                </label>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="tab-pane" id="payment">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">性别<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <label class="radio">
                                                    <input type="radio" name="gender" value="0" data-title="Male" class="uniform" checked="checked" />
                                                    男士
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="gender" value="1" data-title="Female" class="uniform" />
                                                    女士
                                                                   
                                               
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">出生年月<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <input type="date" class="form-control" name="birthday" placeholder="adsfasdf" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>




                                        <div class="form-group">
                                            <label class="control-label col-md-3">身高<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <input type="text" placeholder="请输入您的身高（厘米）" class="form-control" name="height" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3">体重<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <input type="text" placeholder="请输入您的体重（千克）" class="form-control" name="weight" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">健身历史<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="0" data-title="level1" class="uniform" checked="checked" />
                                                    1-2年
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="1" data-title="level2" class="uniform" />
                                                    2-4年
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="2" data-title="level3" class="uniform" />
                                                    4年以上
                                                                   
                                               
                                                </label>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="tab-pane" id="payment">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">性别<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <label class="radio">
                                                    <input type="radio" name="gender" value="0" data-title="Male" class="uniform" checked="checked" />
                                                    男士
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="gender" value="1" data-title="Female" class="uniform" />
                                                    女士
                                                                   
                                               
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">出生年月<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <input type="date" class="form-control" name="birthday" placeholder="adsfasdf" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>




                                        <div class="form-group">
                                            <label class="control-label col-md-3">身高<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <input type="text" placeholder="请输入您的身高（厘米）" class="form-control" name="height" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3">体重<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <input type="text" placeholder="请输入您的体重（千克）" class="form-control" name="weight" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">健身历史<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="0" data-title="level1" class="uniform" checked="checked" />
                                                    1-2年
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="1" data-title="level2" class="uniform" />
                                                    2-4年
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="2" data-title="level3" class="uniform" />
                                                    4年以上
                                                                   
                                               
                                                </label>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="tab-pane" id="payment">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">性别<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <label class="radio">
                                                    <input type="radio" name="gender" value="0" data-title="Male" class="uniform" checked="checked" />
                                                    男士
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="gender" value="1" data-title="Female" class="uniform" />
                                                    女士
                                                                   
                                               
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">出生年月<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <input type="date" class="form-control" name="birthday" placeholder="adsfasdf" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>




                                        <div class="form-group">
                                            <label class="control-label col-md-3">身高<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <input type="text" placeholder="请输入您的身高（厘米）" class="form-control" name="height" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3">体重<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <input type="text" placeholder="请输入您的体重（千克）" class="form-control" name="weight" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">健身历史<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="0" data-title="level1" class="uniform" checked="checked" />
                                                    1-2年
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="1" data-title="level2" class="uniform" />
                                                    2-4年
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="2" data-title="level3" class="uniform" />
                                                    4年以上
                                                                   
                                               
                                                </label>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="tab-pane" id="payment">
                                        <div class="form-group">
                                            <label class="control-label col-md-3">性别<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <label class="radio">
                                                    <input type="radio" name="gender" value="0" data-title="Male" class="uniform" checked="checked" />
                                                    男士
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="gender" value="1" data-title="Female" class="uniform" />
                                                    女士
                                                                   
                                               
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">出生年月<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <input type="date" class="form-control" name="birthday" placeholder="adsfasdf" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>




                                        <div class="form-group">
                                            <label class="control-label col-md-3">身高<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <input type="text" placeholder="请输入您的身高（厘米）" class="form-control" name="height" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-md-3">体重<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <input type="text" placeholder="请输入您的体重（千克）" class="form-control" name="weight" />
                                                <span class="error-span"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3">健身历史<span class="required">*</span></label>
                                            <div class="col-md-4">
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="0" data-title="level1" class="uniform" checked="checked" />
                                                    1-2年
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="1" data-title="level2" class="uniform" />
                                                    2-4年
                                                                   
                                               
                                                </label>
                                                <label class="radio">
                                                    <input type="radio" name="fitHis" value="2" data-title="level3" class="uniform" />
                                                    4年以上
                                                                   
                                               
                                                </label>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="tab-pane" id="confirm">
                                        <h3 class="block">请确认您的信息</h3>
                                        <h4 class="form-section">账户信息</h4>
                                        <div class="well">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">电子邮箱:</label>
                                                <div class="col-md-4">
                                                    <p class="form-control-static" data-display="email"></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">用户名:</label>
                                                <div class="col-md-4">
                                                    <p class="form-control-static" data-display="name"></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">所在省份:</label>
                                                <div class="col-md-4">
                                                    <p class="form-control-static" data-display="province"></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">联系电话:</label>
                                                <div class="col-md-4">
                                                    <p class="form-control-static" data-display="phone"></p>
                                                </div>
                                            </div>
                                            <!--<div class="form-group">
                                                                    <label class="control-label col-md-3">Address:</label>
                                                                    <div class="col-md-4">
                                                                        <p class="form-control-static" data-display="address"></p>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-md-3">Country:</label>
                                                                    <div class="col-md-4">
                                                                        <p class="form-control-static" data-display="country"></p>
                                                                    </div>
                                                                </div>-->
                                        </div>
                                        <h4 class="form-section">个人信息</h4>
                                        <div class="well">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">性别:</label>
                                                <div class="col-md-4">
                                                    <p class="form-control-static" data-display="gender"></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">出生年月:</label>
                                                <div class="col-md-4">
                                                    <p class="form-control-static" data-display="birthday"></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">身高:</label>
                                                <div class="col-md-4">
                                                    <p class="form-control-static" data-display="height"></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">体重:</label>
                                                <div class="col-md-4">
                                                    <p class="form-control-static" data-display="weight"></p>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">健身历史:</label>
                                                <div class="col-md-4">
                                                    <p class="form-control-static" data-display="fitHis"></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="wizard-buttons">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-offset-3 col-md-9">
                                            <a href="javascript:;" class="btn btn-default prevBtn">
                                                <i class="fa fa-arrow-circle-left"></i>上一步
                                            </a>
                                            <a href="javascript:;" class="btn btn-primary nextBtn">下一步 <i class="fa fa-arrow-circle-right"></i>
                                            </a>
                                            <%--  <input type="hidden" name="__viewstate" />--%>
                                            <input type="submit" class="btn btn-success submitBtn" value="提 交" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- /BOX -->
        </div>
    </div>
    <script src="../../js/inputclassie.js"></script>
    <script>
        jQuery(document).ready(function () {
            App.setPage("Register");  //Set current page
            App.init(); //Initialise plugins and elements
            FormWizard.init();
        });
    </script>
    <script type="text/javascript">
        (function () {
            if (!String.prototype.trim) {
                (function () {
                    var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
                    String.prototype.trim = function () {
                        return this.replace(rtrim, '');
                    };
                })();
            }

            [].slice.call(document.querySelectorAll('input.input__field')).forEach(function (inputEl) {
                if (inputEl.value.trim() !== '') {
                    classie.add(inputEl.parentNode, 'input--filled');
                }

                inputEl.addEventListener('focus', onInputFocus);
                inputEl.addEventListener('blur', onInputBlur);
            });

            function onInputFocus(ev) {
                classie.add(ev.target.parentNode, 'input--filled');
            }

            function onInputBlur(ev) {
                if (ev.target.value.trim() === '') {
                    classie.remove(ev.target.parentNode, 'input--filled');
                }
            }
        })();
    </script>



    <script type="text/javascript">

        $(".nextBtn").click(function () {
            //alert("asdfsf");
        });

    </script>
</asp:Content>
