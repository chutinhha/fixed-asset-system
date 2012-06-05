<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/MasterPage.master" CodeBehind="ScrappedApproved.aspx.cs" Inherits="FixedAsset.Web.Admin.ScrappedApproved" %>

<%@ Register TagPrefix="uc1" TagName="DatePicker" Src="~/Admin/UserControl/ucDatePicker.ascx" %>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <script src="../Scripts/calendar.js" type="text/javascript"></script>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-box">
<%--                <div class="content-box-header">
                    <h3 style="cursor: s-resize;">
                        <asp:Literal runat="server" ID="litTitle" Text="报废审核" />
                    </h3>
                </div>--%>
                <div class="content-box-content">
                    <div class="tab-content default-tab">
                        <fieldset>
                            <table style="width: 80%;">
                                <tr>
                                    <td style="width: auto;">
                                        设备编号:
                                    </td>
                                    <td>
                                        <asp:Label ID="litAssetNo" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        申请人: 
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        申请日期: 
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        报废日期:<span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <uc1:DatePicker ID="ucExpireddate" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        报废人: 
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        审核人: 
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        拒绝理由
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtReason" Width="300" runat="server" MaxLength="1000" TextMode="MultiLine"
                                            ValidationGroup="Vaild"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtReason"
                                            Display="Dynamic" ErrorMessage="请输入拒绝理由！"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                
                                <tr style="text-align: center">
                                    <td colspan="2">
                                        <asp:Button ID="BtnAccept" runat="server" Text="同意" CssClass="button" 
                                            ValidationGroup="Vaild" onclick="BtnAccept_Click" />
                                        <asp:Button ID="btnDecline" runat="server" Text="拒绝" CssClass="button" 
                                            ValidationGroup="Vaild" onclick="btnDecline_Click" />
<%--                                        <input type="button" class="button" runat="server" id="btnreset" value="返回" onclick="javascript:window.location.href = 'ScrappedApproved.aspx';" />--%>
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

