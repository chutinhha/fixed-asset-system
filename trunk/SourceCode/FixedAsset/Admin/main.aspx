<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="FixedAsset.Web.Admin.main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
            <asp:ScriptReference Path="~/Scripts/Main.js" />
            <asp:ScriptReference Path="~/Scripts/jquery-1.4.1.min.js" />
        </Scripts>
    </asp:ScriptManager>
    <div class="wrap">
    </div>
    <div class="wrap">
        <dl id="header">
            <dt></dt>
            <dd>
                <p class="title">
                    <img src="../images/mc-cell-exca.gif" alt="待办" /><a href="main.aspx">待办</a>
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
                    <h1 class='type'>
                        <a href='javascript:void(0)'>采购合同</a></h1>
                    <div class='content' style="height: 50px">
                        <ul class='MM'>
                            <li><a href='ProcurePlanList.aspx' target='aa'>采购计划单管理</a></li>
                            <li><a href='ContractList.aspx' target='aa'>采购合同管理</a></li>
                        </ul>
                    </div>
                    <h1 class='type'>
                        <a href='javascript:void(0)'>验收登记</a></h1>
                    <div class='content' style="height: 100px">
                        <ul class='MM'>
                            <li><a href='EquipmentList.aspx' target='aa'>设备管理</a></li>
                            <li><a href='Report_AssetState.aspx' target='aa'>设备状态统计</a></li>
                            <li><a href='Report_AssetStorageAddress.aspx' target='aa'>存放地点统计</a></li>
                            <li><a href='Report_AssetCategory.aspx' target='aa'>资产类别统计</a></li>
                        </ul>
                    </div>
                    <h1 class='type'>
                        <a href='javascript:void(0)'>安装运行</a></h1>
                    <div class='content' style="height: auto;">
                        <ul class='MM'>
                            <li><a href='InstallList.aspx' target='aa'>安装</a></li>
                            <li><a href='RepairList.aspx' target='aa'>维修</a></li>
                            <li><a href='MoveList.aspx' target='aa'>移机</a></li>
                            <li><a href='RemoveList.aspx' target='aa'>拆除</a></li>
                        </ul>
                    </div>
                    <h1 class='type'>
                        <a href='javascript:void(0)'>清产</a></h1>
                    <div class='content' style="height: auto;">
                        <ul class='MM'>
                            <li><a href='B_Account.aspx' target='aa'>B帐</a></li>
                            <li><a href='Asset_Scrapped.aspx' target='aa'>报废</a></li>
                        </ul>
                    </div>
                    <h1 class='type'>
                        <a href='javascript:void(0)'>系统设置</a></h1>
                    <div class='content'>
                        <ul class='MM'>
                            <li><a href='Role_List.aspx' target='aa'>角色管理</a></li>
                            <li><a href='user_list.aspx' target='aa'>用户角色分配</a></li>
                        </ul>
                    </div>
                </div>
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
                alert(height);
                iframe.height = height;
            } catch (ex) { }
        }
    </script>
    <script type="text/javascript">
        var contents = document.getElementsByClassName('content');
        var toggles = document.getElementsByClassName('type');
        var myAccordion = new fx.Accordion(toggles, contents, { opacity: true, duration: 400 });
        myAccordion.showThisHideOpen(contents[0]);
    </script>
    </form>
</body>
</html>