<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="zhenyuFitness.TestPages.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title><link href="../js/datepicker/themes/default.date.min.css" rel="stylesheet" />
    <link href="../css/cloud-admin.css" rel="stylesheet" />
    <script src="../js/jquery/jquery-2.0.3.min.js"></script>
    <link href="../js/datepicker/themes/default.date.min.css" rel="stylesheet" />
    <script src="../js/datepicker/picker.js"></script>
    <script src="../js/datepicker/picker.date.js"></script>

            
    <script src="../js/datepicker/picker.date.js"></script>
</head>
<body>
    <div>
        <input id="goalDaysCount" class="form-control datepicker goalDaysCount" type="text" name="regular" size="10" />
    <script>
        jQuery(document).ready(function () {
            $("#goalDaysCount").datepicker();;
        });
    </script>
    </div>
</body>
</html>
