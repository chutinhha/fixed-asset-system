﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="NewEquipment.aspx.cs" Inherits="FixedAsset.Web.Admin.NewEquipment" %>
 <%@ Register Src="~/Admin/UserControl/ucSelectSubCompany.ascx" TagName="SelectSubCompany" TagPrefix="uc1" %> 
 <%@ Register Src="~/Admin/UserControl/ucSelectSupplier.ascx" TagName="SelectSupplier" TagPrefix="uc1" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <script src="../Scripts/calendar.js" type="text/javascript"></script>
    <script type="text/javascript">
        function reset() {
            window.location.href = "NewEquipment.aspx";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-box">
                <div class="content-box-header">
                    <h3 style="cursor: s-resize;">
                        <asp:Literal runat="server" ID="litTitle" Text="设备登记" />
                    </h3>
                </div>
                <div class="content-box-content">
                    <div class="tab-content default-tab">
                        <fieldset>
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
                                        <asp:TextBox ID="txtAssetname" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAssetname"
                                            Display="Dynamic" ErrorMessage="请输入设备名称！"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        设备规格: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAssetspecification" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                        
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAssetspecification"
                                            Display="Dynamic" ErrorMessage="请输入设备规格！"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        存放地点:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtStorage" runat="server" class="text_inp" Width="300px"></asp:TextBox>
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
                                        <asp:TextBox ID="txtUnitprice" runat="server" class="text_inp" Width="300px"></asp:TextBox>
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
                                        <asp:TextBox ID="txtPurchasedate" class="text_inp" runat="server" Width="300" onclick="new Calendar().show(this);"/>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPurchasedate"
                                            Display="Dynamic" ErrorMessage="请选择设备购入日期！"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        折旧年限: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDepreciationyear" class="text_inp" runat="server" Width="300px" Text="10"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDepreciationyear"
                                            Display="Dynamic" ErrorMessage="请输入折旧年限！"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr style="text-align: center">
                                    <td colspan="2">
                                        <asp:Button ID="BtnSave" runat="server" Text="保 存" CssClass="button" ValidationGroup="Vaild"
                                            OnClick="BtnSave_Click" />
                                        <%--<asp:Button ID="btnSubmit" runat="server" Text="确 定" CssClass="button" ValidationGroup="Vaild"
                                            OnClick="btnSubmit_Click" />--%>
                                        <input id="btnReset" type="button" value="重 置" class="button" onclick="reset();" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>