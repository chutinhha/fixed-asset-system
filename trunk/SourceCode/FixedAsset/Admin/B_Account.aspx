<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="B_Account.aspx.cs" Inherits="FixedAsset.Web.Admin.B_Account" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Src="~/Admin/UserControl/ucDatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ul id="TabPage1">
        <li id="Tab1" title="B账">B账</li>
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
                       <asp:TextBox ID="txtEquipmentID" Width="260" CssClass="" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        设备类别
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlType" runat="server" Width="120">
                        </asp:DropDownList>
                    </td>
                    <td>
                        设备名称
                    </td>
                    <td>
                        <asp:TextBox ID="txtEquipmentName" runat="server" Width="120"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                
                     <td>
                        入账日期
                    </td>
                    <td>
                   
                         <uc1:DatePicker ID="ucImportStartDate" runat="server" Width="120"/>
                        ~
                        <uc1:DatePicker ID="ucImportEndDate" runat="server" Width="120" />
                    </td>
                    <td>
                        预计折旧日期
                    </td>
                    <td colspan="2">
                       <uc1:DatePicker ID="ucZJStartDate" runat="server" Width="120"/>
                        ~
                        <uc1:DatePicker ID="ucZJEndDate" runat="server" Width="120"/>
                      
                    </td>
                    <td><asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="查询" OnClick="BtnSearch_Click" /></td>
                </tr>
              <%--  <tr>
                   
                    
                    
                    <td colspan="7" align="right">
                     
                    </td>
                </tr>--%>
               
            </table>
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center">
                <asp:Repeater ID="rptBAcountsList" runat="server" OnItemDataBound="rptBAcountsList_ItemDataBound"
                    OnItemCommand="rptBAcountsList_ItemCommand">
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
                                存放地点
                            </td>
                            <td>
                                设备状态
                            </td>
                            <td>
                                折旧年限
                            </td>
                            <td>
                                供应商
                            </td>
                            <td>
                                账务类别
                            </td>
                            <td>
                                管理模式
                            </td>
                            <td>
                                入账日期
                            </td>
                            <td>
                                预计折旧日期
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
                                <%#Eval("SUPPLIERNAME")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Createddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <%#Eval("Contractid")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Contractdate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("SUPPLIERNAME")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Createddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Contractdate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("SUPPLIERNAME")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Createddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="编辑" ToolTip="编辑" CommandName="EditDetail" CommandArgument='<%#Eval("Contractid") %>' />
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" CommandName="DeleteDetail"
                                    CommandArgument='<%#Eval("Contractid") %>' />
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
                                <%#Eval("SUPPLIERNAME")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Createddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <%#Eval("Contractid")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Contractdate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("SUPPLIERNAME")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Createddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Contractdate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("SUPPLIERNAME")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Createddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                    AlternateText="编辑" ToolTip="编辑" CommandName="EditDetail" CommandArgument='<%#Eval("Contractid") %>' />
                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                    OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" CommandName="DeleteDetail"
                                    CommandArgument='<%#Eval("Contractid") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="12" style="height: 30px; width: 100%;">
                        <%-- <cc1:PageChangeControl ID="pageControl" PageSize="10" runat="server" OnPageIndexClick="pageControl_PageIndexClick" />--%>
                        <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
