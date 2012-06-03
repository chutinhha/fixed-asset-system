<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="User_AddRole.aspx.cs" Inherits="FixedAsset.Web.Admin.User_AddRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-box">
                <div class="content-box-header">
                    <h3 style="cursor: s-resize;">
                        分配角色</h3>
                </div>
                <div class="text_login">
                    <table>
                        <tr>
                            <td style="width: 180px;">
                                用户姓名:
                            </td>
                            <td>
                                <asp:Literal ID="litUsername" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                登录账号:
                            </td>
                            <td>
                                <asp:Literal ID="litLoginid" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                备注:
                            </td>
                            <td style="word-wrap: break-word; overflow: hidden; width: 680px;">
                                <asp:Label ID="litNote" class="text_inp" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                角色:
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlRoleList" class="text_inp" Width="150" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                角色分配操作人:
                            </td>
                            <td>
                                <asp:Literal ID="litLstmofifiedby" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                角色分配操作时间:
                            </td>
                            <td>
                                <asp:Literal ID="litLastmodifieddate" runat="server" />
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td colspan="2">
                                <asp:Button ID="BtnSave" runat="server" Text="分配角色" CssClass="button" ValidationGroup="Vaild"
                                    OnClick="BtnSave_Click" />
                                <input id="btnReset" type="button" value="重 置" class="button" onclick='javascript:window.location.href = "User_List.aspx";' />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
