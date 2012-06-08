﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="InstallList.aspx.cs" Inherits="FixedAsset.Web.Admin.InstallList" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Src="~/Admin/UserControl/ucDatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<%@ Register Src="~/Admin/UserControl/ucSelectProject.ascx" TagName="SelectProject"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ul id="TabPage1">
        <li id="Tab1" title="安装管理">安装管理</li>
    </ul>
    <div id="cnt">
        <div id="dTab1" class="Box text_box">
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center">
                <tr>
                    <td>
                        申请单号
                    </td>
                    <td>
                        <asp:TextBox ID="txtSrchSetupid" Width="150" CssClass="" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        项目体
                    </td>
                    <td>
                        <uc1:SelectProject ID="ucSelectProject" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        申请日期
                    </td>
                    <td colspan="3">
                        <uc1:DatePicker ID="ucSrchStartApplydate" runat="server" />
                        ~
                        <uc1:DatePicker ID="ucSrchEndApplydate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="right">
                        <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="查询" OnClick="BtnSearch_Click" />
                        <input type="button" class="button" runat="server" id="btnAdd" value="申请" onclick="javascript:window.location='NewInstall.aspx'" />
                    </td>
                </tr>
            </table>
            <table style="width: 100%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center">
                <asp:Repeater ID="rptAssetSetupList" runat="server" OnItemDataBound="rptAssetSetupList_ItemDataBound"
                    OnItemCommand="rptAssetSetupList_ItemCommand">
                    <HeaderTemplate>
                        <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                            <td style="width: 100px;" align="center">
                                申请单号
                            </td>
                            <td align="center" style="width: 40px;">
                                系统
                            </td>
                            <td align="center" style="width: 60px;">
                                分公司
                            </td>
                            <td align="center" style="width: 60px;">
                                项目体
                            </td>
                            <td align="center" style="width: 75px;">
                                申请日期
                            </td>
                            <td align="center">
                                申请人
                            </td>
                            <td align="center">
                                申请内容
                            </td>
                            <td align="center" style="width: 60px;">
                                状态
                            </td>
                            <td align="center">
                                操作
                            </td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%#Eval("Setupid")%>
                            </td>
                            <td>
                                <%#Eval("System")%>
                            </td>
                            <td>
                                <%#Eval("Subcompanyname")%>
                            </td>
                            <td>
                                <%#Eval("Subcompanyname").ToString() == Eval("Storagename").ToString() ? string.Empty : Eval("Storagename").ToString()%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Applydate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Applyuserid")%>
                            </td>
                            <td style="word-wrap: break-word; overflow: hidden; width: 200px;">
                                <%#Eval("Applycontent")%>
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((SetupState)Eval("Approveresult"))%>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    Visible="false" AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Setupid")%>'
                                    CommandName="EditDetail" />
                                <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    CommandArgument='<%#Eval("Setupid")%>' CommandName="DeleteDetail" OnClientClick="return confirm('确认要删除吗？');"
                                    AlternateText="删除" ToolTip="删除" Visible="false" />
                                <asp:ImageButton ID="BtnReply" runat="server" ImageUrl="~/images/Button/approve.GIF"
                                    Visible="false" AlternateText="回复" ToolTip="回复" CommandArgument='<%#Eval("Setupid")%>'
                                    CommandName="ReplyDetail" />
                                <asp:ImageButton ID="BtnComfirm" runat="server" ImageUrl="~/images/Button/approve.GIF"
                                    Visible="false" AlternateText="确认" ToolTip="确认" CommandArgument='<%#Eval("Setupid")%>'
                                    CommandName="ComfirmDetail" />
                                <asp:ImageButton ID="BtnDetail" runat="server" ImageUrl="~/images/Button/detail.GIF"
                                    AlternateText="详细信息" ToolTip="详细信息" CommandArgument='<%#Eval("Setupid")%>' CommandName="ViewDetail" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="alt-row">
                            <td>
                                <%#Eval("Setupid")%>
                            </td>
                            <td>
                                <%#Eval("System")%>
                            </td>
                            <td>
                                <%#Eval("Subcompanyname")%>
                            </td>
                            <td>
                                <%#Eval("Subcompanyname").ToString() == Eval("Storagename").ToString() ? string.Empty : Eval("Storagename").ToString()%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Applydate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Applyuserid")%>
                            </td>
                            <td style="word-wrap: break-word; overflow: hidden; width: 200px;">
                                <%#Eval("Applycontent")%>
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((SetupState)Eval("Approveresult"))%>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    Visible="false" AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Setupid")%>'
                                    CommandName="EditDetail" />
                                <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    CommandArgument='<%#Eval("Setupid")%>' CommandName="DeleteDetail" OnClientClick="return confirm('确认要删除吗？');"
                                    AlternateText="删除" ToolTip="删除" Visible="false" />
                                <asp:ImageButton ID="BtnReply" runat="server" ImageUrl="~/images/Button/approve.GIF"
                                    Visible="false" AlternateText="回复" ToolTip="回复" CommandArgument='<%#Eval("Setupid")%>'
                                    CommandName="ReplyDetail" />
                                <asp:ImageButton ID="BtnComfirm" runat="server" ImageUrl="~/images/Button/approve.GIF"
                                    Visible="false" AlternateText="确认" ToolTip="确认" CommandArgument='<%#Eval("Setupid")%>'
                                    CommandName="ComfirmDetail" />
                                <asp:ImageButton ID="BtnDetail" runat="server" ImageUrl="~/images/Button/detail.GIF"
                                    AlternateText="详细信息" ToolTip="详细信息" CommandArgument='<%#Eval("Setupid")%>' CommandName="ViewDetail" />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="12" style="height: 30px; width: 98%;" align="center">
                        <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
