<%@ Page Title=""  Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="Asset_Scrapped.aspx.cs" Inherits="FixedAsset.Web.Admin.Asset_Scrapped" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Src="~/Admin/UserControl/ucDatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ul id="TabPage1">
        <li id="Tab1" title="设备管理">报废</li>
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
                        <asp:TextBox ID="txtSrchAssetno" Width="150" CssClass="" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        设备类别
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlAssetCategory" class="text_inp" runat="server" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlAssetCategory_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlSubAssetCategory" class="text_inp" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        设备名称
                    </td>
                    <td>
                        <asp:TextBox ID="txtSrchAssetname" Width="150" CssClass="" runat="server"></asp:TextBox>
                    </td>
                     <td>
                        入账日期
                    </td>
                    <td>
                        <uc1:DatePicker ID="ucStartPurchasedate" runat="server" />
                        ~<uc1:DatePicker ID="ucEndPurchasedate" runat="server" />
                    </td>
                </tr>
                <tr> 
                    <td>
                        预计折旧日期
                    </td>
                    <td>
                        <uc1:DatePicker ID="ucStartExpireddate" runat="server" />
                        ~<uc1:DatePicker ID="ucEndExpireddate" runat="server" />
                    </td>
                    <td colspan="2"><asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="查询" 
                            onclick="BtnSearch_Click" /></td>
                </tr>
                <tr>
                    <td colspan="6" align="right">
                            <input type="button" class="button" runat="server" id="btnApplicate" value="报废申请" onclick="ShowTopDialogFrame('报废申请', 'AssetUsedList.aspx',null,850,300);return false;" />
                            <input type="button" class="button" runat="server" id="btnVerify" value="报废审核" onclick="ShowTopDialogFrame('报废审核', 'ScrappedApproved.aspx',null,550,300);return false;" />
                    </td>
                </tr>
            </table>
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center">
                <asp:Repeater ID="rptScrappedList" runat="server" OnItemDataBound="rptScrappedList_ItemDataBound">
                    <HeaderTemplate>
                        <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                            <td style="width: 10%">
                                <input type="checkbox" id="chkAll" />全选/反选
                            </td>
                            <td align="center" style="width: 12%">
                                设备编号
                            </td>
                            <td style="width: 8%">
                                设备类别
                            </td>
                            <td style="width: 9%">
                                设备名称
                            </td>
                            <td style="width: 9%">
                                存放地点
                            </td>
                            <td style="width: 7%">
                                设备状态
                            </td>
                            <td style="width: 7%">
                                折旧年限
                            </td>
                            <td style="width: 6%">
                                报废日期
                            </td>
                            <td style="width: 7%">
                                报废人
                            </td>
                            <td style="width: 8%">
                                入账日期
                            </td>
                            <td style="width: 10%">
                                预计折旧日期
                            </td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td align="center">
                                <input type="checkbox" runat="server" id="ckbB_Account" value='<%#Eval("Assetno")%>' />
                            </td>
                            <td align="center">
                                <%#Eval("Assetno")%>
                            </td>
                            <td>
                                <asp:Literal ID="litCategoryName" runat="server" />
                            </td>
                            <td>
                                <%#Eval("Assetname")%>
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((AssetState)Eval("State"))%>
                            </td>
                            <td>
                                <%#Eval("Depreciationyear")%>
                            </td>
                            <td>
                                <asp:Literal ID="LitSupplierName" runat="server" />
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((FinanceCategory)Eval("Financecategory"))%>
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((ManageMode)Eval("Managemode"))%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Expireddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="alt-row">
                            <td align="center">
                                <input type="checkbox" runat="server" id="ckbB_Account" value='<%#Eval("Assetno")%>' />
                            </td>
                            <td align="center">
                                <%#Eval("Assetno")%>
                            </td>
                            <td>
                                <asp:Literal ID="litCategoryName" runat="server" />
                            </td>
                            <td>
                                <%#Eval("Assetname")%>
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((AssetState)Eval("State"))%>
                            </td>
                            <td>
                                <%#Eval("Depreciationyear")%>
                            </td>
                            <td>
                                <asp:Literal ID="LitSupplierName" runat="server" />
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((FinanceCategory)Eval("Financecategory"))%>
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((ManageMode)Eval("Managemode"))%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Expireddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="9" style="height: 30px; width: 98%;">
                        <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            //全选/反选
            $("#chkAll").click(function () {
                $("input[type='checkbox']").attr("checked", this.checked);
            });
        });
        </script>
</asp:Content>
