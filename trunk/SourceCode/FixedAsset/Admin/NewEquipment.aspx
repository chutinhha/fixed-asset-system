<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="NewEquipment.aspx.cs" Inherits="FixedAsset.Web.Admin.NewEquipment" %>

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
                                        设备名称:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAssetname" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        设备规格:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAssetspecification" runat="server" class="text_inp" Width="300px"></asp:TextBox>
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
                                        单价:
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
                                        <asp:DropDownList ID="ddlFinancecategory" runat="server" Width="300px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        供应商: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSuppliers" class="text_inp" runat="server" Width="300"></asp:TextBox>
                                        <asp:ImageButton ID="btnAppIdSelect" ImageUrl="../images/Button/PickUp.GIF" runat="server"
                                            OnClientClick="ShowTopDialogFrame('供应商选择', 'return_m2mApplication.aspx','AppIdSelect()',790,500);return false;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        购入日期:<span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPurchasedate" class="text_inp" runat="server" Width="300"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPurchasedate"
                                            Display="Dynamic" ErrorMessage="请选择设备购入日期！"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        折旧年限: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDepreciationyear" class="text_inp" runat="server" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="text-align: center">
                                    <td colspan="2">
                                        <asp:Button ID="BtnSave" runat="server" Text="保 存" CssClass="button" ValidationGroup="Vaild"
                                            OnClick="BtnSave_Click" />
                                        <asp:Button ID="btnSubmit" runat="server" Text="确 定" CssClass="button" ValidationGroup="Vaild"
                                            OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnReset" runat="server" Text="重 置" CssClass="button" CausesValidation="false"
                                            OnClientClick="reset();" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript" language="javascript">
        function AppIdSelect() {
            var returnValue = getCookie("dialogReturn_key");
            if (returnValue != null) {
                document.getElementById("<%=txtSuppliers.ClientID %>").value = returnValue;
                setCookie("dialogReturn_key", null);
            }
        }
    </script>
</asp:Content>
