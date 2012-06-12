<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="FixedAsset.Web.Admin.main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <script src="js/menu.js" type="text/javascript"></script>
    <script src="js/prototype.lite.js" type="text/javascript"></script>
    <script src="js/moo.fx.js" type="text/javascript"></script>
    <script src="js/moo.fx.pack.js" type="text/javascript"></script>
    <script src="../Scripts/Dialog.js" type="text/javascript"></script>
    <link href="../App_Themes/Control_Theme/Dialog.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/default.css" type="text/css" />
    <title>固定资产管理系统</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"
        AllowCustomErrorsRedirect="true" EnablePageMethods="true">
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/IframeAutoFit.js" />
            <asp:ScriptReference Path="~/Scripts/Extjs/ext-base.js" />
            <asp:ScriptReference Path="~/Scripts/Extjs/ext-all.js" />
            <asp:ScriptReference Path="~/Scripts/Dialog.js" />
            <asp:ScriptReference Path="~/Scripts/Ajax.js" />
        </Scripts>
    </asp:ScriptManager>
    <div class="wrap">
    </div>
    <div class="wrap">
        <dl id="header">
            <dt></dt>
            <dd>
                <p class="title">
                    <img src="../images/mc-cell-exca.gif" /><a href="main.aspx">待办</a>
                </p>
                <p class="loginfor" height="37">
                    <asp:LinkButton ID="BtnLogout" class="but3" runat="server" OnClick="BtnLogout_Click">退出</asp:LinkButton>
                    <b>&nbsp;&nbsp;登录用户：<asp:Literal ID="litUsername" runat="server" />&nbsp;&nbsp; |&nbsp;&nbsp;身份：<asp:Literal
                        ID="litUserRole" runat="server" />&nbsp;&nbsp;|&nbsp;&nbsp;</b></p>
            </dd>
        </dl>
        <div id="contents">
            <div class="left">
                <div id="container">
                    <asp:Literal ID="litMenuItems" runat="server" />
                </div>
                <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
            </div>
            <div class="right">
                <iframe id="aa" name='aa' src="../index.aspx" width="100%" scrolling="no" frameborder="0"
                    onload="javascript:PageLoad();"></iframe>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <script type="text/javascript" language="javascript">
        function iFrameHeight() {
            var ifm = document.getElementById("aa");
            var subWeb = document.frames ? document.frames["aa"].document : ifm.contentDocument;
            if (ifm != null && subWeb != null) {
                ifm.height = subWeb.body.scrollHeight;
            }
        }
    </script>
    <script type="text/javascript">
        function autoSize() {
            var iframe = document.getElementById("aa");
            try {
                var bHeight = iframe.contentWindow.document.body.scrollHeight;
                var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
                var height = Math.min(bHeight, dHeight);
                iframe.height = height;
            } catch (ex) { }
        }
    </script>
    <script type="text/javascript">
        var contents = document.getElementsByClassName('content');
        var toggles = document.getElementsByClassName('type');
        var myAccordion = new fx.Accordion(
					toggles, contents, { opacity: true, duration: 400 }
				);
        myAccordion.showThisHideOpen(contents[0]);
    </script>
    </form>
</body>
</html>
