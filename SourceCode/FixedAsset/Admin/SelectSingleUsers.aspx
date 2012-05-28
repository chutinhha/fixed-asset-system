<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectSingleUsers.aspx.cs"
    Inherits="FixedAsset.Web.Admin.SelectSingleUsers" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="return_user.aspx.cs" Inherits="Admin_return_user" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="css/default.css" type="text/css" />
    <link href="../App_Themes/Control_Theme/Dialog.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <script language="javascript" type="text/javascript" src="../Scripts/Extjs/ext-base.js"></script>
    <script language="javascript" type="text/javascript" src="../Scripts/Extjs/ext-all.js"></script>
    <script language="javascript" type="text/javascript" src="../Scripts/Dialog.js"></script>
    <script language="javascript" type="text/javascript" src="../Scripts/Ajax.js"></script>
    <form id="form1" runat="server">
    <div id="contents">
        <div id="dTab1" class="Box text_box">
            用户名称
            <asp:TextBox class="text-input small-input" ID="txt_userName" runat="server"></asp:TextBox>
            <asp:Button ID="btn_Show" class="button" runat="server" Text="查询" OnClick="btn_Show_Click" />
            <asp:SGridView ID="grdResult" runat="server" Width="100%" ShowActionToolBar="false"
                PageSize="2" AutoGenerateColumns="false" AllowCascade="false" DataKeyNames="ID,departmentid">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lb_userid" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lb_departmentid" runat="server" Text='<%#Eval("departmentid") %>'
                                Visible="false"></asp:Label>
                            <asp:RadioButton runat="server" ID="radioSelected" OnCheckedChanged="radioSelected_CheckedChanged"
                                AutoPostBack="true" GroupName="templateGroup" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="username" HeaderText="角色名称" />
                    <asp:BoundField DataField="TEL" HeaderText="电话" />
                    <asp:BoundField DataField="mobile" HeaderText="手机" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="departmentname" HeaderText="部门" />
                    <asp:BoundField DataField="statename" HeaderText="状态" />
                </Columns>
                <AlternatingRowStyle CssClass="alt-row"></AlternatingRowStyle>
                <HeaderStyle BackColor="#EFFFEA" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" />
            </asp:SGridView>
            <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
            <asp:Button ID="btnOk" runat="server" Text="确定" class="button" OnClick="btnOk_Click" />
            <input type="button" value="取消" class="button" onclick="CloseTopDialogFrame();" />
        </div>
    </div>
    </form>
</body>
</html>
