<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="Asset_Scrapped.aspx.cs" Inherits="FixedAsset.Web.Admin.Asset_Scrapped" %>

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
        <li id="Tab1" title="报废管理">报废</li>
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
                            OnSelectedIndexChanged="ddlAssetCategory_SelectedIndexChanged" Width="120">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlSubAssetCategory" class="text_inp" Width="120" runat="server">
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
                    <td colspan="2">
                        <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="查询" OnClick="BtnSearch_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" align="right">
                        <asp:Button ID="BtnBatchApply" runat="server" CssClass="button" Text="批量申请报废" OnClick="BtnBatchApply_Click" />
                        <asp:Button ID="Button2" runat="server" CssClass="button" Text="查询" OnClick="BtnSearch_Click" />
                        <%--<input type="button" class="button" runat="server" id="btnApplicate" value="报废申请"
                            onclick="ShowTopDialogFrame('报废申请', 'AssetUsedList.aspx',null,850,300);return false;" />
                        <input type="button" class="button" runat="server" id="btnVerify" value="报废审核" onclick="ShowTopDialogFrame('报废审核', 'ScrappedApproved.aspx',null,550,300);return false;" />--%>
                    </td>
                </tr>
            </table>
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center">
                <asp:Repeater ID="rptScrappedList" runat="server" OnItemDataBound="rptScrappedList_ItemDataBound" OnItemCommand="rptScrappedList_ItemCommand">
                    <HeaderTemplate>
                        <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                            <td style="width: 10%">
                                <input type="checkbox" id="chkAll" />设备编号
                            </td>
                            <td style="width: 8%">
                                设备类别
                            </td>
                            <td style="width: 9%">
                                设备名称
                            </td>
                            <td style="width: 6%">
                                设备状态
                            </td>
                            <td style="width: 5%">
                                折旧年限
                            </td>
                            <td style="width: 8%">
                                入账日期
                            </td>
                            <td style="width: 10%">
                                预计折旧日期
                            </td>
                            <td style="width: 9%">
                                报废申请单号
                            </td>
                            <td style="width: 7%">
                                报废日期
                            </td>
                            <td style="width: 7%">
                                报废人
                            </td>
                            <td style="width: 6%">
                                报废状态
                            </td>
                            <td style="width: 6%">
                                操作
                            </td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td align="center">
                                <asp:CheckBox ID="ckbAssetno" runat="server" TextAlign="Right" />
                                <asp:Literal ID="litAssetno" runat="server" Text='<%#Eval("Assetno")%>' />
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
                                <%#((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Expireddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <%#Eval("Assetscrappedid")%>
                            </td>
                            <td>
                                <%# Eval("Scrappeddate") == null ? "" : ((DateTime)Eval("Scrappeddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Scrappeduser")%>
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((AssetScrappedState)Eval("Approvedstate"))%>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="BtnApprove" runat="server" ImageUrl="~/images/Button/approve.GIF"
                                    Visible="false" AlternateText="审核" ToolTip="审核" CommandArgument='<%#Eval("Assetscrappedid")%>'
                                    CommandName="ApproveDetail" />
                                <asp:ImageButton ID="BtnDetail" runat="server" ImageUrl="~/images/Button/detail.GIF"
                                    AlternateText="详细信息" Visible="false" ToolTip="详细信息" CommandArgument='<%#Eval("Assetscrappedid")%>'
                                    CommandName="ViewDetail" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="alt-row">
                            <td align="center">
                                <asp:CheckBox ID="ckbAssetno" runat="server" TextAlign="Right" />
                                <asp:Literal ID="litAssetno" runat="server" Text='<%#Eval("Assetno")%>' />
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
                                <%#((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Expireddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td align="center">
                                <%#Eval("Assetscrappedid")%>
                            </td>
                            <td>
                                <%# Eval("Scrappeddate") == null ? "" : ((DateTime)Eval("Scrappeddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Scrappeduser")%>
                            </td>
                            <td>
                                <%#EnumUtil.RetrieveEnumDescript((AssetScrappedState)Eval("Approvedstate"))%>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="BtnApprove" runat="server" ImageUrl="~/images/Button/approve.GIF"
                                    Visible="false" AlternateText="审核" ToolTip="审核" CommandArgument='<%#Eval("Assetscrappedid")%>'
                                    CommandName="ApproveDetail" />
                                <asp:ImageButton ID="BtnDetail" runat="server" ImageUrl="~/images/Button/detail.GIF"
                                    Visible="false" AlternateText="详细信息" ToolTip="详细信息" CommandArgument='<%#Eval("Assetscrappedid")%>'
                                    CommandName="ViewDetail" />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <tr>
                   <td colspan="12" style="height: 30px; width: 98%;" align="center">
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
