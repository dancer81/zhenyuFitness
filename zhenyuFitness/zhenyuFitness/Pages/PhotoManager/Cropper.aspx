<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/generalMaster.Master" AutoEventWireup="true" CodeBehind="Cropper.aspx.cs" Inherits="zhenyuFitness.Pages.PhotoManager.Cropper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../js/cropperjs-master/dist/cropper.min.css" rel="stylesheet" />
    <script src="../../js/cropperjs-master/dist/cropper.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        #image {
            max-width: 100%;
        }
    </style>
    <img class="cropper" src="../../img/buildmuscle.jpg">
 

    <script>
        $(".cropper").cropper({
            aspectRatio: 16 / 9,
            modal: false,
            preview: ".extra-preview",
            done: function (data) {
                console.log(data);
            }
        });


    </script>
 

</asp:Content>
