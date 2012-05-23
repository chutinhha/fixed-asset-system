<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="user_edit.aspx.cs" Inherits="Admin_user_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-box">
                <div class="content-box-header">
                    <h3 style="cursor: s-resize;">
                        用户编辑</h3>
                </div>
                <div class="content-box-content">
                    <div class="tab-content default-tab">
                        <div class="column-left">
                            <b>选中部门：</b>
                            <asp:Label ID="lbdepartmentname" runat="server" Text=""></asp:Label>
                            <asp:HiddenField ID="hfdepartmentid" runat="server" />
                            <div class="listbox">
                                <asp:TreeView ID="treeDepartment" runat="server">
                                </asp:TreeView>
                            </div>
                        </div>
                        <div class="column-right">
                            <table>
                                <tr>
                                    <td>
                                        用户名称: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtuserName" runat="server" class="text-input medium-input_new"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvP_USERNAME" runat="server" ErrorMessage="请输入用户名！"
                                            ControlToValidate="txtuserName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        用户电话:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTel" runat="server" MaxLength="13" class="text-input medium-input_new"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        用户手机:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMobile" runat="server" MaxLength="11" class="text-input medium-input_new"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Width="300"
                                            ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="手机号码格式错误！" ValidationExpression="^1[3,5,4,8]{1}[0-9]{1}[0-9]{8}$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Email:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server" class="text-input medium-input_new"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        用户角色:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddl_role" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        用户状态:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddl_Status" runat="server">
                                            <asp:ListItem Value="0">有效</asp:ListItem>
                                            <asp:ListItem Value="1">无效</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="btnSubmit" runat="server" Text="保存" CssClass="button" />
                                        <input type="button" value="取消" onclick="javascript:window.location='user_list.aspx'"
                                            class="button" />
                                    </td>
                                </tr>
                            </table>
                            <div class="clear">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
