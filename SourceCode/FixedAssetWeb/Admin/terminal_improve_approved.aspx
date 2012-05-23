<%@ Page Title="测试资源审批" Language="C#" MasterPageFile="~/Admin/MasterPage.master"
    AutoEventWireup="true" CodeFile="terminal_improve_approved.aspx.cs" Inherits="Admin_terminal_improve_approved" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-box-header">
                <h3 style="cursor: s-resize;">
                    测试资源审批
                </h3>
            </div>
            <div class="content-box-content">
                <div class="tab-content default-tab">
                    <table>
                        <tr>
                            <td>
                                申请人：
                            </td>
                            <td>
                                <asp:TextBox ID="txtUsername" MaxLength="50" class="text-input medium-input_new"
                                    runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                申请时间：
                            </td>
                            <td>
                                <asp:TextBox ID="txtApplydate" class="text-input medium-input_new" runat="server"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                资源提升时间：
                            </td>
                            <td>
                                <asp:TextBox ID="txtResourceimprovetime" class="text-input medium-input_new" runat="server"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnapprove" runat="server" class="button" Text="同意" />
                                <asp:Button ID="btnNotThrouth" runat="server" class="button" Text="不同意" />
                                <asp:Button ID="btnconcel" runat="server" class="button" Text="返回" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
