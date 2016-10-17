//初始化页面
function initMyGoal() {
    initEasyPie();
    initCountdown($("#goaldatespan").html());

    initchart();
}

//初始化EasyPie插件
function initEasyPie() {
    $('#pie_fatrate').easyPieChart({
        easing: 'easeOutBounce',
        onStep: function (from, to, percent) {
            //if (percent > 80 && percent <= 100) $(this.el).find('.percent').text("很高");
            //if (percent > 60 && percent <= 80) $(this.el).find('.percent').text("高");
            //if (percent > 40 && percent <= 60) $(this.el).find('.percent').text("始终");
            //if (percent > 20 && percent <= 40) $(this.el).find('.percent').text("低");
            //if (percent > 0 && percent <= 20) $(this.el).find('.percent').text("很低");
            //$(this.el).find('.percent').text(Math.round(percent * 100) / 100);
        },
        //lineWidth: 6,
        barColor: '#00aeef',
        size: 150,
        scaleLength: 5,
        trackColor: 'black',
        lineCap: 'butt',
        lineWidth: 10
        //barColor: '#D9134F'
    });
    $('#pie_fatrate').data('easyPieChart');
}

//初始化倒计时插件
function initCountdown(days) {
    return new Countdown({
        time: 86400 * days, // 86400 seconds = 1 day
        width: 200,
        height: 50,
        rangeHi: "year",
        target: "foo1",
        labels: {
            font: "微软雅黑",
            textScale: 0.8, // Percentage of size
            weight: "normal"	// < - no comma on last item!
        },
        style: "flip"	// <- no comma on last item!
    });
}

//初始化坐标图插件
function initchart() {
    initchart_weight();
    initchart_bodyfatrate();
    initchart_leanbodyweight();
}
function initchart_weight() {

    var goalweight = [], weighthistory = [], t;
    for (var i = 0; i < 13; i++) {
        t = i + 10;
        //t = Math.floor(Math.random() * (30 + ((i % 12) * 5))) + 10;
        weighthistory.push(t);
    }

    for (var i = 0; i < 8; i++) {
        //t = Math.floor(t * 0.5);
        //t = t - Math.floor((Math.random() * t) / 2);
        t = 50;
        goalweight.push(t);
    }

    var data = [
                {
                    name: '目标体重',
                    value: goalweight,
                    color: '#0d8ecf',
                    line_width: 4
                },
                {
                    name: '历史体重',
                    value: weighthistory,
                    color: '#ef7707',
                    line_width: 1
                }
    ];

    var labels = ["2012-06-01", "2012-08-02", "2012-08-03", "2012-08-04", "2012-08-05", "2012-08-06", "2012-08-05", "2012-08-06"];
    var line = new iChart.LineBasic2D({
        render: 'chartWeightCurve',
        data: data,
        align: 'center',
        title: '您的体重变化曲线',
        //subtitle: '平均每个人访问2-3个页面(访问量单位：万)',
        //footnote: '数据来源：模拟数据',
        width: 760,
        height: 350,
        border: {
            width: [0, 0, 0, 0]
        },
        tip: {
            enable: true,
            shadow: true
        },
        legend: {
            enable: true,
            row: 1,//设置在一行上显示，与column配合使用
            column: 'max',
            valign: 'top',
            sign: 'bar',
            background_color: null,//设置透明背景
            offsetx: -80,//设置x轴偏移，满足位置需要
            border: true
        },
        crosshair: {
            enable: true,
            line_color: '#62bce9'
        },
        sub_option: {
            label: false,
            point_hollow: false
        },
        coordinate: {
            width: 640,
            height: 240,
            axis: {
                color: '#9f9f9f',
                width: [0, 0, 2, 2]
            },
            //grids: {
            //    vertical: {
            //        way: 'share_alike',
            //        value: 5
            //    }
            //},
            scale: [{
                position: 'left',
                start_scale: 0,
                end_scale: 100,
                scale_space: 10,
                scale_size: 2,
                scale_color: '#9f9f9f'
            }, {
                position: 'bottom',
                //labels: labels
            }]
        }
    });

    //开始画图
    line.draw();




}
function initchart_bodyfatrate() {

    var pv = [], ip = [], t;
    for (var i = 0; i < 8; i++) {
        t = i + 10;
        //t = Math.floor(Math.random() * (30 + ((i % 12) * 5))) + 10;
        pv.push(t);
        //t = Math.floor(t * 0.5);
        //t = t - Math.floor((Math.random() * t) / 2);
        t = 50;
        ip.push(t);
    }

    var data = [
                {
                    name: '目标体脂率',
                    value: pv,
                    color: '#0d8ecf',
                    line_width: 2
                },
                {
                    name: '历史体脂率',
                    value: ip,
                    color: '#ef7707',
                    line_width: 2
                }
    ];

    var labels = ["2012-08-01", "2012-08-02", "2012-08-03", "2012-08-04", "2012-08-05", "2012-08-06", "2012-08-05", "2012-08-06"];
    var line = new iChart.LineBasic2D({
        render: 'chartBodyfatRateCurve',
        data: data,
        align: 'center',
        title: '您的体脂率变化曲线',
        //subtitle: '平均每个人访问2-3个页面(访问量单位：万)',
        //footnote: '数据来源：模拟数据',
        width: 760,
        height: 400,
        border: {
            width: [0, 0, 0, 0]
        },
        tip: {
            enable: true,
            shadow: true
        },
        legend: {
            enable: true,
            row: 1,//设置在一行上显示，与column配合使用
            column: 'max',
            valign: 'top',
            sign: 'bar',
            background_color: null,//设置透明背景
            offsetx: -80,//设置x轴偏移，满足位置需要
            border: true
        },
        crosshair: {
            enable: true,
            line_color: '#62bce9'
        },
        sub_option: {
            label: false,
            point_hollow: false
        },
        coordinate: {
            width: 640,
            height: 240,
            axis: {
                color: '#9f9f9f',
                width: [0, 0, 2, 2]
            },
            grids: {
                vertical: {
                    way: 'share_alike',
                    value: 5
                }
            },
            scale: [{
                position: 'left',
                start_scale: 0,
                end_scale: 100,
                scale_space: 10,
                scale_size: 2,
                scale_color: '#9f9f9f'
            }, {
                position: 'bottom',
                labels: labels
            }]
        }
    });

    //开始画图
    line.draw();




}
function initchart_leanbodyweight() {

    var pv = [], ip = [], t;
    for (var i = 0; i < 8; i++) {
        t = i + 10;
        //t = Math.floor(Math.random() * (30 + ((i % 12) * 5))) + 10;
        pv.push(t);
        //t = Math.floor(t * 0.5);
        //t = t - Math.floor((Math.random() * t) / 2);
        t = 50;
        ip.push(t);
    }

    var data = [
                {
                    name: '目标净体重',
                    value: pv,
                    color: '#0d8ecf',
                    line_width: 2
                },
                {
                    name: '历史净体重',
                    value: ip,
                    color: '#ef7707',
                    line_width: 2
                }
    ];

    var labels = ["2012-08-01", "2012-08-02", "2012-08-03", "2012-08-04", "2012-08-05", "2012-08-06", "2012-08-05", "2012-08-06"];
    var line = new iChart.LineBasic2D({
        render: 'chartLeanBodyWeightCurve',
        data: data,
        align: 'center',
        title: '您的净体重变化曲线',
        //subtitle: '平均每个人访问2-3个页面(访问量单位：万)',
        //footnote: '数据来源：模拟数据',
        width: 760,
        height: 400,
        border: {
            width: [0, 0, 0, 0]
        },
        tip: {
            enable: true,
            shadow: true
        },
        legend: {
            enable: true,
            row: 1,//设置在一行上显示，与column配合使用
            column: 'max',
            valign: 'top',
            sign: 'bar',
            background_color: null,//设置透明背景
            offsetx: -80,//设置x轴偏移，满足位置需要
            border: true
        },
        crosshair: {
            enable: true,
            line_color: '#62bce9'
        },
        sub_option: {
            label: false,
            point_hollow: false
        },
        coordinate: {
            width: 640,
            height: 240,
            axis: {
                color: '#9f9f9f',
                width: [0, 0, 2, 2]
            },
            grids: {
                vertical: {
                    way: 'share_alike',
                    value: 5
                }
            },
            scale: [{
                position: 'left',
                start_scale: 0,
                end_scale: 100,
                scale_space: 10,
                scale_size: 2,
                scale_color: '#9f9f9f'
            }, {
                position: 'bottom',
                labels: labels
            }]
        }
    });

    //开始画图
    line.draw();




}

//更新当前体重
function updateCurrentWeight() {
    var goalid = $("#goalid").val();
    if (goalid == "")
    {
        bootbox.alert({
            size: 'small',
            message: "请先制定一个健身目标。"
        });
        return;
    }
    //to do:判断距离上一次更新是否超过了7天




    var startWeight = $("#startWeight").val();
    var startBFR = $("#startBodyFat").val();
    var currentweight = $("#updateCurrentWeight_weightinput").val();
    var lastWeightMesured = $("#currentweight").html();
    var currentBFR = $("#currentBFR").html();
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "updateCurrentWeight", goalID: goalid, currentWeight: currentweight },
        async: true,
        success: function (data) {
            if (data == "0") {//更新失败
                bootbox.alert({
                    size: 'small',
                    message: "更新当前体重失败。请重试！"
                });
                $('#updateCurrentWeight').modal('hide')
            }
            if (data == "1") {//数据库更新成功，更新前台数据
                $('#updateCurrentWeight').modal('hide')

                $("#currentweight").html(currentweight);//更新当前体重
                $("#leanbodyweight").html(((1 - currentBFR / 100) * currentweight).toFixed(1));//更新当前瘦体重
                $("#bodyfatweight").html((currentBFR / 100 * currentweight).toFixed(1));//更新当前体脂肪重量

                //更新体重变化
                var totalWeightChange = currentweight - startWeight;
                if (totalWeightChange > 0)
                {
                    $("#weightchange").html((totalWeightChange).toFixed(1));
                    $("#weightChangeDirection").html("总共增加");
                }
                else
                {
                    $("#weightchange").html((0 - totalWeightChange).toFixed(1));
                    $("#weightChangeDirection").html("总共减少");
                }

                //更新瘦体重变化
                var totalLeanBodyWeightChange = currentweight * (100 - currentBFR) / 100 - startWeight * (100 - startBFR) / 100;
                if(totalLeanBodyWeightChange > 0)
                {
                    $("#leanbodyweightchange").html(totalLeanBodyWeightChange.toFixed(1));
                    $("#leanBodyWeightChangeDirection").html("总共增加");
                }
                else
                {
                    $("#leanbodyweightchange").html(0 - totalLeanBodyWeightChange.toFixed(1));
                    $("#leanBodyWeightChangeDirection").html("总共减少");
                }

                //更新体脂肪变化
                var totalBodyfatWeightChange = currentweight * currentBFR / 100 - startWeight * startBFR / 100;
                if(totalBodyfatWeightChange > 0)
                {
                    $("#bodyfatweightchange").html(totalBodyfatWeightChange.toFixed(1));
                    $("bodyfatWeightChangeDirection").html("总共增加");
                }
                else
                {
                    $("#bodyfatweightchange").html(0 - totalBodyfatWeightChange.toFixed(1));
                    $("bodyfatWeightChangeDirection").html("总共减少");
                }

                //to do:更新三个图表

            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("更新体重时ajax调用出错了");
            alert(errorThrown);
        }
    });
}

//更新当前体脂率
function updateCurrentBFR()
{
    var goalid = $("#goalid").val();
    if (goalid == "") {
        bootbox.alert({
            size: 'small',
            message: "请先制定一个健身目标。"
        });
        return;
    }


    var startWeight = $("#startWeight").val();
    var startBFR = $("#startBodyFat").val();
    var currentbfr = $("#updateCurrentBFR_bfrinput").val();
    var lastBFRMesured = $("#currentBFR").html();
    var currentWeight = $("#currentweight").html();
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "updateCurrentBFR", goalID: goalid, currentBFR: currentbfr },
        async: true,
        success: function (data) {
            if (data == "0") {//更新失败
                bootbox.alert({
                    size: 'small',
                    message: "更新当前体脂率失败。请重试！"
                });
                $('#updateCurrentBF').modal('hide')
            }
            if (data == "1") {//数据库更新成功，更新前台数据
                $('#updateCurrentBF').modal('hide')

                $("#currentBFR").html(currentbfr);//更新当前体脂率
                $("#leanbodyweight").html(((1 - currentbfr / 100) * currentWeight).toFixed(1));//更新当前瘦体重
                $("#bodyfatweight").html((currentbfr / 100 * currentWeight).toFixed(1));//更新当前体脂肪重量

                //更新体脂率变化
                var totalbfrChange = currentbfr - startBFR;
                if (totalbfrChange > 0) {
                    $("#BFRchange").html((totalbfrChange).toFixed(1));
                    $("#BFRChangeDirection").html("总共增加");
                    
                }
                else {
                    $("#BFRchange").html((0 - totalbfrChange).toFixed(1));
                    $("#BFRChangeDirection").html("总共减少");
                }

                //更新瘦体重变化
                var totalLeanBodyWeightChange = currentWeight * (100 - currentbfr) / 100 - startWeight * (100 - startBFR) / 100;
                if (totalLeanBodyWeightChange > 0) {
                    $("#leanbodyweightchange").html(totalLeanBodyWeightChange.toFixed(1));
                    $("#leanBodyWeightChangeDirection").html("总共增加");
                }
                else {
                    $("#leanbodyweightchange").html(0 - totalLeanBodyWeightChange.toFixed(1));
                    $("#leanBodyWeightChangeDirection").html("总共减少");
                }

                //更新体脂肪变化
                var totalBodyfatWeightChange = currentWeight * currentbfr / 100 - startWeight * startBFR / 100;
                if (totalBodyfatWeightChange > 0) {
                    $("#bodyfatweightchange").html(totalBodyfatWeightChange.toFixed(1));
                    $("bodyfatWeightChangeDirection").html("总共增加");
                }
                else {
                    $("#bodyfatweightchange").html(0 - totalBodyfatWeightChange.toFixed(1));
                    $("bodyfatWeightChangeDirection").html("总共减少");
                }

                //to do:更新三个图表

            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("更新体脂率ajax调用出错了");
            alert(errorThrown);
        }
    });
}

//删除当前“体重、体脂率”健身目标
function deleteCurrentBFRGoal() {
    var goalid = $("#goalid").val();
    if (goalid == "") {
        bootbox.alert({
            size: 'small',
            message: "请先制定一个健身目标。"
        });
        return;
    }

    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "deleteCurrentBFRGoal", goalID:goalid },
        async: true,
        success: function (data) {
            if (data == "0") {//删除失败
                bootbox.alert({
                    size: 'small',
                    message: "删除当前健身目标失败。请重试！"
                });
                $('#deleteCurrentGoal').modal('hide')
            }
            if (data == "1") {//数据库更新成功，更新前台数据
                $('#deleteCurrentGoal').modal('hide')

                location.reload(true);

            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("删除当前目标ajax调用出错了");
            alert(errorThrown);
            ret = -1
        }
    });
}

//根据输入的体重值，更新页面数据
function CheckUpdateCurrentWeight_weightinput(inputValue) {
    if (inputValue * 1 >= 500) {
        $("#updateCurrentWeight_weightinput").val("");
        bootbox.alert({
            size: 'small',
            message: "您的体重似乎不太可能超过500公斤！请您重新输入。"
        });
        return;
    }
    var lastWeightMeasured = $("#currentweight").html();
    if (inputValue > 10) {
        if (inputValue * 1 > lastWeightMeasured * 1) {

            $("#updateCurrentWeight_weightdesctable_changeDirection").html("增加了");
            $("#updateCurrentWeight_weightdesctable_changeAmount").html((inputValue - lastWeightMeasured).toFixed(1));
            $(".updateCurrentWeight_directionstyle").attr("class", "fa fa-long-arrow-up fa-5x updateCurrentWeight_directionstyle");
            $(".updateCurrentWeight_directionstyle").css("color", "#F00000");
            //$("#updateCurrentWeight_weightdesctable_changeDayCount").html();
        }
        else if (inputValue * 1 < lastWeightMeasured * 1) {
            $("#updateCurrentWeight_weightdesctable_changeDirection").html("减少了");
            $("#updateCurrentWeight_weightdesctable_changeAmount").html((lastWeightMeasured - inputValue).toFixed(1));
            $(".updateCurrentWeight_directionstyle").attr("class", "fa fa-long-arrow-down fa-5x updateCurrentWeight_directionstyle");
            $(".updateCurrentWeight_directionstyle").css("color", "#003399");

            //$("#updateCurrentWeight_weightdesctable_changeDayCount").html();
        }
        else {
            $("#updateCurrentWeight_weightdesctable_changeDirection").html("没有变化");
            $("#updateCurrentWeight_weightdesctable_changeAmount").html((lastWeightMeasured - inputValue).toFixed(1));
            $(".updateCurrentWeight_directionstyle").attr("class", "fa fa-arrows-h fa-5x updateCurrentWeight_directionstyle");
            $(".updateCurrentWeight_directionstyle").css("color", "#CCCCCC");
            //$("#updateCurrentWeight_weightdesctable_changeDayCount").html();
        }
    }
}

//根据输入的体脂率，更新页面数据
function CheckUpdateCurrentBFR_bfrinput(inputValue) {
    if (inputValue * 1 > 60) {
        $("#updateCurrentBFR_bfrinput").val("");
        bootbox.alert({
            size: 'small',
            message: "您的体脂率似乎不太可能超过60%！请您重新输入。"
        });
        return;
    }

    var lastBFRMeasured = $("#currentBFR").html();
    if (inputValue * 1 > lastBFRMeasured * 1) {
        $("#updateCurrentBFR_bfrdesctable_changeDirection").html("增加了");
        $("#updateCurrentBFR_bfrdesctable_changeAmount").html((inputValue - lastBFRMeasured).toFixed(1));
        $(".updateCurrentBFR_directionstyle").attr("class", "fa fa-long-arrow-up fa-5x updateCurrentBFR_directionstyle");
        $(".updateCurrentBFR_directionstyle").css("color", "#F00000");
    }
    else if (inputValue * 1 < lastBFRMeasured * 1) {
        $("#updateCurrentBFR_bfrdesctable_changeDirection").html("减少了");
        $("#updateCurrentBFR_bfrdesctable_changeAmount").html((lastBFRMeasured - inputValue).toFixed(1));
        $(".updateCurrentBFR_directionstyle").attr("class", "fa fa-long-arrow-down fa-5x updateCurrentBFR_directionstyle");
        $(".updateCurrentBFR_directionstyle").css("color", "#003399");
    }
    else {
        $("#updateCurrentBFR_bfrdesctable_changeDirection").html("没有变化");
        $("#updateCurrentBFR_bfrdesctable_changeAmount").html((lastBFRMeasured - inputValue).toFixed(1));
        $(".updateCurrentBFR_directionstyle").attr("class", "fa fa-arrows-h fa-5x updateCurrentBFR_directionstyle");
        $(".updateCurrentBFR_directionstyle").css("color", "#CCCCCC");
    }
}



//function deleteCurrentBFRGoal()
//{
//    bootbox.alert({
//        title: "删除目标",
//        message: "<span style=\"font-size:16px;\">您确定要删除当前健身目标吗？</span>",
//        callback: function (result) {
//            //console.log('This was logged in the callback: ' + result);
//        }
//    });
//}
