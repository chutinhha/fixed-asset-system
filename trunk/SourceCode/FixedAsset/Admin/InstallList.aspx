<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="InstallList.aspx.cs" Inherits="FixedAsset.Web.Admin.InstallList" %>
<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
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
                        设备编号
                    </td>
                    <td>
                        <asp:TextBox ID="txtSrchPsid" Width="150" CssClass="" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        项目体
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProjects" runat="server" Width="150">
                        </asp:DropDownList>
                    </td>

                       <td>
                        状态
                    </td>
                    <td>
                         <asp:DropDownList ID="ddlStatus" runat="server" Width="150px">
                                            <asp:ListItem>待安装</asp:ListItem>
                                            <asp:ListItem>已安装</asp:ListItem>
                                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                 <td>
                        申请日期
                    </td>
                    <td>
                        <asp:TextBox ID="txtApplicationStartDate" Width="150" CssClass="" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        至
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="txtApplicationEndDate" Width="150" CssClass="" runat="server"></asp:TextBox>
                    </td>  
                  
                </tr>
                <tr>
                <td colspan="6" align="right">
                  <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="查询" OnClick="BtnSearch_Click" />
                <input type="button" class="button" runat="server" id="btnAdd" value="申请" onclick="window.location='NewEquipment.aspx'" />
                </td>
                </tr>
            </table>
        
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center">
                <asp:Repeater ID="rptContactsList" runat="server">
                    <HeaderTemplate>
                        <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                            <td align="center">
                               设备编号
                            </td>
                            <td>
                               设备数量
                            </td>
                            <td>
                               设备名称
                            </td>
                            <td>
                               设备状态
                            </td>
                            <td>
                              申请人
                            </td>
                            <td>
                               申请日期
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
                                <%#((DateTime)Eval("Procurementscheduledate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Subcompany")%>
                            </td>
                            <td>
                                <%#Eval("Applyuser")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Applydate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                              <td align="center">
                                <%#Eval("Psid")%>
                            </td>
                             
                              
                            <td align="right">
                               <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="编辑" ToolTip="编辑" />
                                      <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="回复" ToolTip="回复" />
                                 <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="确认" ToolTip="确认" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="alt-row">
                            <td align="center">
                                <%#Eval("Psid")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Procurementscheduledate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Subcompany")%>
                            </td>
                            <td>
                                <%#Eval("Applyuser")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Applydate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                             <td align="center">
                                <%#Eval("Psid")%>
                            </td>
                           
                            <td align="right">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="编辑" ToolTip="编辑" />
                                      <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="回复" ToolTip="回复" />
                                 <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="确认" ToolTip="确认" />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <tr>
                    <td>
                    </td>
                    <td colspan="6" style="height: 30px; width: 98%;">
                        <%-- <cc1:PageChangeControl ID="pageControl" PageSize="10" runat="server" OnPageIndexClick="pageControl_PageIndexClick" />--%>
                        <cc1:pagingcontrol ID="pcData" runat="server" MaxNavigatePageCount="7" 
                            OnPageIndexClick="pcData_PageIndexClick" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
