<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/generalMaster.Master" AutoEventWireup="true" CodeBehind="PhotoUpload.aspx.cs" Inherits="zhenyuFitness.Pages.PhotoManager.PhotoUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- DROPZONE -->
    <link rel="stylesheet" type="text/css" href="../../js/dropzone/dropzone.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- DROPZONE -->
    <script type="text/javascript" src="../../js/dropzone/dropzone.js"></script>
    <div class="row">
        <div class="col-md-12">
            <!-- BOX -->
            <div class="box border blue">
                <div class="box-title">
                    <h4><i class="fa fa-cloud-download"></i>PhotoUploader</h4>
                    <div class="tools hidden-xs">
                        <a href="javascript:;" class="collapse">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>
                <div class="box-body">
<%--                    <button id="submit-all">Submit all files</button>
                    <form action="PhotoUpload.aspx" class="dropzone" id="my-dropzone"></form>--%>

                    <%--/zhenyuFitness/ashx/DealAjax.ashx--%>
                    <%--<form action="PhotoUpload.aspx" method="post" 
                        class="dropzone"
                        id="my-awesome-dropzone">
                        <div class="fallback">
                            <input name="file" type="file" multiple="" />
                        </div>
                    </form>--%>
                    <!--class="dropzone" 使用dropzone自带的样式 样式在引用的CSS中-->
                    <form action="/"
                        class="dropzone"
                        enctype="multipart/form-data"
                        id="mydropzone"
                        method="post">
                        <!--上传图片时，需要同时提交的数据，这里做个演示-->
                        <%--@Html.Hidden("hidAlbumId")--%>
                    </form>
                    <div>
                        <!--上传按钮，提供多张图片一次性上传的功能-->
                        <button type="submit" id="submit-all" disabled="disabled">上传</button>
                    </div>
                </div>
            </div>
            <!-- /BOX -->
        </div>
    </div>



   <%-- <div class="dz-preview dz-file-preview">
        <div class="dz-details">
            <div class="dz-filename"><span data-dz-name></span></div>
            <div class="dz-size" data-dz-size></div>
            <img data-dz-thumbnail />
        </div>
        <div class="progress progress-sm progress-striped active">
            <div class="progress-bar progress-bar-success" data-dz-uploadprogress></div>
        </div>
        <div class="dz-success-mark"><span>✔</span></div>
        <div class="dz-error-mark"><span>✘</span></div>
        <div class="dz-error-message"><span data-dz-errormessage></span></div>
    </div>--%>
    <%--
    当文件在上传过程中的时候， dz-preview 中的 dz-processing 将被显示；
    当文件上传之后 dz-success 将被显示；
    如果文件上传错误或没网 dz-error 将被显示，此时 data-dz-errormessage 的内容将是服务器端返回的信息。--%>




    <script>

        //Dropzone的初始化，myDropzone为form的id
        Dropzone.options.mydropzone = {
            dictDefaultMessage:"1111111",
            //指定上传图片的路径
            //url: "PhotoUpload.aspx",
            url: "../../ashx/DealAjaxUploadFiles.ashx",

            //添加上传取消和删除预览图片的链接，默认不添加
            addRemoveLinks: true,

            //关闭自动上传功能，默认会true会自动上传
            //也就是添加一张图片向服务器发送一次请求
            autoProcessQueue: false,

            //允许上传多个照片
            uploadMultiple: true,

            //每次上传的最多文件数，经测试默认为2，坑啊
            //记得修改web.config 限制上传文件大小的节
            parallelUploads: 100,

            init: function () {
                var submitButton = document.querySelector("#submit-all")
                myDropzone = this; // closure

                //为上传按钮添加点击事件
                submitButton.addEventListener("click", function () {
                    //手动上传所有图片
                    myDropzone.processQueue();
                });

                //当添加图片后的事件，上传按钮恢复可用
                this.on("addedfile", function () {
                    $("#submit-all").removeAttr("disabled");
                });

                //当上传完成后的事件，接受的数据为JSON格式
                this.on("complete", function (data) {
                    alert(data);
                    if (this.getUploadingFiles().length === 0 && this.getQueuedFiles().length === 0) {
                        var res = eval('(' + data.xhr.responseText + ')'); 
                        var msg;
                        if (res.Result) {
                            //alert('asdfasdf');
                            msg = "恭喜，已成功上传" + res.Count + "张照片！";
                        }
                        else {
                            msg = "上传失败，失败的原因是：" + res.Message;
                        }
                        $("#message").text(msg);
                        $("#dialog").dialog("open");
                    }
                });

                //删除图片的事件，当上传的图片为空时，使上传按钮不可用状态
                this.on("removedfile", function () {
                    if (this.getAcceptedFiles().length === 0) {
                        $("#submit-all").attr("disabled", true);
                    }
                });
            }
        };







        jQuery(document).ready(function () {
            //App.setPage("dropzone_file_upload");  //Set current page
            //App.init(); //Initialise plugins and elements
        });
    </script>

    
</asp:Content>
