<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="Role_AddRight.aspx.cs" Inherits="FixedAsset.Web.Admin.Role_AddRight" %>

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
                            <td>
                                角色名:
                            </td>
                            <td colspan="3">
                                <asp:Literal ID="litRolename" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                角色描述:
                            </td>
                            <td colspan="3" style="word-wrap: break-word; overflow: hidden; width: 680px;">
                                <asp:Literal ID="litDescription" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                创建者:
                            </td>
                            <td>
                                <asp:Literal ID="litCreator" runat="server" />
                            </td>
                            <td>
                                创建时间:
                            </td>
                            <td>
                                <asp:Literal ID="litCreateddate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                最近修改者:
                            </td>
                            <td>
                                <asp:Literal ID="litLstmofifiedby" runat="server" />
                            </td>
                            <td>
                                最近修改时间:
                            </td>
                            <td>
                                <asp:Literal ID="litLastmodifieddate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                菜单名:
                            </td>
                            <td colspan="3">
                                <asp:TreeView ID="tvMenuItems" runat="server"  OnTreeNodeCheckChanged ="tvMenuItems_TreeNodeCheckChanged"/>
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td colspan="2">
                                <asp:Button ID="BtnSave" runat="server" Text="保 存" CssClass="button" ValidationGroup="Vaild"
                                    OnClick="BtnSave_Click" />
                                <input id="btnReset" type="button" value="返 回" class="button" onclick='javascript:window.location.href = "Role_List.aspx";' />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
