﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="NewContacts.aspx.cs" Inherits="FixedAsset.Web.Admin.NewContacts" %>

<%@ Register Src="~/Admin/UserControl/ucSelectSupplier.ascx" TagName="ucSelectSupplier"
    TagPrefix="uc1" %>
<%@ Register Src="~/Admin/UserControl/ucSelectSubCompany.ascx" TagName="ucSelectSubCompany"
    TagPrefix="uc1" %>
<%@ Register Src="~/Admin/UserControl/ucMultiSelectProcurePlans.ascx" TagName="MultiSelectProcurePlans"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="uc1" TagName="DatePicker" Src="~/Admin/UserControl/ucDatePicker.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content-box">
        <div class="content-box-header">
            <h3 style="cursor: s-resize;">
                <asp:Literal runat="server" ID="litTitle" Text="采购合同登记" />
            </h3>
        </div>
        <div class="content-box-content">
            <div class="tab-content default-tab">
                <fieldset>
                     <table>
                        <tr>
                            <td style="width: 120px;">
                                合同编号:
                            </td>
                            <td>
                                <asp:Label ID="litPsid" class="text_inp" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                签订日期:<span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:DatePicker ID="ucContactscheduledate" runat="server" />
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
                                供应商: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:ucSelectSupplier ID="ucSelectSupplier" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                创建日期: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:DatePicker ID="ucApplydate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div id="tag" class="thin blue">
                                    <ul id="tags">
                                        <li id="api" class="selectTag"><a href="#">明细</a> </li>
                                    </ul>
                                    <p class="gap">
                                    </p>
                                </div>
                                <p class="c">
                                </p>
                                <div id="tagContent">
                                    <div id="MyFile" style="display: block;">
                                        <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                                            align="center">
                                            <tr style="border-bottom-width: 1px;">
                                                <td colspan="6" align="right">
                                                    请选择采购计划单：
                                                    <uc1:MultiSelectProcurePlans ID="ucMultiSelectProcurePlans" runat="server" OnSelectProcurePlanChange="ucMultiSelectProcurePlans_SelectProcurePlanChange" />
                                                    <input type="button" class="button" runat="server" id="Button1" value="新增" onclick="ShowTopDialogFrame('新增明细', 'ContactDetail_Add.aspx','RefreshDetail()',790,500);return false;" />
                                                </td>
                                            </tr>
                                            <asp:Repeater ID="rptContactDetailList" runat="server" OnItemDataBound="rptContactDetailList_ItemDataBound"
                                                OnItemCommand="rptContactDetailList_ItemCommand">
                                                <HeaderTemplate>
                                                    <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                                                        <td>
                                                            设备类别
                                                        </td>
                                                        <td>
                                                            设备名称
                                                        </td>
                                                        <td>
                                                            设备规格
                                                        </td>
                                                        <td>
                                                            采购数量
                                                        </td>
                                                        <td>
                                                            单价
                                                        </td>
                                                        <td>
                                                            操作
                                                        </td>
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
                                                            <%#Eval("Procurenumber")%>
                                                        </td>
                                                          <td align="right">
                                                            <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
                                                        </td>
                                                        <td align="right">
                                                            <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                                                AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Contractdetailid")%>'
                                                                CommandName="EditDetail" />
                                                            <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                                                CommandArgument='<%#Eval("Contractdetailid")%>' CommandName="DeleteDetail" OnClientClick="return confirm('确认要删除吗？');"
                                                                AlternateText="删除" ToolTip="删除" />
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
                                                            <%#Eval("Procurenumber")%>
                                                        </td>
                                                          <td align="right">
                                                            <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
                                                        </td>
                                                        <td align="right">
                                                            <asp:ImageButton ID="BtnEdit" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                                                AlternateText="编辑" ToolTip="编辑" CommandArgument='<%#Eval("Contractdetailid")%>'
                                                                CommandName="EditDetail" />
                                                            <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                                                CommandArgument='<%#Eval("Contractdetailid")%>' CommandName="DeleteDetail" OnClientClick="return confirm('确认要删除吗？');"
                                                                AlternateText="删除" ToolTip="删除" />
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
                                    OnClick="btnSubmit_Click" Visible="false" />
                                <asp:Button ID="BtmImortAssets" runat="server" Text="导入登记" Visible="false" CssClass="button"
                                    CausesValidation="false" OnClick="BtmImortAssets_Click" />
                                <input type="button" class="button" runat="server" id="btnReset" value="重 置" onclick="javascript:window.location.href = 'NewContacts.aspx';" />
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
