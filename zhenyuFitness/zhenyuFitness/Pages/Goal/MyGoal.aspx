<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/generalMaster.Master" AutoEventWireup="true" CodeBehind="MyGoal.aspx.cs" Inherits="zhenyuFitness.Pages.Goal.MyGoal" EnableViewState="false" %>

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
                                                <div><span id="currentweight" class="currentvalue"><%=CurrentWeight %></span><span class="currentunit">千克</span></div>
                                            </div>
                                            <div class="col-md-6">
                                                <div><span class="currentdesc">当前体脂率</span></div>
                                                <div><span id="currentBFR" class="currentvalue"><%=CurrentBFR %></span><span class="currentunit">%</span></div>
                                            </div>
                                        </div>
                                        <div class="row" style="margin-top: 30px;">
                                            <div class="col-md-6">
                                                <div id="pie_fatrate" class="piechartBF" data-percent="<%=(100.0 -float.Parse(CurrentBFR)) %>">
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
                                                                <span id="leanbodyweight" class="leanvalue">&nbsp;<%=CurrentLeanBodyWeight %></span>
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
                                                                <span id="bodyfatweight" class="BFvalue">&nbsp;<%=CurrentBodyFatWeight %></span>
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
                                                <img src="<%=GoalPhysiqueImg %>" alt="" />
                                            </div>
                                            <div class="col-md-9">
                                                <div class="container">
                                                    <div class="row goaldate">
                                                        <div class="col-md-12">
                                                            <div class="goaldatediv"><span class="goaldatedesc">目标在<span id="goaldatespan"><%=GoalDaysLeft %></span>天后过期：</span></div>
                                                            <div id="foo1"></div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12 goalstatus">
                                                            <table>
                                                                <tr>
                                                                    <td style="width: 108px; height: 70px;">
                                                                        <div><span class="goalstatusdesc">目标体型</span></div>
                                                                        <div><span class="goalstatusvalue"><%=GoalPhysiqueDesc %></span></div>
                                                                    </td>
                                                                    <td>
                                                                        <div><span class="goalstatusdesc">目标方向</span></div>
                                                                        <div><span class="goalstatusvalue"><%=GoalDirectionDesc %></span></div>
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
                                                                        <div><span class="goalstatusvalue_num"><%=GoalWeight %></span><span class="goalstatusvalue_unit">千克</span></div>
                                                                    </td>
                                                                    <td>
                                                                        <div><span class="goalstatusdesc">目标体脂率</span></div>
                                                                        <div><span class="goalstatusvalue_num"><%=GoalBFR %></span>&nbsp;<span class="goalstatusvaluepercent">%</span></div>
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

                                                            <div class="progress-bar" role="progressbar" aria-valuenow="<%=WeightGoalAchievedPercent %>" aria-valuemin="0" aria-valuemax="100" style="width: <%=WeightGoalAchievedPercent %>%">
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td style="width: 30%; text-align: center;">
                                                        <span style="color: #5e87b0; font-family: 'Times New Roman'; font-size: 15px;"><span><%=WeightGoalAchievedPercent %></span>%</span><a class="collapsed" data-toggle="collapse" href="#weightprogressstatus" aria-expanded="false" aria-controls="collapseTwo" style="color: #919191;">&nbsp;已完成&nbsp;<i style="color: #5e87b0" class="fa fa-angle-down"></i></a>
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
                                                                        <td><span style="font-family: 'Times New Roman';" id="startWeight"><%=StartWeight %></span><span>千克</span></td>
                                                                        <td style="font-family: 'Times New Roman';" id="goalStartDate"><%=GoalStartDate %></td>
                                                                        <td><span style="font-family: 'Times New Roman';" id="goalWeight"><%=GoalWeight %></span><span>千克</span></td>
                                                                        <td><span style="font-family: 'Times New Roman';"><%=GoalDaysLeft %></span><span>天</span></td>
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

                                                            <div class="progress-bar" role="progressbar" aria-valuenow="<%=BFRGoalAchievedPercent %>" aria-valuemin="0" aria-valuemax="100" style="width: <%=BFRGoalAchievedPercent %>%">
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td style="width: 30%; text-align: center;">
                                                        <span style="color: #5e87b0; font-family: 'Times New Roman'; font-size: 15px;"><span><%=BFRGoalAchievedPercent %></span>%</span><a class="collapsed" data-toggle="collapse" href="#BFprogressstatus" aria-expanded="false" aria-controls="collapseThree" style="color: #919191;">&nbsp;已完成&nbsp;<i style="color: #5e87b0" class="fa fa-angle-down"></i></a>
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
                                                                        <td><span style="font-family: 'Times New Roman';" id="startBodyFat"><%=StartBFR %></span><span style="font-family: 'Times New Roman';">%</span></td>
                                                                        <td style="font-family: 'Times New Roman';"><%=GoalStartDate %></td>
                                                                        <td style="font-family: 'Times New Roman';"><span id="goalBFR"><%=GoalBFR %></span><span style="font-family: 'Times New Roman';">%</span></td>
                                                                        <td style="font-family: 'Times New Roman';"><span><%=GoalDaysLeft %></span><span style="font-family: KaiTi;">天</span></td>
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
                                                <td id="weightchange" class="changedivvalue"><%=WeightChangeTotal %></td>
                                            </tr>
                                            <tr>
                                                <td class="changedivunit">千克.<span id="weightChangeDirection"><%=WeightChangeDirection %></span></td>
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
                                                <td id="BFRchange" class="changedivvalue"><%=BFRChangeTotal %></td>
                                            </tr>
                                            <tr>
                                                <td class="changedivunit">%.<span id="BFRChangeDirection"><%=BFRChangeDirection %></span></td>
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
                                                <td class="changedivtitle">瘦体重变化</td>
                                            </tr>
                                            <tr>
                                                <td id="leanbodyweightchange" class="changedivvalue"><%=LeanBodyWeightChangeTotal %></td>
                                            </tr>
                                            <tr>
                                                <td class="changedivunit">千克.<span id="leanBodyWeightChangeDirection"><%=LeanBodyWeightChangeDirection %></span></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="changediv">
                                        <table>
                                            <tr>
                                                <td class="changedivtitle">体脂肪变化</td>
                                            </tr>
                                            <tr>
                                                <td id="bodyfatweightchange" class="changedivvalue"><%=BodyfatChangeTotal %></td>
                                            </tr>
                                            <tr>
                                                <td class="changedivunit">千克.<span id="bodyfatWeightChangeDirection"><%=BodyfatChangeDirection %></span></td>
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
                                                    <%--<div>
                                                        <select name="interval" id="weightCurveInterval" class="col-md-12 full-width-fix">
                                                            <option value="30" selected>每隔30天</option>
                                                            <option value="15">每隔15天</option>
                                                            <option value="7">每隔7天</option>
                                                            <option value="60">每隔60天</option>
                                                        </select>
                                                    </div>--%>
                                                    <div id="chartWeightCurve" class="panel-body"></div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span style="color: #919191">体脂率追踪&nbsp;</span><i style="color: #5e87b0" class="fa fa-angle-down"></i></a></h3>
                                                </div>
                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                    <div id="chartBodyfatRateCurve" class="panel-body"></div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span style="color: #919191">目标完成进度追踪&nbsp;</span><i style="color: #5e87b0" class="fa fa-angle-down"></i></a></h3>
                                                </div>
                                                <div id="collapseThree" class="panel-collapse collapse">
                                                    <div id="chartGoalAchieveRateCurve" class="panel-body">
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
                                                        <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
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
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';" id="startValueHtml_squats">0</span><span>千克</span></td>
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';" id="startDateHtml_squats"></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';" id="goalValueHtml_squats">0</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';" id="goalDaysLeftHtml"></span>天</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>当前</span>
                                                    <span id="progress_currentLiftWeightAmount_squats">101</span><span>千克</span>
                                                    <span>(<span id="progress_currentLiftWeightAchievedPercent_squats">99.5</span>%<span>进度完成</span>)</span>
                                                    <span>状态：<span id="progress_currentLiftWeightStatus_squats">进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#" data-toggle="modal" data-target="#squatsGoal" id="addOtherGoal_squats">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a href="#" data-toggle="modal" data-target="#deleteOtherGoal" id="deleteOtherGoal_squats" onclick="initDeleteOtherGoalmodal('squats')">目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a href="#" data-toggle="modal" data-target="#squatsGoal">更新数据</a>
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
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';" id="startDateHtml_deadLift">2016-10-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span>天</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>当前</span>
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#" data-toggle="modal" data-target="#deadLiftGoal" id="addOtherGoal_deadLift">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a href="#" data-toggle="modal" data-target="#deleteOtherGoal" id="deleteOtherGoal_deadLift" onclick="initDeleteOtherGoalmodal('deadLift')">目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a href="#" data-toggle="modal" data-target="#deadLiftGoal">更新数据</a>
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
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';" id="startDateHtml_barbellPress">2016-9-9</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>当前</span>
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#" data-toggle="modal" data-target="#barbellPressGoal" id="addOtherGoal_barbellPress">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a href="#" data-toggle="modal" data-target="#deleteOtherGoal" id="deleteOtherGoal_barbellPress" onclick="initDeleteOtherGoalmodal('barbellPress')">目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a href="#" data-toggle="modal" data-target="#barbellPressGoal">更新数据</a> 
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
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';" id="startDateHtml_shoulderPress">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>当前</span>
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#" data-toggle="modal" data-target="#shoulderPressGoal" id="addOtherGoal_shoulderPress">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a href="#" data-toggle="modal" data-target="#deleteOtherGoal" id="deleteOtherGoal_shoulderPress" onclick="initDeleteOtherGoalmodal('shoulderPress')">目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a href="#" data-toggle="modal" data-target="#shoulderPressGoal">更新数据</a> 
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
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';" id="startDateHtml_barbellRow">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>当前</span>
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#" data-toggle="modal" data-target="#barbellRowGoal" id="addOtherGoal_barbellRow">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a href="#" data-toggle="modal" data-target="#deleteOtherGoal" id="deleteOtherGoal_barbellRow" onclick="initDeleteOtherGoalmodal('barbellRow')">目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a href="#" data-toggle="modal" data-target="#barbellRowGoal">更新数据</a> 
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
                                                <td class="othergoalvalue" style="font-family: 'Times New Roman';" id="startDateHtml_barbellCurl">2016-9-1</td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">75</span><span>千克</span></td>
                                                <td class="othergoalvalue"><span style="font-family: 'Times New Roman';">2016-9-1</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoalprogressdesc">
                                                    <span>当前</span>
                                                    <span>101<span>千克</span></span>
                                                    <span>(<span>12.5<span>%</span></span><span>进度完成</span>)</span>
                                                    <span>状态：<span>进行中</span></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="othergoaloperation">
                                                    <a href="#" data-toggle="modal" data-target="#barbellCurlGoal" id="addOtherGoal_barbellCurl">目标设定</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a href="#" data-toggle="modal" data-target="#deleteOtherGoal" id="deleteOtherGoal_barbellCurl" onclick="initDeleteOtherGoalmodal('barbellCurl')">目标删除</a>
                                                    <span>&nbsp;|&nbsp;</span>
                                                    <a href="#" data-toggle="modal" data-target="#barbellCurlGoal">更新数据</a> 
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
                                                    <div class="progressphotobefore" style="background-image: url(<%=resourceRootPath %>/img/d42c65949cce4799b0c40009562b646b-196x196.jpg)">
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
                                                    <div class="progressphotocurrent" style="background-image: url(<%=resourceRootPath %>/img/89ef486aed63462a84745ca62dc0f847-196x196.jpg)">
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

        <%--start：弹出窗口--%>
        <div class="modal fade" id="updateCurrentWeight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" style="color: white;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
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
                                            <td><span class="updateCurrentWeight_calendartext"><%=DateTime.Now.ToString("yyyy-MM-dd") %></span></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-md-3">
                                    <table class="updateCurrentWeight_weighttable">
                                        <tr>
                                            <td>
                                                <input id="updateCurrentWeight_weightinput" class="updateCurrentWeight_weightinput" type="number" onkeyup="CheckUpdateCurrentWeight_weightinput(this.value)" />
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
                                            <td rowspan="3"><i class="fa fa-arrows-h fa-5x updateCurrentWeight_directionstyle"></i></td>
                                            <td class="updateCurrentWeight_weightdescdirection"><span id="updateCurrentWeight_weightdesctable_changeDirection">没有变化</span></td>

                                        </tr>
                                        <tr>
                                            <td class="updateCurrentWeight_weightdescvalue"><span style="font-family: 'Times New Roman';" id="updateCurrentWeight_weightdesctable_changeAmount">0</span>千克</td>
                                        </tr>
                                        <tr>
                                            <td class="updateCurrentWeight_weightdescdaycount">在<span id="updateCurrentWeight_weightdesctable_changeDayCount"><%=LastWeightMeasuredDayInterval %></span>天之内</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="updateCurrentWeight()">更新</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="updateCurrentBF" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" style="color: white;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
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
                                            <td><span class="updateCurrentWeight_calendartext"><%=DateTime.Now.ToString("yyyy-MM-dd") %></span></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-md-3">
                                    <table class="updateCurrentWeight_weighttable">
                                        <tr>
                                            <td>
                                                <input id="updateCurrentBFR_bfrinput" class="updateCurrentWeight_weightinput" type="number" onkeyup="CheckUpdateCurrentBFR_bfrinput(this.value)" />
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
                                            <td rowspan="3"><i class="fa fa-arrows-h fa-5x updateCurrentBFR_directionstyle"></i></td>
                                            <td class="updateCurrentWeight_weightdescdirection"><span id="updateCurrentBFR_bfrdesctable_changeDirection">没有变化</span></td>

                                        </tr>
                                        <tr>
                                            <td class="updateCurrentWeight_weightdescvalue"><span style="font-family: 'Times New Roman';" id="updateCurrentBFR_bfrdesctable_changeAmount">0.0</span>%</td>
                                        </tr>
                                        <tr>
                                            <td class="updateCurrentWeight_weightdescdaycount">在<%=LastBFRMeasuredDayInterval %>天之内</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="updateCurrentBFR()">更新</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="deleteCurrentGoal" tabindex="-1" role="dialog" aria-labelledby="myModalLabeldelete" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" style="color: white;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
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
                        <button type="button" class="btn btn-primary" onclick="deleteCurrentBFRGoal()">继续</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade strengthGoal" id="squatsGoal" tabindex="-1" role="dialog" aria-labelledby="squatsGoalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" style="color: white;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="squatsGoalLabel"><span class="strengthTitle">力量型目标</span></h4>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div><span class="strengthSubTitle">自由杠铃深蹲</span></div>
                            <div class="strengthGoalContent">
                                <table>
                                    <tr>
                                        <td>
                                            <div class="currentLiftWeightDesc">当前您可以蹲起</div>
                                            <div class="currentLiftWeightWrap">
                                                <div>
                                                    <input min="1" id="currentLiftWeightAmount_squats" class="currentLiftWeightAmount" type="number" onkeyup="updateModel_squats($('#currentLiftWeightAmount_squats').val(),$('#currentRepsCountInput_squats').val(),$('#goalLiftWeightAmount_squats').val(),$('#goalRepsCountInput_squats').val());" onchange="updateModel_squats($('#currentLiftWeightAmount_squats').val(),$('#currentRepsCountInput_squats').val(),$('#goalLiftWeightAmount_squats').val(),$('#goalRepsCountInput_squats').val());"/>
                                                </div>
                                                <div class="currentLiftWeightUnit">千克</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="currentLiftWeightRepsWrap">
                                                <div class="currentLiftWeightRepsDesc"><span style="font-family: 'Times New Roman'; font-style: oblique;">#</span>次数</div>
                                                <div class="currentLiftWeightRepsAmount">
                                                    <span>【<span id="currentLiftWeightRepsCount_squats">8</span>】</span><div class="liftWeightOneRepMax">(单次最大重量：<span class="currentLiftWeightOneRepsMax" id="currentLiftWeightOneRepsMax_squats">0</span>千克)</div>
                                                </div>
                                                <div>
                                                    <input type="range" min="1" max="20" value="8" class="repsCountInput" id="currentRepsCountInput_squats" onchange="updateModel_squats($('#currentLiftWeightAmount_squats').val(),$('#currentRepsCountInput_squats').val(),$('#goalLiftWeightAmount_squats').val(),$('#goalRepsCountInput_squats').val());"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="height: 15px;"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="goalLiftWeightDesc">目标蹲起重量</div>
                                            <div class="goalLiftWeightWrap">
                                                <div>
                                                    <input min="1" id="goalLiftWeightAmount_squats" class="goalLiftWeightAmount" type="number" onkeyup="updateModel_squats($('#currentLiftWeightAmount_squats').val(),$('#currentRepsCountInput_squats').val(),$('#goalLiftWeightAmount_squats').val(),$('#goalRepsCountInput_squats').val());" onchange="updateModel_squats($('#currentLiftWeightAmount_squats').val(),$('#currentRepsCountInput_squats').val(),$('#goalLiftWeightAmount_squats').val(),$('#goalRepsCountInput_squats').val());"/>
                                                </div>
                                                <div class="goalLiftWeightUnit">千克</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="goalLiftWeightRepsWrap">
                                                <div class="goalLiftWeightRepsDesc"><span style="font-family: 'Times New Roman'; font-style: oblique">#</span>次数</div>
                                                <div class="goalLiftWeightRepsAmount">
                                                    <span>【<span id="goalLiftWeightRepsCount_squats">8</span>】</span><div class="liftWeightOneRepMax">(单次最大重量：<span class="goalLiftWeightOneRepsMax" id="goalLiftWeightOneRepsMax_squats">0</span>千克)</div>
                                                </div>
                                                <div>
                                                    <input type="range" min="1" max="20" value="8" class="repsCountInput" id="goalRepsCountInput_squats" onchange="updateModel_squats($('#currentLiftWeightAmount_squats').val(),$('#currentRepsCountInput_squats').val(),$('#goalLiftWeightAmount_squats').val(),$('#goalRepsCountInput_squats').val());"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="goalLiftWeightDaysCountDesc">目标达成天数</div>
                                            <div class="goalLiftWeightDaysCountWrap">
                                                <div>
                                                    <input min="1" id="goalLiftWeightDaysCountAmount_squats" class="goalLiftWeightDaysCountAmount" type="number" />
                                                </div>
                                                <div class="goalLiftWeightDaysCountUnit">天</div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="height: 15px;"></div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                        <button style="margin-right: 18px;" type="button" class="btn btn-primary" onclick="addOtherGoal_squats()">提交</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade strengthGoal" id="deadLiftGoal" tabindex="-1" role="dialog" aria-labelledby="squatsGoalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" style="color: white;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="deadLiftGoalLabel"><span class="strengthTitle">力量型目标</span></h4>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div><span class="strengthSubTitle">杠铃传统硬拉</span></div>
                            <div class="strengthGoalContent">
                                <table>
                                    <tr>
                                        <td>
                                            <div class="currentLiftWeightDesc">当前您可以拉起</div>
                                            <div class="currentLiftWeightWrap">
                                                <div>
                                                    <input min="1" id="currentLiftWeightAmount_deadLift" class="currentLiftWeightAmount" type="number" onkeyup="updateModel_deadLift($('#currentLiftWeightAmount_deadLift').val(),$('#currentRepsCountInput_deadLift').val(),$('#goalLiftWeightAmount_deadLift').val(),$('#goalRepsCountInput_deadLift').val());" onchange="updateModel_deadLift($('#currentLiftWeightAmount_deadLift').val(),$('#currentRepsCountInput_deadLift').val(),$('#goalLiftWeightAmount_deadLift').val(),$('#goalRepsCountInput_deadLift').val());"/>
                                                </div>
                                                <div class="currentLiftWeightUnit">千克</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="currentLiftWeightRepsWrap">
                                                <div class="currentLiftWeightRepsDesc"><span style="font-family: 'Times New Roman'; font-style: oblique;">#</span>次数</div>
                                                <div class="currentLiftWeightRepsAmount">
                                                    <span>【<span id="currentLiftWeightRepsCount_deadLift">8</span>】</span><div class="liftWeightOneRepMax">(单次最大重量：<span class="currentLiftWeightOneRepsMax" id="currentLiftWeightOneRepsMax_deadLift">0</span>千克)</div>
                                                </div>
                                                <div>
                                                    <input type="range" min="1" max="20" value="8" class="repsCountInput" id="currentRepsCountInput_deadLift" onchange="updateModel_deadLift($('#currentLiftWeightAmount_deadLift').val(),$('#currentRepsCountInput_deadLift').val(),$('#goalLiftWeightAmount_deadLift').val(),$('#goalRepsCountInput_deadLift').val());"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="height: 15px;"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="goalLiftWeightDesc">目标拉起重量</div>
                                            <div class="goalLiftWeightWrap">
                                                <div>
                                                    <input min="1" id="goalLiftWeightAmount_deadLift" class="goalLiftWeightAmount" type="number" onkeyup="updateModel_deadLift($('#currentLiftWeightAmount_deadLift').val(),$('#currentRepsCountInput_deadLift').val(),$('#goalLiftWeightAmount_deadLift').val(),$('#goalRepsCountInput_deadLift').val());" onchange="updateModel_deadLift($('#currentLiftWeightAmount_deadLift').val(),$('#currentRepsCountInput_deadLift').val(),$('#goalLiftWeightAmount_deadLift').val(),$('#goalRepsCountInput_deadLift').val());"/>
                                                </div>
                                                <div class="goalLiftWeightUnit">千克</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="goalLiftWeightRepsWrap">
                                                <div class="goalLiftWeightRepsDesc"><span style="font-family: 'Times New Roman'; font-style: oblique">#</span>次数</div>
                                                <div class="goalLiftWeightRepsAmount">
                                                    <span>【<span id="goalLiftWeightRepsCount_deadLift">8</span>】</span><div class="liftWeightOneRepMax">(单次最大重量：<span class="goalLiftWeightOneRepsMax" id="goalLiftWeightOneRepsMax_deadLift">0</span>千克)</div>
                                                </div>
                                                <div>
                                                    <input type="range" min="1" max="20" value="8" class="repsCountInput" id="goalRepsCountInput_deadLift" onchange="updateModel_deadLift($('#currentLiftWeightAmount_deadLift').val(),$('#currentRepsCountInput_deadLift').val(),$('#goalLiftWeightAmount_deadLift').val(),$('#goalRepsCountInput_deadLift').val());"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="goalLiftWeightDaysCountDesc">目标达成天数</div>
                                            <div class="goalLiftWeightDaysCountWrap">
                                                <div>
                                                    <input min="1" id="goalLiftWeightDaysCountAmount_deadLift" class="goalLiftWeightDaysCountAmount" type="number" />
                                                </div>
                                                <div class="goalLiftWeightDaysCountUnit">天</div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="height: 15px;"></div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                        <button style="margin-right: 18px;" type="button" class="btn btn-primary" onclick="addOtherGoal_deadLift()">提交</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade strengthGoal" id="barbellPressGoal" tabindex="-1" role="dialog" aria-labelledby="squatsGoalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" style="color: white;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="barbellPressGoalLabel"><span class="strengthTitle">力量型目标</span></h4>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div><span class="strengthSubTitle">杠铃平板卧推</span></div>
                            <div class="strengthGoalContent">
                                <table>
                                    <tr>
                                        <td>
                                            <div class="currentLiftWeightDesc">当前您可以推起</div>
                                            <div class="currentLiftWeightWrap">
                                                <div>
                                                    <input min="1" id="currentLiftWeightAmount_barbellPress" class="currentLiftWeightAmount" type="number" onkeyup="updateModel_barbellPress($('#currentLiftWeightAmount_barbellPress').val(),$('#currentRepsCountInput_barbellPress').val(),$('#goalLiftWeightAmount_barbellPress').val(),$('#goalRepsCountInput_barbellPress').val());" onchange="updateModel_barbellPress($('#currentLiftWeightAmount_barbellPress').val(),$('#currentRepsCountInput_barbellPress').val(),$('#goalLiftWeightAmount_barbellPress').val(),$('#goalRepsCountInput_barbellPress').val());"/>
                                                </div>
                                                <div class="currentLiftWeightUnit">千克</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="currentLiftWeightRepsWrap">
                                                <div class="currentLiftWeightRepsDesc"><span style="font-family: 'Times New Roman'; font-style: oblique;">#</span>次数</div>
                                                <div class="currentLiftWeightRepsAmount">
                                                    <span>【<span id="currentLiftWeightRepsCount_barbellPress">8</span>】</span><div class="liftWeightOneRepMax">(单次最大重量：<span class="currentLiftWeightOneRepsMax" id="currentLiftWeightOneRepsMax_barbellPress">0</span>千克)</div>
                                                </div>
                                                <div>
                                                    <input type="range" min="1" max="20" value="8" class="repsCountInput" id="currentRepsCountInput_barbellPress" onchange="updateModel_barbellPress($('#currentLiftWeightAmount_barbellPress').val(),$('#currentRepsCountInput_barbellPress').val(),$('#goalLiftWeightAmount_barbellPress').val(),$('#goalRepsCountInput_barbellPress').val());"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="height: 15px;"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="goalLiftWeightDesc">目标推起重量</div>
                                            <div class="goalLiftWeightWrap">
                                                <div>
                                                    <input min="1" id="goalLiftWeightAmount_barbellPress" class="goalLiftWeightAmount" type="number" onkeyup="updateModel_barbellPress($('#currentLiftWeightAmount_barbellPress').val(),$('#currentRepsCountInput_barbellPress').val(),$('#goalLiftWeightAmount_barbellPress').val(),$('#goalRepsCountInput_barbellPress').val());" onchange="updateModel_barbellPress($('#currentLiftWeightAmount_barbellPress').val(),$('#currentRepsCountInput_barbellPress').val(),$('#goalLiftWeightAmount_barbellPress').val(),$('#goalRepsCountInput_barbellPress').val());"/>
                                                </div>
                                                <div class="goalLiftWeightUnit">千克</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="goalLiftWeightRepsWrap">
                                                <div class="goalLiftWeightRepsDesc"><span style="font-family: 'Times New Roman'; font-style: oblique">#</span>次数</div>
                                                <div class="goalLiftWeightRepsAmount">
                                                    <span>【<span id="goalLiftWeightRepsCount_barbellPress">8</span>】</span><div class="liftWeightOneRepMax">(单次最大重量：<span class="goalLiftWeightOneRepsMax" id="goalLiftWeightOneRepsMax_barbellPress">0</span>千克)</div>
                                                </div>
                                                <div>
                                                    <input min="1" type="range" min="1" max="20" value="8" class="repsCountInput" id="goalRepsCountInput_barbellPress" onchange="updateModel_barbellPress($('#currentLiftWeightAmount_barbellPress').val(),$('#currentRepsCountInput_barbellPress').val(),$('#goalLiftWeightAmount_barbellPress').val(),$('#goalRepsCountInput_barbellPress').val());"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="goalLiftWeightDaysCountDesc">目标达成天数</div>
                                            <div class="goalLiftWeightDaysCountWrap">
                                                <div>
                                                    <input id="goalLiftWeightDaysCountAmount_barbellPress" class="goalLiftWeightDaysCountAmount" type="number" />
                                                </div>
                                                <div class="goalLiftWeightDaysCountUnit">天</div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="height: 15px;"></div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                        <button style="margin-right: 18px;" type="button" class="btn btn-primary" onclick="addOtherGoal_barbellPress()">提交</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade strengthGoal" id="shoulderPressGoal" tabindex="-1" role="dialog" aria-labelledby="squatsGoalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" style="color: white;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="shoulderPressGoalLabel"><span class="strengthTitle">力量型目标</span></h4>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div><span class="strengthSubTitle">杠铃肩上推举</span></div>
                            <div class="strengthGoalContent">
                                <table>
                                    <tr>
                                        <td>
                                            <div class="currentLiftWeightDesc">当前您可以推起</div>
                                            <div class="currentLiftWeightWrap">
                                                <div>
                                                    <input min="1" id="currentLiftWeightAmount_shoulderPress" class="currentLiftWeightAmount" type="number" onkeyup="updateModel_shoulderPress($('#currentLiftWeightAmount_shoulderPress').val(),$('#currentRepsCountInput_shoulderPress').val(),$('#goalLiftWeightAmount_shoulderPress').val(),$('#goalRepsCountInput_shoulderPress').val());" onchange="updateModel_shoulderPress($('#currentLiftWeightAmount_shoulderPress').val(),$('#currentRepsCountInput_shoulderPress').val(),$('#goalLiftWeightAmount_shoulderPress').val(),$('#goalRepsCountInput_shoulderPress').val());"/>
                                                </div>
                                                <div class="currentLiftWeightUnit">千克</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="currentLiftWeightRepsWrap">
                                                <div class="currentLiftWeightRepsDesc"><span style="font-family: 'Times New Roman'; font-style: oblique;">#</span>次数</div>
                                                <div class="currentLiftWeightRepsAmount">
                                                    <span>【<span id="currentLiftWeightRepsCount_shoulderPress">8</span>】</span><div class="liftWeightOneRepMax">(单次最大重量：<span class="currentLiftWeightOneRepsMax" id="currentLiftWeightOneRepsMax_shoulderPress">0</span>千克)</div>
                                                </div>
                                                <div>
                                                    <input type="range" min="1" max="20" value="8" class="repsCountInput" id="currentRepsCountInput_shoulderPress" onchange="updateModel_shoulderPress($('#currentLiftWeightAmount_shoulderPress').val(),$('#currentRepsCountInput_shoulderPress').val(),$('#goalLiftWeightAmount_shoulderPress').val(),$('#goalRepsCountInput_shoulderPress').val());"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="height: 15px;"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="goalLiftWeightDesc">目标推起重量</div>
                                            <div class="goalLiftWeightWrap">
                                                <div>
                                                    <input min="1" id="goalLiftWeightAmount_shoulderPress" class="goalLiftWeightAmount" type="number" onkeyup="updateModel_shoulderPress($('#currentLiftWeightAmount_shoulderPress').val(),$('#currentRepsCountInput_shoulderPress').val(),$('#goalLiftWeightAmount_shoulderPress').val(),$('#goalRepsCountInput_shoulderPress').val());" onchange="updateModel_shoulderPress($('#currentLiftWeightAmount_shoulderPress').val(),$('#currentRepsCountInput_shoulderPress').val(),$('#goalLiftWeightAmount_shoulderPress').val(),$('#goalRepsCountInput_shoulderPress').val());"/>
                                                </div>
                                                <div class="goalLiftWeightUnit">千克</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="goalLiftWeightRepsWrap">
                                                <div class="goalLiftWeightRepsDesc"><span style="font-family: 'Times New Roman'; font-style: oblique">#</span>次数</div>
                                                <div class="goalLiftWeightRepsAmount">
                                                    <span>【<span id="goalLiftWeightRepsCount_shoulderPress">8</span>】</span><div class="liftWeightOneRepMax">(单次最大重量：<span class="goalLiftWeightOneRepsMax" id="goalLiftWeightOneRepsMax_shoulderPress">0</span>千克)</div>
                                                </div>
                                                <div>
                                                    <input type="range" min="1" max="20" value="8" class="repsCountInput" id="goalRepsCountInput_shoulderPress" onchange="updateModel_shoulderPress($('#currentLiftWeightAmount_shoulderPress').val(),$('#currentRepsCountInput_shoulderPress').val(),$('#goalLiftWeightAmount_shoulderPress').val(),$('#goalRepsCountInput_shoulderPress').val());"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="goalLiftWeightDaysCountDesc">目标达成天数</div>
                                            <div class="goalLiftWeightDaysCountWrap">
                                                <div>
                                                    <input min="1" id="goalLiftWeightDaysCountAmount_shoulderPress" class="goalLiftWeightDaysCountAmount" type="number" />
                                                </div>
                                                <div class="goalLiftWeightDaysCountUnit">天</div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="height: 15px;"></div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                        <button style="margin-right: 18px;" type="button" class="btn btn-primary" onclick="addOtherGoal_shoulderPress()">提交</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade strengthGoal" id="barbellRowGoal" tabindex="-1" role="dialog" aria-labelledby="squatsGoalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" style="color: white;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="barbellRowGoalLabel"><span class="strengthTitle">力量型目标</span></h4>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div><span class="strengthSubTitle">杠铃划船</span></div>
                            <div class="strengthGoalContent">
                                <table>
                                    <tr>
                                        <td>
                                            <div class="currentLiftWeightDesc">当前您可以拉起</div>
                                            <div class="currentLiftWeightWrap">
                                                <div>
                                                    <input min="1" id="currentLiftWeightAmount_barbellRow" class="currentLiftWeightAmount" type="number" onkeyup="updateModel_barbellRow($('#currentLiftWeightAmount_barbellRow').val(),$('#currentRepsCountInput_barbellRow').val(),$('#goalLiftWeightAmount_barbellRow').val(),$('#goalRepsCountInput_barbellRow').val());" onchange="updateModel_barbellRow($('#currentLiftWeightAmount_barbellRow').val(),$('#currentRepsCountInput_barbellRow').val(),$('#goalLiftWeightAmount_barbellRow').val(),$('#goalRepsCountInput_barbellRow').val());"/>
                                                </div>
                                                <div class="currentLiftWeightUnit">千克</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="currentLiftWeightRepsWrap">
                                                <div class="currentLiftWeightRepsDesc"><span style="font-family: 'Times New Roman'; font-style: oblique;">#</span>次数</div>
                                                <div class="currentLiftWeightRepsAmount">
                                                    <span>【<span id="currentLiftWeightRepsCount_barbellRow">8</span>】</span><div class="liftWeightOneRepMax">(单次最大重量：<span class="currentLiftWeightOneRepsMax" id="currentLiftWeightOneRepsMax_barbellRow">0</span>千克)</div>
                                                </div>
                                                <div>
                                                    <input type="range" min="1" max="20" value="8" class="repsCountInput" id="currentRepsCountInput_barbellRow" onchange="updateModel_barbellRow($('#currentLiftWeightAmount_barbellRow').val(),$('#currentRepsCountInput_barbellRow').val(),$('#goalLiftWeightAmount_barbellRow').val(),$('#goalRepsCountInput_barbellRow').val());"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="height: 15px;"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="goalLiftWeightDesc">目标拉起重量</div>
                                            <div class="goalLiftWeightWrap">
                                                <div>
                                                    <input min="1" id="goalLiftWeightAmount_barbellRow" class="goalLiftWeightAmount" type="number" onkeyup="updateModel_barbellRow($('#currentLiftWeightAmount_barbellRow').val(),$('#currentRepsCountInput_barbellRow').val(),$('#goalLiftWeightAmount_barbellRow').val(),$('#goalRepsCountInput_barbellRow').val());" onchange="updateModel_barbellRow($('#currentLiftWeightAmount_barbellRow').val(),$('#currentRepsCountInput_barbellRow').val(),$('#goalLiftWeightAmount_barbellRow').val(),$('#goalRepsCountInput_barbellRow').val());"/>
                                                </div>
                                                <div class="goalLiftWeightUnit">千克</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="goalLiftWeightRepsWrap">
                                                <div class="goalLiftWeightRepsDesc"><span style="font-family: 'Times New Roman'; font-style: oblique">#</span>次数</div>
                                                <div class="goalLiftWeightRepsAmount">
                                                    <span>【<span id="goalLiftWeightRepsCount_barbellRow">8</span>】</span><div class="liftWeightOneRepMax">(单次最大重量：<span class="goalLiftWeightOneRepsMax" id="goalLiftWeightOneRepsMax_barbellRow">0</span>千克)</div>
                                                </div>
                                                <div>
                                                    <input type="range" min="1" max="20" value="8" class="repsCountInput" id="goalRepsCountInput_barbellRow" onchange="updateModel_barbellRow($('#currentLiftWeightAmount_barbellRow').val(),$('#currentRepsCountInput_barbellRow').val(),$('#goalLiftWeightAmount_barbellRow').val(),$('#goalRepsCountInput_barbellRow').val());"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="goalLiftWeightDaysCountDesc">目标达成天数</div>
                                            <div class="goalLiftWeightDaysCountWrap">
                                                <div>
                                                    <input min="1" id="goalLiftWeightDaysCountAmount_barbellRow" class="goalLiftWeightDaysCountAmount" type="number" />
                                                </div>
                                                <div class="goalLiftWeightDaysCountUnit">天</div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="height: 15px;"></div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                        <button style="margin-right: 18px;" type="button" class="btn btn-primary" onclick="addOtherGoal_barbellRow()">提交</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade strengthGoal" id="barbellCurlGoal" tabindex="-1" role="dialog" aria-labelledby="squatsGoalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" style="color: white;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="barbellCurlGoalLabel"><span class="strengthTitle">力量型目标</span></h4>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div><span class="strengthSubTitle">二头弯举</span></div>
                            <div class="strengthGoalContent">
                                <table>
                                    <tr>
                                        <td>
                                            <div class="currentLiftWeightDesc">当前您可以拉起</div>
                                            <div class="currentLiftWeightWrap">
                                                <div>
                                                    <input min="1" id="currentLiftWeightAmount_barbellCurl" class="currentLiftWeightAmount" type="number" onkeyup="updateModel_barbellCurl($('#currentLiftWeightAmount_barbellCurl').val(),$('#currentRepsCountInput_barbellCurl').val(),$('#goalLiftWeightAmount_barbellCurl').val(),$('#goalRepsCountInput_barbellCurl').val());" onchange="updateModel_barbellCurl($('#currentLiftWeightAmount_barbellCurl').val(),$('#currentRepsCountInput_barbellCurl').val(),$('#goalLiftWeightAmount_barbellCurl').val(),$('#goalRepsCountInput_barbellCurl').val());"/>
                                                </div>
                                                <div class="currentLiftWeightUnit">千克</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="currentLiftWeightRepsWrap">
                                                <div class="currentLiftWeightRepsDesc"><span style="font-family: 'Times New Roman'; font-style: oblique;">#</span>次数</div>
                                                <div class="currentLiftWeightRepsAmount">
                                                    <span>【<span id="currentLiftWeightRepsCount_barbellCurl">8</span>】</span><div class="liftWeightOneRepMax">(单次最大重量：<span class="currentLiftWeightOneRepsMax" id="currentLiftWeightOneRepsMax_barbellCurl">0</span>千克)</div>
                                                </div>
                                                <div>
                                                    <input type="range" min="1" max="20" value="8" class="repsCountInput" id="currentRepsCountInput_barbellCurl" onchange="updateModel_barbellCurl($('#currentLiftWeightAmount_barbellCurl').val(),$('#currentRepsCountInput_barbellCurl').val(),$('#goalLiftWeightAmount_barbellCurl').val(),$('#goalRepsCountInput_barbellCurl').val());"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="height: 15px;"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="goalLiftWeightDesc">目标拉起重量</div>
                                            <div class="goalLiftWeightWrap">
                                                <div>
                                                    <input min="1" id="goalLiftWeightAmount_barbellCurl" class="goalLiftWeightAmount" type="number" onkeyup="updateModel_barbellCurl($('#currentLiftWeightAmount_barbellCurl').val(),$('#currentRepsCountInput_barbellCurl').val(),$('#goalLiftWeightAmount_barbellCurl').val(),$('#goalRepsCountInput_barbellCurl').val());" onchange="updateModel_barbellCurl($('#currentLiftWeightAmount_barbellCurl').val(),$('#currentRepsCountInput_barbellCurl').val(),$('#goalLiftWeightAmount_barbellCurl').val(),$('#goalRepsCountInput_barbellCurl').val());"/>
                                                </div>
                                                <div class="goalLiftWeightUnit">千克</div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="goalLiftWeightRepsWrap">
                                                <div class="goalLiftWeightRepsDesc"><span style="font-family: 'Times New Roman'; font-style: oblique">#</span>次数</div>
                                                <div class="goalLiftWeightRepsAmount">
                                                    <span>【<span id="goalLiftWeightRepsCount_barbellCurl">8</span>】</span><div class="liftWeightOneRepMax">(单次最大重量：<span class="goalLiftWeightOneRepsMax" id="goalLiftWeightOneRepsMax_barbellCurl">0</span>千克)</div>
                                                </div>
                                                <div>
                                                    <input type="range" min="1" max="20" value="8" class="repsCountInput" id="goalRepsCountInput_barbellCurl" onchange="updateModel_barbellCurl($('#currentLiftWeightAmount_barbellCurl').val(),$('#currentRepsCountInput_barbellCurl').val(),$('#goalLiftWeightAmount_barbellCurl').val(),$('#goalRepsCountInput_barbellCurl').val());"/>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="goalLiftWeightDaysCountDesc">目标达成天数</div>
                                            <div class="goalLiftWeightDaysCountWrap">
                                                <div>
                                                    <input min="1" id="goalLiftWeightDaysCountAmount_barbellCurl" class="goalLiftWeightDaysCountAmount" type="number" />
                                                </div>
                                                <div class="goalLiftWeightDaysCountUnit">天</div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="height: 15px;"></div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                        <button style="margin-right: 18px;" type="button" class="btn btn-primary" onclick="addOtherGoal_barbellCurl()">提交</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade strengthGoal" id="deleteOtherGoal" tabindex="-1" role="dialog" aria-labelledby="squatsGoalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" style="color: white;"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title"><span class="strengthTitle">力量型目标</span></h4>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div><span class="strengthSubTitle" >删除目标：<span class="strengthSubTitlName">自由杠铃深蹲</span></span></div>
                            <div class="deleteStrengthGoalContent">
                                <span class="deleteCurrentGoal_message">请确定要删除力量型目标：<span class="strengthSubTitlName">自由杠铃深蹲</span>吗？</span><span class="deleteCurrentGoal_createdatetime">【该目标创建于<span class="strengthSubTitleCreateDate">2016-10-10</span>】</span>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                        <button style="margin-right: 18px;" type="button" class="btn btn-primary" onclick="deleteOtherGoal()">确定</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="goalid" value="<%=GoalID %>" />
    <input type="hidden" id="weightHistory" value="<%=WeightHistory %>" />
    <input type="hidden" id="weightHistoryDate" value="<%=WeightHistoryDate %>" />
    <input type="hidden" id="bfrHistory" value="<%=BFRHistory %>" />
    <input type="hidden" id="bfrHistoryDate" value="<%=BFRHistoryDate %>" />
    <input type="hidden" id="goalStatus" value="<%=Status %>" />


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




