<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FixedAsset.Web.Admin.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="css/default.css" rel="stylesheet" type="text/css" />
    <title>七建资产管理系统</title>
    <script src="../Scripts/Dialog.js" type="text/javascript"></script>
    <link href="../App_Themes/Control_Theme/Dialog.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="warp clearfix">
        <div class="login clearfix">
            <p class="line">
                <asp:TextBox ID="txtLoginid" class="inp_tex" runat="server"></asp:TextBox></p>
            <p class="line">
                <asp:TextBox ID="txtUserpassword" class="inp_tex" runat="server" TextMode="Password"></asp:TextBox></p>
            <p>
                <asp:Button ID="btn_Login" class="but_login" runat="server" Text="登录" OnClick="Login_Click" />
                <input type="reset" name="button" id="button" class="but_login" value="重置" onclick='javascript:window.location.href = "Login.aspx";' />
            </p>
        </div>
    </div>
    </form>
</body>
</html>
