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


    <link href="../../css/Hover_css/normalize.css" rel="stylesheet" />
    <link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../css/inputcomponent.css" rel="stylesheet" />
    <!-- icheck-->
    <link href="../../js/icheck_blue/blue.css" rel="stylesheet" />
    <script src="../../js/icheck_blue/icheck.js"></script>

    <link href="../../css/custom/common.css" rel="stylesheet" />
    <link href="../../css/custom/goal.css" rel="stylesheet" />
    <script src="../..//js/custom/goal.js"></script>
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
                    <h4><i class="fa fa-bars"></i>健身目标设定 - <span class="stepHeader">1 / 8</span></h4>
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
                                        <a href="#fitnesstarget" data-toggle="tab" class="wiz-step">
                                            <%-- <span class="step-number">1</span>--%>
                                            <span class="step-name" style="font-family: 楷体"><i class="fa fa-check"></i>选择健身目标</span>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="#yourbodyfat" data-toggle="tab" class="wiz-step active">
                                            <%--<span class="step-number">2</span>--%>
                                            <span class="step-name"><i class="fa fa-check"></i>您的体脂率</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#physique" data-toggle="tab" class="wiz-step">
                                            <%--<span class="step-number">3</span>--%>
                                            <span class="step-name"><i class="fa fa-check"></i>选择您的目标体格</span>
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
                                <div class="nav nav-pills nav-justified steps" style="height: 60px; text-align: center; background-color: #4d4848"><span id="currentStep" style="color: white; font-size: 25px"><span id="steptitle"></span></span></div>
                                <div id="bar" class="progress progress-striped progress-sm active" role="progressbar">
                                    <div class="progress-bar progress-bar-warning"></div>
                                </div>
                                <div class="tab-content">
                                    <div class="alert alert-danger display-none">
                                        <a class="close" aria-hidden="true" href="#" data-dismiss="alert">×</a>
                                        <span id="error-span-top"></span><%--请修改后继续。--%>
                                    </div>
                                    <div class="alert alert-success display-none">
                                        <a class="close" aria-hidden="true" href="#" data-dismiss="alert">×</a>
                                        Your form validation is successful!
                                   
                                   
                                    </div>



                                    <div class="tab-pane active" id="bodystats">
                                        <%--                                        <input type="radio" name="iCheck">
                                        <input type="radio" name="iCheck" checked>--%>
                                        <div class="inputcontainer">
                                            <section class="inputcontent bgcolor-1">
                                                <span class="input input--haruki">
                                                    <input class="input__field input__field--haruki" type="text" id="input-1">
                                                    <label class="input__label input__label--haruki" for="input-1">
                                                        <span class="input__label-content input__label-content--haruki"><span style="font-size: 25px">身 高&nbsp;<span style="font-size: 18px">cm</span></span></span>
                                                    </label>
                                                </span>

                                                <span class="input input--haruki">
                                                    <input class="input__field input__field--haruki" type="text" id="input-2">
                                                    <label class="input__label input__label--haruki" for="input-2">
                                                        <span class="input__label-content input__label-content--haruki"><span style="font-size: 25px">体 重&nbsp;<span style="font-size: 18px">kg</span></span></span>
                                                    </label>
                                                </span>
                                                <span class="input input--haruki">
                                                    <input class="input__field input__field--haruki" type="text" id="input-3">
                                                    <label class="input__label input__label--haruki" for="input-3">
                                                        <span class="input__label-content input__label-content--haruki"><span style="font-size: 25px">腰 围&nbsp;<span style="font-size: 18px">cm</span></span></span>
                                                    </label>
                                                </span>
                                            </section>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="fitnesstarget">
                                        <div class="row" id="select_img_fitnesstarget1">
                                            <div class="col-md-3">
                                                <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                    <img id="sss" src="http://localhost/resources/img/fitnesstarget/man/buildmuscle.png" alt="...">
                                                    <div class="caption">
                                                        <%--<p>...</p>--%>
                                                        <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectfitnesstarget" value="5">
                                                                <span style="color: #0099FF">增肌</span>
                                                            </label>
                                                        </p>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-md-3">
                                                <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                    <img src="http://localhost/resources/img/fitnesstarget/man/losefat.png" alt="...">
                                                    <div class="caption">
                                                        <%--<p>...</p>--%>
                                                        <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectfitnesstarget" value="10">
                                                                <span style="color: #0099FF">减脂</span>
                                                            </label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                    <img src="http://localhost/resources/img/fitnesstarget/man/transform.png" alt="...">
                                                    <div class="caption">
                                                        <%--<p>...</p>--%>
                                                        <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectfitnesstarget" value="15">
                                                                <span style="color: #0099FF">塑形</span>
                                                            </label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                    <img src="http://localhost/resources/img/fitnesstarget/man/enduration.png" alt="...">
                                                    <div class="caption">
                                                        <%--<p>...</p>--%>
                                                        <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectfitnesstarget" value="20">
                                                                <span style="color: #0099FF">耐力</span>
                                                            </label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" id="select_img_fitnesstarget2">
                                            <div class="col-md-3">
                                                <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                    <img src="http://localhost/resources/img/fitnesstarget/man/sport.png" alt="...">
                                                    <div class="caption">
                                                        <%--<p>...</p>--%>
                                                        <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectfitnesstarget" value="25">
                                                                <span style="color: #0099FF">运动</span>
                                                            </label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                    <img src="http://localhost/resources/img/fitnesstarget/man/flexibility.png" alt="...">
                                                    <div class="caption">
                                                        <%--<p>...</p>--%>
                                                        <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectfitnesstarget" value="30">
                                                                <span style="color: #0099FF">柔韧性</span>
                                                            </label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                    <img src="http://localhost/resources/img/fitnesstarget/man/others.png" alt="...">
                                                    <div class="caption">
                                                        <%--<p>...</p>--%>
                                                        <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectfitnesstarget" value="35">
                                                                <span style="color: #0099FF">其他</span>
                                                            </label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3" id="step3_last1" style="display: none">
                                                <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                    <img src="http://localhost/resources/img/fitnesstarget/man/buildmuscle.jpg" alt="...">
                                                    <div class="caption">
                                                        <%--<p>...</p>--%>
                                                        <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectfitnesstarget" value="40">
                                                                <span style="color: #0099FF">体脂率：40%&nbsp;严重肥胖</span>
                                                            </label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="yourbodyfat" style="background: #f9f7f6;">

                                        <div class="row">
                                            <%--<div class="col-md-3"></div>--%>
                                            <div class="col-md-3" style="padding-top: 6px;"><span style="font-size: 15px; color: #0033CC; font-style: oblique; margin-top: 15px;">您知道什么是体脂率吗？</span></div>

                                            <div class="col-md-2" style="margin-top: 6px;">
                                                <input type="radio" id="chk_knowbodyfat-1" name="chk_knowbodyfat" value="0" checked>
                                                <label for="chk_knowbodyfat-1">知道</label>

                                                <input type="radio" id="chk_knowbodyfat-2" name="chk_knowbodyfat" value="1">
                                                <label for="chk_knowbodyfat-2">我不知道</label>
                                            </div>
                                            <div class="col-md-7"></div>
                                        </div>
                                        <div id="step2_part1">
                                            <div class="inputcontainer">
                                                <section class="inputcontent bgcolor-1">
                                                    <span class="input input--haruki">
                                                        <input class="input__field input__field--haruki" type="text" id="input-4">
                                                        <label class="input__label input__label--haruki" for="input-4">
                                                            <span class="input__label-content input__label-content--haruki"><span style="font-size: 25px">您的体脂率&nbsp;<span style="font-size: 18px">%</span></span></span>
                                                        </label>
                                                    </span>
                                                </section>
                                            </div>
                                        </div>
                                        <br />
                                        <div id="step2_part2" style="display: none;">

                                            <div class="row">
                                                <div class="col-md-3"></div>
                                                <div class="col-md-7" style="background-color: white; border-width: 2px; border: 6px solid #c8c8c8; padding: 10px; width: 600px;">

                                                    <span style="font-size: 14px; color: #003366;">体脂率是决定您身体形态最重要的指标，其计算方法为：您全身脂肪重量/您的体重。<br />
                                                        <br />
                                                        <br />
                                                    </span>
                                                    <span id="step2_part2_constract_desc">下图两位男士同年龄(35)、同身高(180cm)、同体重(90kg)，但是身体形态差异却十分巨大！<br />
                                                        <br />
                                                    </span>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <table style="margin-left: 25px;">
                                                                <tr>
                                                                    <td rowspan="3">
                                                                        <img src="http://localhost/resources/img/对比/male_lean.jpg" id="step2_part2_img_constrast_lean" /></td>
                                                                    <td>
                                                                        <img src="http://localhost/resources/img/对比/male_lean_chart.png" id="step2_part2_img_constrast_lean_chart" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td id="step2_part2_constrast_height_lean">身高：1.8米</td>
                                                                </tr>
                                                                <tr>
                                                                    <td id="step2_part2_constrast_weight_lean">体重：90千克</td>
                                                                </tr>
                                                                <tr>
                                                                    <td id="step2_part2_constrast_bodyfat_lean" colspan="2" style="text-align: center; font-size: 17px; color: #0066FF; font-weight: bold;">体脂率：9%</td>
                                                                </tr>
                                                            </table>


                                                        </div>
                                                        <div class="col-md-6">
                                                            <table style="margin-left: 25px;">
                                                                <tr>
                                                                    <td rowspan="3">
                                                                        <img src="http://localhost/resources/img/对比/male_large.jpg" id="step2_part2_img_constrast_large" /></td>
                                                                    <td>
                                                                        <img src="http://localhost/resources/img/对比/male_large_chart.png" id="step2_part2_img_constrast_large_chart" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td id="step2_part2_constrast_height_large">身高：1.8米</td>
                                                                </tr>
                                                                <tr>
                                                                    <td id="step2_part2_constrast_weight_large">体重：90千克</td>
                                                                </tr>
                                                                <tr>
                                                                    <td id="step2_part2_constrast_bodyfat_large" colspan="2" style="text-align: center; font-size: 17px; color: #0066FF; font-weight: bold;"><span>体脂率：26</span>%</td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>





                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>

                                            <br />
                                            <div style="border-bottom-width: 1px; border-bottom-color: #989898; border-bottom-style: solid;"></div>
                                            <%--分割线--%>
                                            <br />
                                            <div class="row">
                                                <div class="col-md-2"></div>
                                                <div class="col-md-8">
                                                    <table>
                                                        <tr>
                                                            <td style="border-left-width: 20px; border-left-color: transparent;"><span style="font-size: 15px; font-weight: bold; color: #5e87b0;">您的体型大致如下图：</span></td>

                                                            <td style="border-left-width: 20px; border-left-color: transparent;"><span style="font-size: 20px; font-weight: bold; color: #5e87b0;">已估算您的体脂率：</span></td>
                                                        </tr>
                                                        <tr>
                                                            <td rowspan="2" style="height: 100px; width: 200px;">
                                                                <img src="http://localhost/resources/img/bodyfatpercentage/15_shadow.jpg" id="step2_part2_img" />

                                                            </td>
                                                            <td>
                                                                <table>
                                                                    <tr>
                                                                        <td rowspan="6" style="width: 200px;"><span id="step2_part2_bodyfatrate_span" style="font-size: 45px; font-weight: bold; font-family: 'Times New Roman'; font-style: oblique;">14.5%</span></td>
                                                                        <td><span style="font-size: 16px; font-weight: bold; color: #5e87b0;">根据以下参数进行估算：</span></td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td>
                                                                            <span style="font-size: 16px; font-weight: bold; color: #5e87b0;">性别：</span><span id="step2_part2_gender_span" style="color: #5e87b0;">男</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <span style="font-size: 16px; font-weight: bold; color: #5e87b0;">年龄：</span><span id="step2_part2_age_span" style="color: #5e87b0;">35</span><span style="color: #5e87b0;">周岁</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <span style="font-size: 16px; font-weight: bold; color: #5e87b0;">身高：</span><span id="step2_part2_height_span" style="color: #5e87b0;">1.8</span><span style="color: #5e87b0;">厘米</span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <span style="font-size: 16px; font-weight: bold; color: #5e87b0;">体重：</span><span id="step2_part2_weight_span" style="color: #5e87b0;">94.7</span><span style="color: #5e87b0;">千克</span>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td>
                                                                            <span style="font-size: 16px; font-weight: bold; color: #5e87b0;">腰围：</span><span id="step2_part2_waist_span" style="color: #5e87b0;">89.7</span><span style="color: #5e87b0;">厘米</span>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>

                                                            <tr>
                                                                <td style="font-size: 16px; font-weight: bold;">
                                                                    <span style="font-size: 14px; font-style: oblique; color: #5e87b0;">此估算值对于普通人可能存在3%-5%的误差。但对于肌肉含量大的男性，此估算值可能会严重偏高！</span>
                                                                </td>
                                                            </tr>
                                                    </table>
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>

                                            <br />
                                            <div class="row">
                                                <div class="col-md-8"></div>
                                                <div class="col-md-4" style="text-align: center;">
                                                    <button class="btn btn-primary" id="doestLookLikeMe"><span style="font: bold 15px 微软雅黑;">什么？这看起来完全不像我啊！</span></button>
                                                </div>
                                            </div>
                                        </div>


                                        <br />
                                        <div id="step2_part3" style="display: none">
                                            <div class="row">
                                                <span style="font-size: 20px; font-weight: bold; color: #0099FF; margin-left: 30px;">请选择和您最接近的体型</span><br />
                                            </div>
                                            <div class="row" id="select_img_bodyfat1">
                                                <div class="col-md-3">
                                                    <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                        <img id="step2_part3_img1" src="http://localhost/resources/img/bodyfatpercentage/5_man.jpg" alt="...">
                                                        <div class="caption">
                                                            <p class="bf_desc"></p>
                                                            <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                                <label class="radio-inline">
                                                                    <input type="radio" class="uniform" name="selectbodyfat" value="5">
                                                                    <span style="color: #0099FF">体脂率：5% &nbsp;精干型男</span>
                                                                </label>
                                                                <%-- <input type="radio" id="selectbodyfat-1" name="selectbodyfat" value="5">
                                                                <label for="selectbodyfat-1" style="color: #0099FF">体脂率：5% &nbsp;精干消瘦</label>--%>
                                                            </p>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-3">
                                                    <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                        <img src="http://localhost/resources/img/bodyfatpercentage/10_man.jpg" alt="...">
                                                        <div class="caption">
                                                            <p class="bf_desc"></p>
                                                            <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                                <label class="radio-inline">
                                                                    <%--<input type="radio" id="selectbodyfat-2" name="selectbodyfat" value="10">
                                                                    <label for="selectbodyfat-2" style="color: #0099FF">体脂率：10%&nbsp;敏捷健壮</label>--%>
                                                                    <input type="radio" class="uniform" name="selectbodyfat" value="10">
                                                                    <span style="color: #0099FF">体脂率：10%&nbsp;敏捷健壮</span>
                                                                </label>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                        <img src="http://localhost/resources/img/bodyfatpercentage/15_man.jpg" alt="...">
                                                        <div class="caption">
                                                            <p class="bf_desc"></p>
                                                            <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                                <label class="radio-inline">
                                                                    <input type="radio" class="uniform" name="selectbodyfat" value="15">
                                                                    <span style="color: #0099FF">体脂率：15%&nbsp;强壮健康</span>
                                                                </label>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                        <img src="http://localhost/resources/img/bodyfatpercentage/20_man.jpg" alt="...">
                                                        <div class="caption">
                                                            <p class="bf_desc"></p>
                                                            <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                                <label class="radio-inline">
                                                                    <input type="radio" class="uniform" name="selectbodyfat" value="20">
                                                                    <span style="color: #0099FF">体脂率：20%&nbsp;普通型</span>
                                                                </label>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" id="select_img_bodyfat2">
                                                <div class="col-md-3">
                                                    <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                        <img src="http://localhost/resources/img/bodyfatpercentage/25_man.jpg" alt="...">
                                                        <div class="caption">
                                                            <p class="bf_desc"></p>
                                                            <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                                <label class="radio-inline">
                                                                    <input type="radio" class="uniform" name="selectbodyfat" value="25">
                                                                    <span style="color: #0099FF">体脂率：25%&nbsp;有点超重</span>
                                                                </label>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                        <img src="http://localhost/resources/img/bodyfatpercentage/30_man.jpg" alt="...">
                                                        <div class="caption">
                                                            <p class="bf_desc"></p>
                                                            <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                                <label class="radio-inline">
                                                                    <input type="radio" class="uniform" name="selectbodyfat" value="30">
                                                                    <span style="color: #0099FF">体脂率：30%&nbsp;轻度肥胖</span>
                                                                </label>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3" id="step2_part3_last2">
                                                    <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                        <img src="http://localhost/resources/img/bodyfatpercentage/35_man.jpg" alt="...">
                                                        <div class="caption">
                                                            <p class="bf_desc"></p>
                                                            <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                                <label class="radio-inline">
                                                                    <input type="radio" class="uniform" name="selectbodyfat" value="35">
                                                                    <span style="color: #0099FF">体脂率：35%&nbsp;肥胖</span>
                                                                </label>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3" id="step2_part3_last1">
                                                    <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                        <img src="http://localhost/resources/img/bodyfatpercentage/40_man.jpg" alt="...">
                                                        <div class="caption">
                                                            <p class="bf_desc"></p>
                                                            <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                                <label class="radio-inline">
                                                                    <input type="radio" class="uniform" name="selectbodyfat" value="40">
                                                                    <span style="color: #0099FF">体脂率：40%&nbsp;严重肥胖</span>
                                                                </label>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane active" id="physique">
                                        <div class="row" id="select_img_physique1">
                                            <div class="col-md-3">
                                                <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                    <img id="sss" src="http://localhost/resources/img/physique/man/skinny_ripped-large.png" alt="...">
                                                    <div class="caption">
                                                        <%--<p>...</p>--%>
                                                        <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectphysique" value="0">
                                                                <span style="color: #0099FF">体脂率：5% &nbsp;精干消瘦</span>
                                                            </label>
                                                        </p>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-md-3">
                                                <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                    <img src="http://localhost/resources/img/physique/man/male_model-large.png" alt="...">
                                                    <div class="caption">
                                                        <%--<p>...</p>--%>
                                                        <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectphysique" value="1">
                                                                <span style="color: #0099FF">体脂率：10%&nbsp;敏捷健壮</span>
                                                            </label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                    <img src="http://localhost/resources/img/physique/man/athlete-large.png" alt="...">
                                                    <div class="caption">
                                                        <%--<p>...</p>--%>
                                                        <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectphysique" value="2">
                                                                <span style="color: #0099FF">体脂率：15%&nbsp;强壮健康</span>
                                                            </label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                    <img src="http://localhost/resources/img/physique/man/bodybuilder-large .png" alt="...">
                                                    <div class="caption">
                                                        <%--<p>...</p>--%>
                                                        <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectphysique" value="3">
                                                                <span style="color: #0099FF">体脂率：20%&nbsp;普通标准</span>
                                                            </label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="container">
                                            <div  id="physique_desc" class="row collapse">
                                                <%-- <div class="col-md-12">
                                                <div id="physique_desc">
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <span class="goal_physique">目标体型：健身爱好者</span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <span class="goal_physique_status">目标体脂率: 8%</span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <span>已计算您的目标体重：80.8千克</span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <span>为此您必须：-7.0千克脂肪</span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <span>+6.2千克瘦体重</span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                This body is built with plyometrics, high-intensity training, and weightlifting. It's about power, speed, and agility. You want to look good, but performing well is equally important. You're packing a lot of muscle from years in the gym, but drills keep you lean, mean, and explosive. People see you and instantly think, "Athlete."
                                                           
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12 closegoalmember_title">
                                                                和您目标相近的会员
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12 closegoalmember">
                                                                <table>
                                                                    <tr>
                                                                        <td><a href="#">
                                                                            <img src="http://localhost/resources/img/avatars/avatar1.jpg" /></a></td>
                                                                        <td><a href="#">
                                                                            <img src="http://localhost/resources/img/avatars/avatar2.jpg" /></a></td>
                                                                        <td><a href="#">
                                                                            <img src="http://localhost/resources/img/avatars/avatar3.jpg" /></a></td>
                                                                        <td><a href="#">
                                                                            <img src="http://localhost/resources/img/avatars/avatar4.jpg" /></a></td>
                                                                        <td><a href="#">
                                                                            <img src="http://localhost/resources/img/avatars/avatar5.jpg" /></a></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><a href="#">
                                                                            <img src="http://localhost/resources/img/avatars/avatar6.jpg" /></a></td>
                                                                        <td><a href="#">
                                                                            <img src="http://localhost/resources/img/avatars/avatar7.jpg" /></a></td>
                                                                        <td><a href="#">
                                                                            <img src="http://localhost/resources/img/avatars/avatar8.jpg" /></a></td>
                                                                        <td><a href="#">
                                                                            <img src="http://localhost/resources/img/avatars/avatar2.jpg" /></a></td>
                                                                        <td><a href="#">
                                                                            <img src="http://localhost/resources/img/avatars/avatar3.jpg" /></a></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>--%>
                                                <div>
                                                    <div class="col-md-5">
                                                        <div>
                                                            <span class="goal_physique"><span id="goal_physique">健身爱好者</span></span>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-5" style="text-align:center;">
                                                                <img src="http://localhost/resources/img/physique/man/bk/BODYBUILDER.png" alt="...">
                                                            </div>
                                                            <div class="col-md-7" style="padding-top:10px;">
                                                                <div>
                                                                    <span class="goal_physique_status">目标体脂率: 8%</span>
                                                                </div>
                                                                <div style="margin-top:10px;">
                                                                    <span>已计算您的目标体重：</span>
                                                                </div>
                                                                <div style="text-align:center;"><span id="goal_weight">80.8千克</span></div>
                                                                <div>
                                                                    <span>为此您必须：</span>
                                                                </div>
                                                                <div>
                                                                    <table>
                                                                        <tr><td id="fatchangeD">减少</td><td id="fatchange">47.0千克</td><td style="text-align:center;">脂肪</td></tr>
                                                                        <tr><td id="leanmasschangeD">增加</td><td id="leanmasschange">1.2千克</td><td style="text-align:center;">瘦体重</td></tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--<div class="col-md-2" style="text-align:center;">
                                                        <img src="http://localhost/resources/img/physique/man/bk/BODYBUILDER.png" alt="...">
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <span class="goal_physique">目标体型：健身爱好者</span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <span class="goal_physique_status">目标体脂率: 8%</span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <span>已计算您的目标体重：80.8千克</span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <span>为此您必须：-7.0千克脂肪</span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <span>+6.2千克瘦体重</span>
                                                            </div>
                                                        </div>
                                                    </div>--%>
                                                    <div class="col-md-4" id="goal_physique_desc">
                                                        
                                                    </div>
                                                    <div class="col-md-3">

                                                        <table id="similargoalmemberImgs">
                                                            <tr>
                                                                <td colspan="4" style="text-align:center;height:40px;">与您目标相近的会员</td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>

                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            
                                                        </table>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="row" id="select_img_physique2">
                                            <div class="col-md-3">
                                                <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                    <img src="http://localhost/resources/img/physique/man/strongman-large.png" alt="...">
                                                    <div class="caption">
                                                        <%--<p>...</p>--%>
                                                        <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectphysique" value="4">
                                                                <span style="color: #0099FF">体脂率：25%&nbsp;有点超重</span>
                                                            </label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                    <img src="http://localhost/resources/img/physique/man/pro_bodybuilder-large.png" alt="...">
                                                    <div class="caption">
                                                        <%--<p>...</p>--%>
                                                        <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectphysique" value="5">
                                                                <span style="color: #0099FF">体脂率：30%&nbsp;轻度肥胖</span>
                                                            </label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>

                                            <%--<div class="col-md-3" id="step3_last2" style="display:none">
                                                <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                    <img src="http://localhost/resources/img/physique/35_man.jpg" alt="...">
                                                    <div class="caption">
                                                        
                                                        <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectbodyfat" value="35">
                                                                <span style="color: #0099FF">体脂率：35%&nbsp;肥胖</span>
                                                            </label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3" id="step3_last1" style="display:none">
                                                <div class="thumbnail" style="background-color: #f9f7f6; border: none;">
                                                    <img src="http://localhost/resources/img/physique/40_man.jpg" alt="...">
                                                    <div class="caption">
                                                       
                                                        <p style="text-align: center; background-color: white; box-shadow: 0 3px 3px 0 #7E7E7E;">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectbodyfat" value="40">
                                                                <span style="color: #0099FF">体脂率：40%&nbsp;严重肥胖</span>
                                                            </label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>--%>
                                        </div>
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
        <input type="hidden" id="gender" value="1" />
        <input type="hidden" id="age" value="35" />
    </div>
    <script src="../../js/inputclassie.js"></script>
    <script>
        jQuery(document).ready(function () {
            App.setPage("Register");  //Set current page
            App.init(); //Initialise plugins and elements
            FormWizard.init();

            initPagebyGender($("#gender").val());
            //begin: 初始化所有radio为icheck

            //begin: 绑定onchange事件：设置step2几个部分的显示顺序
            $('input:radio[name="chk_knowbodyfat"]').on('ifChanged', function (event) {
                var chk_knowbodyfat_val = $('input:radio[name="chk_knowbodyfat"]:checked').val();
                //alert($('input:radio[name="chk_knowbodyfat"]:checked').val());
                if (chk_knowbodyfat_val == 1) {
                    $("#step2_part1").css('display', 'none');
                    $("#step2_part2").show();//css('display', 'normal');
                    $("#step2_part3").css('display', 'none');
                }
                else {
                    $("#step2_part1").show();
                    $("#step2_part2").css('display', 'none');
                    $("#step2_part3").css('display', 'none');
                }
            });
            $('input:radio[name="selectbodyfat"]').on('ifChecked', function (event) {
                var p = $(this).closest("p").prev();
                var all_p = $("#step2_part3").find("p.bf_desc");
                all_p.css('display', 'none');


                var all_radio = $("#step2_part3").find("input.uniform"); //alert(all_radio.length);
                for (i = 0; i < all_radio.length; i++) {
                    //if ($('all_radio.eq(i):checked'))
                    if (all_radio.eq(i).is(":checked")) {
                        p.html(bodyfatDesc($("#gender").val(), i));
                        p.show();
                        break;
                    }
                }

            });
            //physique
            $('input:radio[name="selectphysique"]').on('ifChecked', function (event) {
                //根据选择的形体，初始化说明框的数据
                var all_radio = $("#physique").find("input.uniform");
                for (i = 0; i < all_radio.length; i++) {
                    if (all_radio.eq(i).is(":checked")) {
                        physiqueDesc($("#gender").val(), i);
                        break;
                    }
                }

                $('.collapse').collapse();
            });


            //end: 绑定onchange事件：设置step2几个部分的显示顺序

            $(':radio').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%'
            });
            //end: 初始化所有radio为icheck

            $("#doestLookLikeMe").click(function (event) {
                var chk_knowbodyfat_val = $('input:radio[name="chk_knowbodyfat"]:checked').val();
                event.preventDefault();//阻止按钮提交事件
                if (chk_knowbodyfat_val == 1) {//如果radio不在“我不知道”上，则阻止click点击效果。
                    $("#step2_part1").css('display', 'none');//show();
                    $("#step2_part2").css('display', 'none');
                    $("#step2_part3").show();
                }
            });
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
