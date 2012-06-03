<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="Role_Add.aspx.cs" Inherits="FixedAsset.Web.Admin.Role_Add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-box">
                <div class="content-box-header">
                    <h3 style="cursor: s-resize;">
                        <asp:Literal runat="server" ID="litTitle" Text="角色编辑" /></h3>
                </div>
                <div class="text_login">
                    <table>
                        <tr>
                            <td style="width: 180px;">
                                角色名:<span style="color: Red">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtRolename" runat="server" class="text_inp" Width="300px" ValidationGroup="Vaild"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtRolename"
                                    Display="Dynamic" ErrorMessage="请输入角色名！"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                角色描述:
                            </td>
                            <td>
                                <asp:TextBox ID="txtDescription" class="text_inp" Width="300px" Rows="10" runat="server"
                                    MaxLength="400" TextMode="MultiLine" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                创建者:
                            </td>
                            <td>
                                <asp:Literal ID="litCreator" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                创建时间:
                            </td>
                            <td>
                                <asp:Literal ID="litCreateddate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                最近修改者:
                            </td>
                            <td>
                                <asp:Literal ID="litLstmofifiedby" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                最近修改时间:
                            </td>
                            <td>
                                <asp:Literal ID="litLastmodifieddate" runat="server" />
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td colspan="2">
                                <asp:Button ID="BtnSave" runat="server" Text="保 存" CssClass="button" ValidationGroup="Vaild"
                                    OnClick="BtnSave_Click" />
                                <input id="btnReset" type="button" value="重 置" class="button" onclick='javascript:window.location.href = "Role_Add.aspx";' />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
