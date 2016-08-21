<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/generalMaster.Master" AutoEventWireup="true" CodeBehind="ExerciseContent.aspx.cs" Inherits="zhenyuFitness.Pages.Exercises.ExerciseContent" EnableViewState="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>动作内容页</title>
    <!-- EASY PIE CHART -->
    <script src="../../js/jquery-easing/jquery.easing.min.js"></script>
    <script type="text/javascript" src="../../js/easypiechart/jquery.easypiechart.min.js"></script>
    <!-- SPARKLINES -->
    <script type="text/javascript" src="../../js/sparklines/jquery.sparkline.min.js"></script>
    <!-- VideoJs -->
    <link href="../../js/jQuery-video5.8/jQuery-video5.8/css/video-js.min.css" rel="stylesheet" />
    <script src="../../js/jQuery-video5.8/jQuery-video5.8/js/video.min.js"></script>
    <link href="../../js/prettify/prettify.css" rel="stylesheet" />
    <!-- RATY -->
    <script type="text/javascript" src="../../js/jquery-raty/jquery.raty.min.js"></script>
    <script src="../../js/prettify/prettify.js"></script>
    <script src="../../js/jsCustom.js"></script>
    <script src="../../js/underscore.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="row">
        <div class="col-md-12">
            <!-- BOX -->
            <div class="box border">
                <div class="box-title">
                    <h4>
                        <img src="../../img/4gears.png" height="20px;" style="margin-bottom: 5px;" /></i><span class="hidden-inline-mobile" style="font-family: 微软雅黑;">&nbsp;<%=officalName %></span></h4>
                </div>
                <div class="box-body">
                    <div class="tabbable header-tabs user-profile">
                        <ul class="nav nav-tabs">
                            <%--<li><a href="#pro_help" data-toggle="tab"><i class="fa fa-question"></i> <span class="hidden-inline-mobile"> Help</span></a></li>--%>
                            <li><a href="#pro_edit" data-toggle="tab"><i class="fa fa-edit"></i><span class="hidden-inline-mobile">评论</span></a></li>
                            <li class="active"><a href="#pro_overview" data-toggle="tab"><i class="fa fa-book "></i><span class="hidden-inline-mobile">详述</span></a></li>
                        </ul>
                        <div class="tab-content">
                            <!-- OVERVIEW -->
                            <div class="tab-pane fade in active" id="pro_overview">
                                <div class="row">
                                    <!-- PROFILE PIC -->
                                    <div class="col-md-3">
                                        <div class="list-group">

                                            <li class="list-group-item zero-padding">

                                                <a href="#" data-toggle="modal" data-target="#myModal">


                                                    <link href="../../css/Hover_css/component.css" rel="stylesheet" />
                                                    <link href="../../css/Hover_css/normalize.css" rel="stylesheet" />
                                                    <div class="grid">
                                                        <figure class="effect-bubba">

                                                            <img src="<%=this.picExercise %>" alt="" />
                                                            <figcaption>
                                                                <p>点击后轮播该动作图片集</p>

                                                            </figcaption>
                                                        </figure>
                                                    </div>
                                                </a>
                                                <div class="modal fade " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                                    <div class="modal-dialog" role="img" style="width: 1000px;">
                                                        <div class="modal-content">
                                                            <div class="modal-body">


                                                                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                                                    <!-- Indicators -->
                                                                    <ol class="carousel-indicators">
                                                                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                                                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                                                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                                                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                                                                    </ol>

                                                                    <!-- Wrapper for slides -->
                                                                    <div class="carousel-inner" role="listbox">
                                                                        <div class="item active">
                                                                            <img src="<%=picMaleStart %>" />
                                                                            <div class="carousel-caption">
                                                                                开始-男士
                                                                            </div>
                                                                        </div>
                                                                        <div class="item">
                                                                            <img src="<%=picMaleEnd %>" />
                                                                            <div class="carousel-caption">
                                                                                结束-男士
                                                                            </div>
                                                                        </div>
                                                                        <div class="item">
                                                                            <img src="<%=picFemaleStart %>" />
                                                                            <div class="carousel-caption">
                                                                                开始-女士
                                                                            </div>
                                                                        </div>
                                                                        <div class="item">
                                                                            <img src="<%=picFemaleEnd %>" />
                                                                            <div class="carousel-caption">
                                                                                结束-女士
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <!-- Controls -->
                                                                    <a class="carousel-control left" href="#carousel-example-generic"
                                                                        data-slide="prev" style="font-size: 60px">&lsaquo;</a>
                                                                    <a class="carousel-control right" href="#carousel-example-generic"
                                                                        data-slide="next" style="font-size: 60px">&rsaquo;</a>
                                                                </div>



                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>


















                                            <div class="list-group-item profile-details">
                                                <h2 style="font-family: 黑体"><%=officalName %></h2>
                                                <%--<p><i class="fa fa-circle text-green"></i>Online</p>--%>
                                                <p><%=overrall %></p>
                                                <%--<p><a href="#">www.jenniferblogs.com</a></p>--%>
                                                <ul class="list-inline">

                                                    <li><a href="#">
                                                        <img style="width: 30px; height: 30px;" src="../../img/chineseSocial/微信.jpg" /></a>
                                                    </li>
                                                    <li><a href="#">
                                                        <img style="width: 30px; height: 30px;" src="../../img/chineseSocial/微信朋友圈.jpg" /></a>
                                                    </li>
                                                    <li><a href="#">
                                                        <img style="width: 30px; height: 30px;" src="../../img/chineseSocial/新浪微博.jpg" /></a>
                                                    </li>
                                                    <li><a href="#">
                                                        <img style="width: 30px; height: 30px;" src="../../img/chineseSocial/qq空间.jpg" /></a>
                                                    </li>
                                                    <%--<li><a href="#">
                                                        <img style="width: 30px; height: 30px;" src="../../img/chineseSocial/人人网.jpg" /></a>
                                                    </li>--%>
                                                </ul>
                                            </div>



                                            <li class="list-group-item">
                                                <i class="fa fa-check-circle fa-fw"></i>主要肌肉：&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href="ExercisesList.aspx?muscleID=<%= mainMuscleID%>"><span style="font-size: 10px; font-family: 黑体"><%=mainMuscleName %></span></a>
                                            </li>
                                            <li class="list-group-item">
                                                <i class="fa fa-check-circle-o fa-fw"></i>次要肌肉：&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href="ExercisesList.aspx?muscleID=<%=otherMuscleIDsList[0] %>"><span style="font-size: 10px; font-family: 黑体"><%=otherMuscleNames[0] %></span></a>
                                                <%--超过1个肌肉的模板--%>
                                                <%--<br /><a href="#" style="margin-left: 102px"><span style="font-size: 10px; font-family: 黑体">三角肌</span></a>--%>
                                                <%=Html_morethanoneOtherMuscle %>
                                            </li>
                                            <li class="list-group-item">
                                                <i class="fa fa-random fa-fw"></i>动作类型：&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href="ExercisesList.aspx?mechanicType=<%=mechanicType %>"><span style="font-size: 10px; font-family: 黑体"><%=mechanicTypeName %></span></a>
                                            </li>
                                            <li class="list-group-item">
                                                <i class="fa fa-gear fa-fw"></i>所需器械：&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href="ExercisesList.aspx?equipmentID=<%=equipmentID %>"><span style="font-size: 10px; font-family: 黑体"><%=equipmentName %></span></a>
                                            </li>
                                            <li class="list-group-item">
                                                <i class="fa fa-eraser fa-fw"></i>发力形式：&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href="ExercisesList.aspx?force=<%=force %>"><span style="font-size: 10px; font-family: 黑体"><%=forceName %></span></a>
                                            </li>
                                            <%--                                            <a href="#" class="list-group-item">
                                                <span class="badge badge-red">9</span>
                                                <i class="fa fa-calendar fa-fw"></i>Events
                                            </a>
                                            <a href="#" class="list-group-item"><i class="fa fa-comment-o fa-fw"></i>Messages</a>
                                            <a href="#" class="list-group-item"><i class="fa fa-picture-o fa-fw"></i>Photos</a>
                                            <a href="#" class="list-group-item"><i class="fa fa-cog fa-fw"></i>Settings</a>--%>
                                        </div>
                                    </div>
                                    <!-- /PROFILE PIC -->
                                    <!-- PROFILE DETAILS -->
                                    <div class="col-md-9">
                                        <!-- ROW 1 -->
                                        <div class="row">
                                            <div class="col-md-7 profile-details">
                                                <h3>各项评分</h3>
                                                <div class="row">
                                                    <div class="col-md-4 text-center">
                                                        <div id="pie_1" class="piechart" data-percent="<%=rate*10 %>">
                                                            <span class="percent" id="textScore"></span>
                                                        </div>
                                                        <div class="skill-name" title="FitSpace社区会员对此动作的评分的平均值">会员评分</div>
                                                    </div>
                                                    <div class="col-md-4 text-center">
                                                        <div id="pie_2" class="piechart" data-percent="<%=level %>">
                                                            <span class="percent"></span>
                                                        </div>
                                                        <div class="skill-name" title="菜鸟入门的难度">动作难度</div>
                                                    </div>
                                                    <div class="col-md-4 text-center">
                                                        <div id="pie_3" class="piechart" data-percent="<%=exerciseValue %>">
                                                            <span class="percent"></span>
                                                        </div>
                                                        <div class="skill-name">动作价值</div>
                                                    </div>
                                                </div>
                                                <div class="divide-20"></div>
                                                <!-- BUTTONS -->
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <a class="btn btn-danger btn-icon input-block-level" href="javascript:void(0);" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                                            <i class="fa fa-magic fa-2x"></i>
                                                            <div>评分</div>
                                                            <%--<span class="label label-right label-warning">4</span>--%>
                                                        </a>

                                                    </div>
                                                    <div class="col-md-3">
                                                        <a class="btn btn-primary btn-icon input-block-level" href="javascript:void(0);">
                                                            <i class="fa fa-users fa-2x"></i>
                                                            <div>社区</div>

                                                        </a>
                                                    </div>
                                                    <div class="col-md-3" id="divLike">
                                                        <a class="btn btn-pink btn-icon input-block-level" href="javascript:void(0);">
                                                            <%=Html_IsLike %>

                                                        </a>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <a class="btn btn-success btn-icon input-block-level" href="javascript:void(0);">
                                                            <i class="fa fa-print fa-2x"></i>
                                                            <div>打印</div>
                                                        </a>
                                                    </div>
                                                </div>
                                                <%--<div class="collapse" id="collapseExample">
                                                    <div class="well" style="background-color: rgba(143, 198, 239, 0.92)">
                                                        <div>
                                                            <span><i class="fa fa-pencil"></i>&nbsp;<span style="font-family: 宋体; font-size: 13px">当前共<span id="rateCount" style="font-family: 'Times New Roman'; font-style: oblique; font-size: 15px; color: #e66161"><%=rateUserCount %></span>位会员对此动作进行了评分。</span></span>
                                                            <br />
                                                            <span style="font-size: 20px; color: #2465ed">您的评分为：</span><span id="number-demo"></span><span style="font-family: 'Times New Roman'; font-size: 45px; padding-left: 10px; color: #e66161" id="yourScore"><%= yourRate %></span>
                                                            
                                                        </div>

                                                    </div>
                                                </div>--%>

                                                <!-- /BUTTONS -->
                                            </div>
                                            <div class="col-md-5">
                                                <!-- BOX -->
                                                <div class="box border inverse" id="plaerDiv">
                                                    <div class="box-title">
                                                        <span style="font-family: 微软雅黑"><i class="fa fa-video-camera"></i>&nbsp;动作视频</span>
                                                        <div class="tools">
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <video id="sample_video" preload="none" class="video-js vjs-default-skin vjs-big-play-centered" width='278'
                                                            poster="<%=videoPoster %>"
                                                            data-setup='{ "controls": true, "autoplay": false, "preload": "none", "height": 252 }'>
                                                            <source src="<%=video %>" type='video/mp4' />

                                                            <%--<!-- 如果浏览器不兼容HTML5则使用flash播放 -->
                                                                        <object id="sample_video" class="vjs-flash-fallback" width="852"
                                                                            height="480" type="application/x-shockwave-flash"
                                                                            data="http://releases.flowplayer.org/swf/flowplayer-3.2.1.swf">
                                                                            <param name="movie"
                                                                                value="http://releases.flowplayer.org/swf/flowplayer-3.2.1.swf" />
                                                                            <param name="allowfullscreen" value="true" />
                                                                            <param name="flashvars" value='config={"playlist":["images/sample_video_poster.png", {"url": "videos/sample_video.mp4","autoPlay":false,"autoBuffering":true}]}' />
                                                                            <!-- 视频图片. -->
                                                                            <img src="images/sample_video.png" width="852"
                                                                                height="480" alt="Poster Image"
                                                                                title="No video playback capabilities." />
                                                                        </object>--%>
                                                        </video>
                                                        <%--<div class="sparkline-row">
																			<span class="title">Profile Visits</span>
																			<span class="value">7453</span>
																			<div class="linechart linechart-lg">1:3,2.8:4,3:3,4:3.4,5:7.5,6:2.3,7:5.4</div>
																		</div>
																		<div class="sparkline-row">
																			<span class="title">Account balance</span>
																			<span class="value"><i class="fa fa-usd"></i> 45,732</span>
																			<span class="sparkline big" data-color="blue">16,6,23,14,12,10,15,4,19,18,4,24</span>
																		</div>
																		<div class="sparkline-row">
																			<span class="title">Revenue distribution</span>
																			<span class="value"><i class="fa fa-usd"></i> 25,674</span>
																			<span class="sparklinepie big">16,6,23</span>
																		</div>--%>
                                                    </div>
                                                </div>
                                                <!-- /BOX -->
                                                <!-- /SAMPLE -->
                                            </div>
                                        </div>
                                        <div class="collapse" id="collapseExample">
                                            <div class="well" style="background-color: rgba(143, 198, 239, 0.92)">
                                                <div>
                                                    <span><i class="fa fa-pencil"></i>&nbsp;<span style="font-family: 微软雅黑; font-size: 14px">当前共<span id="rateCount" style="font-family: 'Times New Roman'; font-style: oblique; font-size: 15px; color: #e66161"><%=rateUserCount %></span>位会员对此动作进行了评分。您的评分将计入总分，多次评分将会覆盖。<br />
                                                        <span style="font-size: 12px; font-family: 微软雅黑"><i class="fa fa-gear"></i>&nbsp;最终得分计分规则：<br />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当会员评分人数 > 最小会员评分人数阈值时，[最终得分]=[会员评分总和]/[会员评分人员]；<br />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当会员评分人数 <= 最小会员评分人数阈值时，[最终得分]=[系统默认得分]。</span></span></span>
                                                    <br />
                                                    <span style="font-size: 20px; color: #2465ed">您的评分为：</span><span id="number-demo"></span><span style="font-family: 'Times New Roman'; font-size: 45px; padding-left: 10px; color: #e66161" id="yourScore"><%= Data_yourRate %></span>

                                                </div>

                                            </div>
                                        </div>
                                        <!-- /ROW 1 -->
                                        <div class="divide-40"></div>
                                        <!-- ROW 2 -->
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="box border blue">
                                                    <div class="box-title">
                                                        <h4><i class="fa fa-th-list"></i><span class="hidden-inline-mobile">动作综述</span></h4>
                                                    </div>
                                                    <div class="box-body">
                                                        <div class="tabbable">
                                                            <ul class="nav nav-tabs">
                                                                <li><a href="#altivative" data-toggle="tab"><i class="fa fa-retweet"></i><span class="hidden-inline-mobile" style="font-family: Arial, Helvetica, sans-serif; font-size: 14px">替代动作</span></a></li>
                                                                <li><a href="#variant" data-toggle="tab"><i class="fa fa-arrows"></i><span class="hidden-inline-mobile" style="font-family: Arial, Helvetica, sans-serif; font-size: 14px">动作变化</span></a></li>
                                                                <li><a href="#notice" data-toggle="tab"><i class="fa fa-eye"></i><span class="hidden-inline-mobile" style="font-family: Arial, Helvetica, sans-serif; font-size: 14px">注意点</span></a></li>
                                                                <li class="active"><a href="#detail" data-toggle="tab"><i class="fa fa-file-text-o "></i><span class="hidden-inline-mobile" style="font-family: Arial, Helvetica, sans-serif; font-size: 14px">动作分解</span></a></li>
                                                            </ul>
                                                            <div class="tab-content">
                                                                <div class="tab-pane" id="altivative">
                                                                    <ul class="pricing_table row">
                                                                        <%=Html_alternativesShow %>
                                                                    </ul>
                                                                </div>
                                                                <div class="tab-pane" id="variant">
                                                                    <div class="alert alert-block alert-success fade in">
                                                                        <a class="close" data-dismiss="alert" href="#" aria-hidden="true"></a>
                                                                        <p>
                                                                            <h4><i class="fa  fa-check-square-o"></i>&nbsp;动作的细微变化会导致锻炼的侧重点不同</h4>
                                                                            <%=variantion %>
                                                                        </p>
                                                                    </div>

                                                                </div>
                                                                <div class="tab-pane" id="notice">
                                                                    <h4 style="color: #ef5858; font-family: 微软雅黑"><i class="fa fa-exclamation-triangle"></i>&nbsp;进行<span><%=this.officalName %></span>时必须注意以下几点：</h4>
                                                                    <%=Html_ListCaution %>
                                                                </div>
                                                                <div class="tab-pane active" id="detail">
                                                                    <div class="box-body">
                                                                        <div class="alert alert-block alert-info fade in">
                                                                            <a class="close" data-dismiss="alert" href="#" aria-hidden="true"></a>
                                                                            <p>
                                                                                <h4><i class="fa fa-check-square-o"></i>&nbsp;动作开始</h4>
                                                                                <%=Listdetail[0] %>
                                                                            </p>
                                                                        </div>
                                                                        <div class="alert alert-block alert-info fade in">
                                                                            <a class="close" data-dismiss="alert" href="#" aria-hidden="true"></a>
                                                                            <p>
                                                                                <h4><i class="fa fa-check-square-o"></i>&nbsp;动作过程</h4>
                                                                                <%=Listdetail[1] %>
                                                                            </p>
                                                                        </div>
                                                                        <div class="alert alert-block alert-info fade in">
                                                                            <a class="close" data-dismiss="alert" href="#" aria-hidden="true"></a>
                                                                            <p>
                                                                                <h4><i class="fa fa-check-square-o"></i>&nbsp;动作结束</h4>

                                                                                <%=Listdetail[2] %>
                                                                            </p>
                                                                        </div>
                                                                    </div>


                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /ROW 2 -->
                                    </div>
                                    <!-- /PROFILE DETAILS -->
                                </div>
                            </div>
                            <!-- /OVERVIEW -->

                            <!-- EDIT ACCOUNT -->
                            <div class="tab-pane fade" id="pro_edit">
                                <form class="form-horizontal" action="#">
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-2">
                                            <!-- BOX -->
                                            <div class="box border green chat-window">
                                                <div class="box-title">
                                                    <h4><i class="fa fa-comments"></i>会员评论</h4>
                                                    <div class="tools">
                                                    </div>
                                                </div>
                                                <div class="box-body big  col-md-12">
                                                    <div class="scroller" data-height="450px" data-always-visible="1" data-rail-visible="1" id="divComment">
                                                        <ul class="media-list chat-list" id="ul_Comment">

                                                            <%=this.Html_Comment %>
                                                            
                                                        </ul>
                                                    </div>
                                                    <div class="divide-20"></div>
                                                    <div class="chat-form">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" id="inputComment" <%--onkeydown="eKeyup(event)"--%>>
                                                            <span class="input-group-btn">
                                                                <input class="btn btn-primary" type="button" id="btn_Comment" value="提交" /></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /BOX -->
                                        </div>
                                    </div>
                                </form>

                            </div>
                            <!-- /EDIT ACCOUNT -->


                        </div>
                    </div>
                    <!-- /USER PROFILE -->
                </div>
            </div>
        </div>
        <input type="hidden" id="ratyScore" value="<%=Data_yourRate %>" />
        <input type="hidden" id="exerciseID" value="<%=this.exerciseID %>" />
    </div>
    <script>
        jQuery(document).ready(function () {
            App.setPage("exercisecontent");  //Set current page
            App.init(); //Initialise plugins and elements

            $("#btn_Comment").click(
                function () {
                    var l = strLength($('#inputComment').val());
                    if (l > 1990) {
                        bootbox.alert("您输入的评论太长了~！");
                        return;
                    }
                    //
                    $.ajax({
                        type: "POST",
                        url: "ExerciseContent.aspx",
                        data: { ajaxtype: "exerciseUserComment", exerciseID: $('#exerciseID').val(), comment: $("#inputComment").val() },
                        async: true,
                        //返回数据的格式
                        //datatype: "html",//"xml", "html", "script", "json", "jsonp", "text".
                        //在请求之前调用的函数
                        //beforeSend: function () { $("#msg").html("logining"); },
                        //成功返回之后调用的函数             
                        success: function (data) {
                            if (data == "userNotLogin") {
                                bootbox.alert("请先登录，然后进行评分。");
                            }
                            else {
                                $("#ul_Comment").prepend(data)
                                $("#divComment").scrollTop(0);
                                $('#inputComment').val("");
                            }
                        },
                        //调用执行后调用的函数
                        //complete: function (XMLHttpRequest, textStatus) {
                        //    alert(XMLHttpRequest.responseText);
                        //    alert(textStatus);
                        //    //HideLoading();
                        //},
                        //调用出错执行的函数
                        error: function () {
                            bootbox.alert("用户评分ajax调用出错了");
                        }
                    });

                });


            $('#inputComment').bind('keypress', function (event) {
                if (event.keyCode == "13") {
                    $("#btn_Comment").click();
                    event.preventDefault();
                }
            });


            //function eKeyup(e) {
            //    e = e ? e : (window.event ? window.event : null);
            //    if (e.keyCode == 13)//Enter
            //    {
            //        event.preventDefault();
            //        $("#btn_Comment").click();

            //    }
            //}

            $.fn.raty.defaults.path = '../../js/jquery-raty/img';
            $('#number-demo').raty({
                score: $("#ratyScore").val(),
                number: 10,
                click: function (score, evt) {
                    var success = "";
                    $.ajax({
                        type: "POST",
                        url: "ExerciseContent.aspx",
                        //提交的数据
                        //data: { Name: "sanmao", Password: "sanmaoword" },
                        data: { score: score, ajaxtype: "exerciseUserRate", exerciseID: $('#exerciseID').val() },
                        async: true,
                        //返回数据的格式
                        //datatype: "html",//"xml", "html", "script", "json", "jsonp", "text".
                        //在请求之前调用的函数
                        //beforeSend: function () { $("#msg").html("logining"); },
                        //成功返回之后调用的函数             
                        success: function (data) {
                            success = data;
                            if (data == "userNotLogin") {
                                $("#yourScore").html("");
                                bootbox.alert("请先登录，然后进行评分。");
                            }
                            else {
                                bootbox.alert("评分成功!");
                                if (data.newUser == "1") $("#rateCount").html(1 + parseInt($("#rateCount").html()))
                                $("#pie_1").data('easyPieChart').update(data.newScore*10);
                                $("#textScore").text(data.newScore);
                            }
                        },
                        //调用执行后调用的函数
                        //complete: function (XMLHttpRequest, textStatus) {
                        //    alert(XMLHttpRequest.responseText);
                        //    alert(textStatus);
                        //    //HideLoading();
                        //},
                        //调用出错执行的函数
                        error: function () {
                            bootbox.alert("用户评分ajax调用出错了");
                        }
                    });
                    if (success != "userNotLogin") {
                        if (score == null) $("#yourScore").html("0.0");
                        else $("#yourScore").html(score + ".0");
                    }
                },
                hints: ['1', '2', '3', '4', '5']



            });
            translateDegreePie2();
            translateDegreePie3();
        });

        $("#divLike").click(
            _.debounce(
            function () {
                var d;
                var v = $("#like").html();
                if (v == '取消') {
                    d = 0//没有赞
                    $("#like").html('点赞');
                    $("#likePic").removeClass();
                    $("#likePic").addClass("fa  fa-hand-o-up fa-2x");
                }
                else {
                    d = 1//赞
                    $("#like").html('取消');
                    $("#likePic").removeClass();
                    $("#likePic").addClass("fa fa-thumbs-o-up fa-2x");
                }

                $.ajax({
                    type: "POST",
                    url: "ExerciseContent.aspx",
                    //提交的数据
                    //data: { Name: "sanmao", Password: "sanmaoword" },
                    data: { IsLike: d, ajaxtype: "exerciseUserIsLike", exerciseID: $('#exerciseID').val() },
                    async: true,
                    //返回数据的格式
                    //datatype: "html",//"xml", "html", "script", "json", "jsonp", "text".
                    //在请求之前调用的函数
                    //beforeSend: function () { $("#msg").html("logining"); },
                    //成功返回之后调用的函数             
                    success: function (data) {
                        if (data == "userNotLogin") {
                            $("#like").html('点赞');
                            $("#likePic").addClass("fa  fa-hand-o-up fa-2x");
                            bootbox.alert("请先登录，然后进行评分。");
                        }
                        //bootbox.alert("评分成功！");
                    },
                    //调用执行后调用的函数
                    //complete: function (XMLHttpRequest, textStatus) {
                    //    alert(XMLHttpRequest.responseText);
                    //    alert(textStatus);
                    //    //HideLoading();
                    //},
                    //调用出错执行的函数
                    error: function () {
                        bootbox.alert("用户点赞ajax调用出错了");
                    }
                })
            }, 500));
    </script>
    <script>

    </script>


</asp:Content>




