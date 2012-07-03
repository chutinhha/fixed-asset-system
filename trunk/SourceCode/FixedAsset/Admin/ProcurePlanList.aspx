<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="ProcurePlanList.aspx.cs" Inherits="FixedAsset.Web.Admin.ProcurePlanList" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/mail.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ul id="TabPage1">
        <li id="Tab1" title="采购计划单管理">采购计划单管理</li>
    </ul>
    <div id="cnt">
        <div id="dTab1" class="Box text_box">
            <p>
                单号
                <asp:TextBox ID="txtSrchPsid" Width="150" CssClass="" runat="server"></asp:TextBox><asp:Button
                    ID="BtnSearch" runat="server" CssClass="button" Text="查询" OnClick="BtnSearch_Click" />
                <input type="button" class="button" runat="server" id="btnAdd" value="新增" onclick="javascript:window.location='ProcurePlan_Add.aspx'" />
            </p>
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center" class="gridtable">
                <asp:Repeater ID="rptProcureList" runat="server" OnItemDataBound="rptProcureList_ItemDataBound"
                    OnItemCommand="rptProcureList_ItemCommand">
                    <HeaderTemplate>
                        <tr class="thbg" style="padding: 0 0 0 0">
                            <th align="center">
                                单号
                            </th>
                            <th align="center">
                                计划采购日期
                            </th>
                            <th align="center">
                                分公司
                            </th>
                            <th align="center">
                                申请人
                            </th>
                            <th align="center">
                                申请日期
                            </th>
                            <th align="center">
                                审核人
                            </th>
                            <th align="center">
                                审核日期
                            </th>
                            <th align="center">
                                状态
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
                                <%#Eval("Psid")%>
                            </td>
                            <td align="center">
                                <%#((DateTime)Eval("Procurementscheduledate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <%#Eval("Subcompanyname")%>
                            </td>
                            <td align="center">
                                <%#Eval("Applyuser")%>
                            </td>
                            <td align="center">
                                <%#((DateTime)Eval("Applydate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <%#Eval("Approveuser")%>
                            </td>
                            <td align="center">
                                <%# Eval("Approvedate")==null?"":((DateTime)Eval("Approvedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <%#EnumUtil.RetrieveEnumDescript((ApproveResult)Eval("Approveresult"))%>
                            </td>
                            <td align="center">
                                <%#((DateTime)Eval("Createddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    Visible="false" AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Psid")%>'
                                    CommandName="EditDetail" />
                                <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    CommandArgument='<%#Eval("Psid")%>' CommandName="DeleteDetail" OnClientClick="return confirm('确认要删除吗？');"
                                    AlternateText="删除" ToolTip="删除" Visible="false" />
                                <asp:ImageButton ID="BtnApprove" runat="server" ImageUrl="~/images/Button/approve.GIF"
                                    Visible="false" AlternateText="审核" ToolTip="审核" CommandArgument='<%#Eval("Psid")%>'
                                    CommandName="ApproveDetail" />
                                <asp:ImageButton ID="BtnDetail" runat="server" ImageUrl="~/images/Button/detail.GIF"
                                    AlternateText="详细信息" ToolTip="详细信息" CommandArgument='<%#Eval("Psid")%>' CommandName="ViewDetail" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="even">
                            <td align="center">
                                <%#Eval("Psid")%>
                            </td>
                            <td align="center">
                                <%#((DateTime)Eval("Procurementscheduledate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <%#Eval("Subcompanyname")%>
                            </td>
                            <td align="center">
                                <%#Eval("Applyuser")%>
                            </td>
                            <td align="center">
                                <%#((DateTime)Eval("Applydate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <%#Eval("Approveuser")%>
                            </td>
                            <td align="center">
                                <%# Eval("Approvedate")==null?"":((DateTime)Eval("Approvedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <%#EnumUtil.RetrieveEnumDescript((ApproveResult)Eval("Approveresult"))%>
                            </td>
                            <td align="center">
                                <%#((DateTime)Eval("Createddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    Visible="false" AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Psid")%>'
                                    CommandName="EditDetail" />
                                <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    CommandArgument='<%#Eval("Psid")%>' CommandName="DeleteDetail" OnClientClick="return confirm('确认要删除吗？');"
                                    AlternateText="删除" ToolTip="删除" Visible="false" />
                                <asp:ImageButton ID="BtnApprove" runat="server" ImageUrl="~/images/Button/approve.GIF"
                                    Visible="false" AlternateText="审核" ToolTip="审核" CommandArgument='<%#Eval("Psid")%>'
                                    CommandName="ApproveDetail" />
                                <asp:ImageButton ID="BtnDetail" runat="server" ImageUrl="~/images/Button/detail.GIF"
                                    AlternateText="详细信息" ToolTip="详细信息" CommandArgument='<%#Eval("Psid")%>' CommandName="ViewDetail" />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <tr style="height: 28px">
                    <td colspan="10" style="height: 28px; width: 98%;" align="center">
                        <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
