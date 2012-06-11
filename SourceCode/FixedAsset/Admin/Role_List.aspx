<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="Role_List.aspx.cs" Inherits="FixedAsset.Web.Admin.Role_List" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ul id="TabPage1">
        <li id="Tab1" title="角色管理">角色管理</li>
    </ul>
    <div id="cnt">
        <div id="dTab1" class="Box text_box">
            <p>
                角色名<asp:TextBox ID="txtSrchRolename" Width="150" runat="server" /><asp:Button ID="BtnSearch"
                    runat="server" CssClass="button" Text="查询" OnClick="BtnSearch_Click" />
                <input type="button" class="button" runat="server" id="btnAdd" value="新增" onclick="javascript:window.location='Role_Add.aspx'" />
            </p>
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center" class="table_grayTH eoddTable">
                <asp:Repeater ID="rptRoleList" runat="server" OnItemDataBound="rptRoleList_ItemDataBound"
                    OnItemCommand="rptRoleList_ItemCommand">
                    <HeaderTemplate>
                        <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                            <td align="center">
                                角色名
                            </td>
                            <td align="center">
                                角色状态
                            </td>
                            <td align="center">
                                创建时间
                            </td>
                            <td align="center">
                                创建者
                            </td>
                            <td align="center">
                                最近修改时间
                            </td>
                            <td align="center">
                                最近修改者
                            </td>
                            <td align="center">
                                操作
                            </td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td align="center">
                                <%#Eval("Rolename")%>
                            </td>
                            <td align="center">
                                <%#EnumUtil.RetrieveEnumDescript((RoleState)Eval("Rolestate"))%>
                            </td>
                            <td align="center">
                                <%#((DateTime)Eval("Createddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <%#Eval("Creator")%>
                            </td>
                            <td align="center">
                                <%# Eval("Lastmodifieddate") == null ? "" : ((DateTime)Eval("Lastmodifieddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <%#Eval("Lastmodifiedby")%>
                            </td>
                            <td align="center">
                                <asp:ImageButton ID="BtnAddRight" runat="server" ImageUrl="~/images/Button/starttask.GIF"
                                    AlternateText="分配权限" ToolTip="分配权限" CommandArgument='<%#Eval("Roleid")%>' CommandName="AddRight" />
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    Visible='<%#Eval("Allowedit")%>' AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Roleid")%>'
                                    CommandName="EditDetail" />
                                <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    Visible='<%#Eval("Allowedit")%>' CommandArgument='<%#Eval("Roleid")%>' CommandName="DeleteDetail"
                                    OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" />
                                <asp:ImageButton ID="BtnDetail" runat="server" ImageUrl="~/images/Button/detail.GIF"
                                    AlternateText="详细信息" ToolTip="详细信息" CommandArgument='<%#Eval("Roleid")%>' CommandName="ViewDetail" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="alt-row">
                            <td align="center">
                                <%#Eval("Rolename")%>
                            </td>
                            <td align="center">
                                <%#EnumUtil.RetrieveEnumDescript((RoleState)Eval("Rolestate"))%>
                            </td>
                            <td align="center">
                                <%#((DateTime)Eval("Createddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <%#Eval("Creator")%>
                            </td>
                            <td align="center">
                                <%# Eval("Lastmodifieddate") == null ? "" : ((DateTime)Eval("Lastmodifieddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <%#Eval("Lastmodifiedby")%>
                            </td>
                            <td align="center">
                                <asp:ImageButton ID="BtnAddRight" runat="server" ImageUrl="~/images/Button/starttask.GIF"
                                    AlternateText="分配权限" ToolTip="分配权限" CommandArgument='<%#Eval("Roleid")%>' CommandName="AddRight" />
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    Visible='<%#Eval("Allowedit")%>' AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Roleid")%>'
                                    CommandName="EditDetail" />
                                <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    Visible='<%#Eval("Allowedit")%>' CommandArgument='<%#Eval("Roleid")%>' CommandName="DeleteDetail"
                                    OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" />
                                <asp:ImageButton ID="BtnDetail" runat="server" ImageUrl="~/images/Button/detail.GIF"
                                    AlternateText="详细信息" ToolTip="详细信息" CommandArgument='<%#Eval("Roleid")%>' CommandName="ViewDetail" />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="7" style="height: 30px; width: 98%;" align="center">
                        <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
