<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="EquipmentList.aspx.cs" Inherits="FixedAsset.Web.Admin.EquipmentList" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ul id="TabPage1">
        <li id="Tab1" title="设备明细">设备明细</li>
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
                        设备类别
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEquipmentType" runat="server" Width="150">
                        </asp:DropDownList>
                    </td>

                      <td>
                        购入日期
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" Width="150" CssClass="" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                
                      <td>
                        管理模式
                    </td>
                    <td>
                         <asp:DropDownList ID="ddlManagementModel" runat="server" Width="150px">
                                            <asp:ListItem>托管</asp:ListItem>
                                            <asp:ListItem>自管</asp:ListItem>
                                        </asp:DropDownList>
                    </td>
                    <td>
                        设备状态
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEquipmentStatus" runat="server" Width="150">
                            <asp:ListItem>在用</asp:ListItem>
                            <asp:ListItem>未用</asp:ListItem>
                            <asp:ListItem>报废</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        账务类别
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlAccountingType" runat="server" Width="150">
                            <asp:ListItem>A账</asp:ListItem>
                            <asp:ListItem>B账</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                <td colspan="6" align="right">
                  <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="查询" OnClick="BtnSearch_Click" />
                <input type="button" class="button" runat="server" id="btnAdd" value="新增" onclick="window.location='NewEquipment.aspx'" />
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
                               设备类别
                            </td>
                            <td>
                               设备名称
                            </td>
                            <td>
                               设备状态
                            </td>
                            <td>
                               单价
                            </td>
                            <td>
                               品牌
                            </td>
                             <td>
                               账务类别
                            </td>
                            <td>
                               购入日期
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
                              <td align="center">
                                <%#Eval("Psid")%>
                            </td>
                              <td align="center">
                                <%#Eval("Psid")%>
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
                             <td align="center">
                                <%#Eval("Psid")%>
                            </td>
                             <td align="center">
                                <%#Eval("Psid")%>
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
                <tr>
                    <td>
                    </td>
                    <td colspan="8" style="height: 30px; width: 98%;">
                        <%-- <cc1:PageChangeControl ID="pageControl" PageSize="10" runat="server" OnPageIndexClick="pageControl_PageIndexClick" />--%>
                        <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
