<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="Report_Asset_Search.aspx.cs" Inherits="FixedAsset.Web.Admin.Report_Asset_Search" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Src="~/Admin/UserControl/ucDatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<%@ Register Src="~/Admin/UserControl/ucShowAssetDetail.ascx" TagName="ucShowAssetDetail"
    TagPrefix="uc1" %>
    <%@ Register Src="~/Admin/UserControl/ucSelectStorageAddressForSearch.ascx" TagName="SelectStorageAddressForSearch"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/mail.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ul id="TabPage1">
        <li id="Tab1" title="综合查询">综合查询</li>
    </ul>
    <div id="cnt">
        <div id="dTab1" class="Box text_box">
            <table style="width: 100%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center">
                <tr style="height: 30px;">
                    <td>
                        设备编号
                    </td>
                    <td>
                        <asp:TextBox ID="txtSrchAssetno" Width="150" CssClass="" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        设备类别
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlAssetCategory" class="text_inp" runat="server" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlAssetCategory_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlSubAssetCategory" class="text_inp" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        设备名称
                    </td>
                    <td>
                        <asp:TextBox ID="txtSrchAssetname" Width="150" CssClass="text_inp" runat="server" />
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td>
                        设备状态
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSrchState" runat="server" Width="150">
                        </asp:DropDownList>
                    </td>
                    <td>
                        管理模式
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlManagementModel" runat="server" Width="150px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        购入日期
                    </td>
                    <td>
                        <uc1:DatePicker ID="ucStartPurchasedate" runat="server" />
                        ~
                        <uc1:DatePicker ID="ucEndPurchasedate" runat="server" />
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td>
                        账务类别
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFinancecategory" runat="server" Width="150">
                        </asp:DropDownList>
                    </td>
                    <td>
                        供应商
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSuppliers" runat="server" Width="150px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        分公司
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSubCompanies" runat="server" Width="150px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        存放地点
                    </td>
                    <td>
                    <uc1:SelectStorageAddressForSearch ID="ucSelectStorageAddressForSearch" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="right">
                        <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="查询" OnClick="BtnSearch_Click" />
                    </td>
                </tr>
            </table>
            <div style="overflow-x: scroll; width: 100%; padding: 0 0 0 0; margin: 0 0 0 0">
                <table style="padding-top: 0px;" width="100%" cellspacing="0px" cellpadding="0px"
                    align="center" class="gridtable">
                    <asp:Repeater ID="rptAssetsList" runat="server">
                        <HeaderTemplate>
                            <tr class="thbg" style="padding: 0 0 0 0">
                                <th align="center">
                                    设备编号
                                </th>
                                <th align="center">
                                    分公司
                                </th>
                                <th align="center">
                                    供应商
                                </th>
                                <th align="center" style="width: 150px">
                                    存放地点
                                </th>
                                <th align="center">
                                    设备类别
                                </th>
                                <th align="center">
                                    设备名称
                                </th>
                                <th align="center">
                                    品牌
                                </th>
                                <th align="center">
                                    设备规格
                                </th>
                                <th align="center">
                                    设备状态
                                </th>
                                <th align="center">
                                    购入日期
                                </th>
                                <th align="center">
                                    折旧年限
                                </th>
                                <th align="center">
                                    单价
                                </th>
                                <th align="center">
                                    账务类别
                                </th>
                                <th align="center">
                                    管理模式
                                </th>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td align="left">
                                    <a href='javascript:ShowTopDialogFrame("设备明细", "ShowAssetDetail.aspx?Assetno=<%#Eval("Assetno")%>","",900,560);'>
                                        <%#Eval("Assetno")%></a>
                                </td>
                                <td align="left">
                                    <%#Eval("Subcompanyfullname")%>
                                </td>
                                <td align="left">
                                    <%#Eval("Suppliername")%>
                                </td>
                                <td align="left" style="word-wrap: break-word;">
                                    <%#Eval("Subcompanyname")==null?Eval("Storagename"):(Eval("Subcompanyname").ToString() == Eval("Storagename").ToString() ? Eval("Storagename") : Eval("Subcompanyname").ToString() + "-" + Eval("Storagename").ToString())%>
                                </td>
                                <td align="left">
                                    <%#Eval("Categoryallpathname")%>
                                </td>
                                <td align="left">
                                    <%#Eval("Assetname")%>
                                </td>
                                <td align="left">
                                    <%#Eval("Brand")%>
                                </td>
                                <td align="left">
                                    <%#Eval("Assetspecification")%>
                                </td>
                                <td align="left">
                                    <%#EnumUtil.RetrieveEnumDescript((AssetState)Eval("State"))%>
                                </td>
                                <td align="left">
                                    <%# Eval("Purchasedate") == null ? "" : ((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                </td>
                                <td align="center">
                                    <%#Eval("Depreciationyear")%>
                                </td>
                                <td align="right">
                                    <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
                                </td>
                                <td align="left">
                                    <%#EnumUtil.RetrieveEnumDescript((FinanceCategory)Eval("Financecategory"))%>
                                </td>
                                <td align="left">
                                    <%#EnumUtil.RetrieveEnumDescript((ManageMode)Eval("Managemode"))%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr class="even">
                                <td align="left">
                                    <a href='javascript:ShowTopDialogFrame("设备明细", "ShowAssetDetail.aspx?Assetno=<%#Eval("Assetno")%>","",900,560);'>
                                        <%#Eval("Assetno")%></a>
                                </td>
                                <td align="left">
                                    <%#Eval("Subcompanyfullname")%>
                                </td>
                                <td align="left">
                                    <%#Eval("Suppliername")%>
                                </td>
                                <td align="left" style="word-wrap: break-word;">
                                    <%#Eval("Subcompanyname")==null?Eval("Storagename"):(Eval("Subcompanyname").ToString() == Eval("Storagename").ToString() ? Eval("Storagename") : Eval("Subcompanyname").ToString() + "-" + Eval("Storagename").ToString())%>
                                </td>
                                <td align="left">
                                    <%#Eval("Categoryallpathname")%>
                                </td>
                                <td align="left">
                                    <%#Eval("Assetname")%>
                                </td>
                                <td align="left">
                                    <%#Eval("Brand")%>
                                </td>
                                <td align="left">
                                    <%#Eval("Assetspecification")%>
                                </td>
                                <td align="left">
                                    <%#EnumUtil.RetrieveEnumDescript((AssetState)Eval("State"))%>
                                </td>
                                <td align="left">
                                    <%# Eval("Purchasedate") == null ? "" : ((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                </td>
                                <td align="center">
                                    <%#Eval("Depreciationyear")%>
                                </td>
                                <td align="right">
                                    <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
                                </td>
                                <td align="left">
                                    <%#EnumUtil.RetrieveEnumDescript((FinanceCategory)Eval("Financecategory"))%>
                                </td>
                                <td align="left">
                                    <%#EnumUtil.RetrieveEnumDescript((ManageMode)Eval("Managemode"))%>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <tr style="height: 28px">
                        <td colspan="14" style="height: 28px; width: 98%;" align="center">
                            <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
