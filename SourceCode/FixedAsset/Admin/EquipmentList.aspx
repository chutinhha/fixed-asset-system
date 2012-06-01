﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="EquipmentList.aspx.cs" Inherits="FixedAsset.Web.Admin.EquipmentList" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Src="~/Admin/UserControl/ucDatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<%@ Register Src="~/Admin/UserControl/ucShowAssetDetail.ascx" TagName="ucShowAssetDetail"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ul id="TabPage1">
        <li id="Tab1" title="设备管理">设备管理</li>
    </ul>
    <div id="cnt">
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
                        购入日期
                    </td>
                    <td>
                        <uc1:DatePicker ID="ucStartPurchasedate" runat="server" />
                        ~
                        <uc1:DatePicker ID="ucEndPurchasedate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        管理模式
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlManagementModel" runat="server" Width="150px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        设备状态
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEquipmentStatus" runat="server" Width="150">
                        </asp:DropDownList>
                    </td>
                    <td>
                        账务类别
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlAccountingType" runat="server" Width="150">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="right">
                        <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="查询" OnClick="BtnSearch_Click" />
                        <input type="button" class="button" runat="server" id="btnAdd" value="新增" onclick="javascript:window.location='NewEquipment.aspx'" />
                    </td>
                </tr>
            </table>
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center">
                <asp:Repeater ID="rptAssetsList" runat="server" OnItemDataBound="rptAssetsList_ItemDataBound"
                    OnItemCommand="rptAssetsList_ItemCommand">
                    <HeaderTemplate>
                        <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                            <td align="center">
                                设备编号
                            </td>
                            <td>
                                设备类别
                            </td>
                            <td>
                                设备名称
                            </td>
                            <td>
                                设备状态
                            </td>
                            <td>
                                购入日期
                            </td>
                            <td>
                                单价
                            </td>
                            <td>
                                品牌
                            </td>
                            <td>
                                账务类别
                            </td>
                            <td>
                                操作
                            </td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td align="center">
                                <uc1:ucShowAssetDetail ID="ucShowAssetDetail" runat="server" Assetno='<%#Eval("Assetno")%>' />
                            </td>
                            <td>
                                <asp:Literal ID="litCategoryName" runat="server" />
                            </td>
                            <td>
                                <%#Eval("Assetname")%>
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((AssetState)Eval("State"))%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
                            </td>
                            <td>
                                <%#Eval("Brand")%>
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((FinanceCategory)Eval("Financecategory"))%>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Assetno")%>' CommandName="EditDetail" />
                                <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    CommandArgument='<%#Eval("Assetno")%>' CommandName="DeleteDetail" OnClientClick="return confirm('确认要删除吗？');"
                                    AlternateText="删除" ToolTip="删除" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="alt-row">
                            <td align="center">
                                <uc1:ucShowAssetDetail ID="ucShowAssetDetail" runat="server" Assetno='<%#Eval("Assetno")%>' />
                            </td>
                            <td>
                                <asp:Literal ID="litCategoryName" runat="server" />
                            </td>
                            <td>
                                <%#Eval("Assetname")%>
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((AssetState)Eval("State"))%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
                            </td>
                            <td>
                                <%#Eval("Brand")%>
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((FinanceCategory)Eval("Financecategory"))%>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Assetno")%>' CommandName="EditDetail" />
                                <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    CommandArgument='<%#Eval("Assetno")%>' CommandName="DeleteDetail" OnClientClick="return confirm('确认要删除吗？');"
                                    AlternateText="删除" ToolTip="删除" />
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="9" style="height: 30px; width: 98%;">
                        <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
