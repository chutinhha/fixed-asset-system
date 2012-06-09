<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="Repair_View.aspx.cs" Inherits="FixedAsset.Web.Admin.Repair_View" %>

<%@ Import Namespace="SeallNet.Utility" %>
<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Register TagPrefix="uc1" TagName="ucShowAssetDetail" Src="~/Admin/UserControl/ucShowAssetDetail.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SelectStorageAddress" Src="~/Admin/UserControl/ucSelectStorageAddress.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SelectedMultiAssets" Src="~/Admin/UserControl/ucSelectedMultiAssets.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SelectStorageAddress2" Src="~/Admin/UserControl/ucSelectStorageAddress2.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucDatePicker" Src="~/Admin/UserControl/ucDatePicker.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucSelectUser" Src="~/Admin/UserControl/ucSelectUser.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucSeletedSystem" Src="~/Admin/UserControl/ucSeletedSystem.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucMaintaintype" Src="~/Admin/UserControl/ucMaintaintype.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SelectProject" Src="~/Admin/UserControl/ucSelectProject.ascx" %>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="content-box">
        <div class="content-box-header">
            <h3 style="cursor: s-resize;">
                <asp:Literal runat="server" ID="litTitle" Text="确认维修" />
            </h3>
        </div>
        <div class="content-box-content">
            <div class="tab-content default-tab">
                <fieldset>
                    <table style="width: 80%;">
                        <tr>
                            <td>
                                所属系统:
                            </td>
                            <td>
                                <uc1:ucSeletedSystem ID="ucSeletedSystem" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: auto;">
                                单号:
                            </td>
                            <td>
                                <asp:Label ID="litAssetmaintainid" class="text_inp" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                状态:
                            </td>
                            <td>
                                <asp:Literal ID="litApproveresult" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                保修来源:
                            </td>
                            <td>
                                <uc1:ucMaintaintype ID="ucMaintaintype" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                申请内容:
                            </td>
                            <td style="word-wrap: break-word; overflow: hidden; width: 680px;">
                                <asp:Literal ID="litApplycontent" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                申请人:
                            </td>
                            <td>
                                <uc1:ucSelectUser ID="ucApplyuser" runat="server" IsShowUserName="true" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                申请日期:
                            </td>
                            <td>
                                <asp:Literal ID="litApplydate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                项目体(分公司):
                            </td>
                            <td>
                                <uc1:SelectProject ID="ucSelectProject" runat="server" IsShowName="true" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                项目体(分公司)联系人:
                            </td>
                            <td>
                                <uc1:ucSelectUser ID="ucProjectcontactorid" runat="server" IsShowUserName="true" />
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
                                计划维修日期:
                            </td>
                            <td>
                                <asp:Literal ID="litPlanmaintaindate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                实际维修日期:
                            </td>
                            <td>
                                <asp:Literal ID="litActualmaintaindate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                已维修明细:
                            </td>
                            <td style="word-wrap: break-word; overflow: hidden; width: 680px;">
                                <asp:Literal ID="litMaintaincontent" runat="server" />
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
                                <asp:Literal ID="litConfirmuser" runat="server" />
                            </td>
                        </tr>
                        <tr>
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
                                            align="center" class="table_grayTH eoddTable">
                                            <asp:Repeater ID="rptAssetsList" runat="server" OnItemDataBound="rptAssetsList_ItemDataBound">
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
                                                            <%#((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
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
                                                    </tr>
                                                </ItemTemplate>
                                                <AlternatingItemTemplate>
                                                    <tr class="alt-row">
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
                                                            <%#((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
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
