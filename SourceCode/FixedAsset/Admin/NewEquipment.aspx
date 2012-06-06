<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="NewEquipment.aspx.cs" Inherits="FixedAsset.Web.Admin.NewEquipment" %>

<%@ Register Src="~/Admin/UserControl/ucSelectSubCompany.ascx" TagName="SelectSubCompany"
    TagPrefix="uc1" %>
<%@ Register Src="~/Admin/UserControl/ucSelectSupplier.ascx" TagName="SelectSupplier"
    TagPrefix="uc1" %>
<%@ Register Src="~/Admin/UserControl/ucDatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<%@ Register Src="~/Admin/UserControl/ucSelectedMultiAssets.ascx" TagName="SelectedMultiAssets"
    TagPrefix="uc1" %>
<%@ Register Src="~/Admin/UserControl/ucSelectStorageAddress.ascx" TagName="SelectStorageAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/Admin/UserControl/ucSelectStorageAddress2.ascx" TagName="SelectStorageAddress2"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content-box">
        <div class="content-box-header">
            <h3 style="cursor: s-resize;">
                <asp:Literal runat="server" ID="litTitle" Text="设备登记" /></h3>
        </div>
        <div class="content-box-content">
            <div class="tab-content default-tab">
                <div class="column-left">
                    <b>选中存放地点：</b>
                    <div class="listbox">
                        <uc1:SelectStorageAddress ID="ucSelectStorageAddress" runat="server" OnSelectedStorageNodeChange="ucSelectStorageAddress_SelectedStorageNodeChange" />
                    </div>
                </div>
                <div class="column-right">
                    <table>
                        <tr>
                            <td style="width: 180px;">
                                设备编号:
                            </td>
                            <td>
                                <asp:Label ID="litAssetno" class="text_inp" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                设备类别:
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
                            <td style="width: 180px;">
                                设备名称: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAssetname" runat="server" class="text_inp" Width="300px" ValidationGroup="Vaild"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAssetname"
                                    Display="Dynamic" ErrorMessage="请输入设备名称！"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                设备规格: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAssetspecification" runat="server" class="text_inp" Width="300px"
                                    ValidationGroup="Vaild"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAssetspecification"
                                    Display="Dynamic" ErrorMessage="请输入设备规格！"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                存放地点:
                            </td>
                            <td>
                                <asp:Literal runat="server" ID="litStorage" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                设备状态:
                            </td>
                            <td>
                                <asp:Label ID="litState" class="text_inp" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                单价:<span style="color: Red">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtUnitprice" runat="server" class="text_inp" Width="300px" ValidationGroup="Vaild"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUnitprice"
                                    Display="Dynamic" ErrorMessage="请输入单价！"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                品牌:
                            </td>
                            <td>
                                <asp:TextBox ID="txtBrand" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                管理模式:
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlManagementModel" runat="server" Width="300px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                账务类别:
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlFinancecategory" Enabled="false" runat="server" Width="300px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                供应商: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:SelectSupplier ID="ucSelectSupplier" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                分公司: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:SelectSubCompany ID="ucSelectSubCompany" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                购入日期:<span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:DatePicker ID="ucPurchasedate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                折旧年限: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDepreciationyear" class="text_inp" runat="server" Width="300px"
                                    Text="10" ValidationGroup="Vaild"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDepreciationyear"
                                    Display="Dynamic" ErrorMessage="请输入折旧年限！"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td colspan="2">
                                <asp:Button ID="BtnSave" runat="server" Text="保 存" CssClass="button" ValidationGroup="Vaild"
                                    OnClick="BtnSave_Click" />
                                <input id="btnReset" type="button" value="重 置" class="button" onclick='javascript:window.location.href = "NewEquipment.aspx";' />
                            </td>
                        </tr>
                    </table>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
