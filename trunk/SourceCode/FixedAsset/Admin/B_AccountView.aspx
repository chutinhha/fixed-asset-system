<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="B_AccountView.aspx.cs" Inherits="FixedAsset.Web.Admin.B_AccountView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-box">
                <div class="content-box-header">
                    <h3 style="cursor: s-resize;">
                        <asp:Literal runat="server" ID="litTitle" Text="B账明细查看" />
                    </h3>
                </div>
                <div class="content-box-content">
                    <div class="tab-content default-tab">
                        <fieldset>
                            <table style="width: 80%;">
                                <tr>
                                    <td style="width: 180px;">
                                        设备编号：
                                    </td>
                                    <td>
                                       <asp:LinkButton ID="lblAssetNo" runat="server"></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        设备名称:
                                    </td>
                                    <td>
                                        <asp:Label ID="lblAssetName" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td>
                                       入账日期 : 
                                    </td>
                                    <td>
                                         <asp:Label ID="lblAccountDate" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        入账人:
                                    </td>
                                    <td>
                                        <asp:Label ID="litApplyuser" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        创建日期:
                                    </td>
                                    <td>
                                        <asp:Label ID="litApplydate" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        创建者:
                                    </td>
                                    <td>
                                        <asp:Label ID="litCreateduser" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                                <tr style="text-align: center">
                                    <td >
                                        <input type="button" class="button" runat="server" id="Button2" value="返 回" onclick="javascript:window.location.href = 'B_Account.aspx';" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
