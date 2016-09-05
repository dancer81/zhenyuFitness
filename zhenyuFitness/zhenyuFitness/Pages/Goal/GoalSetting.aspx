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
                    <h4><i class="fa fa-bars"></i>健身目标设定 - <span class="stepHeader">1 / 7</span></h4>
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
                                        <a href="#yourgoalstats" data-toggle="tab" class="wiz-step">
                                            <%--  <span class="step-number">4</span>--%>
                                            <span class="step-name"><i class="fa fa-check"></i>您的目标相关数据</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#goaldate" data-toggle="tab" class="wiz-step">
                                            <%-- <span class="step-number">4</span>--%>
                                            <span class="step-name"><i class="fa fa-check"></i>达成目标所需天数</span>
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
                                                        <p class="caption_p">
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
                                                        <p class="caption_p">
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
                                                        <p class="caption_p">
                                                            <label class="radio-inline">
                                                                <input type="radio" class="uniform" name="selectfitnesstarget" value="15">
                                                                <span>塑形</span>
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
                                                        <p class="caption_p">
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
                                                        <p class="caption_p">
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
                                                        <p class="caption_p">
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
                                                        <p class="caption_p">
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
                                                        <p class="caption_p">
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
                                            <div id="knowbodyfat_text" class="col-md-3"><span>您知道什么是体脂率吗？</span></div>

                                            <div class="col-md-2" style="margin-top: 9px;">
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
                                                            <span class="input__label-content input__label-content--haruki"><span style="font-size: 25px">已估算您的体脂率&nbsp;<span style="font-size: 18px">%</span></span></span>
                                                        </label>
                                                    </span>
                                                    <div><span>如果您知道自己的体脂率，可以直接修改上面数值，然后进入下一步。</span></div>
                                                    <div><span>如果您不知道什么是体脂率，请勾选上方对应的圆圈。</span></div>
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
                                                <div class="col-md-3"></div>
                                                <div class="col-md-7">
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
                                                                        <td rowspan="6" style="width: 150px;"><span id="step2_part2_bodyfatrate_span" style="font-size: 40px; font-weight: bold; font-family: 'Times New Roman'; font-style: oblique;"></span></td>
                                                                        <td><span style="font-size: 16px; font-weight: bold; color: #5e87b0; width: 110px;">根据以下参数进行估算：</span></td>
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
                                                                    <span style="font-size: 14px; font-style: oblique; color: #5e87b0;">此估算值对于普通人可能存在5%左右的误差。但对于肌肉含量大的男性，此估算值可能会严重偏高！</span>
                                                                </td>
                                                            </tr>
                                                    </table>
                                                </div>
                                                <div class="col-md-2"></div>
                                            </div>

                                            <br />
                                            <div class="row">
                                                <div class="col-md-6"></div>
                                                <div class="col-md-6" style="text-align: center;">
                                                    <button class="btn btn-primary" id="doestLookLikeMe"><span style="font: bold 15px 微软雅黑;">这看起来完全不像我啊！</span></button>
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
                                                    <div class="thumbnail">
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
                                                    <div class="thumbnail">
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
                                                    <div class="thumbnail">
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
                                                    <div class="thumbnail">
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
                                                    <div class="thumbnail">
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
                                                    <div class="thumbnail">
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
                                                    <div class="thumbnail">
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
                                                    <div class="thumbnail">
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
                                            <div id="physique_desc" class="row collapse">
                                                <div>
                                                    <div class="col-md-5">
                                                        <div style="padding-left: 20px;">
                                                            <span class="goal_physique"><span id="goal_physique">健身爱好者</span></span>
                                                        </div>
                                                        <div class="row" style="margin-top: 20px;">
                                                            <div class="col-md-5" style="text-align: center;">
                                                                <img src="http://localhost/resources/img/physique/man/bk/BODYBUILDER.png" alt="...">
                                                            </div>
                                                            <div class="col-md-7">
                                                                <div>
                                                                    <span class="goal_physique_status" style="color: forestgreen;">目标体脂率: 8%</span>
                                                                </div>
                                                                <div style="margin-top: 10px;">
                                                                    <span>已计算您的目标体重：</span>
                                                                </div>
                                                                <div style="text-align: center;"><span id="goal_weight">80.8千克</span></div>
                                                                <div>
                                                                    <span>为此您必须：</span>
                                                                </div>
                                                                <div>
                                                                    <table>
                                                                        <tr>
                                                                            <td id="fatchangeD">减少</td>
                                                                            <td id="fatchange">47.0千克</td>
                                                                            <td style="text-align: center; color: orangered;">脂肪</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td id="leanmasschangeD">增加</td>
                                                                            <td id="leanmasschange">1.2千克</td>
                                                                            <td style="text-align: center; color: forestgreen;">瘦体重</td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4" id="goal_physique_desc">
                                                    </div>
                                                    <div class="col-md-3">

                                                        <table id="similargoalmemberImgs">
                                                            <tr>
                                                                <td colspan="4" style="text-align: center; height: 40px;">与您目标相近的会员</td>
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
                                            <div class="col-md-3" id="last_physique_div">
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
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="yourgoalstats">
                                        <div class="inputcontainer">
                                            <section class="inputcontent bgcolor-1">
                                                <div><span style="font-size: 15px;">您的目标体型：<span id="yourgoalstats_physiquetext"></span></span></div>
                                                <div>
                                                    <img id="yourgoalstats_physique_img" src="http://localhost/resources/img/physique/man/skinny_ripped-large.png" />
                                                </div>
                                                <div><span style="font-size: 15px;">根据您的目标体型、当前的身高、体重和体脂率，计算出您的目标体重和体脂率为：</span></div>
                                                <span class="input input--haruki">
                                                    <input class="input__field input__field--haruki" type="text" id="input-5">
                                                    <label class="input__label input__label--haruki" for="input-5">
                                                        <span class="input__label-content input__label-content--haruki"><span style="font-size: 25px">您的目标体重&nbsp;<span style="font-size: 18px">(千克)</span></span></span>
                                                    </label>
                                                </span>

                                                <span class="input input--haruki">
                                                    <input class="input__field input__field--haruki" type="text" id="input-6">
                                                    <label class="input__label input__label--haruki" for="input-6">
                                                        <span class="input__label-content input__label-content--haruki"><span style="font-size: 25px">您的目标体脂率&nbsp;<span style="font-size: 18px">%</span></span></span>
                                                    </label>
                                                </span>
                                                <div id="seperator1"></div>
                                                <div>
                                                    <span style="font-size: 16px; margin-bottom: 15px;">和您目标体型相同，且最能激励您的会员：<br />
                                                    </span>
                                                </div>
                                                <div id="yourgoalstats_table">
                                                    <table id="samephysique_topinspiration_memberImgs">
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
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
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <%--<div>
                                                    <table id="samephysique_topinspiration_memberImgs">
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
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
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                    </table>
                                                </div>--%>
                                            </section>
                                        </div>

                                    </div>

                                    <div class="tab-pane" id="goaldate">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-4"></div>
                                                <div class="col-md-4">
                                                    <div id="knobdiv">
                                                        <h4>请选择您目标达成的天数</h4>
                                                        <input class="knob" data-angleoffset="-125" data-anglearc="250" data-fgcolor="#D9534F" value="90">
                                                    </div>
                                                    <div style="margin-bottom: 20px; text-align: center;"><span style="color: #0099FF; font-size: 23px;">适中</span></div>
                                                </div>
                                                <div class="col-md-4"></div>
                                            </div>
                                        </div>

                                        <div id="goaldate_desc">
                                            <div id="goaldate_bodychange">
                                                <span>您希望在<span id="goaldatecount">300</span>天后达成的目标：<br />
                                                </span>
                                                <span>体重<span id="goaldate_weight">50</span>千克 <span style="color: #0099FF;">&</span> 体脂率<span id="goaldate_bf">18%</span></span>

                                            </div>
                                            <div id="goaldate_fatchange">
                                                <div>您需要:</div>
                                                <div>
                                                    <span id="goaldate_fatD">减少</span>脂肪：<span id="goaldate_fatA">10</span>千克<br />
                                                    <span id="goaldate_leanD">增加</span>瘦体重：<span id="goaldate_leanA">9</span>千克
                                                </div>
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
    <script src="../../js/jQuery-Knob/js/jquery.knob.min.js"></script>
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
                increaseArea: '100%'
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
