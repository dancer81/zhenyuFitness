<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/generalMaster.Master" AutoEventWireup="true" CodeBehind="PhotoUpload.aspx.cs" Inherits="zhenyuFitness.Pages.PhotoManager.PhotoUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- DROPZONE -->
    <link rel="stylesheet" type="text/css" href="../../js/dropzone/dropzone.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- DROPZONE -->
    <script type="text/javascript" src="../../js/dropzone/dropzone.min.js"></script>
    <div class="row">
        <div class="col-md-12">
            <!-- BOX -->
            <div class="box border blue">
                <div class="box-title">
                    <h4><i class="fa fa-cloud-download"></i>PhotoUploader</h4>
                    <div class="tools hidden-xs">
                        <%--<a href="#box-config" data-toggle="modal" class="config">
                            <i class="fa fa-cog"></i>
                        </a>--%>
                        <%--<a href="javascript:;" class="reload">
                            <i class="fa fa-refresh"></i>
                        </a>--%>
                        <a href="javascript:;" class="collapse">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <%--<a href="javascript:;" class="remove">
                            <i class="fa fa-times"></i>
                        </a>--%>
                    </div>
                </div>
                <div class="box-body">
                    <form action="//file-arrow-circle-o-up"
                        class="dropzone"
                        id="my-awesome-dropzone">
                        <div class="fallback">
                            <input name="file" type="file" multiple="" />
                        </div>
                    </form>
                </div>
            </div>
            <!-- /BOX -->
        </div>
    </div>



    <div class="dz-preview dz-file-preview">
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
    </div>
    <%--
    当文件在上传过程中的时候， dz-preview 中的 dz-processing 将被显示；
    当文件上传之后 dz-success 将被显示；
    如果文件上传错误或没网 dz-error 将被显示，此时 data-dz-errormessage 的内容将是服务器端返回的信息。--%>


    <script>
        jQuery(document).ready(function () {
            App.setPage("dropzone_file_upload");  //Set current page
            App.init(); //Initialise plugins and elements
        });
    </script>
</asp:Content>
