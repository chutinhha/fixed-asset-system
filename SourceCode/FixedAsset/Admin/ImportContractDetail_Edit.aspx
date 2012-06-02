<%@ Page Title="修改导入明细" Language="C#" MasterPageFile="~/Admin/MasterPage.master"
    AutoEventWireup="true" CodeBehind="ImportContractDetail_Edit.aspx.cs" Inherits="FixedAsset.Web.Admin.ImportContractDetail_Edit" %>

<%@ Register TagPrefix="uc1" TagName="selectstorageaddress" Src="~/Admin/UserControl/ucSelectStorageAddress.ascx" %>
<%@ Register TagPrefix="uc1" TagName="datepicker" Src="~/Admin/UserControl/ucDatePicker.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-box-content">
                <div class="tab-content default-tab">
                    <div class="column-left">
                        <b>选中存放地点：</b>
                        <div class="listbox">
                            <uc1:selectstorageaddress ID="ucSelectStorageAddress" runat="server" OnSelectedStorageNodeChange="ucSelectStorageAddress_SelectedStorageNodeChange" />
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
                            <%-- <tr>
                                <td style="width: 180px;">
                                    账务类别:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlFinancecategory" Enabled="false" runat="server" Width="300px">
                                    </asp:DropDownList>
                                </td>
                            </tr>--%>
                            <%--<tr>
                                <td>
                                    供应商: <span style="color: Red">*</span>
                                </td>
                                <td>
                                    <uc1:selectsupplier id="ucSelectSupplier" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    分公司: <span style="color: Red">*</span>
                                </td>
                                <td>
                                    <uc1:selectsubcompany id="ucSelectSubCompany" runat="server" />
                                </td>
                            </tr>--%>
                            <tr>
                                <td>
                                    购入日期:<span style="color: Red">*</span>
                                </td>
                                <td>
                                    <uc1:datepicker ID="ucPurchasedate" runat="server" />
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
                            <tr>
                                <td>
                                    可导入数量: <span style="color: Red">*</span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPlannumber" class="text_inp" runat="server" Width="300" ValidationGroup="Vaild"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPlannumber"
                                        Display="Dynamic" ErrorMessage="请输入可导入数量！"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="text-align: center">
                                <td colspan="2">
                                    <asp:Button ID="btnSubmit" runat="server" Text="提 交" CssClass="button" OnClick="btnSubmit_Click"
                                        ValidationGroup="Vaild" />
                                    <asp:Button ID="btnReset" runat="server" Text="关 闭" CssClass="button" CausesValidation="false"
                                        OnClientClick="javascript:CloseTopDialogFrame();" />
                                </td>
                            </tr>
                        </table>
                        <div class="clear">
                        </div>
                    </div>
                </div>
            </div>
            <%--<div class="text_login">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            设备名称:<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAssetname" class="text_inp" runat="server" Width="300" ValidationGroup="Vaild"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAssetname"
                                Display="Dynamic" ErrorMessage="请输入设备名称！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 180px;">
                            设备类别: <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlAssetCategory" class="text_inp" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlAssetCategory_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlSubAssetCategory" class="text_inp" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            设备规格: <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAssetspecification" MaxLength="50" class="text_inp" runat="server" ValidationGroup="Vaild"
                                Width="300"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAssetspecification"
                                Display="Dynamic" ErrorMessage="请输入设备规格！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            单价: <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUnitprice" class="text_inp" runat="server" Width="300" ValidationGroup="Vaild"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUnitprice"
                                Display="Dynamic" ErrorMessage="请输入单价！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           采购数量: <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPlannumber" class="text_inp" runat="server" Width="300" ValidationGroup="Vaild"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPlannumber"
                                Display="Dynamic" ErrorMessage="请输入采购数量！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="text-align: center">
                        <td colspan="2">
                            <asp:Button ID="btnSubmit" runat="server" Text="提 交" CssClass="button" OnClick="btnSubmit_Click" ValidationGroup="Vaild" />
                            <asp:Button ID="btnReset" runat="server" Text="关 闭" CssClass="button" CausesValidation="false"
                                OnClientClick="javascript:CloseTopDialogFrame();" />
                        </td>
                    </tr>
                </table>
            </div>--%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
