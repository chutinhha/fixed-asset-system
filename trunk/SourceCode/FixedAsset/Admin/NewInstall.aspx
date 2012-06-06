<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="NewInstall.aspx.cs" Inherits="FixedAsset.Web.Admin.NewInstall" %>

<%@ Register TagPrefix="uc1" TagName="ucShowAssetDetail_1" Src="~/Admin/UserControl/ucShowAssetDetail.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SelectStorageAddress" Src="~/Admin/UserControl/ucSelectStorageAddress.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SelectedMultiAssets" Src="~/Admin/UserControl/ucSelectedMultiAssets.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SelectStorageAddress2" Src="~/Admin/UserControl/ucSelectStorageAddress2.ascx" %>
<%@ Register TagPrefix="uc1" TagName="DatePicker_1" Src="~/Admin/UserControl/ucDatePicker.ascx" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Register Src="UserControl/ucSelectUser.ascx" TagName="ucSelectUser" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc1" TagName="ucSeletedSystem" Src="~/Admin/UserControl/ucSeletedSystem.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SelectProject" Src="~/Admin/UserControl/ucSelectProject.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-box">
                <div class="content-box-header">
                    <h3 style="cursor: s-resize;">
                        <asp:Literal runat="server" ID="litTitle" Text="安装申请" />
                    </h3>
                </div>
                <div class="content-box-content">
                    <div class="tab-content default-tab">
                        <fieldset>
                            <table>
                                <tr>
                                    <td style="width: 180px;">
                                        所属系统: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <uc1:ucSeletedSystem ID="ucSeletedSystem" runat="server" OnSelectedAssetCategoryChange="ucSeletedSystem_SelectedAssetCategoryChange" />
                                    </td>
                                </tr>
                                 <tr>
                                    <td style="width: 180px;">
                                        申请单号: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                         <asp:Literal ID="litSetupid"   runat="server" />
                                    </td>
                                </tr>
                                 <tr>
                                    <td style="width: 180px;">
                                        申请内容: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                       <asp:TextBox TextMode="MultiLine" Height="80px" ID="txtApplycontent" 
                                            runat="server" Width="288px" />
                                    </td>
                                </tr>
                                <tr style="text-align: center">
                                    <td colspan="2">
                                        设备选择:<uc1:SelectedMultiAssets ID="ucSelectedMultiAssets" runat="server" />
                                        <asp:Repeater ID="rptAssetsList" runat="server" OnItemDataBound="rptAssetsList_ItemDataBound"
                                            OnItemCommand="rptAssetsList_ItemCommand">
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
                                                        购入日期
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
                                                        操作
                                                    </td>
                                                </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td align="center">
                                                        <uc1:ucShowAssetDetail_1 ID="ucShowAssetDetail" runat="server" Assetno='<%#Eval("Assetno")%>' />
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
                                                        <%#((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                                    </td>
                                                    <td>
                                                        <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
                                                    </td>
                                                    <td>
                                                        <%#Eval("Brand")%>
                                                    </td>
                                                    <td>
                                                        <%#EnumUtil.RetrieveEnumDescript((FinanceCategory)Eval("Financecategory"))%>
                                                    </td>
                                                    <td align="right">
                                                        <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                                            CommandArgument='<%#Eval("Assetno")%>' CommandName="DeleteDetail" 
                                                            AlternateText="删除" ToolTip="删除" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        申请安装日期: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <uc1:DatePicker_1 ID="ucApplySetupDate" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        项目体(分公司): <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                         <uc1:SelectProject ID="ucSelectProject" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        项目体(分公司)联系人: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProjectContact" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        项目体(分公司)联系电话: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProjectContactNum" class="text_inp" runat="server" Width="300"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        申请日期: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <uc1:DatePicker_1 ID="ucApplyDate" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        申请人: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:Literal ID="txtApplier" runat="server"></asp:Literal>                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        联系电话:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtContactNum" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="text-align: center">
                                    <td colspan="2">
                                        <asp:Button ID="BtnSave" runat="server" Text="保 存" CssClass="button" 
                                            ValidationGroup="Vaild" onclick="BtnSave_Click" />
                                        <asp:Button ID="btnSubmit" runat="server" Text="提 交" CssClass="button" 
                                            ValidationGroup="Vaild" onclick="btnSubmit_Click" />
                                        <asp:Button ID="btnReset" runat="server" Text="取 消" CssClass="button" CausesValidation="false"
                                            OnClientClick="javascript:window.location.href = 'InstallList.aspx';" 
                                            onclick="btnReset_Click" />
                                    </td>
                                </tr>
                            </table>
                           
                        </fieldset>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="hfdApplyUserId" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript" language="javascript">
        function AppIdSelect() {
            var returnValue = getCookie("dialogReturn_key");
            if (returnValue != null) {
                //document.getElementById("<%=txtSubcompany.ClientID %>").value = returnValue;
                setCookie("dialogReturn_key", null);
            }
        }
    </script>
</asp:Content>
