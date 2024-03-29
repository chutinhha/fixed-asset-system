﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="ProcurePlan_Add.aspx.cs" Inherits="FixedAsset.Web.Admin.ProcurePlan_Add" %>

<%@ Register Src="~/Admin/UserControl/ucSelectSubCompany.ascx" TagName="ucSelectSubCompany"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="uc1" TagName="DatePicker" Src="~/Admin/UserControl/ucDatePicker.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucSelectUser" Src="~/Admin/UserControl/ucSelectUser.ascx" %>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="content-box">
        <div class="content-box-header">
            <h3 style="cursor: s-resize;">
                <asp:Literal runat="server" ID="litTitle" Text="计划登记" />
            </h3>
        </div>
        <div class="content-box-content">
            <div class="tab-content default-tab">
                <fieldset>
                     <table>
                        <tr>
                            <td style="width: 120px;">
                                单号:
                            </td>
                            <td>
                                <asp:Label ID="litPsid" class="text_inp" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                计划采购日期:<span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:DatePicker ID="ucProcurementscheduledate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                采购事由: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtReason" Width="300" runat="server" MaxLength="1000" TextMode="MultiLine"
                                    ValidationGroup="Vaild"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtReason"
                                    Display="Dynamic" ErrorMessage="请输入采购事由！"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                分公司: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:ucSelectSubCompany ID="ucSubCompany" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                申请人: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:ucSelectUser ID="ucApplyuser" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                申请日期: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:DatePicker ID="ucApplydate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div id="tag" class="thin blue">
                                    <ul id="tags">
                                        <li id="api" class="selectTag"><a href="#">设备明细</a> </li>
                                    </ul>
                                    <p class="gap">
                                    </p>
                                </div>
                                <p class="c">
                                </p>
                                <div id="tagContent">
                                    <div id="MyFile" style="display: block;">
                                        <table style="width: 100%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                                            align="center" class="gridtable">
                                            <tr style="border-bottom-width: 1px;">
                                                <td colspan="6" align="right">
                                                    <input type="button" class="button" runat="server" id="Button1" value="新增" onclick="ShowTopDialogFrame('新增明细', 'ProcurePlanDetail_Add.aspx','RefreshDetail()',790,500);return false;" />
                                                </td>
                                            </tr>
                                            <asp:Repeater ID="rptProcureDetailList" OnItemDataBound="rptProcureDetailList_ItemDataBound"
                                                OnItemCommand="rptProcureDetailList_ItemCommand" runat="server">
                                                <HeaderTemplate>
                                                    <tr class="thbg" style="padding: 0 0 0 0">
                                                        <th style="width: 100px;" align="center">
                                                            设备类别
                                                        </th>
                                                        <th>
                                                            设备名称
                                                        </th>
                                                        <th>
                                                            设备规格
                                                        </th>
                                                        <th>
                                                            计划采购数量
                                                        </th>
                                                        <th>
                                                            单价
                                                        </th>
                                                        <th>
                                                            操作
                                                        </th>
                                                    </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <%#Eval("CategoryAllPathName")%>
                                                        </td>
                                                        <td>
                                                            <%#Eval("Assetname")%>
                                                        </td>
                                                        <td>
                                                            <%#Eval("Assetspecification")%>
                                                        </td>
                                                        <td>
                                                            <%#Eval("Plannumber")%>
                                                        </td>
                                                        <td align="right">
                                                            <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
                                                        </td>
                                                        <td align="right">
                                                            <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                                                CausesValidation="false" AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Detailid")%>'
                                                                CommandName="EditDetail" />
                                                            <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                                                CommandArgument='<%#Eval("Detailid")%>' CommandName="DeleteDetail" OnClientClick="return confirm('确认要删除吗？');"
                                                                AlternateText="删除" ToolTip="删除" CausesValidation="false" />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <AlternatingItemTemplate>
                                                    <tr class="even">
                                                        <td>
                                                            <%#Eval("CategoryAllPathName")%>
                                                        </td>
                                                        <td>
                                                            <%#Eval("Assetname")%>
                                                        </td>
                                                        <td>
                                                            <%#Eval("Assetspecification")%>
                                                        </td>
                                                        <td>
                                                            <%#Eval("Plannumber")%>
                                                        </td>
                                                        <td align="right">
                                                            <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
                                                        </td>
                                                        <td align="right">
                                                            <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                                                CausesValidation="false" AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Detailid")%>'
                                                                CommandName="EditDetail" />
                                                            <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                                                CommandArgument='<%#Eval("Detailid")%>' CommandName="DeleteDetail" OnClientClick="return confirm('确认要删除吗？');"
                                                                AlternateText="删除" ToolTip="删除" CausesValidation="false" />
                                                        </td>
                                                    </tr>
                                                </AlternatingItemTemplate>
                                            </asp:Repeater>
                                        </table>
                                        <div style="display: none;">
                                            <asp:Button ID="BtnRefreshDetail" OnClick="BtnRefreshDetail_Click" Width="0" runat="server"
                                                CausesValidation="false" Text="Button" /></div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td colspan="2">
                                <asp:Button ID="BtnSave" runat="server" Text="保 存" CssClass="button" ValidationGroup="Vaild"
                                    OnClick="BtnSave_Click" />
                                <asp:Button ID="btnSubmit" runat="server" Text="提 交" CssClass="button" ValidationGroup="Vaild"
                                    OnClick="btnSubmit_Click" />
                                <input type="button" class="button" runat="server" id="Button2" value="重 置" onclick="javascript:window.location.href = 'ProcurePlan_Add.aspx';" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
        </div>
    </div>
    <script type="text/javascript" language="javascript">
        function RefreshDetail() {
            var returnValue = getCookie("dialogReturn_key");
            if (returnValue != null) {
                document.getElementById("<%=BtnRefreshDetail.ClientID %>").click();
                setCookie("dialogReturn_key", null);
            }
        }
    </script>
</asp:Content>
