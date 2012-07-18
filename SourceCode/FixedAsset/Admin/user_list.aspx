<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="User_List.aspx.cs" Inherits="FixedAsset.Web.Admin.User_List" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/mail.css" rel="stylesheet" type="text/css" />
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
                align="center" class="gridtable">
                <asp:Repeater ID="rptUserRoleList" runat="server" OnItemDataBound="rptUserRoleList_ItemDataBound"
                    OnItemCommand="rptUserRoleList_ItemCommand">
                    <HeaderTemplate>
                        <tr class="thbg" style="padding: 0 0 0 0">
                            <th align="center">
                                用户姓名
                            </th>
                            <th align="center">
                                登录账号
                            </th>
                            <th align="center">
                                角色名
                            </th>
                            <th align="center">
                                角色分配操作人
                            </th>
                            <th align="center">
                                角色分配操作时间
                            </th>
                            <th align="center">
                                操作
                            </th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td align="center">
                                <%#Eval("Username")%>
                            </td>
                            <td align="center">
                                <%#Eval("Loginid")%>
                            </td>
                            <td align="center">
                                <%#Eval("Rolename")%>
                            </td>
                            <td align="center">
                                <%#Eval("Lastmodifiedby")%>
                            </td>
                            <td align="center">
                                <%# Eval("Lastmodifieddate") == null ? "" : ((DateTime)Eval("Lastmodifieddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/user.GIF"
                                    AlternateText="分配角色" ToolTip="分配角色" CommandArgument='<%#Eval("Id")%>' CommandName="EditDetail" />
                                <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    CommandArgument='<%#Eval("Id")%>' CommandName="DeleteDetail" OnClientClick="return confirm('确认要取消角色吗？');"
                                    AlternateText="取消角色" ToolTip="取消角色" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="even">
                            <td align="center">
                                <%#Eval("Username")%>
                            </td>
                            <td align="center">
                                <%#Eval("Loginid")%>
                            </td>
                            <td align="center">
                                <%#Eval("Rolename")%>
                            </td>
                            <td align="center">
                                <%#Eval("Lastmodifiedby")%>
                            </td>
                            <td align="center">
                                <%# Eval("Lastmodifieddate") == null ? "" : ((DateTime)Eval("Lastmodifieddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/user.GIF"
                                    AlternateText="分配角色" ToolTip="分配角色" CommandArgument='<%#Eval("Id")%>' CommandName="EditDetail" />
                                <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    CommandArgument='<%#Eval("Id")%>' CommandName="DeleteDetail" OnClientClick="return confirm('确认要取消角色吗？');"
                                    AlternateText="取消角色" ToolTip="取消角色" />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="6" style="height: 30px; width: 98%;" align="center">
                        <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
