<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/generalMaster.Master" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="zhenyuFitness.Pages.Home.DashBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script>
		jQuery(document).ready(function() {		
			//App.setPage("dynamic_table");  //Set current page
			App.init(); //Initialise plugins and elements


		});
	</script>
</asp:Content>
