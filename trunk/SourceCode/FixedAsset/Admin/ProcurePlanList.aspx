<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="ProcurePlanList.aspx.cs" Inherits="FixedAsset.Web.Admin.ProcurePlanList" %>

<%@ Import Namespace="FixedAsset.Web.AppCode" %>
<%@ Register Assembly="SeallNet.WebControls" Namespace="SeallNet.WebControls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                    ID="BtnSearch" runat="server" CssClass="button" Text="查询"  OnClick="BtnSearch_Click"/>
                <input type="button" class="button" runat="server" id="btnAdd" value="新增" onclick="window.location='ProcurePlan_Add.aspx'" />
            </p>
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center">
                <asp:Repeater ID="rptProcureList" runat="server">
                    <HeaderTemplate>
                        <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                            <td align="center">
                                单号
                            </td>
                            <td>
                                计划采购日期
                            </td>
                            <td>
                                分公司
                            </td>
                            <td>
                                申请人
                            </td>
                            <td>
                                申请日期
                            </td>
                            <td>
                                审核人
                            </td>
                            <td>
                                审核日期
                            </td>
                            <td>
                                审核结果
                            </td>
                            <td>
                                操作
                            </td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td align="center">
                                <%#Eval("Psid")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Procurementscheduledate")).ToString(UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Subcompany")%>
                            </td>
                            <td>
                                <%#Eval("Applyuser")%>
                            </td>
                            <td>
                                <%#Eval("")%>
                                <%#((DateTime)Eval("Applydate")).ToString(UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Approveuser")%>
                            </td>
                            <td>
                                <%# Eval("Approvedate")==null?"":((DateTime)Eval("Approvedate")).ToString(UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Approveresult")%>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="编辑" ToolTip="编辑" />
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="alt-row">
                            <td align="center">
                                <%#Eval("Psid")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Procurementscheduledate")).ToString(UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Subcompany")%>
                            </td>
                            <td>
                                <%#Eval("Applyuser")%>
                            </td>
                            <td>
                                <%#Eval("")%>
                                <%#((DateTime)Eval("Applydate")).ToString(UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Approveuser")%>
                            </td>
                            <td>
                                <%# Eval("Approvedate")==null?"":((DateTime)Eval("Approvedate")).ToString(UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Approveresult")%>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="编辑" ToolTip="编辑" />
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
            </table>
            <cc1:PageChangeControl ID="pageControl" PageSize="10" runat="server" OnPageIndexClick="pageControl_PageIndexClick" />
        </div>
    </div>
</asp:Content>
