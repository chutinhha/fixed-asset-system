﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="ContractList.aspx.cs" Inherits="FixedAsset.Web.Admin.ContractList" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                align="center">
                <asp:Repeater ID="rptContactsList" runat="server"  OnItemDataBound="rptContactsList_ItemDataBound"
                                                        OnItemCommand="rptContactsList_ItemCommand">
                    <HeaderTemplate>
                        <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                            <td align="center">
                               合同编号
                            </td>
                            <td>
                                签订日期
                            </td>
                            <td>
                                供应商
                            </td>
                           
                            <td>
                                创建日期
                            </td>
                            <td>
                                操作
                            </td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td align="center">
                                <%#Eval("Contractid")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Contractdate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Suppliername")%>
                            </td>
                           
                            <td>
                                <%#((DateTime)Eval("Createddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="right">
                                  <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="编辑" ToolTip="编辑" CommandName="EditDetail" CommandArgument='<%#Eval("Contractid") %>' />
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" CommandName="DeleteDetail"  CommandArgument='<%#Eval("Contractid") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="alt-row">
                           <td align="center">
                                <%#Eval("Contractid")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Contractdate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Suppliername")%>
                            </td>
                           
                            <td>
                                <%#((DateTime)Eval("Createddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                           
                            <td align="right">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="编辑" ToolTip="编辑" CommandName="EditDetail" CommandArgument='<%#Eval("Contractid") %>' />
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" CommandName="DeleteDetail"  CommandArgument='<%#Eval("Contractid") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <tr>
                    <td>
                    </td>
                    <td colspan="5" style="height: 30px;width: 790px;">
                       <%-- <cc1:PageChangeControl ID="pageControl" PageSize="10" runat="server" OnPageIndexClick="pageControl_PageIndexClick" />--%>
                       <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
                    </td>
                </tr>  
            </table>
        </div>
    </div>
</asp:Content>