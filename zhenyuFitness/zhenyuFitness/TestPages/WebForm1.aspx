<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/generalMaster.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="zhenyuFitness.TestPages.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link href="../js/datepicker/themes/default.date.min.css" rel="stylesheet" />
    <script src="../js/datepicker/picker.date.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <input id="goalDaysCount" class="form-control datepicker goalDaysCount" type="text" name="regular" size="10">
    <script>
        jQuery(document).ready(function () {
            $("#goalDaysCount").datepicker();;
        });
    </script>
</asp:Content>
