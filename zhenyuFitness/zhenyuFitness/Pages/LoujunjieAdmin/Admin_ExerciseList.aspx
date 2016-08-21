<%@ Page Language="C#" MasterPageFile="~/MasterPages/generalMaster.Master" AutoEventWireup="true" CodeBehind="Admin_ExerciseList.aspx.cs" Inherits="zhenyuFitness.Pages.LoujunjieAdmin.Admin_ExerciseList" EnableViewState="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>动作列表页</title>
<!-- DATA TABLES -->
	<link rel="stylesheet" type="text/css" href="../../js/datatables/media/css/jquery.dataTables.min.css" />
	<link rel="stylesheet" type="text/css" href="../../js/datatables/media/assets/css/datatables.min.css" />
	<link rel="stylesheet" type="text/css" href="../../js/datatables/extras/TableTools/media/css/TableTools.min.css"/>

    <!-- DATA TABLES -->
	<script type="text/javascript" src="../../js/datatables/media/js/jquery.dataTables.js" ></script>
	<script type="text/javascript" src="../../js/datatables/media/assets/js/datatables.min.js" ></script>
	<%--<script type="text/javascript" src="../../js/datatables/extras/TableTools/media/js/TableTools.min.js"></script>--%>
	<%--<script type="text/javascript" src="../../js/datatables/extras/TableTools/media/js/ZeroClipboard.min.js"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div><a href="Admin_ExerciseEdit.aspx" target="_blank">新增</a></div>
    <div class="row">
							<div class="col-md-12">
								<!-- BOX -->
								<div class="box border green">
									<div class="box-title">
										<h4><i class="fa fa-table"></i>动作列表</h4>
										<div class="tools hidden-xs">
											
											<a href="javascript:;" class="collapse">
												<i class="fa fa-chevron-up"></i>
											</a>
											<a href="javascript:;" class="remove">
												<i class="fa fa-times"></i>
											</a>
										</div>
									</div>
									<div class="box-body">
										<table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>动作名称</th>
													<th>目标肌肉</th>
													<th class="hidden-xs">装备器械</th>
													<th class="center">动作类型</th>
                                                    <th class="center">发力形式</th>
													<th class="hidden-xs center">会员评分</th>
												</tr>
											</thead>
											<tbody>
												<%=tableShow %>
											</tbody>
											<%--<tfoot>
												<tr>
													<th>动作名称</th>
													<th>目标肌肉</th>
													<th class="hidden-xs">装备器械</th>
													<th>动作类型</th>
													<th class="hidden-xs">会员评分</th>
												</tr>
											</tfoot>--%>
										</table>
									</div>
								</div>
								<!-- /BOX -->
							</div>
						</div>
    <script>
		jQuery(document).ready(function() {		
			App.setPage("dynamic_table");  //Set current page
			App.init(); //Initialise plugins and elements


		});



	</script>
</asp:Content>
