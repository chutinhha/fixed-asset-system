﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="NewInstall.aspx.cs" Inherits="FixedAsset.Web.Admin.NewInstall" %>

<%@ Import Namespace="SeallNet.Utility" %>
<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Register TagPrefix="uc1" TagName="ucShowAssetDetail" Src="~/Admin/UserControl/ucShowAssetDetail.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SelectStorageAddress" Src="~/Admin/UserControl/ucSelectStorageAddress.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SelectedMultiAssets" Src="~/Admin/UserControl/ucSelectedMultiAssets.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SelectStorageAddress2" Src="~/Admin/UserControl/ucSelectStorageAddress2.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucDatePicker" Src="~/Admin/UserControl/ucDatePicker.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucSelectUser" Src="~/Admin/UserControl/ucSelectUser.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucSeletedSystem" Src="~/Admin/UserControl/ucSeletedSystem.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SelectProject" Src="~/Admin/UserControl/ucSelectProject.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link href="css/mail.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content-box">
        <div class="content-box-header">
            <h3 style="cursor: s-resize;">
                <asp:Literal runat="server" ID="litTitle" Text="安装申请" />
            </h3>
        </div>
        <div class="content-box-content">
            <div class="tab-content default-tab">
                <fieldset>
                    <table>
                        <tr>
                            <td style="width: 180px;">
                                所属系统: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:ucSeletedSystem ID="ucSeletedSystem" runat="server" OnSelectedAssetCategoryChange="ucSeletedSystem_SelectedAssetCategoryChange" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                申请单号:
                            </td>
                            <td>
                                <asp:Literal ID="litSetupid" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                申请内容:
                            </td>
                            <td>
                                <asp:TextBox TextMode="MultiLine" Height="80px" ID="txtApplycontent" runat="server"
                                    Width="500" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                申请安装日期: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:ucDatePicker ID="ucApplySetupDate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                项目体(分公司): <span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:SelectProject ID="ucSelectProject" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                项目体(分公司)联系人: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtProjectcontactorid" MaxLength="100" CssClass="text_inp" runat="server"
                                    Width="300" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                项目体(分公司)联系电话:
                            </td>
                            <td>
                                <asp:TextBox ID="txtProjectcontactorphone" class="text_inp" runat="server" Width="300"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                联系电话:
                            </td>
                            <td>
                                <asp:TextBox ID="txtContactphone" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                申请日期: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:ucDatePicker ID="ucApplyDate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                申请人: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:ucSelectUser ID="ucApplyuser" runat="server" />
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td colspan="2">
                                <div id="tag" class="thin blue">
                                    <ul id="tags">
                                        <li id="api" class="selectTag"><a href="#">设备明细</a> </li>
                                    </ul>
                                    <p class="gap">
                                    </p>
                                </div>
                                <p class="c">
                                </p>
                                <div id="tagContent">
                                    <div id="MyFile" style="display: block;">
                                        <table style="width: 100%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                                            align="center" class="gridtable">
                                            <tr style="border-bottom-width: 1px;">
                                                <td colspan="6" align="right">
                                                    设备选择<uc1:SelectedMultiAssets ID="ucSelectedMultiAssets" BillCategory="SetupBill"
                                                        runat="server" OnSelectAssetChange="ucSelectedMultiAssets_SelectAssetChange" />
                                                </td>
                                            </tr>
                                            <asp:Repeater ID="rptAssetsList" runat="server" OnItemDataBound="rptAssetsList_ItemDataBound"
                                                OnItemCommand="rptAssetsList_ItemCommand">
                                                <HeaderTemplate>
                                                    <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                                                        <tr class="thbg" style="padding: 0 0 0 0">
                                                            <th style="width: 100px;" align="center">
                                                                设备编号
                                                            </th>
                                                            <th>
                                                                设备类别
                                                            </th>
                                                            <th>
                                                                设备名称
                                                            </th>
                                                            <th>
                                                                设备状态
                                                            </th>
                                                            <th>
                                                                购入日期
                                                            </th>
                                                            <th>
                                                                单价
                                                            </th>
                                                            <th>
                                                                品牌
                                                            </th>
                                                            <th>
                                                                账务类别
                                                            </th>
                                                            <th>
                                                                操作
                                                            </th>
                                                        </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td align="center">
                                                            <a href='javascript:ShowTopDialogFrame("设备明细", "ShowAssetDetail.aspx?Assetno=<%#Eval("Assetno")%>","",900,560);'>
                                                                <%#Eval("Assetno")%></a>
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
                                                            <%# Eval("Purchasedate") == null ? "" : ((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                                        </td>
                                                        <td align="right">
                                                            <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
                                                        </td>
                                                        <td>
                                                            <%#Eval("Brand")%>
                                                        </td>
                                                        <td>
                                                            <%#EnumUtil.RetrieveEnumDescript((FinanceCategory)Eval("Financecategory"))%>
                                                        </td>
                                                        <td align="right">
                                                            <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                                                CommandArgument='<%#Eval("Detailid")%>' CommandName="DeleteDetail" AlternateText="删除"
                                                                ToolTip="删除" />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <AlternatingItemTemplate>
                                                    <tr class="even">
                                                        <td align="center">
                                                            <a href='javascript:ShowTopDialogFrame("设备明细", "ShowAssetDetail.aspx?Assetno=<%#Eval("Assetno")%>","",900,560);'>
                                                                <%#Eval("Assetno")%></a>
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
                                                            <%# Eval("Purchasedate") == null ? "" : ((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                                        </td>
                                                        <td align="right">
                                                            <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
                                                        </td>
                                                        <td>
                                                            <%#Eval("Brand")%>
                                                        </td>
                                                        <td>
                                                            <%#EnumUtil.RetrieveEnumDescript((FinanceCategory)Eval("Financecategory"))%>
                                                        </td>
                                                        <td align="right">
                                                            <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                                                CommandArgument='<%#Eval("Detailid")%>' CommandName="DeleteDetail" AlternateText="删除"
                                                                ToolTip="删除" />
                                                        </td>
                                                    </tr>
                                                </AlternatingItemTemplate>
                                            </asp:Repeater>
                                        </table>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td colspan="2">
                                <asp:Button ID="BtnSave" runat="server" Text="保 存" CssClass="button" ValidationGroup="Vaild"
                                    OnClick="BtnSave_Click" />
                                <asp:Button ID="btnSubmit" runat="server" Text="提 交" CssClass="button" ValidationGroup="Vaild"
                                    OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnReset" runat="server" Text="返 回" CssClass="button" CausesValidation="false"
                                    OnClick="btnReset_Click" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>
