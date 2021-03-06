﻿//初始化页面
function initMyGoal(v) {
    initVariable(v);
    initDatePicker();
    initEasyPie();
    initCountdown($("#goaldatespan").html());
    initchart();

    initStrengthGoal();
    //initStrengthGoalSectionButtons();
}

function initVariable(value) {
    if (value.length < 12) { alert("其他类型目标的ID数量不符。");return; }
    squatsID = value[0];
    deadLiftID = value[1];
    barbellPressID = value[2];
    shoulderPressID = value[3];
    barbellRowID = value[4];
    barbellCurlID = value[5];

    chestID = value[6]
    armID = value[7]
    waistID = value[8]
    thighID = value[9]
    shoulderID = value[10]
    hipID = value[11]
}

function initDatePicker() {
    $("#goalDaysCount").datepicker();;
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
    initchart_goalAchievePercent();
}
function initchart_weight() {//weighthistory形如：72,74,75,72
    //var interval = $("#weightCurveInterval").val();
    var weightHistory = $("#weightHistory").val().split(",");
    var weightHistoryDate = $("#weightHistoryDate").val().split(",");

    if (weightHistory.length == 1 || weightHistoryDate.length == 1) {
        if (weightHistory == "") {
            $("#chartWeightCurve").css("height", "350");
            $("#chartWeightCurve").html("<div style=\"margin-top:110px;margin-left:90px;color:#919191;font-family:微软雅黑;font-size:50px;\">您从未更新过您的体重！</div>");
            return;
        }
    }

    if (weightHistory.length != weightHistoryDate.length)
    {
        bootbox.alert({
            size: 'small',
            message: "历史体重记录和历史体重记录值不匹配。("+weightHistory.length+","+weightHistoryDate.length +")"
        });
        return;
    }

    var goalWeight = $("#goalWeight").html();
    var startWeight = $("#startWeight").html();
    var startDate = $("#goalStartDate").html();
    //goalweight：目标体重曲线；weighthistory：用户记录的体重记录；
    var goalweight = [], weighthistory = [], dateRecords = [],xlabels =[],xs = [];
    //加入起始点
    goalweight.push(goalWeight);
    weighthistory.push(startWeight);
    dateRecords.push(startDate);
    var totalRecords = weightHistory.length;

    if (totalRecords >= 26) {
        //初始化记录值
        for (var i = 0; i < totalRecords; i++) {
            goalweight.push(goalWeight);
            weighthistory.push(weightHistory[i]);
            dateRecords.push(weightHistoryDate[i]);

            xs.push(i + 1);
            if (i % 3 == 0)
                xlabels.push(i + 1);

                
        }
    }
    else
    {
        for(var i = 0;i<26;i++)
        {
            goalweight.push(goalWeight);
            xlabels.push(i);
            if(i<totalRecords)
            {
                weighthistory.push(weightHistory[i]);
                dateRecords.push(weightHistoryDate[i]);
                
                xs.push(i+1);
            }
        }
        
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

    //var labels = ["2012-06-01", "2012-08-02", "2012-08-03", "2012-08-04", "2012-08-05", "2012-08-06", "2012-08-05", "2012-08-06"];
    var line = new iChart.LineBasic2D({
        render: 'chartWeightCurve',
        data: data,
        align: 'center',
        title: {
            text: '您的体重变化曲线',
            color: '#254d70',
            font: '微软雅黑',
            size:'10px'
        },
        shadow:true,
        //subtitle: '平均每个人访问2-3个页面(访问量单位：万)',
        //footnote: '共' + totalRecords + '个体重记录',
        width: 760,
        height: 350,
        border: {
            width: [0, 0, 0, 0]
        },
        tip: {
            enable: true,
            shadow: true,
            listeners: {
                //tip:提示框对象、name:数据名称、value:数据值、text:当前文本、i:数据点的索引
                parseText: function (tip, name, value, text, i) {
                    if (name == '历史体重') {
                        if (i == 0) {
                            return "<span style='color:#005268;font-size:12px;'>目标开始时的体重：<br/>" +
                        "</span><span style='color:#005268;font-size:12px;'>记录时间：" + dateRecords[i] + "<br/>" +
                        "</span><span style='color:#005268;font-size:20px;'>" + value + "千克</span>";
                        }
                        return "<span style='color:#005268;font-size:12px;'>第" + xs[i - 1] + "次记录：<br/>" +
                        "</span><span style='color:#005268;font-size:12px;'>记录时间：" + dateRecords[i] + "<br/>" +
                        "</span><span style='color:#005268;font-size:20px;'>" + value + "千克</span>";
                    }
                    else
                    {
                        return "<span>目标体重：</span></span><span style='color:#005268;font-size:20px;'>" + value + "千克</span>";
                    }
                }
            }
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
                start_scale: startWeight * 0.45,
                end_scale: startWeight * 1.50,
                scale_space: 5,
                scale_size: 2,
                scale_color: '#9f9f9f'
            }, {
                position: 'bottom',
                labels: xlabels
            }]
        }
    });

    //利用自定义组件构造左侧说明文本
    line.plugin(new iChart.Custom({
        drawFn: function () {
            //计算位置
            var coo = line.getCoordinate(),
                x = coo.get('originx'),
                y = coo.get('originy'),
                w = coo.width,
                h = coo.height;
            //在左上侧的位置，渲染一个单位的文字
            line.target.textAlign('start')
            .textBaseline('bottom')
            .textFont('600 11px 微软雅黑')
            .fillText('体重(千克)', x - 40, y - 12, false, '#9d987a')
            .textBaseline('top')
            .fillText('(序号)', x + w + 12, y + h + 10, false, '#9d987a');

        }
    }));

    //开始画图
    line.draw();




}
function initchart_bodyfatrate() {
    var bfrHistory = $("#bfrHistory").val().split(",");
    var bfrHistoryDate = $("#bfrHistoryDate").val().split(",");
    if (bfrHistory.length == 1 || bfrHistoryDate.length == 1)
    {
        if (bfrHistory == "") {
            $("#chartBodyfatRateCurve").css("height", "350");
            $("#chartBodyfatRateCurve").html("<div style=\"margin-top:110px;margin-left:70px;color:#919191;font-family:微软雅黑;font-size:50px;\">您从未更新过您的体脂率！</div>");
            return;
        }
    }


    if (bfrHistory.length != bfrHistoryDate.length) {
        bootbox.alert({
            size: 'small',
            message: "历史体脂率记录和历史体脂率记录值不匹配。(" + bfrHistory.length + "," + bfrHistoryDate.length + ")"
        });
        return;
    }

    var goalBFR = $("#goalBFR").html();
    var startBodyFat = $("#startBodyFat").html();
    var startDate = $("#goalStartDate").html();
    //goalbfr：目标体脂率曲线；bfrhistory：用户记录的体脂率记录；
    var goalbfr = [], bfrhistory = [], dateRecords = [], xlabels = [], xs = [];
    //加入起始点
    goalbfr.push(goalBFR);
    bfrhistory.push(startBodyFat);
    dateRecords.push(startDate);
    var totalRecords = bfrHistory.length;
    if (totalRecords >= 26) {

        //初始化记录值
        for (var i = 0; i < totalRecords; i++) {
            goalbfr.push(goalBFR);
            bfrhistory.push(bfrHistory[i]);
            dateRecords.push(bfrHistoryDate[i]);

            xs.push(i + 1);
            if (i % 3 == 0)
                xlabels.push(i + 1);


        }
    }
    else {
        for (var i = 0; i < 26; i++) {
            goalbfr.push(goalBFR);
            xlabels.push(i);
            if (i < totalRecords) {
                bfrhistory.push(bfrHistory[i]);
                dateRecords.push(bfrHistoryDate[i]);
                
                xs.push(i + 1);
            }
        }

    }

    var data = [
                {
                    name: '目标体脂率',
                    value: goalbfr,
                    color: '#0d8ecf',
                    line_width: 4
                },
                {
                    name: '历史体脂率',
                    value: bfrhistory,
                    color: '#ef7707',
                    line_width: 1
                }
    ];
    //var labels = ["2012-06-01", "2012-08-02", "2012-08-03", "2012-08-04", "2012-08-05", "2012-08-06", "2012-08-05", "2012-08-06"];
    var line = new iChart.LineBasic2D({
        render: 'chartBodyfatRateCurve',
        data: data,
        align: 'center',
        title: {
            text: '您的体脂率变化曲线',
            color: '#254d70',
            font: '微软雅黑',
            size: '10px'
        },
        shadow: true,
        //subtitle: '平均每个人访问2-3个页面(访问量单位：万)',
        //footnote: '共' + totalRecords + '个体重记录',
        width: 760,
        height: 350,
        border: {
            width: [0, 0, 0, 0]
        },
        tip: {
            enable: true,
            shadow: true,
            listeners: {
                //tip:提示框对象、name:数据名称、value:数据值、text:当前文本、i:数据点的索引
                parseText: function (tip, name, value, text, i) {
                    if (name == '历史体脂率') {
                        if (i == 0) {
                            return "<span style='color:#005268;font-size:12px;'>目标开始时的体脂率：<br/>" +
                        "</span><span style='color:#005268;font-size:12px;'>记录时间：" + dateRecords[i] + "<br/>" +
                        "</span><span style='color:#005268;font-size:20px;'>" + value + "%</span>";
                        }
                        return "<span style='color:#005268;font-size:12px;'>第" + xs[i - 1] + "次记录：<br/>" +
                        "</span><span style='color:#005268;font-size:12px;'>记录时间：" + dateRecords[i] + "<br/>" +
                        "</span><span style='color:#005268;font-size:20px;'>" + value + "%</span>";
                    }
                    else {
                        return "<span>目标体脂率：</span></span><span style='color:#005268;font-size:20px;'>" + value + "%</span>";
                    }
                }
            }
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
                end_scale: startBodyFat * 1 + 10,
                scale_space: 3,
                scale_size: 2,
                scale_color: '#9f9f9f'
            }, {
                position: 'bottom',
                labels: xlabels
            }]
        }
    });

    //利用自定义组件构造左侧说明文本
    line.plugin(new iChart.Custom({
        drawFn: function () {
            //计算位置
            var coo = line.getCoordinate(),
                x = coo.get('originx'),
                y = coo.get('originy'),
                w = coo.width,
                h = coo.height;
            //在左上侧的位置，渲染一个单位的文字
            line.target.textAlign('start')
            .textBaseline('bottom')
            .textFont('600 11px 微软雅黑')
            .fillText('体脂率(%)', x - 40, y - 12, false, '#9d987a')
            .textBaseline('top')
            .fillText('(序号)', x + w + 12, y + h + 10, false, '#9d987a');

        }
    }));

    //开始画图
    line.draw();
}
function initchart_goalAchievePercent() {
    var weightHistory = $("#weightHistory").val().split(",");
    var weightHistoryDate = $("#weightHistoryDate").val().split(",");
    var bfrHistory = $("#bfrHistory").val().split(",");
    var bfrHistoryDate = $("#bfrHistoryDate").val().split(",");
    var goalWeight = $("#goalWeight").html();
    var startWeight = $("#startWeight").html();
    var goalBFR = $("#goalBFR").html();
    var startBodyFat = $("#startBodyFat").html();
    var startDate = $("#goalStartDate").html();

    if (weightHistory.length == 1 || weightHistoryDate.length == 1) {
        if (weightHistory == "") {
            if (bfrHistory.length == 1 || bfrHistoryDate.length == 1)
            {
                if(bfrHistory == "")
                {
                    $("#chartGoalAchieveRateCurve").css("height", "350");
                    $("#chartGoalAchieveRateCurve").html("<div style=\"margin-top:110px;margin-left:47px;color:#919191;font-family:微软雅黑;font-size:50px;\">您从未更新过体重和体脂率！</div>");
                    return;
                }
            }
        }
    }

    if (weightHistory.length != weightHistoryDate.length) {
        bootbox.alert({
            size: 'small',
            message: "历史体重记录和历史体重记录值不匹配。(" + weightHistory.length + "," + weightHistoryDate.length + ")"
        });
        return;
    }

    if (bfrHistory.length == 1 && weightHistory==1) {
        if (bfrHistory == "") {
            $("#chartBodyfatRateCurve").css("height", "350");
            $("#chartBodyfatRateCurve").html("<div style=\"margin-top:110px;margin-left:70px;color:#919191;font-family:微软雅黑;font-size:50px;\">您从未更新过您的体脂率！</div>");
            return;
        }
    }


    if (bfrHistory.length != bfrHistoryDate.length) {
        bootbox.alert({
            size: 'small',
            message: "历史体脂率记录和历史体脂率记录值不匹配。(" + bfrHistory.length + "," + bfrHistoryDate.length + ")"
        });
        return;
    }

    var weightAchievePercentHistory = [], bfrAchievePercent = [], weightDateRecords = [], bfrDateRecords = [], xlabels = [], xs = [];
    weightAchievePercentHistory.push(0);
    bfrAchievePercent.push(0);
    weightDateRecords.push(startDate);
    bfrDateRecords.push(startDate);

    var weightChangeDireciton = goalWeight * 1 - startWeight * 1;
    if (weightChangeDireciton > 0) weightChangeDireciton = 1;//增重
    else weightChangeDireciton = -1;//减重

    var bfrChangeDireciton = goalBFR * 1 - startBodyFat;
    if (bfrChangeDireciton > 0) bfrChangeDireciton = 1;//增脂肪（基本不可能）
    else bfrChangeDireciton = -1;//减重

    for(var i = 0;i<weightHistory.length;i++)
    {
        if (weightChangeDireciton > 0) {
            if (weightHistory[i] * 1 - startWeight < 0) {
                weightAchievePercentHistory.push(0);
            }
            else {
                weightAchievePercentHistory.push((((weightHistory[i] * 1 - startWeight) / (goalWeight * 1 - startWeight))*100).toFixed(1));
            }
        }
        else
        {
            if (weightHistory[i] * 1 - startWeight > 0)
            {
                weightAchievePercentHistory.push(0);
            }
            else {
                weightAchievePercentHistory.push((((weightHistory[i] * 1 - startWeight) / (goalWeight * 1 - startWeight))*100).toFixed(1));
            }
        }
        weightDateRecords.push(weightHistoryDate[i]);
    }
    //alert(weightDateRecords[1]);
    for (var i = 0; i < bfrHistory.length; i++) {
        if (bfrHistory[i] == "") break;

        if (bfrChangeDireciton > 0) {
            if (bfrHistory[i] * 1 - startBodyFat < 0) {
                bfrAchievePercent.push(0);
            }
            else {
                bfrAchievePercent.push((((bfrHistory[i] * 1 - startBodyFat) / (goalBFR * 1 - startBodyFat))*100).toFixed(1));
            }
        }
        else
        {
            if (bfrHistory[i] * 1 - startBodyFat > 0) {
                bfrAchievePercent.push(0);
            }
            else {
                bfrAchievePercent.push((((bfrHistory[i] * 1 - startBodyFat) / (goalBFR * 1 - startBodyFat))*100).toFixed(3));
            }
        }
        bfrDateRecords.push(bfrHistoryDate[i]);
    }

    var longerListCount;
    if (weightHistory.length > bfrHistory.length) longerListCount = weightHistory.length;
    else longerListCount = bfrHistory.length;

    

    var longX = [];//
    if (longerListCount < 26) {
        for (var i = 0; i < 26; i++) {
            longX.push(i);
            xlabels.push(i);
        }
    }
    else {
        for (var i = 0; i < longerListCount; i++) {
            xlabels.push(i);
        }
    }


    var data = [
                {
                    name: '体重指标完成率',
                    value: weightAchievePercentHistory,
                    color: '#0d8ecf',
                    line_width: 1
                },
                {
                    name: '体脂率指标完成率',
                    value: bfrAchievePercent,
                    color: '#ef7707',
                    line_width: 1
                },
                {
                    name: '',
                    value: longX,
                    color: 'rgba(0,0,0,0)',
                }
    ];

    //var labels = ["2012-06-01", "2012-08-02", "2012-08-03", "2012-08-04", "2012-08-05", "2012-08-06", "2012-08-05", "2012-08-06"];
    var line = new iChart.LineBasic2D({
        render: 'chartGoalAchieveRateCurve',
        data: data,
        align: 'center',
        title: {
            text: '健身目标完成率变化曲线',
            color: '#254d70',
            font: '微软雅黑',
            size: '10px'
        },
        shadow: true,
        //subtitle: '平均每个人访问2-3个页面(访问量单位：万)',
        //footnote: '共' + totalRecords + '个体重记录',
        width: 760,
        height: 350,
        border: {
            width: [0, 0, 0, 0]
        },
        tip: {
            enable: true,
            shadow: true,
            listeners: {
                //tip:提示框对象、name:数据名称、value:数据值、text:当前文本、i:数据点的索引
                parseText: function (tip, name, value, text, i) {
                    if (name == '体重指标完成率') {
                        return "<span style='color:#005268;font-size:12px;'>记录时间：" + weightDateRecords[i] + "<br/>" +
                        "<span>体重指标完成率：</span></span><span style='color:#005268;font-size:20px;'>" + value.toFixed(1) + "%</span>";
                    }
                    else if (name == '体脂率指标完成率') {
                        return "<span style='color:#005268;font-size:12px;'>记录时间：" + weightDateRecords[i] + "<br/>" +
                            "<span>体脂率指标完成率：</span></span><span style='color:#005268;font-size:20px;'>" + value.toFixed(1) + "%</span>";
                    }
                    else return "<span style='display:none;height:2px;width:2px;border:none;background-color:transparent;color:transparent'></span>";
                }
            }
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
                start_scale: -10,
                end_scale: 100,
                scale_space: 10,
                scale_size: 2,
                scale_color: '#9f9f9f'
            }, {
                position: 'bottom',
                labels: xlabels
            }]
        }
    });

    //利用自定义组件构造左侧说明文本
    line.plugin(new iChart.Custom({
        drawFn: function () {
            //计算位置
            var coo = line.getCoordinate(),
                x = coo.get('originx'),
                y = coo.get('originy'),
                w = coo.width,
                h = coo.height;
            //在左上侧的位置，渲染一个单位的文字
            line.target.textAlign('start')
            .textBaseline('bottom')
            .textFont('600 11px 微软雅黑')
            .fillText('完成进度(%)', x - 40, y - 12, false, '#9d987a')
            .textBaseline('top')
            .fillText('(序号)', x + w + 12, y + h + 10, false, '#9d987a');

        }
    }));

    //开始画图
    line.draw();

}

//初始化力量型目标栏目的数据
function initStrengthGoal() {
    initStrengthGoalSectionButtons();
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




    var startWeight = $("#startWeight").html();
    var startBFR = $("#startBodyFat").html();
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

function initSelect2()
{
    $("#weightCurveInterval").select2({
        tags: true,
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


    var startWeight = $("#startWeight").html();
    var startBFR = $("#startBodyFat").html();
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






///********************开始：力量型目标***************************
///估算One Rep Max
function EstimateRepMax(weightUsed, numberOfRepetitions) {
    return weightUsed / (1.0278 - (0.0278 * numberOfRepetitions));
}
///初始化力量型目标区域按钮的可见性
function initStrengthGoalSectionButtons() {
    var s = ["squats", "deadLift", "barbellPress", "shoulderPress", "barbellRow", "barbellCurl","chest","arm","waist","thigh","shoulder","hip"];
    var data = "startValueHtml_";
    var addButton = "addOtherGoal_";
    var deleteButton = "deleteOtherGoal_";
    var updateButton = "updateOtherGoal_";
    var percent = "progress_currentLiftWeightAchievedPercent_";

    var startDate = "startDateHtml_";
    var goalDays = "goalDaysLeftHtml_";
    var status = "progress_currentLiftWeightStatus_";

    for (var i = 0; i < s.length; i++) {
        if ($("#" + data + s[i]).html() == "0") {//没有进行中的目标
            $("#" + addButton + s[i]).removeClass("disableCss");
            $("#" + deleteButton + s[i]).addClass("disableCss");
            $("#" + updateButton + s[i]).addClass("disableCss");
        }
        else {//有进行中的目标
            var percent1 = $("#" + percent + s[i]).html() * 1;
            //alert(percent1);
            if (percent1 <= 100) {//未完成的目标
                if ($("#" + status + s[i]).html().indexOf("进行中") > 0) {
                    $("#" + addButton + s[i]).addClass("disableCss");
                    $("#" + deleteButton + s[i]).removeClass("disableCss");
                    $("#" + updateButton + s[i]).removeClass("disableCss");
                }
                else {//过期目标
                    $("#" + addButton + s[i]).removeClass("disableCss");
                    $("#" + deleteButton + s[i]).removeClass("disableCss");
                    $("#" + updateButton + s[i]).addClass("disableCss");
                }
                
            }
            else {//已经完成的目标
                $("#" + addButton + s[i]).removeClass("disableCss");
                $("#" + deleteButton + s[i]).removeClass("disableCss");
                $("#" + updateButton + s[i]).addClass("disableCss");
            }
            
        }
    }
}
///********************开始：目标设定***************************
//初始化力量型目标增加框
function initModal_settingGoal(type)
{
    if (type == "squats") {
        $("#currentLiftWeightAmount_squats").val("");
        $("#currentLiftWeightRepsCount_squats").html("8");
        $("#currentRepsCountInput_squats").val("8");

        $("#goalLiftWeightAmount_squats").val("");
        $("#goalLiftWeightRepsCount_squats").html("8");
        $("#goalRepsCountInput_squats").val("8");

        $("#goalLiftWeightDaysCountAmount_squats").val("");
        $("#currentLiftWeightOneRepsMax_squats").html("0");
        $("#goalLiftWeightOneRepsMax_squats").html("0");
    }
    else if (type == "deadLift") {
        $("#currentLiftWeightAmount_deadLift").val("");
        $("#currentLiftWeightRepsCount_deadLift").html("8");
        $("#currentRepsCountInput_deadLift").val("8");

        $("#goalLiftWeightAmount_deadLift").val("");
        $("#goalLiftWeightRepsCount_deadLift").html("8");
        $("#goalRepsCountInput_deadLift").val("8");

        $("#goalLiftWeightDaysCountAmount_deadLift").val("");
        $("#currentLiftWeightOneRepsMax_deadLift").html("0");
        $("#goalLiftWeightOneRepsMax_deadLift").html("0");
    }
    else if (type == "barbellPress") {
        $("#currentLiftWeightAmount_barbellPress").val("");
        $("#currentLiftWeightRepsCount_barbellPress").html("8");
        $("#currentRepsCountInput_barbellPress").val("8");

        $("#goalLiftWeightAmount_barbellPress").val("");
        $("#goalLiftWeightRepsCount_barbellPress").html("8");
        $("#goalRepsCountInput_barbellPress").val("8");

        $("#goalLiftWeightDaysCountAmount_barbellPress").val("");
        $("#currentLiftWeightOneRepsMax_barbellPress").html("0");
        $("#goalLiftWeightOneRepsMax_barbellPress").html("0");
    }
    else if (type == "shoulderPress") {
        $("#currentLiftWeightAmount_shoulderPress").val("");
        $("#currentLiftWeightRepsCount_shoulderPress").html("8");
        $("#currentRepsCountInput_shoulderPress").val("8");

        $("#goalLiftWeightAmount_shoulderPress").val("");
        $("#goalLiftWeightRepsCount_shoulderPress").html("8");
        $("#goalRepsCountInput_shoulderPress").val("8");

        $("#goalLiftWeightDaysCountAmount_shoulderPress").val("");
        $("#currentLiftWeightOneRepsMax_shoulderPress").html("0");
        $("#goalLiftWeightOneRepsMax_shoulderPress").html("0");
    }
    else if (type == "barbellRow") {
        $("#currentLiftWeightAmount_barbellRow").val("");
        $("#currentLiftWeightRepsCount_barbellRow").html("8");
        $("#currentRepsCountInput_barbellRow").val("8");

        $("#goalLiftWeightAmount_barbellRow").val("");
        $("#goalLiftWeightRepsCount_barbellRow").html("8");
        $("#goalRepsCountInput_barbellRow").val("8");

        $("#goalLiftWeightDaysCountAmount_barbellRow").val("");
        $("#currentLiftWeightOneRepsMax_barbellRow").html("0");
        $("#goalLiftWeightOneRepsMax_barbellRow").html("0");
    }
    else if (type == "barbellCurl") {
        $("#currentLiftWeightAmount_barbellCurl").val("");
        $("#currentLiftWeightRepsCount_barbellCurl").html("8");
        $("#currentRepsCountInput_barbellCurl").val("8");

        $("#goalLiftWeightAmount_barbellCurl").val("");
        $("#goalLiftWeightRepsCount_barbellCurl").html("8");
        $("#goalRepsCountInput_barbellCurl").val("8");

        $("#goalLiftWeightDaysCountAmount_barbellCurl").val("");
        $("#currentLiftWeightOneRepsMax_barbellCurl").html("0");
        $("#goalLiftWeightOneRepsMax_barbellCurl").html("0");
    }
    else {

    }
}

///start:在力量型目标框里操作时的变化
function updateModel_squats(currentLiftWeightAmount, currentRepsCount, goalLiftWeightAmount, goalRepsCount)
{
    if (currentLiftWeightAmount.length > 3) {
        $("#currentLiftWeightAmount_squats").val(parseInt(currentLiftWeightAmount / 10));
        $("#currentLiftWeightOneRepsMax_squats").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount) / 10).toFixed(0));
    }

    else
    {
        //$("#currentLiftWeightOneRepsMax").html(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightAmount_squats").val(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightOneRepsMax_squats").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount)).toFixed(0));
    }
    $('#currentLiftWeightRepsCount_squats').html(currentRepsCount);

    if (goalLiftWeightAmount.length > 3) {
        $("#goalLiftWeightAmount_squats").val(parseInt(goalLiftWeightAmount / 10));
        $("#goalLiftWeightOneRepsMax_squats").html((EstimateRepMax(goalLiftWeightAmount, goalRepsCount) / 10).toFixed(0));
    }
    else {
        $("#goalLiftWeightAmount_squats").val(parseInt(goalLiftWeightAmount));
        $("#goalLiftWeightOneRepsMax_squats").html(EstimateRepMax(goalLiftWeightAmount, goalRepsCount).toFixed(0));
    }
    $('#goalLiftWeightRepsCount_squats').html(goalRepsCount);
}

function updateModel_deadLift(currentLiftWeightAmount, currentRepsCount, goalLiftWeightAmount, goalRepsCount) {
    if (currentLiftWeightAmount.length > 3) {
        $("#currentLiftWeightAmount_deadLift").val(parseInt(currentLiftWeightAmount / 10));
        $("#currentLiftWeightOneRepsMax_deadLift").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount) / 10).toFixed(0));
    }

    else {
        //$("#currentLiftWeightOneRepsMax_deadLift").html(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightAmount_deadLift").val(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightOneRepsMax_deadLift").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount)).toFixed(0));
    }
    $('#currentLiftWeightRepsCount_deadLift').html(currentRepsCount);

    if (goalLiftWeightAmount.length > 3) {
        $("#goalLiftWeightAmount_deadLift").val(parseInt(goalLiftWeightAmount / 10));
        $("#goalLiftWeightOneRepsMax_deadLift").html((EstimateRepMax(goalLiftWeightAmount, goalRepsCount) / 10).toFixed(0));
    }
    else {
        $("#goalLiftWeightAmount_deadLift").val(parseInt(goalLiftWeightAmount));
        $("#goalLiftWeightOneRepsMax_deadLift").html(EstimateRepMax(goalLiftWeightAmount, goalRepsCount).toFixed(0));
    }
    $('#goalLiftWeightRepsCount_deadLift').html(goalRepsCount);
}

function updateModel_barbellPress(currentLiftWeightAmount, currentRepsCount, goalLiftWeightAmount, goalRepsCount) {
    if (currentLiftWeightAmount.length > 3) {
        $("#currentLiftWeightAmount_barbellPress").val(parseInt(currentLiftWeightAmount / 10));
        $("#currentLiftWeightOneRepsMax_barbellPress").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount) / 10).toFixed(0));
    }

    else {
        //$("#currentLiftWeightOneRepsMax_barbellPress").html(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightAmount_barbellPress").val(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightOneRepsMax_barbellPress").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount)).toFixed(0));
    }
    $('#currentLiftWeightRepsCount_barbellPress').html(currentRepsCount);

    if (goalLiftWeightAmount.length > 3) {
        $("#goalLiftWeightAmount_barbellPress").val(parseInt(goalLiftWeightAmount / 10));
        $("#goalLiftWeightOneRepsMax_barbellPress").html((EstimateRepMax(goalLiftWeightAmount, goalRepsCount) / 10).toFixed(0));
    }
    else {
        $("#goalLiftWeightAmount_barbellPress").val(parseInt(goalLiftWeightAmount));
        $("#goalLiftWeightOneRepsMax_barbellPress").html(EstimateRepMax(goalLiftWeightAmount, goalRepsCount).toFixed(0));
    }
    $('#goalLiftWeightRepsCount_barbellPress').html(goalRepsCount);
}

function updateModel_shoulderPress(currentLiftWeightAmount, currentRepsCount, goalLiftWeightAmount, goalRepsCount) {
    if (currentLiftWeightAmount.length > 3) {
        $("#currentLiftWeightAmount_shoulderPress").val(parseInt(currentLiftWeightAmount / 10));
        $("#currentLiftWeightOneRepsMax_shoulderPress").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount) / 10).toFixed(0));
    }

    else {
        //$("#currentLiftWeightOneRepsMax_shoulderPress").html(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightAmount_shoulderPress").val(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightOneRepsMax_shoulderPress").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount)).toFixed(0));
    }
    $('#currentLiftWeightRepsCount_shoulderPress').html(currentRepsCount);

    if (goalLiftWeightAmount.length > 3) {
        $("#goalLiftWeightAmount_shoulderPress").val(parseInt(goalLiftWeightAmount / 10));
        $("#goalLiftWeightOneRepsMax_shoulderPress").html((EstimateRepMax(goalLiftWeightAmount, goalRepsCount) / 10).toFixed(0));
    }
    else {
        $("#goalLiftWeightAmount_shoulderPress").val(parseInt(goalLiftWeightAmount));
        $("#goalLiftWeightOneRepsMax_shoulderPress").html(EstimateRepMax(goalLiftWeightAmount, goalRepsCount).toFixed(0));
    }
    $('#goalLiftWeightRepsCount_shoulderPress').html(goalRepsCount);
}

function updateModel_barbellRow(currentLiftWeightAmount, currentRepsCount, goalLiftWeightAmount, goalRepsCount) {
    if (currentLiftWeightAmount.length > 3) {
        $("#currentLiftWeightAmount_barbellRow").val(parseInt(currentLiftWeightAmount / 10));
        $("#currentLiftWeightOneRepsMax_barbellRow").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount) / 10).toFixed(0));
    }

    else {
        //$("#currentLiftWeightOneRepsMax_barbellRow").html(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightAmount_barbellRow").val(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightOneRepsMax_barbellRow").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount)).toFixed(0));
    }
    $('#currentLiftWeightRepsCount_barbellRow').html(currentRepsCount);

    if (goalLiftWeightAmount.length > 3) {
        $("#goalLiftWeightAmount_barbellRow").val(parseInt(goalLiftWeightAmount / 10));
        $("#goalLiftWeightOneRepsMax_barbellRow").html((EstimateRepMax(goalLiftWeightAmount, goalRepsCount) / 10).toFixed(0));
    }
    else {
        $("#goalLiftWeightAmount_barbellRow").val(parseInt(goalLiftWeightAmount));
        $("#goalLiftWeightOneRepsMax_barbellRow").html(EstimateRepMax(goalLiftWeightAmount, goalRepsCount).toFixed(0));
    }
    $('#goalLiftWeightRepsCount_barbellRow').html(goalRepsCount);
}

function updateModel_barbellCurl(currentLiftWeightAmount, currentRepsCount, goalLiftWeightAmount, goalRepsCount) {
    if (currentLiftWeightAmount.length > 3) {
        $("#currentLiftWeightAmount_barbellCurl").val(parseInt(currentLiftWeightAmount / 10));
        $("#currentLiftWeightOneRepsMax_barbellCurl").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount) / 10).toFixed(0));
    }

    else {
        //$("#currentLiftWeightOneRepsMax_barbellCurl").html(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightAmount_barbellCurl").val(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightOneRepsMax_barbellCurl").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount)).toFixed(0));
    }
    $('#currentLiftWeightRepsCount_barbellCurl').html(currentRepsCount);

    if (goalLiftWeightAmount.length > 3) {
        $("#goalLiftWeightAmount_barbellCurl").val(parseInt(goalLiftWeightAmount / 10));
        $("#goalLiftWeightOneRepsMax_barbellCurl").html((EstimateRepMax(goalLiftWeightAmount, goalRepsCount) / 10).toFixed(0));
    }
    else {
        $("#goalLiftWeightAmount_barbellCurl").val(parseInt(goalLiftWeightAmount));
        $("#goalLiftWeightOneRepsMax_barbellCurl").html(EstimateRepMax(goalLiftWeightAmount, goalRepsCount).toFixed(0));
    }
    $('#goalLiftWeightRepsCount_barbellCurl').html(goalRepsCount);
}
///end:在力量型目标框里操作时的变化

///start：添加力量型目标
function addOtherGoal_squats() {
    var startLiftWeight = $("#currentLiftWeightAmount_squats").val();
    var startRepsCount = $("#currentRepsCountInput_squats").val();
    var goalLiftWeight = $("#goalLiftWeightAmount_squats").val();
    var goalRepsCount = $("#goalRepsCountInput_squats").val();
    var goalDaysCount = $("#goalLiftWeightDaysCountAmount_squats").val();
    if(startLiftWeight == "" || startLiftWeight == "undefined")
    {
        AlertBasic("当前能蹲起的重量不能为空，请填写。");
        return;
    }

    if (goalLiftWeight == "" || goalLiftWeight == "undefined") {
        AlertBasic("目标蹲起重量不能为空，请填写。");
        return;
    }

    if (goalDaysCount == "" || goalDaysCount == "undefined") {
        AlertBasic("目标达成日期不能为空，请填写。");
        return;
    }
    var startLiftWeightMax = EstimateRepMax(startLiftWeight, startRepsCount).toFixed(0);
    var goalLiftWeightMax = EstimateRepMax(goalLiftWeight, goalRepsCount).toFixed(0);

    if (goalLiftWeightMax * 1 <= startLiftWeightMax * 1) {
        AlertBasic("目标重量必须大于起始重量！");
        return;
    }


    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "addOtherGoal_squats", startValue: startLiftWeightMax, goalValue: goalLiftWeightMax, goalDaysCount: goalDaysCount, type: "squats", startLiftWeight: startLiftWeight, startRepsCount: startRepsCount, goalLiftWeight: goalLiftWeight, goalRepsCount: goalRepsCount },
        async: true,
        success: function (data) {
            if (data == "2" || data == "1" || data == "0" || data == "3") {//更新失败
                if (date == "1") {
                    AlertBasic("您尚未登录！请登录后重试。")
                }
                else if(date == "2"){
                    AlertBasic("更新数据时出错，请重试！");
                }
                else if (data == "3") {
                    AlertBasic("您尚有未完成或者未到期的深蹲目标！");
                }
                else {
                    AlertBasic("什么都没有发生！");
                }
            }
            else {//数据库更新成功，更新前台数据
                //刷新前台页面
                $("#squatsGoal").modal("hide");
                AlertBasic("设定目标：自由杠铃深蹲成功。");
                $("#startValueHtml_squats").html(startLiftWeightMax);
                var nowDate = new Date();
                $("#startDateHtml_squats").html(nowDate.getFullYear() + "-" + (nowDate.getMonth() * 1 + 1).toString() + "-" + nowDate.getDate());
                $("#goalValueHtml_squats").html(goalLiftWeightMax);
                $("#goalDaysLeftHtml_squats").html(goalDaysCount);
                $("#progress_currentLiftWeightAmount_squats").html(startLiftWeightMax);
                $("#progress_currentLiftWeightAchievedPercent_squats").html(0);
                $("#progress_currentLiftWeightStatus_squats").html("<span style='color:green'>进行中</span>");
                $("#progressbar_squats").css("width", "0");

                $("#addOtherGoal_squats").addClass("disableCss");
                $("#deleteOtherGoal_squats").removeClass("disableCss");
                $("#updateOtherGoal_squats").removeClass("disableCss");

                squatsID = data.toString();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("增加深蹲目标时出错了");
            alert(errorThrown);
        }
    });
}
function addOtherGoal_deadLift() {
    var startLiftWeight = $("#currentLiftWeightAmount_deadLift").val();
    var startRepsCount = $("#currentRepsCountInput_deadLift").val();
    var goalLiftWeight = $("#goalLiftWeightAmount_deadLift").val();
    var goalRepsCount = $("#goalRepsCountInput_deadLift").val();
    var goalDaysCount = $("#goalLiftWeightDaysCountAmount_deadLift").val();
    if (startLiftWeight == "" || startLiftWeight == "undefined") {
        AlertBasic("当前能蹲起的重量不能为空，请填写。");
        return;
    }

    if (goalLiftWeight == "" || goalLiftWeight == "undefined") {
        AlertBasic("目标蹲起重量不能为空，请填写。");
        return;
    }

    if (goalDaysCount == "" || goalDaysCount == "undefined") {
        AlertBasic("目标达成日期不能为空，请填写。");
        return;
    }

    var startLiftWeightMax = EstimateRepMax(startLiftWeight, startRepsCount).toFixed(0);
    var goalLiftWeightMax = EstimateRepMax(goalLiftWeight, goalRepsCount).toFixed(0);

    if (goalLiftWeightMax * 1 <= startLiftWeightMax * 1) {
        AlertBasic("目标重量必须大于起始重量！");
        return;
    }
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "addOtherGoal_deadLift", startValue: startLiftWeightMax, goalValue: goalLiftWeightMax, goalDaysCount: goalDaysCount, type: "deadLift", startLiftWeight: startLiftWeight, startRepsCount: startRepsCount, goalLiftWeight: goalLiftWeight, goalRepsCount: goalRepsCount },
        async: true,
        success: function (data) {
            if (data == "2" || data == "1" || data == "0" || data=="3") {//更新失败
                if (date == "1") {
                    AlertBasic("您尚未登录！请登录后重试。")
                }
                else if (date == "2") {
                    AlertBasic("更新数据时出错，请重试！");
                }
                else if (data == "3") {
                    AlertBasic("您尚有未完成或者未到期的硬拉目标！");
                }
                else {
                    AlertBasic("什么都没有发生！");
                }
            }
            else {//数据库更新成功，更新前台数据
                //刷新前台页面
                $("#deadLiftGoal").modal("hide");
                AlertBasic("设定目标：杠铃传统硬拉成功。");
                $("#startValueHtml_deadLift").html(startLiftWeightMax);
                var nowDate = new Date();
                $("#startDateHtml_deadLift").html(nowDate.getFullYear() + "-" + (nowDate.getMonth() * 1 + 1).toString() + "-" + nowDate.getDate());
                $("#goalValueHtml_deadLift").html(goalLiftWeightMax);
                $("#goalDaysLeftHtml_deadLift").html(goalDaysCount);
                $("#progress_currentLiftWeightAmount_deadLift").html(startLiftWeightMax);
                $("#progress_currentLiftWeightAchievedPercent_deadLift").html(0);
                $("#progress_currentLiftWeightStatus_deadLift").html("<span style='color:green'>进行中</span>");
                $("#progressbar_deadLift").css("width", "0");

                $("#addOtherGoal_deadLift").addClass("disableCss");
                $("#deleteOtherGoal_deadLift").removeClass("disableCss");
                $("#updateOtherGoal_deadLift").removeClass("disableCss");

                deadLiftID = data.toString();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("增加深蹲目标时出错了");
            alert(errorThrown);
        }
    });
}
function addOtherGoal_barbellPress() {
    var startLiftWeight = $("#currentLiftWeightAmount_barbellPress").val();
    var startRepsCount = $("#currentRepsCountInput_barbellPress").val();
    var goalLiftWeight = $("#goalLiftWeightAmount_barbellPress").val();
    var goalRepsCount = $("#goalRepsCountInput_barbellPress").val();
    var goalDaysCount = $("#goalLiftWeightDaysCountAmount_barbellPress").val();
    if (startLiftWeight == "" || startLiftWeight == "undefined") {
        AlertBasic("当前能蹲起的重量不能为空，请填写。");
        return;
    }

    if (goalLiftWeight == "" || goalLiftWeight == "undefined") {
        AlertBasic("目标蹲起重量不能为空，请填写。");
        return;
    }

    if (goalDaysCount == "" || goalDaysCount == "undefined") {
        AlertBasic("目标达成日期不能为空，请填写。");
        return;
    }

    var startLiftWeightMax = EstimateRepMax(startLiftWeight, startRepsCount).toFixed(0);
    var goalLiftWeightMax = EstimateRepMax(goalLiftWeight, goalRepsCount).toFixed(0);

    if (goalLiftWeightMax * 1 <= startLiftWeightMax * 1) {
        AlertBasic("目标重量必须大于起始重量！");
        return;
    }
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "addOtherGoal_barbellPress", startValue: startLiftWeightMax, goalValue: goalLiftWeightMax, goalDaysCount: goalDaysCount, type: "barbellPress", startLiftWeight: startLiftWeight, startRepsCount: startRepsCount, goalLiftWeight: goalLiftWeight, goalRepsCount: goalRepsCount },
        async: true,
        success: function (data) {
            if (data == "2" || data == "1" || data == "0" || data == "3") {//更新失败
                if (date == "1") {
                    AlertBasic("您尚未登录！请登录后重试。")
                }
                else if (date == "2") {
                    AlertBasic("更新数据时出错，请重试！");
                }
                else if (data == "3") {
                    AlertBasic("您尚有未完成或者未到期的平板卧推目标！");
                }
                else {
                    AlertBasic("什么都没有发生！");
                }
            }
            else {//数据库更新成功，更新前台数据
                //刷新前台页面
                $("#barbellPressGoal").modal("hide");
                AlertBasic("设定目标：杠铃平板卧推成功。");
                $("#startValueHtml_barbellPress").html(startLiftWeightMax);
                var nowDate = new Date();
                $("#startDateHtml_barbellPress").html(nowDate.getFullYear() + "-" + (nowDate.getMonth() * 1 + 1).toString() + "-" + nowDate.getDate());
                $("#goalValueHtml_barbellPress").html(goalLiftWeightMax);
                $("#goalDaysLeftHtml_barbellPress").html(goalDaysCount);
                $("#progress_currentLiftWeightAmount_barbellPress").html(startLiftWeightMax);
                $("#progress_currentLiftWeightAchievedPercent_barbellPress").html(0);
                $("#progress_currentLiftWeightStatus_barbellPress").html("<span style='color:green'>进行中</span>");
                $("#progressbar_barbellPress").css("width", "0");

                $("#addOtherGoal_barbellPress").addClass("disableCss");
                $("#deleteOtherGoal_barbellPress").removeClass("disableCss");
                $("#updateOtherGoal_barbellPress").removeClass("disableCss");

                barbellPressID = data.toString();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("增加深蹲目标时出错了");
            alert(errorThrown);
        }
    });
}
function addOtherGoal_shoulderPress() {
    var startLiftWeight = $("#currentLiftWeightAmount_shoulderPress").val();
    var startRepsCount = $("#currentRepsCountInput_shoulderPress").val();
    var goalLiftWeight = $("#goalLiftWeightAmount_shoulderPress").val();
    var goalRepsCount = $("#goalRepsCountInput_shoulderPress").val();
    var goalDaysCount = $("#goalLiftWeightDaysCountAmount_shoulderPress").val();
    if (startLiftWeight == "" || startLiftWeight == "undefined") {
        AlertBasic("当前能蹲起的重量不能为空，请填写。");
        return;
    }

    if (goalLiftWeight == "" || goalLiftWeight == "undefined") {
        AlertBasic("目标蹲起重量不能为空，请填写。");
        return;
    }

    if (goalDaysCount == "" || goalDaysCount == "undefined") {
        AlertBasic("目标达成日期不能为空，请填写。");
        return;
    }

    var startLiftWeightMax = EstimateRepMax(startLiftWeight, startRepsCount).toFixed(0);
    var goalLiftWeightMax = EstimateRepMax(goalLiftWeight, goalRepsCount).toFixed(0);

    if (goalLiftWeightMax * 1 <= startLiftWeightMax * 1) {
        AlertBasic("目标重量必须大于起始重量！");
        return;
    }
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "addOtherGoal_shoulderPress", startValue: startLiftWeightMax, goalValue: goalLiftWeightMax, goalDaysCount: goalDaysCount, type: "shoulderPress", startLiftWeight: startLiftWeight, startRepsCount: startRepsCount, goalLiftWeight: goalLiftWeight, goalRepsCount: goalRepsCount },
        async: true,
        success: function (data) {
            if (data == "2" || data == "1" || data == "0" || data == "3") {//更新失败
                if (date == "1") {
                    AlertBasic("您尚未登录！请登录后重试。")
                }
                else if (date == "2") {
                    AlertBasic("更新数据时出错，请重试！");
                }
                else if (data == "3") {
                    AlertBasic("您尚有未完成或者未到期的肩上推举目标！");
                }
                else {
                    AlertBasic("什么都没有发生！");
                }
            }
            else {//数据库更新成功，更新前台数据
                //刷新前台页面
                $("#shoulderPressGoal").modal("hide");
                AlertBasic("设定目标：杠铃肩上推举成功。");
                $("#startValueHtml_shoulderPress").html(startLiftWeightMax);
                var nowDate = new Date();
                $("#startDateHtml_shoulderPress").html(nowDate.getFullYear() + "-" + (nowDate.getMonth() * 1 + 1).toString() + "-" + nowDate.getDate());
                $("#goalValueHtml_shoulderPress").html(goalLiftWeightMax);
                $("#goalDaysLeftHtml_shoulderPress").html(goalDaysCount);
                $("#progress_currentLiftWeightAmount_shoulderPress").html(startLiftWeightMax);
                $("#progress_currentLiftWeightAchievedPercent_shoulderPress").html(0);
                $("#progress_currentLiftWeightStatus_shoulderPress").html("<span style='color:green'>进行中</span>");
                $("#progressbar_shoulderPress").css("width", "0");

                $("#addOtherGoal_shoulderPress").addClass("disableCss");
                $("#deleteOtherGoal_shoulderPress").removeClass("disableCss");
                $("#updateOtherGoal_shoulderPress").removeClass("disableCss");

                shoulderPressID = data.toString();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("增加深蹲目标时出错了");
            alert(errorThrown);
        }
    });
}
function addOtherGoal_barbellRow() {
    var startLiftWeight = $("#currentLiftWeightAmount_barbellRow").val();
    var startRepsCount = $("#currentRepsCountInput_barbellRow").val();
    var goalLiftWeight = $("#goalLiftWeightAmount_barbellRow").val();
    var goalRepsCount = $("#goalRepsCountInput_barbellRow").val();
    var goalDaysCount = $("#goalLiftWeightDaysCountAmount_barbellRow").val();
    if (startLiftWeight == "" || startLiftWeight == "undefined") {
        AlertBasic("当前能蹲起的重量不能为空，请填写。");
        return;
    }

    if (goalLiftWeight == "" || goalLiftWeight == "undefined") {
        AlertBasic("目标蹲起重量不能为空，请填写。");
        return;
    }

    if (goalDaysCount == "" || goalDaysCount == "undefined") {
        AlertBasic("目标达成日期不能为空，请填写。");
        return;
    }

    var startLiftWeightMax = EstimateRepMax(startLiftWeight, startRepsCount).toFixed(0);
    var goalLiftWeightMax = EstimateRepMax(goalLiftWeight, goalRepsCount).toFixed(0);

    if (goalLiftWeightMax * 1 <= startLiftWeightMax * 1) {
        AlertBasic("目标重量必须大于起始重量！");
        return;
    }
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "addOtherGoal_barbellRow", startValue: startLiftWeightMax, goalValue: goalLiftWeightMax, goalDaysCount: goalDaysCount, type: "barbellRow", startLiftWeight: startLiftWeight, startRepsCount: startRepsCount, goalLiftWeight: goalLiftWeight, goalRepsCount: goalRepsCount },
        async: true,
        success: function (data) {
            if (data == "2" || data == "1" || data == "0" || data=="3") {//更新失败
                if (date == "1") {
                    AlertBasic("您尚未登录！请登录后重试。")
                }
                else if (date == "2") {
                    AlertBasic("更新数据时出错，请重试！");
                }
                else if (data == "3") {
                    AlertBasic("您尚有未完成或者未到期的杠铃划船目标！");
                }
                else {
                    AlertBasic("什么都没有发生！");
                }
            }
            else {//数据库更新成功，更新前台数据
                //刷新前台页面
                $("#barbellRowGoal").modal("hide");
                AlertBasic("设定目标：杠铃划船成功。");
                $("#startValueHtml_barbellRow").html(startLiftWeightMax);
                var nowDate = new Date();
                $("#startDateHtml_barbellRow").html(nowDate.getFullYear() + "-" + (nowDate.getMonth() * 1 + 1).toString() + "-" + nowDate.getDate());
                $("#goalValueHtml_barbellRow").html(goalLiftWeightMax);
                $("#goalDaysLeftHtml_barbellRow").html(goalDaysCount);
                $("#progress_currentLiftWeightAmount_barbellRow").html(startLiftWeightMax);
                $("#progress_currentLiftWeightAchievedPercent_barbellRow").html(0);
                $("#progress_currentLiftWeightStatus_barbellRow").html("<span style='color:green'>进行中</span>");
                $("#progressbar_barbellRow").css("width", "0");

                $("#addOtherGoal_barbellRow").addClass("disableCss");
                $("#deleteOtherGoal_barbellRow").removeClass("disableCss");
                $("#updateOtherGoal_barbellRow").removeClass("disableCss");
                barbellRowID = data.toString();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("增加深蹲目标时出错了");
            alert(errorThrown);
        }
    });
}
function addOtherGoal_barbellCurl() {
    var startLiftWeight = $("#currentLiftWeightAmount_barbellCurl").val();
    var startRepsCount = $("#currentRepsCountInput_barbellCurl").val();
    var goalLiftWeight = $("#goalLiftWeightAmount_barbellCurl").val();
    var goalRepsCount = $("#goalRepsCountInput_barbellCurl").val();
    var goalDaysCount = $("#goalLiftWeightDaysCountAmount_barbellCurl").val();
    if (startLiftWeight == "" || startLiftWeight == "undefined") {
        AlertBasic("当前能蹲起的重量不能为空，请填写。");
        return;
    }

    if (goalLiftWeight == "" || goalLiftWeight == "undefined") {
        AlertBasic("目标蹲起重量不能为空，请填写。");
        return;
    }

    if (goalDaysCount == "" || goalDaysCount == "undefined") {
        AlertBasic("目标达成日期不能为空，请填写。");
        return;
    }

    var startLiftWeightMax = EstimateRepMax(startLiftWeight, startRepsCount).toFixed(0);
    var goalLiftWeightMax = EstimateRepMax(goalLiftWeight, goalRepsCount).toFixed(0);

    if (goalLiftWeightMax * 1 <= startLiftWeightMax * 1) {
        AlertBasic("目标重量必须大于起始重量！");
        return;
    }
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "addOtherGoal_barbellCurl", startValue: startLiftWeightMax, goalValue: goalLiftWeightMax, goalDaysCount: goalDaysCount, type: "barbellCurl", startLiftWeight: startLiftWeight, startRepsCount: startRepsCount, goalLiftWeight: goalLiftWeight, goalRepsCount: goalRepsCount },
        async: true,
        success: function (data) {
            if (data == "2" || data == "1" || data == "0" || data== "3") {//更新失败
                if (date == "1") {
                    AlertBasic("您尚未登录！请登录后重试。")
                }
                else if (date == "2") {
                    AlertBasic("更新数据时出错，请重试！");
                }
                else if (data == "3") {
                    AlertBasic("您尚有未完成或者未到期的二头弯举目标！");
                }
                else {
                    AlertBasic("什么都没有发生！");
                }
            }
            else {//数据库更新成功，更新前台数据
                //刷新前台页面
                $("#barbellCurlGoal").modal("hide");
                AlertBasic("设定目标：杠铃二头弯举成功。");
                $("#startValueHtml_barbellCurl").html(startLiftWeightMax);
                var nowDate = new Date();
                $("#startDateHtml_barbellCurl").html(nowDate.getFullYear() + "-" + (nowDate.getMonth() * 1 + 1).toString() + "-" + nowDate.getDate());
                $("#goalValueHtml_barbellCurl").html(goalLiftWeightMax);
                $("#goalDaysLeftHtml_barbellCurl").html(goalDaysCount);
                $("#progress_currentLiftWeightAmount_barbellCurl").html(startLiftWeightMax);
                $("#progress_currentLiftWeightAchievedPercent_barbellCurl").html(0);
                $("#progress_currentLiftWeightStatus_barbellCurl").html("<span style='color:green'>进行中</span>");
                $("#progressbar_barbellCurl").css("width", "0");

                $("#addOtherGoal_barbellCurl").addClass("disableCss");
                $("#deleteOtherGoal_barbellCurl").removeClass("disableCss");
                $("#updateOtherGoal_barbellCurl").removeClass("disableCss");
                barbellCurlID = data.toString();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("增加深蹲目标时出错了");
            alert(errorThrown);
        }
    });
}
///end：添加力量型目标

///初始化：“删除力量型目标框”
function initDeleteOtherGoalmodal(type) {
    if (type == "squats") {
        $(".strengthSubTitlName").html("自由杠铃深蹲");
        $(".strengthSubTitleCreateDate").html($("#startDateHtml_squats").html());
    }
    else if (type == "deadLift") {
        $(".strengthSubTitlName").html("杠铃传统硬拉");
        $(".strengthSubTitleCreateDate").html($("#startDateHtml_deadLift").html());
    }
    else if (type == "barbellPress") {
        $(".strengthSubTitlName").html("杠铃平板卧推");
        $(".strengthSubTitleCreateDate").html($("#startDateHtml_barbellPress").html());
    }
    else if (type == "shoulderPress") {
        $(".strengthSubTitlName").html("杠铃肩上推举");
        $(".strengthSubTitleCreateDate").html($("#startDateHtml_shoulderPress").html());
    }
    else if (type == "barbellRow") {
        $(".strengthSubTitlName").html("杠铃划船");
        $(".strengthSubTitleCreateDate").html($("#startDateHtml_barbellRow").html());
    }
    else if (type == "barbellCurl") {
        $(".strengthSubTitlName").html("杠铃二头弯举");
        $(".strengthSubTitleCreateDate").html($("#startDateHtml_barbellCurl").html());
    }
    else {

    }
}
///提交：“删除力量型目标框”
function deleteOtherGoal() {
    var type;
    var strengthGoalID;

    if ($("#deleteOtherGoal .strengthSubTitlName").html() == '自由杠铃深蹲') {
        type = "squats";
        if (squatsID == "" || squatsID == "undefined") {
            AlertBasic("您没有设定过该项力量型目标。")
            return;
        }
        else {
            strengthGoalID = squatsID;
        }
    }
    else if ($("#deleteOtherGoal .strengthSubTitlName").html() == '杠铃传统硬拉') {
        type = "deadLift";
        if (deadLiftID == "" || deadLiftID == "undefined") {
            AlertBasic("您没有设定过该项力量型目标。")
            return;
        }
        else {
            strengthGoalID = deadLiftID; 
        }
    }
    else if ($("#deleteOtherGoal .strengthSubTitlName").html() == '杠铃平板卧推') {
        type = "barbellPress";
        if (barbellPressID == "" || barbellPressID == "undefined") {
            AlertBasic("您没有设定过该项力量型目标。")
            return;
        }
        else {
            strengthGoalID = barbellPressID;
        }
    }
    else if ($("#deleteOtherGoal .strengthSubTitlName").html() == '杠铃肩上推举') {
        type = "shoulderPress";
        if (shoulderPressID == "" || shoulderPressID == "undefined") {
            AlertBasic("您没有设定过该项力量型目标。")
            return;
        }
        else {
            strengthGoalID = shoulderPressID;
        }
    }
    else if ($("#deleteOtherGoal .strengthSubTitlName").html() == '杠铃划船') {
        type = "barbellRow";
        if (barbellRowID == "" || barbellRowID == "undefined") {
            AlertBasic("您没有设定过该项力量型目标。")
            return;
        }
        else {
            strengthGoalID = barbellRowID;
        }
    }
    else if ($("#deleteOtherGoal .strengthSubTitlName").html() == '杠铃二头弯举') {
        type = "barbellCurl";
        if (barbellCurlID == "" || barbellCurlID == "undefined") {
            AlertBasic("您没有设定过该项力量型目标。")
            return;
        }
        else {
            strengthGoalID = barbellCurlID;
        }
    }
    else {
        type = "";
    }
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "deleteOtherGoal", type: type, strengthGoalID: strengthGoalID },
        async: true,
        success: function (data) {
            if (data != "1") {//更新失败

            }
            else {//数据库更新成功，更新前台数据
                $("#deleteOtherGoal").modal("hide");
                AlertBasic("删除成功");

                if (type == "squats") {
                    $("#addOtherGoal_squats").removeClass("disableCss");
                    $("#deleteOtherGoal_squats").addClass("disableCss");
                    $("#updateOtherGoal_squats").addClass("disableCss");

                    squatsID = "";
                }
                else if (type == "deadLift") {
                    $("#addOtherGoal_deadLift").removeClass("disableCss");
                    $("#deleteOtherGoal_deadLift").addClass("disableCss");
                    $("#updateOtherGoal_deadLift").addClass("disableCss");

                    deadLiftID = "";
                }
                else if (type == "barbellPress") {
                    $("#addOtherGoal_barbellPress").removeClass("disableCss");
                    $("#deleteOtherGoal_barbellPress").addClass("disableCss");
                    $("#updateOtherGoal_barbellPress").addClass("disableCss");

                    barbellPressID = "";
                }
                else if (type == "shoulderPress") {
                    $("#addOtherGoal_shoulderPress").removeClass("disableCss");
                    $("#deleteOtherGoal_shoulderPress").addClass("disableCss");
                    $("#updateOtherGoal_shoulderPress").addClass("disableCss");
                    shoulderPressID = "";
                }
                else if (type == "barbellRow") {
                    $("#addOtherGoal_barbellRow").removeClass("disableCss");
                    $("#deleteOtherGoal_barbellRow").addClass("disableCss");
                    $("#updateOtherGoal_barbellRow").addClass("disableCss");

                    barbellRowID = "";
                }
                else if (type == "barbellCurl") {
                    $("#addOtherGoal_barbellCurl").removeClass("disableCss");
                    $("#deleteOtherGoal_barbellCurl").addClass("disableCss");
                    $("#updateOtherGoal_barbellCurl").addClass("disableCss");

                    barbellCurlID = "";
                }
                else {

                }

                //startValueHtml_deadLift
                //startDateHtml_deadLift
                //goalValueHtml_deadLift
                //goalDaysLeftHtml_squats
                //progress_currentLiftWeightAmount_squats
                //progress_currentLiftWeightAchievedPercent_squats
                //progress_currentLiftWeightStatus_squats
                var s = ["squats", "deadLift", "barbellPress", "shoulderPress", "barbellRow", "barbellCurl"];
                var startValue = "startValueHtml_";
                var startDate = "startDateHtml_";
                var goalValue = "goalValueHtml_";
                var goalDays = "goalDaysLeftHtml_";
                var current = "progress_currentLiftWeightAmount_";
                var percent = "progress_currentLiftWeightAchievedPercent_";
                var status = "progress_currentLiftWeightStatus_";
                var progressbar = "#progressbar_" + type;
                
                $("#" + startValue + type).html("0");
                $("#" + startDate + type).html("尚未制定");
                $("#" + goalValue + type).html("0");
                $("#" + goalDays + type).html("0");
                $("#" + current + type).html("0");
                $("#" + percent + type).html("0");
                $("#" + status + type).html("未开始");
                $("#" + status + type).css("color", "red");
                $(progressbar).css("width","0");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("删除目标时出错了");
            alert(errorThrown);
        }
    });
}


///初始化：“更新力量型目标框”
function initUpdateLiftWeightStats(type)
{
    $(".UpdateLiftWeightStats_goalLiftWeightAmount").val("");
    $(".UpdateLiftWeightStats_goalRepsCountInput_squats").val(8);
    $(".UpdateLiftWeightStats_goalLiftWeightRepsCount_squats").html(8);

    var dateNow = getCurrentDatetime();
    $(".strengthSubTitleCreateDate").html(dateNow);
    if (type == "squats") {
        $(".strengthSubTitlName").html("自由杠铃深蹲");
        $(".UpdateLiftWeightStats_moveDirectionDesc").html("蹲起");
        $("#currentUpdateLiftWeightStats_ModalType").val("squats");
    }
    else if (type == "deadLift") {
        $(".strengthSubTitlName").html("传统杠铃硬拉");
        $(".UpdateLiftWeightStats_moveDirectionDesc").html("拉起");
        $("#currentUpdateLiftWeightStats_ModalType").val("deadLift");
    }
    else if (type == "barbellPress") {
        $(".strengthSubTitlName").html("杠铃平板卧推");
        $(".UpdateLiftWeightStats_moveDirectionDesc").html("推起");
        $("#currentUpdateLiftWeightStats_ModalType").val("barbellPress");
    }
    else if (type == "shoulderPress") {
        $(".strengthSubTitlName").html("杠铃肩上推举");
        $(".UpdateLiftWeightStats_moveDirectionDesc").html("推起");
        $("#currentUpdateLiftWeightStats_ModalType").val("shoulderPress");
    }
    else if (type == "barbellRow") {
        $(".strengthSubTitlName").html("杠铃划船");
        $(".UpdateLiftWeightStats_moveDirectionDesc").html("拉起");
        $("#currentUpdateLiftWeightStats_ModalType").val("barbellRow");
    }
    else if (type == "barbellCurl") {
        $(".strengthSubTitlName").html("杠铃二头弯举");
        $(".UpdateLiftWeightStats_moveDirectionDesc").html("举起");
        $("#currentUpdateLiftWeightStats_ModalType").val("barbellCurl");
    }
    else {

    }
}
///数据过滤
function updateModel_updateLiftWeightStats(goalLiftWeightAmount, goalRepsCount)
{
    if (goalLiftWeightAmount.length > 3) {
        $(".UpdateLiftWeightStats_goalLiftWeightAmount").val(parseInt(goalLiftWeightAmount / 10));
        $(".UpdateLiftWeightStats_goalLiftWeightOneRepsMax_squats").html((EstimateRepMax(goalLiftWeightAmount, goalRepsCount) / 10).toFixed(0));
    }
    else {
        $(".UpdateLiftWeightStats_goalLiftWeightAmount").val(parseInt(goalLiftWeightAmount));
        $(".UpdateLiftWeightStats_goalLiftWeightOneRepsMax_squats").html(EstimateRepMax(goalLiftWeightAmount, goalRepsCount).toFixed(0));
    }
    $('.UpdateLiftWeightStats_goalLiftWeightRepsCount_squats').html(goalRepsCount);
}
///提交：“更新力量型目标框”
function updateLiftWeightStats()
{
    //alert(squatsID);
    var currentWeight = $(".UpdateLiftWeightStats_goalLiftWeightAmount").val();
    var currentReps = $(".UpdateLiftWeightStats_goalRepsCountInput_squats").val();
    var oneRepsMax = (EstimateRepMax(currentWeight, currentReps) * 1).toFixed(0);
    if (currentWeight == "" || currentWeight == "undefined")
    {
        AlertBasic("重量不能为空！请输入。")
        return;
    }
    if (currentReps == "" || currentReps == "undefined") {
        AlertBasic("重复次数不能为空！请输入。")
        return;
    }

    var typedesc = $("#updateLiftWeightStats .strengthSubTitlName").html();
    var type;
    var strengthGoalID;
    var goalAmount;
    if (typedesc == "自由杠铃深蹲") {
        if (squatsID == "" || squatsID == "undefined") {
            AlertBasic("必须先建立该力量型目标，然后更新数据。")
            return;
        }
        else {
            strengthGoalID = squatsID;
        }
        type = "squats";
        goalAmount = $("#goalValueHtml_squats").html();
    }
    else if (typedesc == "传统杠铃硬拉") {
        if (deadLiftID == "" || deadLiftID == "undefined") {
            AlertBasic("必须先建立该力量型目标，然后更新数据。")
            return;
        }
        else {
            strengthGoalID = deadLiftID;
        }
        type = "deadLift";
        goalAmount = $("#goalValueHtml_deadLift").html();
    }
    else if (typedesc == "杠铃平板卧推") {
        if (barbellPressID == "" || barbellPressID == "undefined") {
            AlertBasic("必须先建立该力量型目标，然后更新数据。")
            return;
        }
        else {
            strengthGoalID = barbellPressID;
        }
        type = "barbellPress";
        goalAmount = $("#goalValueHtml_barbellPress").html();
    }
    else if (typedesc == "杠铃肩上推举") {
        if (shoulderPressID == "" || shoulderPressID == "undefined") {
            AlertBasic("必须先建立该力量型目标，然后更新数据。")
            return;
        }
        else {
            strengthGoalID = shoulderPressID;
        }
        type = "shoulderPress";
        goalAmount = $("#goalValueHtml_shoulderPress").html();
    }
    else if (typedesc == "杠铃划船") {
        if (barbellRowID == "" || barbellRowID == "undefined") {
            AlertBasic("必须先建立该力量型目标，然后更新数据。")
            return;
        }
        else {
            strengthGoalID = barbellRowID;
        }
        type = "barbellRow";
        goalAmount = $("#goalValueHtml_barbellRow").html();
    }
    else if (typedesc == "杠铃二头弯举") {
        if (barbellCurlID == "" || barbellCurlID == "undefined") {
            AlertBasic("必须先建立该力量型目标，然后更新数据。")
            return;
        }
        else {
            strengthGoalID = barbellCurlID;
        }
        type = "barbellCurl";
        goalAmount = $("#goalValueHtml_barbellCurl").html();
    }
    else {

    }

    //alert(goalAmount);
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "updateLiftWeightStats", currentWeight: currentWeight, currentReps: currentReps, type: type, oneRepsMax: oneRepsMax, strengthGoalID:strengthGoalID, goalAmounts: goalAmount },
        async: true,
        success: function (data) {
            if (data == "2") {//更新失败
                alert(data.toString());
                AlertBasic("更新数据失败，请重试。");
            }
            else {//数据库更新成功，更新前台数据
                //刷新前台页面
                AlertBasic("更新数据成功。");
                $("#updateLiftWeightStats").modal("hide");
                var complete = 0;
                ///progress_currentLiftWeightAmount_squats
                ///progress_currentLiftWeightAchievedPercent_squats
                ///progress_currentLiftWeightStatus_squats
                ///startValueHtml_squats
                ///goalValueHtml_squats
                if (typedesc == "自由杠铃深蹲") {
                    $("#progress_currentLiftWeightAmount_squats").html(oneRepsMax);
                    var start = $("#startValueHtml_squats").html();
                    var end = $("#goalValueHtml_squats").html();
                    //alert(start + "," + oneRepsMax + "," + end);
                    var achievedPercent = (100 * (oneRepsMax * 1 - start * 1) / (end * 1 - start * 1)).toFixed(1); 
                    //progress_currentLiftWeightAchievedPercent_squats = ((oneRepsMax * 1 - start * 1) / (end * 1 - start * 1)).toFixed(1);
                    $("#progress_currentLiftWeightAchievedPercent_squats").html(achievedPercent);
                    if (achievedPercent * 1 >= 100) {
                        $("#progress_currentLiftWeightStatus_squats").html("已完成");
                        $("#progress_currentLiftWeightStatus_squats").css("color", "#3366CC");
                        $("#progressbar_squats").css("width", "100%");
                        complete = 1;
                    }
                    else {
                        $("#progress_currentLiftWeightStatus_squats").html("进行中");
                        $("#progress_currentLiftWeightStatus_squats").css("color", "green");
                        $("#progressbar_squats").css("width", achievedPercent.toString() + "%");
                    }
                }
                else if (typedesc == "传统杠铃硬拉") {
                    $("#progress_currentLiftWeightAmount_deadLift").html(oneRepsMax);
                    var start = $("#startValueHtml_deadLift").html();
                    var end = $("#goalValueHtml_deadLift").html();
                    var achievedPercent = (100 * (oneRepsMax * 1 - start * 1) / (end * 1 - start * 1)).toFixed(1);
                    $("#progress_currentLiftWeightAchievedPercent_deadLift").html(achievedPercent);
                    if (achievedPercent * 1 >= 100) {
                        $("#progress_currentLiftWeightStatus_deadLift").html("已完成");
                        $("#progress_currentLiftWeightStatus_deadLift").css("color", "#3366CC");
                        $("#progressbar_deadLift").css("width", "100%");
                        complete = 1;
                    }
                    else {
                        $("#progress_currentLiftWeightStatus_deadLift").html("进行中");
                        $("#progress_currentLiftWeightStatus_deadLift").css("color", "green");
                        $("#progressbar_deadLift").css("width", achievedPercent.toString() + "%");
                    }
                }
                else if (typedesc == "杠铃平板卧推") {
                    $("#progress_currentLiftWeightAmount_barbellPress").html(oneRepsMax);
                    var start = $("#startValueHtml_barbellPress").html();
                    var end = $("#goalValueHtml_barbellPress").html();
                    var achievedPercent = (100 * (oneRepsMax * 1 - start * 1) / (end * 1 - start * 1)).toFixed(1);
                    $("#progress_currentLiftWeightAchievedPercent_barbellPress").html(achievedPercent);
                    if (achievedPercent * 1 >= 100) {
                        $("#progress_currentLiftWeightStatus_barbellPress").html("已完成");
                        $("#progress_currentLiftWeightStatus_barbellPress").css("color", "#3366CC");
                        $("#progressbar_barbellPress").css("width", "100%");
                        complete = 1;
                    }
                    else {
                        $("#progress_currentLiftWeightStatus_barbellPress").html("进行中");
                        $("#progress_currentLiftWeightStatus_barbellPress").css("color", "green");
                        $("#progressbar_barbellPress").css("width", achievedPercent.toString() + "%");
                    }
                }
                else if (typedesc == "杠铃肩上推举") {
                    $("#progress_currentLiftWeightAmount_shoulderPress").html(oneRepsMax);
                    var start = $("#startValueHtml_shoulderPress").html();
                    var end = $("#goalValueHtml_shoulderPress").html();
                    var achievedPercent = (100 * (oneRepsMax * 1 - start * 1) / (end * 1 - start * 1)).toFixed(1);
                    $("#progress_currentLiftWeightAchievedPercent_shoulderPress").html(achievedPercent);
                    if (achievedPercent * 1 >= 100) {
                        $("#progress_currentLiftWeightStatus_shoulderPress").html("已完成");
                        $("#progress_currentLiftWeightStatus_shoulderPress").css("color", "#3366CC");
                        $("#progressbar_shoulderPress").css("width", "100%");
                        complete = 1;
                    }
                    else {
                        $("#progress_currentLiftWeightStatus_shoulderPress").html("进行中");
                        $("#progress_currentLiftWeightStatus_shoulderPress").css("color", "green");
                        $("#progressbar_shoulderPress").css("width", achievedPercent.toString() + "%");
                    }
                }
                else if (typedesc == "杠铃划船") {
                    $("#progress_currentLiftWeightAmount_barbellRow").html(oneRepsMax);
                    var start = $("#startValueHtml_barbellRow").html();
                    var end = $("#goalValueHtml_barbellRow").html();
                    var achievedPercent = (100 * (oneRepsMax * 1 - start * 1) / (end * 1 - start * 1)).toFixed(1);
                    $("#progress_currentLiftWeightAchievedPercent_barbellRow").html(achievedPercent);
                    if (achievedPercent * 1 >= 100) {
                        $("#progress_currentLiftWeightStatus_barbellRow").html("已完成");
                        $("#progress_currentLiftWeightStatus_barbellRow").css("color", "#3366CC");
                        $("#progressbar_barbellRow").css("width", "100%");
                        complete = 1;
                    }
                    else {
                        $("#progress_currentLiftWeightStatus_barbellRow").html("进行中");
                        $("#progress_currentLiftWeightStatus_barbellRow").css("color", "green");
                        $("#progressbar_barbellRow").css("width", achievedPercent.toString() + "%");
                    }
                }
                else if (typedesc == "杠铃二头弯举") {
                    $("#progress_currentLiftWeightAmount_barbellCurl").html(oneRepsMax);
                    var start = $("#startValueHtml_barbellCurl").html();
                    var end = $("#goalValueHtml_barbellCurl").html();
                    var achievedPercent = (100 * (oneRepsMax * 1 - start * 1) / (end * 1 - start * 1)).toFixed(1);
                    $("#progress_currentLiftWeightAchievedPercent_barbellCurl").html(achievedPercent);
                    if (achievedPercent * 1 >= 100) {
                        $("#progress_currentLiftWeightStatus_barbellCurl").html("已完成");
                        $("#progress_currentLiftWeightStatus_barbellCurl").css("color", "#3366CC");
                        $("#progressbar_barbellCurl").css("width", "100%");
                        complete = 1;
                    }
                    else {
                        $("#progress_currentLiftWeightStatus_barbellCurl").html("进行中");
                        $("#progress_currentLiftWeightStatus_barbellCurl").css("color", "green");
                        $("#progressbar_barbellCurl").css("width", achievedPercent.toString() + "%");
                    }
                }
                else {

                }
                if (complete == 1) {
                    $("#addOtherGoal_" + type).removeClass("disableCss");
                }
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("更新数据时出错了");
            alert(errorThrown);
        }
    });



}
///********************结束：力量型目标***************************


//********************开始：测量型目标***************************
///初始化“新增测量型目标框”
function initModal_AddMeasurementGoal(measurementType) {
    $("#currentMeasurementAmount").val("");
    $("#goalMeasurementAmount").val("");
    $("#goalMeasurementDaysCountAmount").val("");

    switch (measurementType) {
        case "chest":
            $(".measurementType").html("胸围");
            $("#measuretType").val("chest");
            break;
        case "arm":
            $(".measurementType").html("大臂围度");
            $("#measuretType").val("arm");
            break;
        case "waist":
            $(".measurementType").html("腰围");
            $("#measuretType").val("waist");
            break;
        case "thigh":
            $(".measurementType").html("大腿围度");
            $("#measuretType").val("thigh");
            break;
        case "shoulder":
            $(".measurementType").html("肩膀围度");
            $("#measuretType").val("shoulder");
            break;
        case "hip":
            $(".measurementType").html("臀围");
            $("#measuretType").val("hip");
            break;
        default:
            break;
    }
}

///提交“新增测量型目标框”
function submitModal_AddMeasurementGoal() {
    var type = $("#measuretType").val();
    var startValue = $("#currentMeasurementAmount").val();
    var goalValue = $("#goalMeasurementAmount").val();
    var goalDaysCount = $("#goalMeasurementDaysCountAmount").val();

    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "addMeasurementGoal", startValue: startValue, goalValue: goalValue, goalDaysCount: goalDaysCount, type: type },
        async: true,
        success: function (data) {
            $("#addMeasurementGoal").modal("hide");

            if (data == "1" || data == "0" ) {//更新失败
                if (data == "0") {
                    AlertBasic("您尚未登录！请登录后重试。")
                }
                else if (data == "1") {
                    AlertBasic("更新数据时出错，请重试！");
                }
                else {
                    AlertBasic("什么都没有发生！");
                }
            }
            else {//数据库更新成功，更新前台数据
                AlertBasic("新增目标成功。");
                var startValueHtml = "startValueHtml_";
                var startDateHtml = "startDateHtml_";
                var goalValueHtml = "goalValueHtml_";
                var goalDaysLeftHtml = "goalDaysLeftHtml_";
                var currentValueHtml = "progress_currentLiftWeightAmount_";
                var percentHtml = "progress_currentLiftWeightAchievedPercent_";
                var statusHtml = "progress_currentLiftWeightStatus_";

                switch (type) {
                    case "chest":
                        chestID = data.toString();
                        break;
                    case "arm":
                        armID = data.toString();
                        break;
                    case "waist":
                        waistID = data.toString();
                        break;
                    case "thigh":
                        thighID = data.toString();
                        break;
                    case "shoulder":
                        shoulderID = data.toString();
                        break;
                    case "hip":
                        hipID = data.toString();
                        break;
                    default:
                        break;
                }
                ///设置按钮的可见性
                $("#addOtherGoal_" + type).addClass("disableCss");
                $("#deleteOtherGoal_" + type).removeClass("disableCss");
                $("#updateOtherGoal_" + type).removeClass("disableCss");

                //alert(type+","+startValue + "," + goalValue );
                ///更新对应的显示字段
                $("#" + startValueHtml + type).html(startValue);
                $("#" + startDateHtml + type).html((new Date()).toLocaleDateString());
                $("#" + goalValueHtml + type).html(goalValue);
                $("#" + goalDaysLeftHtml + type).html(goalDaysCount);
                $("#" + currentValueHtml + type).html(startValue);
                $("#" + percentHtml + type).html("0.0");
                $("#" + statusHtml + type).html("进行中");
                $("#" + statusHtml + type).css("color", "green");
                $("#progressbar_" + type).css("width", "0");
                //alert("asdasdf");

            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("增加测量型目标时出错了");
            alert(errorThrown);
        }
    });
}

///初始化“删除测量型目标框”
function initModal_DeleteMeasurementGoal(measurementType) {
    var startDate = $("#startDateHtml_" + measurementType).html();
    var measurementID;
    switch (measurementType) {
        case "chest":
            $(".measurementType").html("胸围");
            measurementID = chestID;
            break;
        case "arm":
            $(".measurementType").html("大臂围度");
            measurementID = armID;
            break;
        case "waist":
            $(".measurementType").html("腰围");
            measurementID = waistID;
            break;
        case "thigh":
            $(".measurementType").html("大腿围度");
            measurementID = thighID;
            break;
        case "shoulder":
            $(".measurementType").html("肩膀围度");
            measurementID = shoulderID;
            break;
        case "hip":
            $(".measurementType").html("臀围");
            measurementID = hipID;
            break;
        default:
            break;
    }
    $(".measurementSubTitleCreateDate").html(startDate);
    $("#measurementID").val(measurementID);
    $("#measuretType").val(measurementType);
    
}

///提交“删除测量型目标框”
function submitModal_DeleteMeasurementGoal() {
    //alert(1);
    var id = $("#measurementID").val();
    var type = $("#measuretType").val();
    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "deleteMeasurementGoal", ID: id},
        async: true,
        success: function (data) {
            $("#deleteMeasurementGoal").modal("hide");

            if (data == "2" || data == "0") {//更新失败
                if (data == "0") {
                    AlertBasic("您尚未登录！请登录后重试。")
                }
                else if (data == "2") {
                    AlertBasic("更新数据时出错，请重试！");
                }
                else {
                    AlertBasic("什么都没有发生！");
                }
            }
            else {//数据库更新成功，更新前台数据
                AlertBasic("删除目标成功。");
                
                ///设置按钮的可见性
                $("#addOtherGoal_" + type).removeClass("disableCss");
                $("#deleteOtherGoal_" + type).addClass("disableCss");
                $("#updateOtherGoal_" + type).addClass("disableCss");

                ///更新对应的显示字段
                var startValueHtml = "startValueHtml_";
                var startDateHtml = "startDateHtml_";
                var goalValueHtml = "goalValueHtml_";
                var goalDaysLeftHtml = "goalDaysLeftHtml_";
                var currentValueHtml = "progress_currentLiftWeightAmount_";
                var percentHtml = "progress_currentLiftWeightAchievedPercent_";
                var statusHtml = "progress_currentLiftWeightStatus_";

                $("#" + startValueHtml + type).html(0);
                $("#" + startDateHtml + type).html("尚未制定");
                $("#" + goalValueHtml + type).html(0);
                $("#" + goalDaysLeftHtml + type).html(0);
                $("#" + currentValueHtml + type).html(0);
                $("#" + percentHtml + type).html("0.0");
                $("#" + statusHtml + type).html("未开始");
                $("#" + statusHtml + type).css("color", "red");
                $("#progressbar_" + type).css("width", "0");

                switch (type) {
                    case "chest":
                        chestID = "";
                        break;
                    case "arm":
                        armID = "";
                        break;
                    case "waist":
                        waistID = "";
                        break;
                    case "thigh":
                        thighID = "";
                        break;
                    case "shoulder":
                        shoulderID = "";
                        break;
                    case "hip":
                        hipID = "";
                        break;
                    default:
                        break;
                }
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("删除测量型目标时出错了");
            alert(errorThrown);
        }
    });
}

///初始化“更新测量型目标框”
function initModal_UpdateMeasurementGoal(measurementType)
{
    var measurementID;
    switch (measurementType) {
        case "chest":
            $(".measurementType").html("胸围");
            measurementID = chestID;
            break;
        case "arm":
            $(".measurementType").html("大臂围度");
            measurementID = armID;
            break;
        case "waist":
            $(".measurementType").html("腰围");
            measurementID = waistID;
            break;
        case "thigh":
            $(".measurementType").html("大腿围度");
            measurementID = thighID;
            break;
        case "shoulder":
            $(".measurementType").html("肩膀围度");
            measurementID = shoulderID;
            break;
        case "hip":
            $(".measurementType").html("臀围");
            measurementID = hipID;
            break;
        default:
            break;
    }

    $(".updateMeasurementGoal_createDateTime").html($("#startDateHtml_" + measurementType).html());
    $(".updateMeasurementGoal_currentDateTime").html((new Date()).toLocaleString());

    $("#measurementID").val(measurementID);
    $("#measuretType").val(measurementType);
}

///提交“更新测量型目标框”
function submitModal_updateMeasurementGoal() {
    var id = $("#measurementID").val();
    var type = $("#measuretType").val();
    var startValue = $("#startValueHtml_" + type).html();
    var goalValue = $("#goalValueHtml_" + type).html();
    var currentValue = $("#currentMeasurementGoalData").val();

    $.ajax({
        type: "POST",
        url: "/zhenyuFitness/ashx/DealAjax.ashx",
        data: { ajaxtype: "updateMeasurementGoal", ID: id, currentValue: currentValue, startValue: startValue, goalValue: goalValue, type:type },
        async: true,
        success: function (data) {
            $("#updateMeasurementGoal").modal("hide");

            if (data == "3" || data == "0") {//更新失败
                if (date == "0") {
                    AlertBasic("您尚未登录！请登录后重试。")
                }
                else if (data == "3") {
                    AlertBasic("更新数据时出错，请重试！");
                }
                else {
                    AlertBasic("什么都没有发生！");
                }
            }
            else {//数据库更新成功，更新前台数据
                //AlertBasic("更新数据成功。");

                ///设置按钮的可见性
                if(data == "3") $("#addOtherGoal_" + type).removeClass("disableCss");//目标完成时，显示“新增”按钮

                ///更新对应的显示字段
                var startValueHtml = "#startValueHtml_" + type;
                var startDateHtml = "#startDateHtml_" + type;
                var goalValueHtml = "#goalValueHtml_" + type;
                var goalDaysLeftHtml = "#goalDaysLeftHtml_" + type;
                var currentValueHtml = "#progress_currentLiftWeightAmount_" + type;
                var percentHtml = "#progress_currentLiftWeightAchievedPercent_" + type;
                var statusHtml = "#progress_currentLiftWeightStatus_" + type;

                var start = parseFloat($(startValueHtml).html());
                var goal = parseFloat($(goalValueHtml).html());
                var current = parseFloat(currentValue);
                var percent = 100 * (current - start) / (goal - start);
                //alert(start + "," + goal + "," + current + "," + percent)

                $(currentValueHtml).html(currentValue);
                $(percentHtml).html(percent.toFixed(1));
                if (percent >= 100) {
                    $(statusHtml).html("已完成");
                    $(statusHtml).css("color", "#3366CC");
                    $("#progressbar_" + type).css("width", "100%");
                }
                else {
                    $(statusHtml).html("进行中");
                    $(statusHtml).css("color", "green");
                    $("#progressbar_" + type).css("width", percent.toFixed(0).toString()+"%"); 
                }
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("更新测量型目标时出错了");
            alert(errorThrown);
        }
    });
}


//********************结束：测量型目标***************************

