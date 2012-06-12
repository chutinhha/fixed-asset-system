<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/MasterPage.master"
    CodeBehind="AssetScrapped_Approved.aspx.cs" Inherits="FixedAsset.Web.Admin.AssetScrapped_Approved" %>

<%@ Register TagPrefix="uc1" TagName="DatePicker" Src="~/Admin/UserControl/ucDatePicker.ascx" %>
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
                <asp:Literal runat="server" ID="litTitle" Text="报废审核" />
            </h3>
        </div>
        <div class="content-box-content">
            <div class="tab-content default-tab">
                <fieldset>
                     <table>
                        <tr>
                            <td style="width: auto;">
                                申请单号:
                            </td>
                            <td>
                                <asp:Literal ID="litAssetscrappedid" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: auto;">
                                设备编号:
                            </td>
                            <td>
                                <asp:Literal ID="litAssetno" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                报废人:
                            </td>
                            <td>
                                <asp:Literal ID="litScrappeduser" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                报废日期:
                            </td>
                            <td>
                                <asp:Literal ID="litScrappeddate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                审核人:
                            </td>
                            <td>
                                <asp:Literal ID="litApproveuser" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                审核时间:
                            </td>
                            <td>
                                <asp:Literal ID="litApprovedate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                拒绝理由
                            </td>
                            <td>
                                <asp:TextBox ID="txtRejectreason" Width="300" class="text_inp" Rows="10" runat="server"
                                    MaxLength="1000" TextMode="MultiLine" />
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td colspan="2">
                                <asp:Button ID="BtnAccept" runat="server" Text="同意" CssClass="button" ValidationGroup="Vaild"
                                    OnClick="BtnAccept_Click" />
                                <asp:Button ID="btnDecline" runat="server" Text="拒绝" CssClass="button" ValidationGroup="Vaild"
                                    OnClick="btnDecline_Click" />
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
