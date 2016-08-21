<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_ExerciseEdit.aspx.cs" Inherits="zhenyuFitness.Pages.LoujunjieAdmin.Admin_ExerciseEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <div style="text-align:center"><h2>动作录入和修改（管理员）</h2></div>
    <form id="form1" runat="server">
        <div>
            <asp:Label runat="server" Text="OfficialName:" Width="10%"></asp:Label>
            <asp:TextBox ID="OfficialName" runat="server" Width="50%" placeholder="动作名称"></asp:TextBox>
        </div>
        <br />
        <div style="background-color:aliceblue">
            <asp:Label runat="server" Text="OtherName:" Width="10%"></asp:Label>
            <asp:TextBox ID="OtherName" runat="server" Width="50%" placeholder="动作别名"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label runat="server" Text="Overrall:" Width="10%"></asp:Label>
            <asp:TextBox ID="Overrall" runat="server" Width="50%" placeholder="动作概述"></asp:TextBox>
        </div>
        <br />
        <div style="background-color:aliceblue">
            <asp:Label runat="server" Text="Type:" Width="10%"></asp:Label>
            <asp:TextBox ID="Type" runat="server" Width="50%" placeholder="没有使用,可以不填"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label runat="server" Text="MainMuscleID:" Width="10%"></asp:Label>
            <%--<asp:TextBox ID="MainMuscleID" runat="server" Width="50%" placeholder="主要肌肉"></asp:TextBox>--%>
            <asp:DropDownList runat="server" ID="MainMuscleID">
                <asp:ListItem Value="F0971133-23AC-466B-B3DE-7AC685CA6E98">小腿肌群</asp:ListItem>
                <asp:ListItem Value="BC57E3E1-2A6C-4989-BDA7-AB5A569DF94D">股二头肌</asp:ListItem>
                <asp:ListItem Value="01D1FF41-607C-4B09-A0B8-44D5F47D46C0">股四头肌</asp:ListItem>
                <asp:ListItem Value="6F996D7E-44B8-44D0-A8F5-0F6C3D4CA119">臀大肌</asp:ListItem>
                <asp:ListItem Value="AB05D2A1-53BE-41D1-9BC7-C27F1BD8D7D0">肱三头肌</asp:ListItem>
                <asp:ListItem Value="03D4BCD8-DD90-4BE4-8915-C59423DC94BD">肱二头肌</asp:ListItem>
                <asp:ListItem Value="90C326A5-AD1B-4981-ADB3-3F033E9E9AFD">肱肌</asp:ListItem>
                <asp:ListItem Value="057D247E-DAC7-4451-A088-3683B6633A47">前臂肌群</asp:ListItem>
                <asp:ListItem Value="CE4DFA88-7CEE-49F7-9097-EBDEB36716EE">背阔肌</asp:ListItem>
                <asp:ListItem Value="3F7A90A4-E440-459D-BC1F-C002705B88F4">竖脊肌</asp:ListItem>
                <asp:ListItem Value="720B87D8-757E-418D-8188-2309FDD95843">斜方肌</asp:ListItem>
                <asp:ListItem Value="BF1F92BB-5BA0-4CD5-A639-935C344C06D8">三角肌前束</asp:ListItem>
                <asp:ListItem Value="9E329883-B6AE-4F2E-B125-6E5C1BD13D37">三角肌中束</asp:ListItem>
                <asp:ListItem Value="3E39E4B5-AF7D-4A72-87A2-6235DDF0484E">三角肌后束</asp:ListItem>
                <asp:ListItem Value="4CA62027-78E2-4E34-BC3D-7EBD57F6AE89">腹肌</asp:ListItem>
                <asp:ListItem Value="9719E345-913B-4869-AEDA-A732BD884F95">胸大肌</asp:ListItem>
            </asp:DropDownList>
        </div>
        <br />
        <div style="background-color:aliceblue">
            <asp:Label runat="server" Text="OtherMuscleIDs:" Width="10%"></asp:Label>
            <asp:TextBox ID="OtherMuscleIDs" runat="server" Width="50%" placeholder="次要肌肉（用,隔开）"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label runat="server" Text="EquipmentID:" Width="10%"></asp:Label>
         <%--   <asp:TextBox ID="EquipmentID" runat="server" Width="50%" placeholder="装备ID"></asp:TextBox>--%>
            <asp:DropDownList runat="server" ID="EquipmentID">
                <asp:ListItem Value="03C24362-4BE1-49A5-91DF-515A1E966922">哑铃</asp:ListItem>
                <asp:ListItem Value="3607F142-3F07-4339-B4E6-531EFF06D1BC">双杠</asp:ListItem>
                <asp:ListItem Value="6D357697-09E0-4904-944B-2EBA7A8E0088">史密斯机</asp:ListItem>
                <asp:ListItem Value="8C650A36-6ED8-41BD-A1A1-85C6896F0E42">单杠</asp:ListItem>
                <asp:ListItem Value="9EDF9012-977A-4AE8-A5EA-EF4B7F044EB0">绳索</asp:ListItem>
                <asp:ListItem Value="A78BBB99-6B81-4A9E-8C9A-C9F724960780">固定器械</asp:ListItem>
                <asp:ListItem Value="B5E92454-F358-40F7-B4BB-583BD1F1C4F2">杠铃</asp:ListItem>
                <asp:ListItem Value="DAF39A61-710A-4E9C-8474-398514FEECF5">自重</asp:ListItem>
                <asp:ListItem Value="A71C0BBB-BA7A-4149-A4B4-8A5410A421DB">弹力带</asp:ListItem>
                <asp:ListItem Value="AE2D755B-671A-4C21-8ECD-04309403936B">曲杆</asp:ListItem>
                <asp:ListItem Value="FD330789-0595-49C7-9053-437998B1FFA1">壶铃</asp:ListItem>
            </asp:DropDownList>
        </div>
        <br />
        <div style="background-color:aliceblue">
            <asp:Label runat="server" Text="MechanicsType:" Width="10%"></asp:Label>
            <asp:DropDownList runat="server" ID="MechanicsType">
                <asp:ListItem Value="0">复合</asp:ListItem>
                <asp:ListItem Value="1">单关节</asp:ListItem>
                <asp:ListItem Value="2">拉伸</asp:ListItem>
                <asp:ListItem Value="3">其他</asp:ListItem>
            </asp:DropDownList> 
        </div>
        <br />
        <div>
            <asp:Label runat="server" Text="Force:" Width="10%"></asp:Label>
            <asp:DropDownList runat="server" ID="Force">
                <asp:ListItem Value="0">推</asp:ListItem>
                <asp:ListItem Value="1">拉</asp:ListItem>
                <asp:ListItem Value="2">其他</asp:ListItem>
            </asp:DropDownList> 
        </div>
        <br />
        <div style="background-color:aliceblue">
            <asp:Label runat="server" Text="RateDefault:" Width="10%"></asp:Label>
            <asp:TextBox ID="RateDefault" runat="server" Width="50%" placeholder="默认得分"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label runat="server" Text="RateOverrall:" Width="10%"></asp:Label>
            <asp:TextBox ID="RateOverrall" runat="server" Width="50%" placeholder="会员评分总和"></asp:TextBox>
        </div>
        <br />
        <div style="background-color:aliceblue">
            <asp:Label runat="server" Text="RateUserCount:" Width="10%"></asp:Label>
            <asp:TextBox ID="RateUserCount" runat="server" Width="50%" placeholder="会员评分人数"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label runat="server" Text="Level:" Width="10%"></asp:Label>
            <asp:TextBox ID="Level" runat="server" Width="50%" placeholder="动作难度（0-100）"></asp:TextBox>
        </div>
        <br />
        <div style="background-color:aliceblue">
            <asp:Label runat="server" Text="ExerciseValue:" Width="10%"></asp:Label>
            <asp:TextBox ID="ExerciseValue" runat="server" Width="50%" placeholder="动作价值（0-100）"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label runat="server" Text="Video:" Width="10%"></asp:Label>
            <asp:TextBox ID="Video" runat="server" Width="50%" placeholder="动作视频"></asp:TextBox>
        </div>
        <br />
        <div style="background-color:aliceblue">
            <asp:Label runat="server" Text="VideoPoster:" Width="10%"></asp:Label>
            <asp:TextBox ID="VideoPoster" runat="server" Width="50%" placeholder="动作视频海报"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label runat="server" Text="PicMaleStart:" Width="10%"></asp:Label>
            <asp:TextBox ID="PicMaleStart" runat="server" Width="50%" placeholder="动作图片（男性开始）"></asp:TextBox>
        </div>
        <br />
        <div style="background-color:aliceblue">
            <asp:Label runat="server" Text="PicMaleEnd:" Width="10%"></asp:Label>
            <asp:TextBox ID="PicMaleEnd" runat="server" Width="50%" placeholder="动作图片（男性结束）"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label runat="server" Text="PicFemaleStart:" Width="10%"></asp:Label>
            <asp:TextBox ID="PicFemaleStart" runat="server" Width="50%" placeholder="动作图片（女性开始）"></asp:TextBox>
        </div>
        <br />
        <div style="background-color:aliceblue">
            <asp:Label runat="server" Text="PicFemaleEnd:" Width="10%"></asp:Label>
            <asp:TextBox ID="PicFemaleEnd" runat="server" Width="50%" placeholder="动作图片（女性结束）"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label runat="server" Text="PicMuscle:" Width="10%"></asp:Label>
            <asp:TextBox ID="PicMuscle" runat="server" Width="50%" placeholder="肌肉图片"></asp:TextBox>
        </div>
        <br />
        <div style="background-color:aliceblue">
            <asp:Label runat="server" Text="Detail1:" Width="10%"></asp:Label>
            <asp:TextBox ID="Detail1" runat="server" Width="50%" TextMode="MultiLine" Rows="4" placeholder="动作细节（第一步）"></asp:TextBox>
        </div>
        <div>
            <asp:Label runat="server" Text="Detail2:" Width="10%"></asp:Label>
            <asp:TextBox ID="Detail2" runat="server" Width="50%" TextMode="MultiLine" Rows="4" placeholder="动作细节（第二部）"></asp:TextBox>
        </div>
        <div style="background-color:aliceblue">
            <asp:Label runat="server" Text="Detail3:" Width="10%"></asp:Label>
            <asp:TextBox ID="Detail3" runat="server" Width="50%" TextMode="MultiLine" Rows="4" placeholder="动作细节（第三部）"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label runat="server" Text="Variantion:" Width="10%"></asp:Label>
            <asp:TextBox ID="Variantion" runat="server" Width="50%" TextMode="MultiLine" Rows="3" placeholder="动作变化"></asp:TextBox>
        </div>
        <br />
        <div style="background-color:aliceblue">
            <asp:Label runat="server" Text="Caution:" Width="10%"></asp:Label>
            <asp:TextBox ID="Caution" runat="server" Width="50%" TextMode="MultiLine" Rows="10" placeholder="动作注意点（每一步用|隔开）"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label runat="server" Text="AlterNatives:" Width="10%"></asp:Label>
            <asp:TextBox ID="AlterNatives" runat="server" Width="50%" placeholder="替代动作（用,隔开）"></asp:TextBox>
        </div>
        <br />
        <div style="text-align:center"><asp:Button runat="server" Text="提交" OnClick="btn_OnClick"/></div>
        


    </form>
</body>
</html>
