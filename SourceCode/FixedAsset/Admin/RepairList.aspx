<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="RepairList.aspx.cs" Inherits="FixedAsset.Web.Admin.RepairList" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Src="~/Admin/UserControl/ucDatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<%@ Register Src="~/Admin/UserControl/ucSelectProject.ascx" TagName="SelectProject"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/mail.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ul id="TabPage1">
        <li id="Tab1" title="维修登记">维修登记</li>
    </ul>
    <div id="cnt">
        <div id="dTab1" class="Box text_box">
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center">
                <tr>
                    <td style="width: 20%;">
                        维修单编号
                    </td>
                    <td>
                        <asp:TextBox ID="txtSrchAssetmaintainid" Width="150" CssClass="" runat="server"></asp:TextBox>
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
                        <input type="button" class="button" runat="server" id="btnAdd" value="申请" onclick="javascript:window.location='NewRepairing.aspx'" />
                    </td>
                </tr>
            </table>
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center" class="gridtable">
                <asp:Repeater ID="rptRepairList" runat="server" OnItemDataBound="rptRepairList_ItemDataBound"
                    OnItemCommand="rptRepairList_ItemCommand">
                    <HeaderTemplate>
                        <tr class="thbg" style="padding: 0 0 0 0">
                            <th style="width: 100px;" align="center">
                                维修单号
                            </th>
                            <th align="center" style="width: 40px;">
                                系统
                            </th>
                            <th align="center" style="width: 60px;">
                                分公司
                            </th>
                            <th align="center" style="width: 150px;">
                                项目体
                            </th>
                            <th align="center" style="width: 75px;">
                                申请日期
                            </th>
                            <th align="center" style="width: 50px;">
                                申请人
                            </th>
                            <th align="center">
                                申请内容
                            </th>
                            <th align="center" style="width: 60px;">
                                状态
                            </th>
                            <th align="center" style="width: 65px;">
                                操作
                            </th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%#Eval("Assetmaintainid")%>
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
                                <%#Eval("Applyusername")%>
                            </td>
                            <td style="word-wrap: break-word; overflow: hidden; width: 200px;">
                                <%#Eval("Applycontent")%>
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((AssetMaintainState)Eval("Approveresult"))%>
                            </td>
                            <td align="center">
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    Visible="false" AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Assetmaintainid")%>'
                                    CommandName="EditDetail" />
                                <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    CommandArgument='<%#Eval("Assetmaintainid")%>' CommandName="DeleteDetail" OnClientClick="return confirm('确认要删除吗？');"
                                    AlternateText="删除" ToolTip="删除" Visible="false" />
                                <asp:ImageButton ID="BtnReply" runat="server" ImageUrl="~/images/Button/approve.GIF"
                                    Visible="false" AlternateText="回复" ToolTip="回复" CommandArgument='<%#Eval("Assetmaintainid")%>'
                                    CommandName="ReplyDetail" />
                                <asp:ImageButton ID="BtnComfirm" runat="server" ImageUrl="~/images/Button/approve.GIF"
                                    Visible="false" AlternateText="确认" ToolTip="确认" CommandArgument='<%#Eval("Assetmaintainid")%>'
                                    CommandName="ComfirmDetail" />
                                <asp:ImageButton ID="BtnDetail" runat="server" ImageUrl="~/images/Button/detail.GIF"
                                    AlternateText="详细信息" ToolTip="详细信息" CommandArgument='<%#Eval("Assetmaintainid")%>'
                                    CommandName="ViewDetail" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="even">
                            <td>
                                <%#Eval("Assetmaintainid")%>
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
                                <%#Eval("Applyusername")%>
                            </td>
                            <td style="word-wrap: break-word; overflow: hidden; width: 200px;">
                                <%#Eval("Applycontent")%>
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((AssetMaintainState)Eval("Approveresult"))%>
                            </td>
                            <td align="center">
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    Visible="false" AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Assetmaintainid")%>'
                                    CommandName="EditDetail" />
                                <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    CommandArgument='<%#Eval("Assetmaintainid")%>' CommandName="DeleteDetail" OnClientClick="return confirm('确认要删除吗？');"
                                    AlternateText="删除" ToolTip="删除" Visible="false" />
                                <asp:ImageButton ID="BtnReply" runat="server" ImageUrl="~/images/Button/approve.GIF"
                                    Visible="false" AlternateText="回复" ToolTip="回复" CommandArgument='<%#Eval("Assetmaintainid")%>'
                                    CommandName="ReplyDetail" />
                                <asp:ImageButton ID="BtnComfirm" runat="server" ImageUrl="~/images/Button/approve.GIF"
                                    Visible="false" AlternateText="确认" ToolTip="确认" CommandArgument='<%#Eval("Assetmaintainid")%>'
                                    CommandName="ComfirmDetail" />
                                <asp:ImageButton ID="BtnDetail" runat="server" ImageUrl="~/images/Button/detail.GIF"
                                    AlternateText="详细信息" ToolTip="详细信息" CommandArgument='<%#Eval("Assetmaintainid")%>'
                                    CommandName="ViewDetail" />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="9" style="height: 30px; width: 98%;" align="center">
                        <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
