<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="New_Contract_List.aspx.cs" Inherits="FixedAsset.Web.Admin.New_Contract_List" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/mail.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ul id="TabPage1">
        <li id="Tab1" title="设备导入">设备导入</li>
    </ul>
    <div id="cnt">
        <div id="dTab1" class="Box text_box">
            <p>
                合同名
                <asp:TextBox ID="txtSrchXmmc" Width="150" CssClass="" runat="server"></asp:TextBox>
                供应商
                <asp:TextBox ID="txtSrchCbf" Width="150" CssClass="" runat="server"></asp:TextBox><asp:Button
                    ID="BtnSearch" runat="server" CssClass="button" Text="查询" OnClick="BtnSearch_Click" />
                <input type="button" class="button" runat="server" id="btnAdd" value="新增" onclick="javascript:window.location='NewContacts.aspx'" />
            </p>
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center" class="gridtable">
                <asp:Repeater ID="rptContactsList" runat="server" OnItemDataBound="rptContactsList_ItemDataBound"
                    OnItemCommand="rptContactsList_ItemCommand">
                    <HeaderTemplate>
                        <tr class="thbg" style="padding: 0 0 0 0">
                            <th align="center">
                                合同编号
                            </th>
                            <th align="center">
                                合同名
                            </th>
                            <th align="center">
                                合同完成日期
                            </th>
                            <th align="center">
                                分公司
                            </th>
                            <th align="center">
                                供应商
                            </th>
                            <th align="center">
                                操作
                            </th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td align="center">
                                <%#Eval("Instanceid")%>
                            </td>
                            <td align="left">
                                <%#Eval("Xmmc")%>
                            </td>
                            <td align="center">
                                <%# Eval("Htwcrq") == null ? "" : ((DateTime)Eval("Htwcrq")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="left">
                                <%#Eval("Subcompanyname")%>
                            </td>
                            <td align="left">
                                <%#Eval("Cbf")%>
                            </td>
                            <td align="center">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="导入设备" ToolTip="导入设备" CommandName="EditDetail" CommandArgument='<%#Eval("Instanceid") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="even">
                            <td align="center">
                                <%#Eval("Instanceid")%>
                            </td>
                            <td align="left">
                                <%#Eval("Xmmc")%>
                            </td>
                            <td align="center">
                                <%# Eval("Htwcrq") == null ? "" : ((DateTime)Eval("Htwcrq")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="left">
                                <%#Eval("Subcompanyname")%>
                            </td>
                            <td align="left">
                                <%#Eval("Cbf")%>
                            </td>
                            <td align="center">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="导入设备" ToolTip="导入设备" CommandName="EditDetail" CommandArgument='<%#Eval("Instanceid") %>' />
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
