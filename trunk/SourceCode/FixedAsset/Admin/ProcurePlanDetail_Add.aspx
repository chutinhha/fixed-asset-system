<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="ProcurePlanDetail_Add.aspx.cs" Inherits="FixedAsset.Web.Admin.ProcurePlanDetail_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/calendar.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="text_login">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            设备名称:<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAssetname" class="text_inp" runat="server" Width="300"></asp:TextBox>
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
                            <%--<asp:TextBox ID="txtAssetcategoryid" class="text_inp" runat="server" Width="300" />--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            设备规格: <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAssetspecification" MaxLength="50" class="text_inp" runat="server"
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
                            <asp:TextBox ID="txtUnitprice" class="text_inp" runat="server" Width="300"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUnitprice"
                                Display="Dynamic" ErrorMessage="请输入单价！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            计划采购数量: <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPlannumber" class="text_inp" runat="server" Width="300"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPlannumber"
                                Display="Dynamic" ErrorMessage="请输入数量！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="text-align: center">
                        <td colspan="2">
                            <asp:Button ID="btnSubmit" runat="server" Text="确 定" CssClass="button" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnReset" runat="server" Text="关 闭" CssClass="button" CausesValidation="false"
                                OnClientClick="javascript:CloseTopDialogFrame();" />
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
