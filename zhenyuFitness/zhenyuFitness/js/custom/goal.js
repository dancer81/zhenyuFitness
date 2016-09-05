var FormWizard = function () {
    return {
        init: function () {
            if (!jQuery().bootstrapWizard) {
                return;
            }
            /*-----------------------------------------------------------------------------------*/
            /*	Show country list in Uniform style
			/*-----------------------------------------------------------------------------------*/
            $("#province_select").select2({
                placeholder: ""
            });

            var wizform = $('#registerForm');
            var alert_success = $('.alert-success', wizform);
            var alert_error = $('.alert-danger', wizform);

            $('#steptitle').html("请输入当前的身体数据");

            /*-----------------------------------------------------------------------------------*/
            /*	Validate the form elements
			/*-----------------------------------------------------------------------------------*/
            wizform.validate({
                doNotHideMessage: true,
                errorClass: 'error-span',
                errorElement: 'span',
                rules: {
                    /* �����˺� */
                    height: {
                        required: true,
                        number: true
                    },
                    weight: {
                        required: true,
                        number: true
                    },




                    email: {
                        required: true,
                        email: true,
                        maxlength: 49
                    },
                    password: {
                        minlength: 3,
                        required: true,
                        rangelength: [4, 15]
                    },
                    name: {
                        required: true,
                        maxlength: 29
                    },
                    gender: {
                        required: true
                    },
                    confirmpassword: {
                        required: true,
                        equalTo: '#password'

                    },
                    province: {
                        required: true
                    },
                    //country: {
                    //    required: true
                    //},
                    phone: {
                        /*                        required: true,*/
                        digits: true
                    },

                    /* ������Ϣ */
                    birthday: {
                        required: true

                    },

                    fitHis: {
                        required: true
                    }
                    //card_number: {
                    //	required: true,
                    //    minlength: 16,
                    //    maxlength: 16
                    //},
                    //card_cvc: {
                    //	required: true,
                    //    digits: true,
                    //    minlength: 3,
                    //    maxlength: 3
                    //},
                    //card_expirydate: {
                    //    required: true
                    //},
                    // card_holder_name: {
                    //    required: true
                    //}
                },

                invalidHandler: function (event, validator) {
                    alert_success.hide();
                    alert_error.show();
                },

                highlight: function (element) {
                    $(element)
                        .closest('.form-group').removeClass('has-success').addClass('has-error');
                },

                unhighlight: function (element) {
                    $(element)
                        .closest('.form-group').removeClass('has-error');
                },

                success: function (label) {
                    if (label.attr("for") == "gender") {
                        label.closest('.form-group').removeClass('has-error').addClass('has-success');
                        label.remove();
                    } else {
                        label.addClass('valid')
                        .closest('.form-group').removeClass('has-error').addClass('has-success');
                    }


                }
            });

            /*-----------------------------------------------------------------------------------*/
            /*	Initialize Bootstrap Wizard
			/*-----------------------------------------------------------------------------------*/
            $('#formWizard').bootstrapWizard({
                'nextSelector': '.nextBtn',
                'previousSelector': '.prevBtn',
                onNext: function (tab, navigation, index) {
                    if (index == 1) {
                        /* 验证身高、体重、腰围输入的正确性 */
                        $('#error-span-top').html("");
                        var tag = 0;
                        var height = parseFloat($('#input-1').val());
                        var weight = parseFloat($('#input-2').val());
                        var waist = parseFloat($('#input-3').val());
                        if ($('#input-1').val().length == 0) {
                            tag = 1;
                            $('#error-span-top').html($('#error-span-top').html() + "身高必须填写。此数值将参与估算您的体脂率。<br />");
                        }
                        if ($('#input-2').val().length == 0) {
                            tag = 1;
                            $('#error-span-top').html($('#error-span-top').html() + "体重必须填写。此数值将参与估算您的体脂率。<br />");
                        }
                        if ($('#input-3').val().length == 0) {
                            tag = 1;
                            $('#error-span-top').html($('#error-span-top').html() + "腰围必须填写。此数值将参与估算您的体脂率。<br />");
                        }
                        if ($('#input-1').val().length != 0 && (isNaN(height) || height > 300 || height <= 0)) {
                            tag = 1;
                            if (isNaN(height)) {
                                $('#error-span-top').html($('#error-span-top').html() + "身高必须为数字。<br />");
                            }
                            if (height > 3) {
                                $('#error-span-top').html($('#error-span-top').html() + "您的身高似乎不太可能超过3米……<br />");
                            }
                            if (height < 0.5) {
                                $('#error-span-top').html($('#error-span-top').html() + "您的身高似乎不太可能小于0.5米……<br />");
                            }
                        }


                        if ($('#input-2').val().length != 0 && (isNaN(weight) || weight > 300 || weight < 20)) {
                            tag = 1;
                            if (isNaN(weight)) {
                                $('#error-span-top').html($('#error-span-top').html() + "体重必须为数字。<br />");
                            }
                            if (weight > 300) {
                                $('#error-span-top').html($('#error-span-top').html() + "您的体重似乎不太可能超过300千克……<br />");
                            }
                            if (weight < 20) {
                                $('#error-span-top').html($('#error-span-top').html() + "您的体重似乎不太可能小于20千克……<br />");
                            }
                        }

                        if ($('#input-3').val().length != 0 && (isNaN(waist) || waist > 300 || waist < 20)) {
                            tag = 1;
                            if (isNaN(waist)) {
                                $('#error-span-top').html($('#error-span-top').html() + "腰围必须为数字。<br />");
                            }
                            if (waist > 300) {
                                $('#error-span-top').html($('#error-span-top').html() + "您的腰围似乎不太可能超过300厘米……<br />");
                            }
                            if (waist < 20) {
                                $('#error-span-top').html($('#error-span-top').html() + "您的腰围似乎不太可能小于20厘米……<br />");
                            }
                        }

                        if (tag == 1) {
                            alert_error.show();
                            return false;
                        }
                    }
                    /* end 验证身高、体重、腰围输入的正确性 */

                    /*根据input-1,input-2,input-3,以及用户的年龄和性别来计算体脂率,即初始化第三步的内容*/
                    if (index == 1) {
                        var bodyfat = calculateBodyfat($('#input-1').val(), $('#input-2').val(), $('#input-3').val(), $('#gender').val(), $('#age').val());
                        $('#input-4').val(bodyfat.toFixed(2));
                        initinput();
                        /*end 根据input-1,input-2,input-3,以及用户的年龄和性别来计算体脂率*/

                        /*初始化step2_part2里的参数*/
                        //设置bodyfat
                        $("#step2_part2_bodyfatrate_span").html(bodyfat.toFixed(2)+"%");
                        //设置参数显示
                        if ($("#gender").val() == 0) {
                            $("#step2_part2_gender_span").html("男");
                        }
                        if ($("#gender").val() == 1) {
                            $("#step2_part2_gender_span").html("女");
                        }
                        $("#step2_part2_age_span").html($("#age").val());
                        $("#step2_part2_height_span").html($('#input-1').val());
                        $("#step2_part2_weight_span").html($('#input-2').val());
                        $("#step2_part2_waist_span").html($('#input-3').val());

                        //设置对比数据、体型图片-男
                        bodyfat /= 100;
                        if ($("#gender").val() == 0)//男性
                        {
                            ////对比
                            //$("#step2_part2_img_constrast_lean").attr('src', "http://localhost/resources/img/对比/male_lean.jpg");
                            //$("#step2_part2_img_constrast_lean_chart").attr('src', "http://localhost/resources/img/对比/male_lean_chart.png");
                            //$("#step2_part2_constrast_height_lean").html("身高：1.8米");
                            //$("#step2_part2_constrast_weight_lean").html("体重：90千克");
                            //$("#step2_part2_constrast_bodyfat_lean").html("体脂率：9%");
                            //$("#step2_part2_img_constrast_large").attr('src', "http://localhost/resources/img/对比/male_large.jpg");
                            //$("#step2_part2_img_constrast_large_chart").attr('src', "http://localhost/resources/img/对比/male_large_chart.png");
                            //$("#step2_part2_constrast_height_large").html("身高：1.8米");
                            //$("#step2_part2_constrast_weight_large").html("体重：90千克");
                            //$("#step2_part2_constrast_bodyfat_large").html("体脂率：26%");

                            //if (bodyfat <= 0.05) {
                            //    $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/5_man_shadow.jpg");
                            //}
                            //else if (bodyfat > 0.05 && bodyfat <= 0.1) {
                            //    $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/10_man_shadow.jpg");
                            //}
                            //else if (bodyfat > 0.1 && bodyfat <= 0.15) {
                            //    $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/15_man_shadow.jpg");
                            //}
                            //else if (bodyfat > 0.15 && bodyfat <= 0.2) {
                            //    $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/20_man_shadow.jpg");
                            //}
                            //else if (bodyfat > 0.2 && bodyfat <= 0.25) {
                            //    $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/25_man_shadow.jpg");
                            //}
                            //else if (bodyfat > 0.25 && bodyfat <= 0.3) {
                            //    $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/30_man_shadow.jpg");
                            //}
                            //else if (bodyfat > 0.3 && bodyfat <= 0.35) {
                            //    $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/35_man_shadow.jpg");
                            //}
                            //else {
                            //    $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/40_man_shadow.jpg");
                            //}


                            ////初始化step2_part3图片
                            //var listimg1 = $("#select_img_bodyfat1 img");
                            //for (i = 0; i < listimg1.length; i++) {
                            //    var src = "http://localhost/resources/img/bodyfatpercentage/" + (i + 2) * 5 + "_man.jpg";
                            //    listimg1.eq(i).attr('src', src);
                            //}

                            //var listimg2 = $("#select_img_bodyfat2 img");
                            //for (i = 0; i < listimg2.length; i++) {
                            //    var src = "http://localhost/resources/img/bodyfatpercentage/" + (i + 4) * 5 + "_man.jpg";
                            //    listimg2.eq(i).attr('src', src);
                            //}



                        }
                        if ($("#gender").val() == 1)//女性
                        {
                            //对比
                            $("#step2_part2_constract_desc").html("下图两位女士同年龄(30)、同身高(165cm)、同体重(65kg)，但是身体形态差异却十分巨大！");
                            $("#step2_part2_img_constrast_lean").attr('src', "http://localhost/resources/img/对比/female_lean.jpg");
                            $("#step2_part2_img_constrast_lean_chart").attr('src', "http://localhost/resources/img/对比/female_lean_chart.png");
                            $("#step2_part2_constrast_height_lean").html("身高：1.65米");
                            $("#step2_part2_constrast_weight_lean").html("体重：65千克");
                            $("#step2_part2_constrast_bodyfat_lean").html("体脂率：13%");
                            $("#step2_part2_img_constrast_large").attr('src', "http://localhost/resources/img/对比/female_large.jpg");
                            $("#step2_part2_img_constrast_large_chart").attr('src', "http://localhost/resources/img/对比/female_large_chart.png");
                            $("#step2_part2_constrast_height_large").html("身高：1.65米");
                            $("#step2_part2_constrast_weight_large").html("体重：65千克");
                            $("#step2_part2_constrast_bodyfat_large").html("体脂率：33%");


                            if (bodyfat <= 0.1) {
                                $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/10_women_shadow.jpg");
                            }
                            else if (bodyfat > 0.1 && bodyfat <= 0.15) {
                                $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/15_women_shadow.jpg");
                            }
                            else if (bodyfat > 0.15 && bodyfat <= 0.2) {
                                $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/20_women_shadow.jpg");
                            }
                            else if (bodyfat > 0.2 && bodyfat <= 0.25) {
                                $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/25_women_shadow.jpg");
                            }
                            else if (bodyfat > 0.25 && bodyfat <= 0.3) {
                                $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/30_women_shadow.jpg");
                            }
                            else {
                                $("#step2_part2_img").attr('src', "http://localhost/resources/img/bodyfatpercentage/35_women_shadow.jpg");
                            }

                            //初始化step2_part3图片
                            //var listimg1 = $("#select_img_bodyfat1 img");
                            //for (i = 0; i < listimg1.length; i++) {
                            //    var src = "http://localhost/resources/img/bodyfatpercentage/" + (i + 2) * 5 + "_women.jpg";
                            //    listimg1.eq(i).attr('src', src);
                            //}

                            //var listimg2 = $("#select_img_bodyfat2 img");
                            //for (i = 0; i < listimg2.length; i++) {
                            //    var src = "http://localhost/resources/img/bodyfatpercentage/" + (i + 6) * 5 + "_women.jpg";
                            //    listimg2.eq(i).attr('src', src);
                            //}

                            

                            ////设置图片说明
                            //var listdesc = $("#select_img_bodyfat1 span");
                            //for (i = 0; i < listdesc.length; i++) {
                            //    switch (i) {
                            //        case 0:
                            //            listdesc.eq(i).html("体脂率：10% &nbsp;纤细骨感");
                            //            break;
                            //        case 1:
                            //            listdesc.eq(i).html("体脂率：15% &nbsp;气质性感");
                            //            break;
                            //        case 2:
                            //            listdesc.eq(i).html("体脂率：20% &nbsp;活力健康");
                            //            break;
                            //        case 3:
                            //            listdesc.eq(i).html("体脂率：25% &nbsp;健康柔美");
                            //            break;
                            //        default:
                            //            break;
                            //    }
                            //}

                            //listdesc = $("#select_img_bodyfat2 span");
                            //for (i = 0; i < listdesc.length; i++) {
                            //    switch (i) {
                            //        case 0:
                            //            listdesc.eq(i).html("体脂率：30% &nbsp;超重……");
                            //            break;
                            //        case 1:
                            //            listdesc.eq(i).html("体脂率：35% &nbsp;肥胖……");
                            //            break;
                            //        default:
                            //            break;
                            //    }
                            //}
                        }



                        /* end 初始化step2_part2里的参数*/


                        
                    }

                    //验证健身目标有没有勾选
                    if (index == 2) {
                        var tag_fitnesstarget = 0;
                        var fitnesstarget_radio = $("#fitnesstarget").find("input.uniform"); //alert(all_radio.length);
                        for (i = 0; i < fitnesstarget_radio.length; i++) {
                            //if ($('all_radio.eq(i):checked'))
                            if (fitnesstarget_radio.eq(i).is(":checked")) {
                                tag_fitnesstarget = 1;
                                break;
                            }
                        }
                        if (tag_fitnesstarget == 0) {
                            $('#error-span-top').html("请选择您健身的总体目标后继续。");
                            alert_error.show();
                            return false;

                        }
                    }

                    //体脂率是否为空或者合理，因为允许用户修改，所以可能出错。
                    if (index == 3) {

                    }

                    //验证目标体格有没有勾选
                    if (index == 4) {
                        var tag_physique = 0;
                        var physique_radio = $("#physique").find("input.uniform"); //alert(all_radio.length);
                        for (i = 0; i < physique_radio.length; i++) {
                            //if ($('all_radio.eq(i):checked'))
                            if (physique_radio.eq(i).is(":checked")) {
                                tag_physique = 1;
                                break;
                            }
                        }
                        if (tag_physique == 0) {
                            $('#error-span-top').html("请选择您的目标体型后继续。");
                            alert_error.show();
                            return false;

                        }

                        //设置下一步的“最能激励您的用户”图片列表；
                        setSamephysiqueTopInspirationMemberImgs($("#gender").val(), index);
                    }

                    //设置步骤标题
                    showStepTitle(index);




                    alert_success.hide();
                    alert_error.hide();
                    if (wizform.valid() == false) {
                        return false;
                    }
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    $('.stepHeader', $('#formWizard')).text((index + 1) + ' / ' + total);
                    jQuery('li', $('#formWizard')).removeClass("done");
                    var li_list = navigation.find('li');
                    for (var i = 0; i < index; i++) {
                        jQuery(li_list[i]).addClass("done");
                    }
                    if (current == 1) {
                        $('#formWizard').find('.prevBtn').hide();
                    } else {
                        $('#formWizard').find('.prevBtn').show();
                    }
                    if (current >= total) {
                        $('#formWizard').find('.nextBtn').hide();
                        $('#formWizard').find('.submitBtn').show();
                    } else {
                        $('#formWizard').find('.nextBtn').show();
                        $('#formWizard').find('.submitBtn').hide();
                    }
                },
                onPrevious: function (tab, navigation, index) {
                    showStepTitle(index);


                    alert_success.hide();
                    alert_error.hide();
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    $('.stepHeader', $('#formWizard')).text((index + 1) + ' / ' + total);
                    jQuery('li', $('#formWizard')).removeClass("done");
                    var li_list = navigation.find('li');
                    for (var i = 0; i < index; i++) {
                        jQuery(li_list[i]).addClass("done");
                    }
                    if (current == 1) {
                        $('#formWizard').find('.prevBtn').hide();
                    } else {
                        $('#formWizard').find('.prevBtn').show();
                    }
                    if (current >= total) {
                        $('#formWizard').find('.nextBtn').hide();
                        $('#formWizard').find('.submitBtn').show();
                    } else {
                        $('#formWizard').find('.nextBtn').show();
                        $('#formWizard').find('.submitBtn').hide();
                    }
                },
                onTabClick: function (tab, navigation, index) {
                    //bootbox.alert('On Tab click is disabled');
                    return false;
                },
                onTabShow: function (tab, navigation, index) {
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    var $percent = (current / total) * 100;
                    $('#formWizard').find('.progress-bar').css({
                        width: $percent + '%'
                    });
                }
            });

            $('#formWizard').find('.prevBtn').hide();
            $('#formWizard .submitBtn').click(function () {
                //bootbox.alert("提交成功。");
            }).hide();
        }
    };
}();

//设置步骤标题
function showStepTitle(index) {//选择健身目标
    if (index == 0) {
        $('#steptitle').html("请输入您当前的身体数据");
    }
    if (index == 1) {
        $('#steptitle').html("请选择您健身的总体目标");
    }
    if (index == 2) {
        $('#steptitle').html("请确认您的体脂率");
    }
    if (index == 3) {
        $('#steptitle').html("请选择您的目标体型");
    }
    if (index == 4) {
        $('#steptitle').html("您健身目标的相关数据");
    }
    if (index == 5) {
        $('#steptitle').html("目标达成的天数");
    }
    if (index == 6) {
        $('#steptitle').html("健身目标设置完成");
    }
}

function calculateBodyfat(height, weight, waist, gender, age) {
    var first = calbodyfat1(weight, waist, gender);
    var second = calbodyfat2(weight, height, waist, age, gender);
    return (first + second) / 2;
}
function calbodyfat1(weight, waist, gender) {
    var a = waist * 0.74;
    var b;
    if (gender == 0)//男性
        b = weight * 0.082 + 44.74;
    else b = weight * 0.082 + 34.89;//女性
    return (a - b) / weight * 100;
}
function calbodyfat2(weight, height, waist, age, gender) {
    var BMI = weight / (height * height) * 10000;
    var tag;
    if (gender == 0) tag = 1;//男性
    if (gender == 1) tag = 0;//女性
    return 1.2 * BMI + 0.23 * age - 5.4 - 10.8 * tag;
}

//初始化定制的输入框
function initinput() {
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
}

function bodyfatDesc(gender,index)
{
    var desc;
    if (gender == 0) {//男性
        switch(index)
        {
            case 0://5%
                desc = "您有着近乎雕像般的体型。能拥有这样的体型显示着您曾经或者正在经历“痛苦指数”极高的生活方式，但这一切都是值得的。您身体表面每一块肌肉都清晰可见，您的腹肌犹如雕刻出来一般让人着迷。请允许我向您致敬！";
                break;
            case 1://10%
                desc = "您有着非常让人着迷的体型，您的体型让您赢得了超高的回头率甚至是许多妒忌的目光。您身上结实而又棱角分明的肌肉块显示着您非常注重锻炼的细节，并且过着健康、科学而自律的生活。您的腹部可能会有一点点脂肪，但每一寸脂肪下面都能让人看清楚结实的腹肌。非常了不起！";
                break;
            case 2://15%
                desc = "您可以用手摸到腹肌，但您的腹肌还不能被看到；您全身的肌肉开始显露，但还不明显。您可能经常锻炼，同时又注意饮食，希望自己能达到健身的目标。非常好，您拥有健康的体态。继续保持吧！";
                break;
            case 3://20%
                desc = "您的肌肉并不容易让人引起注意。也许有时候在健身房锻炼以后，您的肌肉块能凸起到让人多看一眼，但这并不长久。您可能经常健身，但可能不太注意训练的细节，同时在日常饮食方面也并不太讲究。但是如果您继续努力，离目标实现不会太久。";
                break;
            case 4://25%
                desc = "是时候来一场转变了！您现在的身体已经超重。也许在你望着镜子里的自己时感到困惑。现在开始健身吧，设定一个目标，坚持住，您会看到自己的转变如此之快。别让生活掌控你，你必须掌控自己的生活！";
                break;
            case 5://30%
                desc = "您正在开始经历一场灾难。您有粗壮而松软的大腿和圆圆的腹部。如果您不就此打住，灾难就要开始了。所以，就到这儿吧。现在开始放弃你那些超大号的宽松的衣裤，开始健身！在这里制定一个科学的健身计划和合理的饮食计划，我们会帮您达到目标，加油！";
                break;
            case 6://35%
                desc = "您必须马上关上电视，从舒适的沙发里站起来！否则，情况会持续恶化！您的全身都覆盖着厚厚的脂肪，并且您的肌肉受到了压迫。当您看见镜子里的自己时，您可能会非常沮丧！但一切还并未结束，我们会帮助您迈出第一步，重新掌控您的生活！站起来，开始战斗！";
                break;
            case 7://40%
                desc = "这是一场战争，不成功便成仁！您的健康状况极度危险，您的器官正在遭受损害，您的全身都挂满了定时炸弹！在这场战争中，您正处于极度不利的形式中。但战争还没有结束，因此您必须开始还击！而我们就是您的援军，我们能为您提供改变现状的一切。立刻开始,就是现在！";
                break;
            default:
                break;
        }
    }
    else {//女性
        switch(index)
        {
            case 0://10%
                desc = "作为女性，要达到您这种水平极度不容易，这表明您长期科学地进行抗阻训练，同时在生活上有超乎常人的自律能力。您有着凿刻般的腹肌，全身的肌肉线条和整体的身体形态达到了健美比赛的要求。您对健身非常专业！";
                break;
            case 1://15%
                desc = "相信我，如果您穿着比基尼走在沙滩上，那绝对会吸引大多数人的眼光。您有着维秘般的体态，这一切都显示出您非常认真而科学的对待健身，也许已经有2年，每周3-4次健身，是不是？虽然很累，但这一切都是值得的！";
                break;
            case 2://20%
                desc = "您的身材苗条有型，腹肌虽然还看不到但能明显感受到。您的身体并不柔弱，力量在你的皮肤下流淌。您可能经常锻炼身体，但如果要更进一步还有很多路要走。您应该更加关注运动的科学性和饮食的合理性。";
                break;
            case 3://25%
                desc = "作为女性，您并不算肥胖。也许有时候当您望着镜子里的自己时会觉得一些沮丧，但事实上您处于女性体脂率的平均水平。如果您想拥有紧致的腹部，健美的手臂，没问题，不要给自己找任何借口。我们可以在训练方法、饮食搭配、补剂推荐等各方面为您提供咨询和帮助。";
                break;
            case 4://30%
                desc = "虽然您已经处于肥胖行列，但是一切并不算太晚。您的腹部和臀部堆积着相当多的脂肪，您的手臂粗壮而松软，但是没关系，让我们来帮助你。是时候来一场转变了！请记住，人只活一次，所以不要让你唯一的“住所”——身体一团糟！";
                break;
            case 5://35%
                desc = "这是一场战争，不成功便成仁！您的健康状况极度危险，您的器官正在遭受损害，您的全身都挂满了定时炸弹！在这场战争中，您正处于极度不利的形式中。但战争还没有结束，因此您必须开始还击！而我们就是您的援军，我们能为您提供改变现状的一切。立刻开始,就是现在！";
                break;
            default:
                break;
        }
    }
    return desc;
}


function physiqueDesc(gender, index) {
    var goal_weight;
    var fatchangeValue;
    var leanmasschangeValue;
    var coefficient;
    var goal_bf;
    var physique_img;
    var yourgoalstats_physique_img;
    //设置体型描述文字的html
    goalphysiqueDesc(gender, index);
    //设置目标相近会员栏
    setSimilargoalMember(gender, index);
    if (gender == 0) {
        switch(index)
        {
            case 0:
                goal_bf = 0.075;
                coefficient = 42.7;
                physique_img = "http://localhost/resources/img/physique/man/bk/SKINNY_RIPPED.png";
                yourgoalstats_physique_img = "http://localhost/resources/img/physique/man/skinny_ripped-large.png";
                $("#goal_physique").html("很瘦，但肌肉线条明显");
                
                break;
            case 1:
                goal_bf = 0.08;
                coefficient = 45.1;
                physique_img = "http://localhost/resources/img/physique/man/bk/MALE_MODEL.png";
                yourgoalstats_physique_img = "http://localhost/resources/img/physique/man/male_model-large.png";
                $("#goal_physique").html("男性模特");
                
                break;
            case 2:
                goal_bf = 0.08;
                coefficient = 47.8;
                physique_img = "http://localhost/resources/img/physique/man/bk/ATHLETE.png";
                yourgoalstats_physique_img = "http://localhost/resources/img/physique/man/athlete-large.png";
                $("#goal_physique").html("对抗类男性运动员");
                
                break;
            case 3:
                goal_bf = 0.06;
                coefficient = 53.4;
                physique_img = "http://localhost/resources/img/physique/man/bk/BODYBUILDER.png";
                yourgoalstats_physique_img = "http://localhost/resources/img/physique/man/bodybuilder-large.png";
                $("#goal_physique").html("健身达人");
                
                break;
            case 4:
                goal_bf = 0.2;
                coefficient = 71.1;
                physique_img = "http://localhost/resources/img/physique/man/bk/STRONGMAN.png";
                yourgoalstats_physique_img = "http://localhost/resources/img/physique/man/strongman-large.png";
                $("#goal_physique").html("大力士");
                
                break;
            case 5:
                goal_bf = 0.04;
                coefficient = 64.4;
                physique_img = "http://localhost/resources/img/physique/man/bk/PRO_BODYBUILDER.png";
                yourgoalstats_physique_img = "http://localhost/resources/img/physique/man/pro_bodybuilder-large.png";
                $("#goal_physique").html("专业健美运动员");
                
                break;
            default:
                break;

        }
    }
    else {//女性
        switch (index) {
            case 0:
                goal_bf = 0.20;
                coefficient = 31.8;
                physique_img = "http://localhost/resources/img/physique/women/bk/FASHION_MODEL.png";
                yourgoalstats_physique_img = "http://localhost/resources/img/physique/women/fashion_model-large.png";
                $("#goal_physique").html("时尚女模特");
                
                break;
            case 1:
                goal_bf = 0.18;
                coefficient = 33.4;
                physique_img = "http://localhost/resources/img/physique/women/bk/SWIMSUIT.png";
                yourgoalstats_physique_img = "http://localhost/resources/img/physique/women/swimsuit-large.png";
                $("#goal_physique").html("比基尼女郎");
                
                break;
            case 2:
                goal_bf = 0.16;
                coefficient = 33.9;
                physique_img = "http://localhost/resources/img/physique/women/bk/FIT_WOMAN.png";
                yourgoalstats_physique_img = "http://localhost/resources/img/physique/women/fit_woman-large.png";
                $("#goal_physique").html("健康女士");
                
                break;
            case 3:
                goal_bf = 0.13;
                coefficient = 34;
                physique_img = "http://localhost/resources/img/physique/women/bk/FITNESS_MODEL.png";
                yourgoalstats_physique_img = "http://localhost/resources/img/physique/women/fitness_model-large.png";
                $("#goal_physique").html("健身女士");
                
                break;
            case 4:
                goal_bf = 0.09;
                coefficient = 38.6;
                physique_img = "http://localhost/resources/img/physique/women/bk/FITNESS_MODEL.png";
                yourgoalstats_physique_img = "http://localhost/resources/img/physique/women/bodybuilder-large.png";
                $("#goal_physique").html("专业女健美运动员");
                
                break;
            default:
                break;

        }
    }
    $("#physique_desc .col-md-5 img").attr('src', physique_img);
    setGoalbfHtml(goal_bf);
    goal_weight = coefficient * $("#input-1").val() / 100;
    $("#goal_weight").html(goal_weight.toFixed(1) + "千克");
    setFatchangeAndLeanmasschange(goal_weight, goal_bf);

    //初始化第五部的页面数据，2个输入框数据goalweight,goalBF和一个图片
    $("#input-5").val(goal_weight.toFixed(1));
    $("#input-6").val((goal_bf * 100).toFixed(1));
    initinput();
    $("#yourgoalstats_physique_img").attr('src', yourgoalstats_physique_img);
    $("#yourgoalstats_physiquetext").html($("#goal_physique").html());

    
}

function setGoalbfHtml(bfGoal)
{
    $(".goal_physique_status").html("目标体脂率: " + (bfGoal *100).toFixed(1) + "%");
}
//设置增加减少脂肪量和瘦体重的html
function setFatchangeAndLeanmasschange(weightGoal, bfGoal)
{
    var fatchangeValue = fatchange(weightGoal, bfGoal);

    if (fatchangeValue > 0) {
        $("#fatchangeD").html("增加");
        $("#fatchange").html(fatchangeValue + "千克");
    }
    else {
        $("#fatchangeD").html("减少");
        $("#fatchange").html((0 - fatchangeValue) + "千克");
    }

    leanmasschangeValue = leanmasschange(weightGoal, bfGoal);
    if (leanmasschangeValue > 0) {
        $("#leanmasschangeD").html("增加");
        $("#leanmasschange").html(leanmasschangeValue + "千克");
    }
    else {
        $("#leanmasschangeD").html("减少");
        $("#leanmasschange").html(0 - leanmasschangeValue + "千克");
    }
}

function fatchange(weightGoal, bfGoal) {
    var weightNow = $("#input-2").val();
    var bodyfat = getbodyfat();
    var bfNow = getbodyfat() / 100;

    return (weightGoal * bfGoal - weightNow * bfNow).toFixed(1);
}

function leanmasschange(weightGoal, bfGoal) {
    var weightNow = $("#input-2").val();
    var bfNow = getbodyfat() / 100;

    return (weightGoal * (1 - bfGoal) - weightNow * (1 - bfNow)).toFixed(1);
}

//根据用户所填信息，获取用户的体脂率的100倍
function getbodyfat() {
    var radio_knowbf = $('input:radio[name="chk_knowbodyfat"]:checked').val();
    if (radio_knowbf == 0) {
        return $("#input-4").val();
    }
    else {
        var boolCheck = $('input:radio[name="selectbodyfat"]').is(":checked");
        if(!boolCheck){
            return $("#step2_part2_bodyfatrate_span").html().substr(0, $("#step2_part2_bodyfatrate_span").html().length - 1);
        }
        else {
            var all_radio = $("#step2_part3").find("input.uniform"); //alert(all_radio.length);
            for (i = 0; i < all_radio.length; i++) {
                if (all_radio.eq(i).is(":checked")) {
                    return (i + 1) * 5;
                }
            }
        }
    }
}

//设置目标体型图片的说明
function goalphysiqueDesc(gender, index) {
    var desc;
    if (gender == 0) {//男性
        switch (index) {
            case 0://skinny ripped
                desc = "这并不是所谓的‘骨瘦如柴’或者‘瘦胖子（即，体重小但体脂率高）’。这种体型具有极高的‘瘦体重’和极低的脂肪含量，体表的肌肉线条十分清晰，腹部六块腹肌如同雕刻出来似得，这一切都意味着常年累月刻苦的锻炼。相信很多女性都喜欢这种体型的男士，而很多男士都希望拥有此种体型。";
                break;
            case 1:
                desc = "这完全可以在健身房锻炼而获得！这种体型全身肌肉线条可见，腹部平坦腹肌隐约可见。相比前一种体型，因为体脂率略有升高，因为体型更为柔和，看起来也更有亲和力。";
                break;
            case 2:
                desc = "这种体型代表着力量、速度和敏捷性，是视觉效果和身体素质的高度统一！它必须通过高强度的力量训练和高强度的有氧练习才能获得。你必须在健身房刻苦的练习已增加肌肉，同时结合高强度的有氧练习能保证你始终保持一个很低的体脂率。";
                break;
            case 3:
                desc = "如果你想拥有这样的体型，那么长年混迹于健身房只是一个开始，你还必须有科学的训练方法、合理的饮食搭配、良好的生活习惯以及高度自律能力。健身已经不是一种习惯或者爱好，它已经是一种生活态度。";
                break;
            case 4:
                desc = "谁说脂肪无用？这具巨量肌肉和脂肪混合的躯体所拥有的力量是其他几种体型望尘莫及的。什么？肌肉线条是什么玩意儿，去！我就是要力量！想成为大力士？努力训练，保证充足甚至是过量的饮食，一切重物在你面前都不值一提！";
                break;
            case 5:
                desc = "这是专业健美运动员的体型，普通人想练到这种程度几乎不可能。它拥有所有体型中最低的体脂率和最高的肌肉含量，健美舞台才是你的归宿！想拥有这种体型，除了努力和汗水，还必须拥有天赋和基因。";
                break;
            default:
                break;
        }
    }
    else {//女性
        switch (index) {
            case 0://skinny ripped
                desc = "这是一个能让女士十分自信的体型，是一具属于舞台的、魅力十足的躯体。身体略微有一丝肌肉线条，但身体每一寸地方都让人觉得既紧致又柔和。这种体型必须在日常健身锻炼中十分注意细节。不要惊讶，这不是天方夜谭，你也可以拥有如此让人着迷的身材。";
                break;
            case 1:
                desc = "这是一种极其适合穿着泳装比基尼的身体形态。身体线条错落有致，但不突兀；苗条柔软，但并不弱不禁风，能与‘热情’、‘健康’、‘魅力’紧紧联系起来。如果你想拥有此种体型，你必须经常进行力量训练，同时有合理的饮食搭配。坚持，日复一日，迟早你就会拥有此种身材。";
                break;
            case 2:
                desc = "如果你想拥有这种体型，那么你就必须和懒惰、贪吃、自我放纵说再见了。你的身体肌肉线条清晰，但并不让人望而生畏；相反，如果你有这种体型，相信我，你肯定拥有无数的粉丝。你是健康和性感的代言！当然，这一切并不容易，从现在开始迈出第一步，循序渐进。相信我，你也可以的！";
                break;
            case 3:
                desc = "这是一种‘痛苦指数’很高的体型，意味着你的生活极度自律，而健身房才是你快乐的源泉。健身是你的生活态度，力量训练是你的第一选择。你的体脂肪率已经低于大部分普通男士，所以在某些男士看来，你的体型近乎完美！真是不容易，但这一切都是值得的！";
                break;
            case 4:
                desc = "什么？这是女士的体型吗？你没看错！这是专业女性健美运动员的体型。普通的女士无论怎么进行力量训练都绝无可能练成这种体型！没错！是绝无可能！可能大部分女士都不认同这种体型，但是如果你希望达到这个目标，我们可以帮助你！";
                break;
            default:
                break;
        }
    }

    $("#goal_physique_desc").html(desc);
}

//根据用户目标体型来选择与用户目标相近的会员
function setSimilargoalMember(gender,index) {
    var imglist = new Array();
    
    //ajax取得数据源(用到参数index),并赋值给imglist,imglist最大长度为12（3行）
    imglist[0] = "http://localhost/resources/img/avatars/avatar1.jpg";
    imglist[1] = "http://localhost/resources/img/avatars/avatar2.jpg";
    imglist[2] = "http://localhost/resources/img/avatars/avatar3.jpg";
    imglist[3] = "http://localhost/resources/img/avatars/avatar4.jpg";
    imglist[4] = "http://localhost/resources/img/avatars/avatar5.jpg";
    imglist[5] = "http://localhost/resources/img/avatars/avatar6.jpg";
    imglist[6] = "http://localhost/resources/img/avatars/avatar7.jpg";
    imglist[7] = "http://localhost/resources/img/avatars/avatar8.jpg";
    imglist[8] = "http://localhost/resources/img/avatars/avatar3.jpg";
    imglist[9] = "http://localhost/resources/img/avatars/avatar4.jpg";

    //将imglist赋值给对应的table
    var htmlTD;
    $("#similargoalmemberImgs tr:gt(0)").each(function (i) {
        $(this).children("td").each(function (j) {
            if (i * 4 + j >= imglist.length) return false;
            htmlTD = "<a href='#'><img src='" + imglist[i * 4 + j] + "' /></a>";
            $(this).html(htmlTD);
        });
    });

}

function setSamephysiqueTopInspirationMemberImgs(gender, index) {
    var imglist = new Array();

    //ajax取得数据源(用到参数index),并赋值给imglist,imglist最大长度为12（2行）
    imglist[0] = "http://localhost/resources/img/avatars/avatar1.jpg";
    imglist[1] = "http://localhost/resources/img/avatars/avatar2.jpg";
    imglist[2] = "http://localhost/resources/img/avatars/avatar3.jpg";
    imglist[3] = "http://localhost/resources/img/avatars/avatar4.jpg";
    imglist[4] = "http://localhost/resources/img/avatars/avatar5.jpg";
    imglist[5] = "http://localhost/resources/img/avatars/avatar6.jpg";
    imglist[6] = "http://localhost/resources/img/avatars/avatar7.jpg";
    imglist[7] = "http://localhost/resources/img/avatars/avatar8.jpg";
    imglist[8] = "http://localhost/resources/img/avatars/avatar3.jpg";
    imglist[9] = "http://localhost/resources/img/avatars/avatar4.jpg";

    //将imglist赋值给对应的table
    var htmlTD;
    $("#samephysique_topinspiration_memberImgs tr:gt(0)").each(function (i) {
        $(this).children("td").each(function (j) {
            if (i * 6 + j >= imglist.length) return false;
            htmlTD = "<a href='#'><img src='" + imglist[i * 6 + j] + "' /></a>";
            $(this).html(htmlTD);
        });
    });
}

//初始化女性健身目标选择图片
function initFitnessTarget(gender) {
    var imglist = $("#fitnesstarget img");
    if (gender == 1){//男性在页面直接初始化，如果是女性，此处初始化
        for (i = 0; i < imglist.length; i++) {
            switch(i)
            {
                case 0:
                    imglist.eq(i).attr('src', 'http://localhost/resources/img/fitnesstarget/women/buildmuscle.png');
                    break;
                case 1:
                    imglist.eq(i).attr('src', 'http://localhost/resources/img/fitnesstarget/women/losefat.png');
                    break;
                case 2:
                    imglist.eq(i).attr('src', 'http://localhost/resources/img/fitnesstarget/women/transform.png');
                    break;
                case 3:
                    imglist.eq(i).attr('src', 'http://localhost/resources/img/fitnesstarget/women/endurance.png');
                    break;
                case 4:
                    imglist.eq(i).attr('src', 'http://localhost/resources/img/fitnesstarget/women/sport.png');
                    break;
                case 5:
                    imglist.eq(i).attr('src', 'http://localhost/resources/img/fitnesstarget/women/stretch.png');
                    break;
                case 6:
                    imglist.eq(i).attr('src', 'http://localhost/resources/img/fitnesstarget/women/probodybuilder.png');
                    break;
            } 
        }
    }
}

//初始化女性体脂率选择图片
function initBodyfatSelect(gender) {
    var imglist = $("#yourbodyfat #step2_part3 img");
    if (gender == 1) {
        for (i = 0; i < imglist.length; i++) {
            var imgsrc = "http://localhost/resources/img/bodyfatpercentage/" + (i + 2) * 5 + "_women.jpg";
            imglist.eq(i).attr('src', imgsrc);
        }
    }
    $("#step2_part3_last1").css('display', 'none');
    $("#step2_part3_last2").css('display', 'none');

    //设置图片说明
    var listdesc = $("#select_img_bodyfat1 span");
    for (i = 0; i < listdesc.length; i++) {
        switch (i) {
            case 0:
                listdesc.eq(i).html("体脂率：10% &nbsp;纤细骨感");
                break;
            case 1:
                listdesc.eq(i).html("体脂率：15% &nbsp;气质性感");
                break;
            case 2:
                listdesc.eq(i).html("体脂率：20% &nbsp;活力健康");
                break;
            case 3:
                listdesc.eq(i).html("体脂率：25% &nbsp;健康柔美");
                break;
            default:
                break;
        }
    }

    listdesc = $("#select_img_bodyfat2 span");
    for (i = 0; i < listdesc.length; i++) {
        switch (i) {
            case 0:
                listdesc.eq(i).html("体脂率：30% &nbsp;超重……");
                break;
            case 1:
                listdesc.eq(i).html("体脂率：35% &nbsp;肥胖……");
                break;
            default:
                break;
        }
    }
}

//初始化女性目标体型选择图片
function initphysiqueSelect(gender) {
    var imglist = $("#physique .thumbnail img");
    if (gender == 1) {
        for (i = 0; i < imglist.length; i++) {
            switch (i) {
                case 0:
                    imglist.eq(i).attr('src', 'http://localhost/resources/img/physique/women/fashion_model-large.png');
                    break;
                case 1:
                    imglist.eq(i).attr('src', 'http://localhost/resources/img/physique/women/swimsuit-large.png');
                    break;
                case 2:
                    imglist.eq(i).attr('src', 'http://localhost/resources/img/physique/women/fit_woman-large.png');
                    break;
                case 3:
                    imglist.eq(i).attr('src', 'http://localhost/resources/img/physique/women/fitness_model-large.png');
                    break;
                case 4:
                    imglist.eq(i).attr('src', 'http://localhost/resources/img/physique/women/bodybuilder-large.png');
                    break;
                default:
                    break;
            }
        }
    }

    $("#last_physique_div").css('display', 'none');
}

function initPagebyGender(gender){
    initFitnessTarget(gender);
    initBodyfatSelect(gender);
    initphysiqueSelect(gender);
}

