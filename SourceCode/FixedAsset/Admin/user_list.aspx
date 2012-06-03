<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="User_List.aspx.cs" Inherits="FixedAsset.Web.Admin.User_List" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ul id="TabPage1">
        <li id="Tab1" title="角色分配">角色分配</li>
    </ul>
    <div id="cnt">
        <div id="dTab1" class="Box text_box">
            <p>
                用户姓名<asp:TextBox ID="txtSrchUsername" Width="150" CssClass="" runat="server" />
                登录账号<asp:TextBox ID="txtSrchLoginid" Width="150" CssClass="" runat="server" />
                <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="查询" OnClick="BtnSearch_Click" />
            </p>
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center" class="table_grayTH eoddTable">
                <asp:Repeater ID="rptUserRoleList" runat="server" OnItemDataBound="rptUserRoleList_ItemDataBound"
                    OnItemCommand="rptUserRoleList_ItemCommand">
                    <HeaderTemplate>
                        <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                            <td>
                                用户姓名
                            </td>
                            <td>
                                登录账号
                            </td>
                            <td>
                                角色名
                            </td>
                            <td>
                                角色分配操作人
                            </td>
                            <td>
                                角色分配操作时间
                            </td>
                            <td>
                                操作
                            </td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%#Eval("Username")%>
                            </td>
                            <td>
                                <%#Eval("Loginid")%>
                            </td>
                            <td>
                                <%#Eval("Rolename")%>
                            </td>
                            <td>
                                <%#Eval("Lastmodifiedby")%>
                            </td>
                            <td>
                                <%# Eval("Lastmodifieddate") == null ? "" : ((DateTime)Eval("Lastmodifieddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Id")%>' CommandName="EditDetail" />
                                <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                     CommandArgument='<%#Eval("Id")%>' CommandName="DeleteDetail" OnClientClick="return confirm('确认要删除吗？');"
                                    AlternateText="删除" ToolTip="删除" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="alt-row">
                            <td>
                                <%#Eval("Username")%>
                            </td>
                            <td>
                                <%#Eval("Loginid")%>
                            </td>
                            <td>
                                <%#Eval("Rolename")%>
                            </td>
                            <td>
                                <%#Eval("Lastmodifiedby")%>
                            </td>
                            <td>
                                <%# Eval("Lastmodifieddate") == null ? "" : ((DateTime)Eval("Lastmodifieddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Id")%>' CommandName="EditDetail" />
                                <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    CommandArgument='<%#Eval("Id")%>' CommandName="DeleteDetail" OnClientClick="return confirm('确认要删除吗？');"
                                    AlternateText="删除" ToolTip="删除" />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="6" style="height: 30px; width: auto;">
                        <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
