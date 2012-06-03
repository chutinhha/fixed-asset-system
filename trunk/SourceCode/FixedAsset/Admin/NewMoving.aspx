<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="NewMoving.aspx.cs" Inherits="FixedAsset.Web.Admin.NewMoving" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />    
    <script type="text/javascript">
        function reset() {
            window.location.href = "NewMoving.aspx";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-box">
                <div class="content-box-header">
                    <h3 style="cursor: s-resize;">
                        <asp:Literal runat="server" ID="litTitle" Text="移机申请" />
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
                                        <asp:Label ID="litPsid" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td style="width: 180px;">
                                        设备名称:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEquipmentName" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        申请移机日期:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMovingDate" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        申请日期:
                                    </td>
                                    <td>
                                       <asp:TextBox ID="txtApplyDate" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        申请人:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtApplyer" runat="server" class="text_inp" Width="300px"></asp:TextBox>
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
                                <tr>
                                    <td style="width: 180px;">
                                        项目体:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProject" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        项目体联系人:
                                    </td>
                                    <td>
                                       <asp:TextBox ID="txtProjectContact" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        项目体联系电话: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProjectContactNum" class="text_inp" runat="server" Width="300"></asp:TextBox>
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        计划移机日期:<span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEquipmentMovedate" class="text_inp" runat="server" Width="300"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEquipmentMovedate"
                                            Display="Dynamic" ErrorMessage="请选择设备计划移机日期！"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        实际移机日期: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                           <asp:TextBox ID="txtActualMoveDate" class="text_inp" runat="server" Width="300"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtActualMoveDate"
                                            Display="Dynamic" ErrorMessage="请选择设备实际移机日期！"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr style="text-align: center">
                                    <td colspan="2">
                                        <asp:Button ID="BtnSave" runat="server" Text="保 存" CssClass="button" ValidationGroup="Vaild"
                                            OnClick="BtnSave_Click" />
                                        <asp:Button ID="btnSubmit" runat="server" Text="提 交" CssClass="button" ValidationGroup="Vaild"
                                            OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnReset" runat="server" Text="重 置" CssClass="button" CausesValidation="false"
                                            OnClientClick="javascript:reset();" />
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
