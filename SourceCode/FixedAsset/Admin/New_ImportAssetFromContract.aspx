<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="New_ImportAssetFromContract.aspx.cs" Inherits="FixedAsset.Web.Admin.New_ImportAssetFromContract" %>

<%@ Register Src="~/Admin/UserControl/ucSelectSupplier.ascx" TagName="ucSelectSupplier"
    TagPrefix="uc1" %>
<%@ Register Src="~/Admin/UserControl/ucSelectSubCompany.ascx" TagName="ucSelectSubCompany"
    TagPrefix="uc1" %>
<%@ Register Src="~/Admin/UserControl/ucMultiSelectProcurePlans.ascx" TagName="MultiSelectProcurePlans"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="uc1" TagName="DatePicker" Src="~/Admin/UserControl/ucDatePicker.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucSelectProject" Src="~/Admin/UserControl/ucSelectProject.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content-box">
        <div class="content-box-header">
            <h3 style="cursor: s-resize;">
                导入设备表
            </h3>
        </div>
        <div class="content-box-content">
            <div class="tab-content default-tab">
                <fieldset>
                    <table>
                        <tr>
                            <td style="width: 180px;">
                                合同编号:
                            </td>
                            <td>
                                <asp:Literal ID="litInstanceid" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                合同名:
                            </td>
                            <td>
                                <asp:Literal ID="litXmmc" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                分公司:
                            </td>
                            <td>
                                <uc1:ucSelectSubCompany ID="ucSubCompany" runat="server" IsShowSubCompanyName="true" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                供应商:
                            </td>
                            <td>
                                <uc1:ucSelectSupplier ID="ucSelectSupplier" runat="server" IsShowSupplierName="true" />
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td colspan="2">
                                <div id="tag" class="thin blue">
                                    <ul id="tags">
                                        <li id="api" class="selectTag"><a href="#">导入资产明细</a> </li>
                                    </ul>
                                    <p class="gap">
                                    </p>
                                </div>
                                <p class="c">
                                </p>
                                <div id="tagContent">
                                    <div id="MyFile" style="display: block;">
                                        <table style="width: 900px; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                                            align="center" class="gridtable">
                                            <asp:Repeater ID="rptContactDetailList" runat="server" OnItemDataBound="rptContactDetailList_ItemDataBound"
                                                OnItemCommand="rptContactDetailList_ItemCommand">
                                                <HeaderTemplate>
                                                    <tr class="thbg" style="padding: 0 0 0 0">
                                                        <th style="width: 100px;" align="center">
                                                            设备类别 </td>
                                                            <td>
                                                                设备名称
                                                            </td>
                                                            <td>
                                                                设备规格
                                                            </td>
                                                            <td>
                                                                导入数量
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
                                                            <%#Eval("ImportNumber")%>
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
                                                            <%#Eval("ImportNumber")%>
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
                                <asp:Button ID="BtnSave" runat="server" Text="导入设备" CssClass="button" OnClick="BtnSave_Click" />
                                <input type="button" class="button" runat="server" id="btnReset" value="返回设备管理" onclick="javascript:window.location.href = 'EquipmentList.aspx';" />
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
