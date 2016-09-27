<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/generalMaster.Master" AutoEventWireup="true" CodeBehind="MyGoal.aspx.cs" Inherits="zhenyuFitness.Pages.Goal.MyGoal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../css/custom/mygoal.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-9 content">
                <div class="row">
                    <div class="col-md-12">
                        <a href="#" class="pull-right ">
                            <img src="http://localhost/resources/img/logo/bodyspace_logo_small.png" alt="" style="width:18px;"/>
                        </a>
                        <a href="#" class="pull-right">
                            <img src="http://localhost/resources/img/logo/bodyspace_logo_small.png" alt="" style="width:18px;"/>
                        </a>
                        <a href="#" class="pull-right">
                            <img src="http://localhost/resources/img/logo/bodyspace_logo_small.png" alt="" style="width:18px;"/>
                        </a>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="box border inverse">
                                <div class="box-title">
                                    <h4><i class="fa fa-money"></i>当前身体成分</h4>
                                    <div class="tools">
                                        <a href="javascript:;" class="reload">
                                            <i class="fa fa-refresh"></i>
                                        </a>
                                        <a href="javascript:;" class="remove">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="box-body">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="box border inverse">
                                <div class="box-title">
                                    <h4><i class="fa fa-money"></i>当前身体成分</h4>
                                    <div class="tools">
                                        <a href="javascript:;" class="reload">
                                            <i class="fa fa-refresh"></i>
                                        </a>
                                        <a href="javascript:;" class="remove">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="box-body">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">插入推荐文章</div>
        </div>
    </div>





    <script>
        jQuery(document).ready(function () {
            App.init();
        });
    </script>
</asp:Content>
