<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/generalMaster.Master" AutoEventWireup="true" CodeBehind="MyGoal.aspx.cs" Inherits="zhenyuFitness.Pages.Goal.MyGoal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../css/custom/mygoal.css" rel="stylesheet" />

    <script src="../../js/jquery-easing/jquery.easing.min.js"></script>
    <script type="text/javascript" src="../../js/easypiechart/jquery.easypiechart.min.js"></script>
    <script src="../../js/custom/mygoal.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-10 content">
                <div class="row topdiv">
                    <div class="col-md-12">
                        <a href="#" class="pull-right topimg">
                            <img src="http://localhost/resources/img/logo/bodyspace_logo_small.png" alt="" />
                        </a>
                        <a href="#" class="pull-right topimg">
                            <img src="http://localhost/resources/img/logo/bodyspace_logo_small.png" alt="" />
                        </a>
                        <a href="#" class="pull-right topimg">
                            <img src="http://localhost/resources/img/logo/bodyspace_logo_small.png" alt="" />
                        </a>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="box border currentbodycompositionmenu">
                                <div class="box-title" style="background-color: #f5f6f6">
                                    <span style="color: #919191; font-weight: bold;">当前身体成分</span>
                                    <div class="btn-group dropdown pull-right">
                                        <a class="dropdown-toggle" data-toggle="dropdown">
                                            <i class="fa fa-gear"></i>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="#">更新体重数据</a>
                                            </li>
                                            <li>
                                                <a href="#">更新体脂率数据</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div><span class="currentdesc">当前体重</span></div>
                                                <div><span class="currentvalue">70</span><span class="currentunit">千克</span></div>
                                            </div>
                                            <div class="col-md-6">
                                                <div><span class="currentdesc">当前体脂率</span></div>
                                                <div><span class="currentvalue">22</span><span class="currentunit">%</span></div>
                                            </div>
                                        </div>
                                        <div class="row" style="margin-top: 30px;">
                                            <div class="col-md-6">
                                                <div id="pie_fatrate" class="piechartBF" data-percent="75">
                                                    <span class="percent">
                                                        <img src="http://localhost/resources/img/maleback.png" /></span>
                                                </div>
                                                <%--                                                <div id="pie_fatrate" class="piechart" data-percent="80">
                                                    <span class="percent">20%</span>
                                                </div>--%>
                                            </div>
                                            <div class="col-md-6">
                                                <div style="margin-left: 18px;">
                                                    <table style="text-align: left">
                                                        <tr>
                                                            <td rowspan="2">
                                                                <div class="leanbar"></div>
                                                            </td>
                                                            <td colspan="2" class="leandesc"><span>瘦体重</span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span class="leanvalue">54.6</span>
                                                            </td>
                                                            <td>
                                                                <span class="leanunit">千克</span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div style="margin-top: 10px; margin-left: 18px;">
                                                    <table style="text-align: left">
                                                        <tr>
                                                            <td rowspan="2">
                                                                <div class="BFbar"></div>
                                                            </td>
                                                            <td colspan="2" class="BFdesc"><span>体脂肪</span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span class="BFvalue">15.4</span>
                                                            </td>
                                                            <td>
                                                                <span class="BFunit">千克</span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="box border currentbodycompositionmenu">
                                <div class="box-title" style="background-color: #f5f6f6">
                                    <span style="color: #919191; font-weight: bold;">目标体重和体脂率</span>
                                    <div class="btn-group dropdown pull-right">
                                        <a class="dropdown-toggle" data-toggle="dropdown">
                                            <i class="fa fa-gear"></i>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="#">新建健身目标</a>
                                            </li>
                                            <li>
                                                <a href="#">删除当前目标</a>
                                            </li>
                                            <li>
                                                <a href="#">更新体重数据</a>
                                            </li>
                                            <li>
                                                <a href="#">更新体脂率数据</a>
                                            </li>
                                            <li>
                                                <a href="#">查看历史数据</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="box-body goaldiv">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <img src="http://localhost/resources/img/physique/women/fit_woman-large.png" alt="" />
                                            </div>
                                            <div class="col-md-9">
                                                <div class="container">
                                                    <div class="row goaldate">
                                                        <div class="col-md-12">
                                                            <div class="goaldatediv"><span class="goaldatedesc">目标在<span id="goaldatespan">400</span>天后过期：</span></div>
                                                            <div id="foo1"></div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12 goalstatus">
                                                            <table>
                                                                <tr>
                                                                    <td style="width: 108px;height: 80px;">
                                                                        <div><span class="goalstatusdesc">目标体型</span></div>
                                                                        <div><span class="goalstatusvalue">健康女士</span></div>
                                                                    </td>
                                                                    <td>
                                                                        <div><span class="goalstatusdesc">目标方向</span></div>
                                                                        <div><span class="goalstatusvalue">塑形</span></div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 108px;height: 45px;">
                                                                        <div><span class="goalstatusdesc">目标体重</span></div>
                                                                        <div><span class="goalstatusvalue_num">65.5</span><span class="goalstatusvalue_unit">千克</span></div>
                                                                    </td>
                                                                    <td>
                                                                        <div><span class="goalstatusdesc">目标体脂率</span></div>
                                                                        <div><span class="goalstatusvalue_num">16</span>&nbsp;<span class="goalstatusvaluepercent">%</span></div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12"><span>体重：体重：体重：体重：</span></div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-2">插入推荐文章</div>
        </div>
    </div>

    <script src="../../js/jquery_Countdown/countdown.js"></script>
    <script>
        jQuery(document).ready(function () {
            App.init();
            initMyGoal();

        });
    </script>
</asp:Content>
