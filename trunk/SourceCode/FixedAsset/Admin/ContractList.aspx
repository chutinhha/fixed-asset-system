<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="ContractList.aspx.cs" Inherits="FixedAsset.Web.Admin.ContractList" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/mail.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ul id="TabPage1">
        <li id="Tab1" title="合同管理">合同管理</li>
    </ul>
    <div id="cnt">
        <div id="dTab1" class="Box text_box">
            <p>
                编号
                <asp:TextBox ID="txtSrchPsid" Width="150" CssClass="" runat="server"></asp:TextBox><asp:Button
                    ID="BtnSearch" runat="server" CssClass="button" Text="查询" OnClick="BtnSearch_Click" />
                <input type="button" class="button" runat="server" id="btnAdd" value="新增" onclick="javascript:window.location='NewContacts.aspx'" />
            </p>
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center" class="gridtable">
                <asp:Repeater ID="rptContactsList" runat="server" OnItemDataBound="rptContactsList_ItemDataBound"
                    OnItemCommand="rptContactsList_ItemCommand">
                    <HeaderTemplate>
                        <tr  class="thbg" style="padding:0 0 0 0">
                            <th align="center">
                                合同编号
                            </th>
                            <th align="center">
                                签订日期
                            </th>
                            <th align="center">
                                分公司
                            </th>
                            <th align="center">
                                供应商
                            </th>
                            <th align="center">
                                创建日期
                            </th>
                            <th align="center">
                                操作
                            </th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td align="center">
                                <%#Eval("Contractid")%>
                            </td>
                            <td align="center">
                                <%#((DateTime)Eval("Contractdate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <%#Eval("Subcompanyname")%>
                            </td>
                            <td align="center">
                                <%#Eval("Suppliername")%>
                            </td>
                            <td align="center">
                                <%#((DateTime)Eval("Createddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="编辑" ToolTip="编辑" CommandName="EditDetail" CommandArgument='<%#Eval("Contractid") %>' />
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" CommandName="DeleteDetail"
                                    CommandArgument='<%#Eval("Contractid") %>' />
                                <asp:ImageButton ID="BtnDetail" runat="server" ImageUrl="~/images/Button/detail.GIF"
                                    AlternateText="详细信息" ToolTip="详细信息" CommandArgument='<%#Eval("Contractid")%>'
                                    CommandName="ViewDetail" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="even">
                            <td align="center">
                                <%#Eval("Contractid")%>
                            </td>
                            <td align="center">
                                <%#((DateTime)Eval("Contractdate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <%#Eval("Subcompanyname")%>
                            </td>
                            <td align="center">
                                <%#Eval("Suppliername")%>
                            </td>
                            <td align="center">
                                <%#((DateTime)Eval("Createddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="编辑" ToolTip="编辑" CommandName="EditDetail" CommandArgument='<%#Eval("Contractid") %>' />
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" CommandName="DeleteDetail"
                                    CommandArgument='<%#Eval("Contractid") %>' />
                                <asp:ImageButton ID="BtnDetail" runat="server" ImageUrl="~/images/Button/detail.GIF"
                                    AlternateText="详细信息" ToolTip="详细信息" CommandArgument='<%#Eval("Contractid")%>'
                                    CommandName="ViewDetail" />
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
