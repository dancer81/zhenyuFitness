//初始化页面
function initMyGoal() {
    initDatePicker();
    initEasyPie();
    initCountdown($("#goaldatespan").html());
    initchart();
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
            $("#chartWeightCurve").html("<div style=\"margin-top:110px;margin-left:80px;color:#919191;font-family:微软雅黑;font-size:50px;\">您从未更新过您的体重！</div>");
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
            $("#chartWeightCurve").css("height", "350");
            $("#chartWeightCurve").html("<div style=\"margin-top:110px;margin-left:80px;color:#919191;font-family:微软雅黑;font-size:50px;\">您从未更新过您的体重！</div>");
            return;
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







//估算Rep Max
function EstimateRepMax(weightUsed, numberOfRepetitions) {
    return weightUsed / (1.0278 - (0.0278 * numberOfRepetitions));
}

function getOneRepsMax(currentLiftWeightAmount, currentRepsCount, goalLiftWeightAmount, goalRepsCount)
{
    if (currentLiftWeightAmount.length > 3) {
        $("#currentLiftWeightAmount_squats").val(parseInt(currentLiftWeightAmount / 10));
        $("#currentLiftWeightOneRepsMax").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount) / 10).toFixed(0));
    }

    else
    {
        $("#currentLiftWeightOneRepsMax").html(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightAmount_squats").val(parseInt(currentLiftWeightAmount));
        $("#currentLiftWeightOneRepsMax").html((EstimateRepMax(currentLiftWeightAmount, currentRepsCount)).toFixed(0));
    }
    $('#currentLiftWeightRepsCount').html(currentRepsCount);

    if (goalLiftWeightAmount.length > 3) {
        $("#goalLiftWeightAmount_squats").val(parseInt(goalLiftWeightAmount / 10));
        $("#goalLiftWeightOneRepsMax").html((EstimateRepMax(goalLiftWeightAmount, goalRepsCount) / 10).toFixed(0));
    }
    else {
        $("#goalLiftWeightAmount_squats").val(parseInt(goalLiftWeightAmount));
        $("#goalLiftWeightOneRepsMax").html(EstimateRepMax(goalLiftWeightAmount, goalRepsCount).toFixed(0));
    }
    $('#goalLiftWeightRepsCount').html(goalRepsCount);
}

