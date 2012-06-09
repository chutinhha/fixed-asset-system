<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="AssetScrapped_View.aspx.cs" Inherits="FixedAsset.Web.Admin.AssetScrapped_View" %>

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
                    <table style="width: 80%;">
                        <tr>
                            <td style="width: auto;">
                                申请单号:
                            </td>
                            <td>
                                <asp:Literal ID="litAssetscrappedid" runat="server" />
                            </td>
                        </tr>
                         <tr>
                            <td>
                                审核状态:
                            </td>
                            <td>
                               <asp:Literal ID="litApprovedstate"  runat="server"/>
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
                            <td style="word-wrap: break-word; overflow: hidden; width: 680px;">
                                <asp:Literal ID="litRejectreason" runat="server" />
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

