<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="Role_View.aspx.cs" Inherits="FixedAsset.Web.Admin.Role_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-box">
                <div class="content-box-header">
                    <h3 style="cursor: s-resize;">
                        <asp:Literal runat="server" ID="litTitle" Text="角色信息查看" /></h3>
                </div>
                <div class="text_login">
                    <table>
                        <tr>
                            <td style="width: 180px;">
                                角色名:
                            </td>
                            <td>
                                <asp:Literal ID="litRolename"  runat="server"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                角色描述:
                            </td>
                            <td style="word-wrap: break-word; overflow: hidden; width: 680px;">
                                <asp:Literal ID="litDescription"  runat="server"/>
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
                                <input id="btnReset" type="button" value="返 回" class="button" onclick='javascript:window.location.href = "Role_List.aspx";' />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
