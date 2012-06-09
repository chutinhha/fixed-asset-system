<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectSingleSupplier.aspx.cs"
    Inherits="FixedAsset.Web.Admin.SelectSingleSupplier" %>

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
            供应商
            <asp:TextBox class="text-input small-input" ID="txtSrchSuppliername" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" class="button" runat="server" Text="查询" OnClick="btnSearch_Click" />
            <asp:SGridView ID="gvSuppliers" GridLines="None" border="0" CssClass="table_grayTH eoddTable"
                runat="server" Width="40%" ShowActionToolBar="false" PageSize="2" AutoGenerateColumns="false"
                AllowCascade="false" DataKeyNames="Supplierid">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lblSupplierid" runat="server" Text='<%#Eval("Supplierid") %>' Visible="false"></asp:Label>
                            <asp:RadioButton runat="server" ID="radioSelected" OnCheckedChanged="radioSelected_CheckedChanged"
                                AutoPostBack="true" GroupName="templateGroup" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Suppliername" HeaderText="供应商" ControlStyle-Width="50"
                        ItemStyle-CssClass="center" ItemStyle-HorizontalAlign="Left" />
                </Columns>
                <AlternatingRowStyle CssClass="alt-row"></AlternatingRowStyle>
                <RowStyle HorizontalAlign="Center" />
            </asp:SGridView>
            <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
            <asp:Button ID="btnOk" runat="server" Text="确定" class="button" OnClick="btnOk_Click" />
            <input type="button" value="取消" class="button" onclick="javascript:CloseTopDialogFrame();" />
        </div>
    </div>
    </form>
</body>
</html>
