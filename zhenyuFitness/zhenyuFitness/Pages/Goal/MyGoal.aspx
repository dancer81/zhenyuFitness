<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/generalMaster.Master" AutoEventWireup="true" CodeBehind="MyGoal.aspx.cs" Inherits="zhenyuFitness.Pages.Goal.MyGoal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>健身目标总览</title>
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
                            <img src="<%=resourceRootPath %>/img/logo/bodyspace_logo_small.png" alt="" />
                        </a>
                        <a href="#" class="pull-right topimg">
                            <img src="<%=resourceRootPath %>/img/logo/bodyspace_logo_small.png" alt="" />
                        </a>
                        <a href="#" class="pull-right topimg">
                            <img src="<%=resourceRootPath %>/img/logo/bodyspace_logo_small.png" alt="" />
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
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                            <i class="fa fa-gear"></i>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="#" data-toggle="modal" data-target="#updateCurrentWeight">更新体重数据</a>
                                            </li>
                                            <li>
                                                <a href="#" data-toggle="modal" data-target="#updateCurrentBF">更新体脂率数据</a>
                                            </li>
                                            <li>
                                                <a href="#" data-toggle="modal" data-target="#deleteCurrentGoal">删除当前目标</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div class="container" style="height: 310px;">
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
                                                        <img src="<%=resourceRootPath %>/img/maleback.png" /></span>
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
                                                            <td colspan="2" class="leandesc"><span>&nbsp;&nbsp;瘦体重</span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span class="leanvalue">&nbsp;54.6</span>
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
                                                            <td colspan="2" class="BFdesc"><span>&nbsp;&nbsp;体脂肪</span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span class="BFvalue">&nbsp;15.4</span>
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
                            <div class="box border goalsection">
                                <div class="box-title" style="background-color: #f5f6f6">
                                    <span style="color: #919191; font-weight: bold;">目标体重和体脂率</span>
                                    <div class="btn-group dropdown pull-right">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                            <i class="fa fa-gear"></i>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <%--<li>
                                                <a href="GoalSetting.aspx">新建健身目标</a>
                                            </li>--%>
                                            
                                            <li>
                                                <a href="#" data-toggle="modal" data-target="#updateCurrentWeight">更新体重数据</a>
                                            </li>
                                            <li>
                                                <a href="#" data-toggle="modal" data-target="#updateCurrentBF">更新体脂率数据</a>
                                            </li>
                                            <li>
                                                <a href="#">查看历史数据</a>
                                            </li>
                                            <li>
                                                <a href="#" data-toggle="modal" data-target="#deleteCurrentGoal">删除当前目标</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="box-body goaldiv">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <img src="<%=resourceRootPath %>/img/physique/women/fit_woman-large.png" alt="" />
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
                                                                    <td style="width: 108px; height: 70px;">
                                                                        <div><span class="goalstatusdesc">目标体型</span></div>
                                                                        <div><span class="goalstatusvalue">健康女士</span></div>
                                                                    </td>
                                                                    <td>
                                                                        <div><span class="goalstatusdesc">目标方向</span></div>
                                                                        <div><span class="goalstatusvalue">塑形</span></div>
                                                                    </td>
                                                                </tr>

                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12 goalstatus">
                                                            <table>
                                                                <tr>
                                                                    <td style="width: 108px; height: 45px;">
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
                                        <div class="row goalprogress">
                                            <table style="width: 95%">
                                                <tr>
                                                    <td style="width: 15%; color: #919191;">体重&nbsp;</td>
                                                    <td style="width: 55%;">
                                                        <div class="progress progress-striped active" style="margin: 10px;">

                                                            <div class="progress-bar" role="progressbar" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100" style="width: 55%">
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td style="width: 30%; text-align: center;">
                                                        <span style="color: #5e87b0; font-family: 'Times New Roman'; font-size: 15px;">55%</span><a class="collapsed" data-toggle="collapse" href="#weightprogressstatus" aria-expanded="false" aria-controls="collapseTwo" style="color: #919191;">&nbsp;已完成&nbsp;<i style="color: #5e87b0" class="fa fa-angle-down"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <div id="weightprogressstatus" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                                            <div class="panel-body">
                                                                <table style="width: 99%; text-align: center; font-family: KaiTi; font-size: 16px; color: black;">
                                                                    <tr>
                                                                        <td style="width: 25%;">起始数值</td>
                                                                        <td>起始日期</td>
                                                                        <td>目标数值</td>
                                                                        <td>剩余天数</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><span style="font-family: 'Times New Roman';">70</span><span>千克</span></td>
                                                                        <td style="font-family: 'Times New Roman';">2016-9-1</td>
                                                                        <td><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                                        <td><span style="font-family: 'Times New Roman';">386</span><span>天</span></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 15%; color: #919191;">体脂率&nbsp;</td>
                                                    <td style="width: 55%;">
                                                        <div class="progress progress-striped active" style="margin: 10px;">

                                                            <div class="progress-bar" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td style="width: 30%; text-align: center;">
                                                        <span style="color: #5e87b0; font-family: 'Times New Roman'; font-size: 15px;">35%</span><a class="collapsed" data-toggle="collapse" href="#BFprogressstatus" aria-expanded="false" aria-controls="collapseThree" style="color: #919191;">&nbsp;已完成&nbsp;<i style="color: #5e87b0" class="fa fa-angle-down"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <div id="BFprogressstatus" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                                            <div class="panel-body">
                                                                <table style="width: 99%; text-align: center; font-family: KaiTi; font-size: 16px; color: black;">
                                                                    <tr>
                                                                        <td>起始数值</td>
                                                                        <td>起始日期</td>
                                                                        <td>目标数值</td>
                                                                        <td>剩余天数</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><span style="font-family: 'Times New Roman';">25</span><span style="font-family: 'Times New Roman';">%</span></td>
                                                                        <td style="font-family: 'Times New Roman';">2016-9-1</td>
                                                                        <td style="font-family: 'Times New Roman';"><span>15</span><span style="font-family: 'Times New Roman';">%</span></td>
                                                                        <td style="font-family: 'Times New Roman';"><span>386</span><span style="font-family: KaiTi;">天</span></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
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
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="row bodychangedivleft">
                                <div class="col-md-6">
                                    <div class="changediv">
                                        <table>
                                            <tr>
                                                <td class="changedivtitle">体重变化</td>
                                            </tr>
                                            <tr>
                                                <td class="changedivvalue">1.5</td>
                                            </tr>
                                            <tr>
                                                <td class="changedivunit">千克.增加</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="changediv">
                                        <table>
                                            <tr>
                                                <td class="changedivtitle">体脂率变化</td>
                                            </tr>
                                            <tr>
                                                <td class="changedivvalue">3</td>
                                            </tr>
                                            <tr>
                                                <td class="changedivunit">%.增加</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row bodychangedivright">
                                <div class="col-md-6">
                                    <div class="changediv">
                                        <table>
                                            <tr>
                                                <td class="changedivtitle">已实现目标数</td>
                                            </tr>
                                            <tr>
                                                <td class="changedivvalue">2</td>
                                            </tr>
                                            <tr>
                                                <td class="changedivunit">已实现</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="changediv">
                                        <table>
                                            <tr>
                                                <td class="changedivtitle">实现目标比例</td>
                                            </tr>
                                            <tr>
                                                <td class="changedivvalue">12%</td>
                                            </tr>
                                            <tr>
                                                <td class="changedivunit">共8个</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container" id="progresschartssection">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="box border">
                                <div class="box-title" style="background-color: #f5f6f6">
                                    <span style="color: #919191; font-weight: bold;">进度追踪</span>
                                    <div class="btn-group dropdown pull-right">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                            <i class="fa fa-gear"></i>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="#" data-toggle="modal" data-target="#updateCurrentWeight">更新体重数据</a>
                                            </li>
                                            <li>
                                                <a href="#" data-toggle="modal" data-target="#updateCurrentBF">更新体脂率数据</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div class="box-body">
                                        <div class="panel-group" id="accordion">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span style="color: #919191">体重追踪&nbsp;</span><i style="color: #5e87b0" class="fa fa-angle-down"></i></a></h3>
                                                </div>
                                                <div id="collapseOne" class="panel-collapse collapse in">
                                                    <div id="chart1" class="panel-body"></div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span style="color: #919191">体脂率追踪&nbsp;</span><i style="color: #5e87b0" class="fa fa-angle-down"></i></a></h3>
                                                </div>
                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                    <div id="chart2" class="panel-body"></div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span style="color: #919191">净体重追踪&nbsp;</span><i style="color: #5e87b0" class="fa fa-angle-down"></i></a></h3>
                                                </div>
                                                <div id="collapseThree" class="panel-collapse collapse">
                                                    <div id="chart3" class="panel-body"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="box border">
                                <div class="box-title" style="background-color: #f5f6f6">
                                    <span style="color: #919191; font-weight: bold;">力量型目标</span>
                                </div>
                                <div class="box-body othergoalboxbody">
                                    <div class="container othergoalcontainer">
                                        <table style="width: 100%" id="squatstable">
                                            <tr>
                                                <td colspan="4" class="othergoaltitle"><a href="#">自由杠铃深蹲</a></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: left; padding-left: 0; height: 28px;">
                                                    <div class="progress progress-striped active" style="margin-top: 10px; margin-bottom: 10px;">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalfield">起始数值</td>
                                                <td class="othergoalfield">起始日期</td>
                                                <td class="othergoalfield">目标数值</td>
                                                <td class="othergoalfield">达成日期</td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">70</span><span>千克</span></td>
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标编辑</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalseperator"></td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%" id="deadlifttable">
                                            <tr>
                                                <td colspan="4" class="othergoaltitle"><a href="#">杠铃传统硬拉</a></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: left; padding-left: 0; height: 28px;">
                                                    <div class="progress progress-striped active" style="margin-top: 10px; margin-bottom: 10px;">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalfield">起始数值</td>
                                                <td class="othergoalfield">起始日期</td>
                                                <td class="othergoalfield">目标数值</td>
                                                <td class="othergoalfield">达成日期</td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">70</span><span>千克</span></td>
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标编辑</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalseperator"></td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%" id="barbellpresstable">
                                            <tr>
                                                <td colspan="4" class="othergoaltitle"><a href="#">杠铃平板卧推</a></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: left; padding-left: 0; height: 28px;">
                                                    <div class="progress progress-striped active" style="margin-top: 10px; margin-bottom: 10px;">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalfield">起始数值</td>
                                                <td class="othergoalfield">起始日期</td>
                                                <td class="othergoalfield">目标数值</td>
                                                <td class="othergoalfield">达成日期</td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">70</span><span>千克</span></td>
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标编辑</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalseperator"></td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%" id="shoulderpresstable">
                                            <tr>
                                                <td colspan="4" class="othergoaltitle"><a href="#">杠铃肩上推举</a></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: left; padding-left: 0; height: 28px;">
                                                    <div class="progress progress-striped active" style="margin-top: 10px; margin-bottom: 10px;">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalfield">起始数值</td>
                                                <td class="othergoalfield">起始日期</td>
                                                <td class="othergoalfield">目标数值</td>
                                                <td class="othergoalfield">达成日期</td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">70</span><span>千克</span></td>
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标编辑</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalseperator"></td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%" id="barbellrowtable">
                                            <tr>
                                                <td colspan="4" class="othergoaltitle"><a href="#">杠铃划船</a></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: left; padding-left: 0; height: 28px;">
                                                    <div class="progress progress-striped active" style="margin-top: 10px; margin-bottom: 10px;">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalfield">起始数值</td>
                                                <td class="othergoalfield">起始日期</td>
                                                <td class="othergoalfield">目标数值</td>
                                                <td class="othergoalfield">达成日期</td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">70</span><span>千克</span></td>
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标编辑</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalseperator"></td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%" id="barbellcurltable">
                                            <tr>
                                                <td colspan="4" class="othergoaltitle"><a href="#">杠铃二头弯举</a></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: left; padding-left: 0; height: 28px;">
                                                    <div class="progress progress-striped active" style="margin-top: 10px; margin-bottom: 10px;">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalfield">起始数值</td>
                                                <td class="othergoalfield">起始日期</td>
                                                <td class="othergoalfield">目标数值</td>
                                                <td class="othergoalfield">达成日期</td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">70</span><span>千克</span></td>
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标编辑</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalseperator"></td>
                                            </tr>
                                        </table>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="box border goalsection">
                                <div class="box-title" style="background-color: #f5f6f6">
                                    <span style="color: #919191; font-weight: bold;">测量型目标</span>
                                </div>
                                <div class="box-body goaldiv">
                                    <div class="container" style="height: 400px; overflow-y: auto; overflow-x: hidden;">
                                        <table style="width: 100%" id="chesttable">
                                            <tr>
                                                <td colspan="4" class="othergoaltitle">胸围</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: left; padding-left: 0; height: 28px;">
                                                    <div class="progress progress-striped active" style="margin-top: 10px; margin-bottom: 10px;">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalfield">起始数值</td>
                                                <td class="othergoalfield">起始日期</td>
                                                <td class="othergoalfield">目标数值</td>
                                                <td class="othergoalfield">达成日期</td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">70</span><span>千克</span></td>
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标编辑</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalseperator"></td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%" id="armtable">
                                            <tr>
                                                <td colspan="4" class="othergoaltitle">上臂围度</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: left; padding-left: 0; height: 28px;">
                                                    <div class="progress progress-striped active" style="margin-top: 10px; margin-bottom: 10px;">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalfield">起始数值</td>
                                                <td class="othergoalfield">起始日期</td>
                                                <td class="othergoalfield">目标数值</td>
                                                <td class="othergoalfield">达成日期</td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">70</span><span>千克</span></td>
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标编辑</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalseperator"></td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%" id="waisttable">
                                            <tr>
                                                <td colspan="4" class="othergoaltitle">腰围</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: left; padding-left: 0; height: 28px;">
                                                    <div class="progress progress-striped active" style="margin-top: 10px; margin-bottom: 10px;">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalfield">起始数值</td>
                                                <td class="othergoalfield">起始日期</td>
                                                <td class="othergoalfield">目标数值</td>
                                                <td class="othergoalfield">达成日期</td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">70</span><span>千克</span></td>
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标编辑</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalseperator"></td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%" id="thighstable">
                                            <tr>
                                                <td colspan="4" class="othergoaltitle">大腿围度</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: left; padding-left: 0; height: 28px;">
                                                    <div class="progress progress-striped active" style="margin-top: 10px; margin-bottom: 10px;">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalfield">起始数值</td>
                                                <td class="othergoalfield">起始日期</td>
                                                <td class="othergoalfield">目标数值</td>
                                                <td class="othergoalfield">达成日期</td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">70</span><span>千克</span></td>
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标编辑</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalseperator"></td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%" id="calvestable">
                                            <tr>
                                                <td colspan="4" class="othergoaltitle">小腿围度</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: left; padding-left: 0; height: 28px;">
                                                    <div class="progress progress-striped active" style="margin-top: 10px; margin-bottom: 10px;">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalfield">起始数值</td>
                                                <td class="othergoalfield">起始日期</td>
                                                <td class="othergoalfield">目标数值</td>
                                                <td class="othergoalfield">达成日期</td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">70</span><span>千克</span></td>
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标编辑</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalseperator"></td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%" id="forearmstable">
                                            <tr>
                                                <td colspan="4" class="othergoaltitle">前臂围度</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: left; padding-left: 0; height: 28px;">
                                                    <div class="progress progress-striped active" style="margin-top: 10px; margin-bottom: 10px;">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalfield">起始数值</td>
                                                <td class="othergoalfield">起始日期</td>
                                                <td class="othergoalfield">目标数值</td>
                                                <td class="othergoalfield">达成日期</td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">70</span><span>千克</span></td>
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标编辑</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalseperator"></td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%" id="shouldertable">
                                            <tr>
                                                <td colspan="4" class="othergoaltitle">肩膀围度</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: left; padding-left: 0; height: 28px;">
                                                    <div class="progress progress-striped active" style="margin-top: 10px; margin-bottom: 10px;">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalfield">起始数值</td>
                                                <td class="othergoalfield">起始日期</td>
                                                <td class="othergoalfield">目标数值</td>
                                                <td class="othergoalfield">达成日期</td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">70</span><span>千克</span></td>
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标编辑</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalseperator"></td>
                                            </tr>
                                        </table>
                                        <table style="width: 100%" id="hiptable">
                                            <tr>
                                                <td colspan="4" class="othergoaltitle">臀围</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="text-align: left; padding-left: 0; height: 28px;">
                                                    <div class="progress progress-striped active" style="margin-top: 10px; margin-bottom: 10px;">
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalfield">起始数值</td>
                                                <td class="othergoalfield">起始日期</td>
                                                <td class="othergoalfield">目标数值</td>
                                                <td class="othergoalfield">达成日期</td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">70</span><span>千克</span></td>
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标编辑</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a>目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="othergoalseperator"></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container" id="progressPhotossection">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="box border">
                                <div class="box-title" style="background-color: #f5f6f6">
                                    <span style="color: #919191; font-weight: bold;">您的进展照片</span>
                                    <div class="btn-group dropdown pull-right">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                            <i class="fa fa-gear"></i>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="#">上传您的进展照片</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div class="box-body" style="height: 240px;">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="progressphotobefore" style="background-image:url(<%=resourceRootPath %>/img/d42c65949cce4799b0c40009562b646b-196x196.jpg)">
                                                        <div class="progressPhototext">
                                                            <table class="beforetexttable">
                                                                <tr>
                                                                    <td colspan="3" class="beforeorcurrenttext">以前：</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="phototimestamp">2015-9-1</td>
                                                                    <td class="progressphotoweight">61千克</td>
                                                                    <td class="progressphotoBF">31%</td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="progressphotocurrent" style="background-image:url(<%=resourceRootPath %>/img/89ef486aed63462a84745ca62dc0f847-196x196.jpg)">
                                                        <div class="progressPhototext">
                                                            <table class="beforetexttable">
                                                                <tr>
                                                                    <td colspan="3" class="beforeorcurrenttext">现在：</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="phototimestamp">2016-11-1</td>
                                                                    <td class="progressphotoweight">52千克</td>
                                                                    <td class="progressphotoBF">23.5%</td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <table class="otherprogressphototable">
                                                        <tr>
                                                            <td colspan="3"><a href="#" class="progressphotocount">0</a><span class="progressphotocountdesc">张进展相关照片</span></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="otherprogressphoto"></div>
                                                            </td>
                                                            <td>
                                                                <div class="otherprogressphoto"></div>
                                                            </td>
                                                            <td>
                                                                <div class="otherprogressphoto"></div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="otherprogressphoto"></div>
                                                            </td>
                                                            <td>
                                                                <div class="otherprogressphoto"></div>
                                                            </td>
                                                            <td>
                                                                <div class="otherprogressphoto"></div>
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
                    </div>
                </div>
            </div>
            <div class="col-md-2">插入推荐文章</div>
        </div>


        <div class="modal fade" id="updateCurrentWeight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" style="color:white;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel"><span class="updateweightmodaltitle">更新您的体重数据</span></h4>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-3">
                                    <table class="updateCurrentWeight_calendartable">
                                        <tr>
                                            <td>
                                                <img class="updateCurrentWeight_calendarimg" src="<%=resourceRootPath %>/img/calendaricon1.png" style="height: 77px; width: 77px" /></td>
                                        </tr>
                                        <tr>
                                            <td><span class="updateCurrentWeight_calendartext">2016-10-11</span></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-md-3">
                                    <table class="updateCurrentWeight_weighttable">
                                        <tr>
                                            <td>
                                                <input class="updateCurrentWeight_weightinput" type="number"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><span class="updateCurrentWeight_weighttext">千克</span></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-md-6">
                                    <table class="updateCurrentWeight_weightdesctable">
                                        <tr>
                                            <td rowspan="3"><i class="fa fa-long-arrow-up fa-5x updateCurrentWeight_directionstyle"></i></td>
                                            <td class="updateCurrentWeight_weightdescdirection">增加了</td>
                                            
                                        </tr>
                                        <tr>
                                            <td class="updateCurrentWeight_weightdescvalue"><span style="font-family:'Times New Roman';">0.9</span>千克</td>
                                        </tr>
                                        <tr>
                                            <td class="updateCurrentWeight_weightdescdaycount">在10天之内</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary">更新</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="updateCurrentBF" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" style="color:white;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel1"><span class="updateweightmodaltitle">更新您的体脂率数据</span></h4>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-3">
                                    <table class="updateCurrentWeight_calendartable">
                                        <tr>
                                            <td>
                                                <img class="updateCurrentWeight_calendarimg" src="<%=resourceRootPath %>/img/calendaricon1.png" style="height: 77px; width: 77px" /></td>
                                        </tr>
                                        <tr>
                                            <td><span class="updateCurrentWeight_calendartext">2016-10-11</span></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-md-3">
                                    <table class="updateCurrentWeight_weighttable">
                                        <tr>
                                            <td>
                                                <input class="updateCurrentWeight_weightinput" type="number"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><span class="updateCurrentWeight_weighttext">%</span></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-md-6">
                                    <table class="updateCurrentWeight_weightdesctable">
                                        <tr>
                                            <td rowspan="3"><i class="fa fa-long-arrow-up fa-5x updateCurrentWeight_directionstyle"></i></td>
                                            <td class="updateCurrentWeight_weightdescdirection">增加了</td>
                                            
                                        </tr>
                                        <tr>
                                            <td class="updateCurrentWeight_weightdescvalue"><span style="font-family:'Times New Roman';">0.9</span>千克</td>
                                        </tr>
                                        <tr>
                                            <td class="updateCurrentWeight_weightdescdaycount">在10天之内</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary">更新</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="deleteCurrentGoal" tabindex="-1" role="dialog" aria-labelledby="myModalLabeldelete" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" style="color:white;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabeldelete"><span class="updateweightmodaltitle">删除健身目标</span></h4>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <span class="deleteCurrentGoal_message">您确定要删除当前正在进行的健身目标吗？<span class="deleteCurrentGoal_createdatetime">【该目标制定于2015年8月24日 21点23分】</span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary">继续</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../../js/jquery_Countdown/countdown.js"></script>

    <script src="../../js/icharts.js/dist/ichartjs.base.js"></script>
    <script src="../../js/icharts.js/dist/ichart.coordinate.js"></script>
    <script src="../../js/icharts.js/dist/ichartjs.line.js"></script>
    <script src="../../js/icharts.js/ichart.linebasic2d.minify.js"></script>
    <%--    <script src='http://www.ichartjs.com/ichart.latest.min.js'></script>--%>
    <script>
        jQuery(document).ready(function () {
            App.init();
            initMyGoal();
        });
    </script>
</asp:Content>




