<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="Report_ShowCurrentAssets.aspx.cs" Inherits="FixedAsset.Web.Admin.Report_ShowCurrentAssets" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/mail.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript" src="../Scripts/Extjs/ext-base.js"></script>
    <script language="javascript" type="text/javascript" src="../Scripts/Extjs/ext-all.js"></script>
    <script language="javascript" type="text/javascript" src="../Scripts/Dialog.js"></script>
    <script language="javascript" type="text/javascript" src="../Scripts/Ajax.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
        align="center" class="gridtable">
        <asp:Repeater ID="gvDetails" runat="server">
            <HeaderTemplate>
                <tr class="thbg" style="padding: 0 0 0 0">
                    <th align="center">
                        设备编号
                    </th>
                    <th align="center">
                        设备名称
                    </th>
                    <th align="center">
                        设备状态
                    </th>
                    <th align="center">
                        账务类别
                    </th>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <%#Eval("Assetno")%>
                    </td>
                    <td>
                        <%#Eval("Assetname")%>
                    </td>
                    <td align="center">
                        <%#EnumUtil.RetrieveEnumDescript((AssetState)Eval("State"))%>
                    </td>
                    <td align="center">
                        <%#EnumUtil.RetrieveEnumDescript((FinanceCategory)Eval("Financecategory"))%>
                    </td>
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr class="even">
                    <td>
                        <%#Eval("Assetno")%>
                    </td>
                    <td>
                        <%#Eval("Assetname")%>
                    </td>
                    <td align="center">
                        <%#EnumUtil.RetrieveEnumDescript((AssetState)Eval("State"))%>
                    </td>
                    <td align="center">
                        <%#EnumUtil.RetrieveEnumDescript((FinanceCategory)Eval("Financecategory"))%>
                    </td>
                </tr>
            </AlternatingItemTemplate>
        </asp:Repeater>
    </table>
    <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px">
        <tr>
            <td colspan="4" style="height: 30px; width: 98%;" align="center">
                <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <input type="button" value="关闭" class="button" onclick="javascript:CloseTopDialogFrame();" />
            </td>
        </tr>
    </table>
</asp:Content>
