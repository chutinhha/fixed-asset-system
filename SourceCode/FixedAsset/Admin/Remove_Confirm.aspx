﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="Remove_Confirm.aspx.cs" Inherits="FixedAsset.Web.Admin.Remove_Confirm" %>

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
                <asp:Literal runat="server" ID="litTitle" Text="确认拆机" />
            </h3>
        </div>
        <div class="content-box-content">
            <div class="tab-content default-tab">
                <fieldset>
                    <table>
                        <tr>
                            <td style="width: 180px;">
                                所属系统: 
                            </td>
                            <td>
                                <uc1:ucSeletedSystem ID="ucSeletedSystem" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                申请单号: 
                            </td>
                            <td>
                                <asp:Literal ID="litRemoveId" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                申请内容: 
                            </td>
                            <td style="word-wrap: break-word; overflow: hidden; width: 680px;">
                                <asp:Literal ID="litApplycontent" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                申请拆机日期:
                            </td>
                            <td>
                                <asp:Literal ID="litApplysetupdate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                项目体(分公司):
                            </td>
                            <td>
                                <uc1:SelectProject ID="ucSelectProject" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                项目体(分公司)联系人:
                            </td>
                            <td>
                                <asp:Literal ID="litProjectcontactorid" runat="server"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                项目体(分公司)联系电话: 
                            </td>
                            <td>
                                <asp:Literal ID="litProjectcontactorphone" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                联系电话:
                            </td>
                            <td>
                                <asp:Literal ID="litContactphone" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                申请日期:
                            </td>
                            <td>
                                <asp:Literal ID="litApplyDate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                申请人:
                            </td>
                            <td>
                                <uc1:ucSelectUser ID="ucApplyuser" runat="server" IsShowUserName="true" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                回复时间:
                            </td>
                            <td>
                                <asp:Literal ID="litApprovedate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                回复人:
                            </td>
                            <td>
                                <asp:Literal ID="litApproveuser" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                计划拆机日期:
                            </td>
                            <td>
                                <asp:Literal ID="litPlansetupdate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                实际拆机日期: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:ucDatePicker ID="ucActualsetupdate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                已拆机明细: 
                            </td>
                            <td>
                                <asp:TextBox TextMode="MultiLine" Height="80px" ID="txtSetupcontent" runat="server" MaxLength="500"
                                    Width="500" Rows="10" />
                            </td>
                        </tr>
                         <tr>
                            <td style="width: 180px;">
                                存放地点:
                            </td>
                            <td>
                                <uc1:SelectStorageAddress2 ID="SelectStorageAddress"  runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                确认日期:
                            </td>
                            <td>                                
                                 <asp:Literal ID="litConfirmdate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                确认人: 
                            </td>
                            <td>
                                <uc1:ucSelectUser ID="ucConfirmuser" runat="server" IsShowUserName="true" />
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
                                            <asp:Repeater ID="rptAssetsList" runat="server" OnItemDataBound="rptAssetsList_ItemDataBound">
                                                <HeaderTemplate>
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
                                                        <td>
                                                            <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
                                                        </td>
                                                        <td>
                                                            <%#Eval("Brand")%>
                                                        </td>
                                                        <td>
                                                            <%#EnumUtil.RetrieveEnumDescript((FinanceCategory)Eval("Financecategory"))%>
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
                                                        <td>
                                                            <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
                                                        </td>
                                                        <td>
                                                            <%#Eval("Brand")%>
                                                        </td>
                                                        <td>
                                                            <%#EnumUtil.RetrieveEnumDescript((FinanceCategory)Eval("Financecategory"))%>
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
                                <asp:Button ID="BtnSave" runat="server" Text="确 认" CssClass="button" ValidationGroup="Vaild"
                                    OnClick="BtnSave_Click" />
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

