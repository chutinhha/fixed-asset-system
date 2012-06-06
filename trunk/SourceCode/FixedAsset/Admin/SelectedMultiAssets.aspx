<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="SelectedMultiAssets.aspx.cs"
    Inherits="FixedAsset.Web.Admin.SelectedMultiAssets" %>

<%@ Import Namespace="SeallNet.Utility" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="FixedAsset.Domain" %>
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
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center">
                <tr>
                    <td>
                        设备编号
                    </td>
                    <td>
                        <asp:TextBox ID="txtSrchAssetno" Width="150" CssClass="" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        设备名称
                    </td>
                    <td>
                        <asp:TextBox ID="txtSrchAssetname" Width="150" CssClass="" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="right">
                        <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="查询" OnClick="BtnSearch_Click" />
                    </td>
                </tr>
            </table>
            <table style="width: 100%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center" class="table_grayTH eoddTable" id="tbAssetList">
                <asp:Repeater ID="rptAssetsList" runat="server" OnItemDataBound="rptAssetsList_ItemDataBound">
                    <HeaderTemplate>
                        <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                            <td align="center">
                                设备编号<input id="ckbAllSelected" onclick="javascript:AllChooseOrNoChoose('tbAssetList',this);"
                                    type="checkbox" />
                                <td align="center">
                                    设备类别
                                </td>
                                <td align="center">
                                    设备名称
                                </td>
                                <td align="center">
                                    设备状态
                                </td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td align="left">
                                <asp:CheckBox ID="ckbAssetno" Text='<%#Eval("Assetno")%>' runat="server" TextAlign="Right" />
                            </td>
                            <td align="left">
                                <asp:Literal ID="litCategoryName" runat="server" />
                            </td>
                            <td align="left">
                                <%#Eval("Assetname")%>
                            </td>
                            <td align="left">
                                <%#EnumUtil.RetrieveEnumDescript((AssetState)Eval("State"))%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="alt-row">
                            <td align="left">
                                <asp:CheckBox ID="ckbAssetno" Text='<%#Eval("Assetno")%>' runat="server" />
                            </td>
                            <td align="left">
                                <asp:Literal ID="litCategoryName" runat="server" />
                            </td>
                            <td align="left">
                                <%#Eval("Assetname")%>
                            </td>
                            <td align="left">
                                <%#EnumUtil.RetrieveEnumDescript((AssetState)Eval("State"))%>
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="4" style="height: 30px; width: 790px;">
                        <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick"
                            PageSize="10" />
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnOk" runat="server" Text="确定" class="button" OnClick="btnOk_Click" />
            <input type="button" value="取消" class="button" onclick="javascript:CloseTopDialogFrame();" />
        </div>
    </div>
    </form>
</body>
</html>
