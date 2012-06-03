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
                            <%--<td>
                                角色ID
                            </td>--%>
                            <td>
                                角色名
                            </td>
                            <td>
                                角色状态
                            </td>
                            <td>
                                创建时间
                            </td>
                            <td>
                                创建者
                            </td>
                            <td>
                                最近修改时间
                            </td>
                            <td>
                                最近修改者
                            </td>
                            <td>
                                操作
                            </td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <%--<td>
                                <%#Eval("Roleid")%>
                            </td>--%>
                            <td>
                                <%#Eval("Rolename")%>
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((RoleState)Eval("Rolestate"))%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Createddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Creator")%>
                            </td>
                            <td>
                                <%# Eval("Lastmodifieddate") == null ? "" : ((DateTime)Eval("Lastmodifieddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    Visible='<%#Eval("Allowedit")%>' AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Roleid")%>'
                                    CommandName="EditDetail" />
                                <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    Visible='<%#Eval("Allowedit")%>' CommandArgument='<%#Eval("Roleid")%>' CommandName="DeleteDetail"
                                    OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="alt-row">
                            <%--<td>
                                <%#Eval("Roleid")%>
                            </td>--%>
                            <td>
                                <%#Eval("Rolename")%>
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((RoleState)Eval("Rolestate"))%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Createddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Creator")%>
                            </td>
                            <td>
                                <%# Eval("Lastmodifieddate") == null ? "" : ((DateTime)Eval("Lastmodifieddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    Visible='<%#Eval("Allowedit")%>' AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Roleid")%>'
                                    CommandName="EditDetail" />
                                <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    Visible='<%#Eval("Allowedit")%>' CommandArgument='<%#Eval("Roleid")%>' CommandName="DeleteDetail"
                                    OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="7" style="height: 30px; width: 790px;">
                        <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
