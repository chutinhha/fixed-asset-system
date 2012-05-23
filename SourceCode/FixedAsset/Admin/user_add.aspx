<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="user_add.aspx.cs" Inherits="FixedAsset.Web.Admin.user_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/calendar.js" type="text/javascript"></script>
    <script type="text/javascript">
        function reset() {
            window.location.href = "terminal_edit.aspx";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <ul id="TabPage1">
                <li id="Tab1" title="终端修改">终端修改</li>
            </ul>
            <br />
            <div class="text_login">
                <table>
                    <tr>
                        <td style="width: 180px;">
                            终端编号:
                        </td>
                        <td>
                            <asp:Label ID="lblId" class="text_inp" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            M2M终端ID:<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtM2mId" class="text_inp" runat="server" Width="300"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtM2mId"
                                Display="Dynamic" ErrorMessage="请输入M2M终端ID！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            终端名称: <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTerminalName" MaxLength="50" class="text_inp" runat="server"
                                Width="300"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTerminalName"
                                Display="Dynamic" ErrorMessage="请输入终端名称！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            终端图片:
                        </td>
                        <td>
                            <asp:FileUpload ID="fudImage" runat="server" /><br />
                            <b class="note">支持（gif/jpg/png/bmp 内容＜1M）
                                <asp:Label ID="lblImage" runat="server"></asp:Label></b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            MDMP协议版本号: <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMdmpVersion" class="text_inp" runat="server" Width="300"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMdmpVersion"
                                Display="Dynamic" ErrorMessage="请输入MDMP协议版本号！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            终端绑定应用ID: <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTerminalAppid" class="text_inp" runat="server" Width="300"></asp:TextBox>
                            <asp:ImageButton ID="btnAppIdSelect" ImageUrl="../images/Button/PickUp.GIF" runat="server"
                                OnClientClick="ShowTopDialogFrame('应用选择', 'return_m2mApplication.aspx','AppIdSelect()',790,500);return false;" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            生效时间: <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEffDate" class="text_inp" Width="150" onclick="new Calendar().show(this);"
                                ReadOnly="true" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                    runat="server" ControlToValidate="txtEffDate" Display="Dynamic" ErrorMessage="请选择生效时间！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            失效时间: <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtExpDate" class="text_inp" Width="150" onclick="new Calendar().show(this);"
                                ReadOnly="true" runat="server" /><asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                    runat="server" ControlToValidate="txtExpDate" Display="Dynamic" ErrorMessage="请选择失效时间！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            状态:
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlState" runat="server">
                                <asp:ListItem Value="0">F0A</asp:ListItem>
                                <asp:ListItem Value="1">F0X</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            终端状态:
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlTerminalState" runat="server">
                                <asp:ListItem Value="0">在线</asp:ListItem>
                                <asp:ListItem Value="1">离线</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            部署服务器Ip<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtServerip" class="text_inp" runat="server" Width="300"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtServerip"
                                Display="Dynamic" ErrorMessage="请输入部署服务器Ip！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            串口（COM）号: <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlSerCom" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            串口波特率: <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBotel" class="text_inp" runat="server" Width="300"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtBotel"
                                Display="Dynamic" ErrorMessage="请输入串口波特率！"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="text-align: center">
                        <td colspan="2">
                            <asp:Button ID="btnSubmit" runat="server" Text="确 定" CssClass="button" />
                            <asp:Button ID="btnReset" runat="server" Text="重 置" CssClass="button" CausesValidation="false"
                                OnClientClick="reset();" />
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
    <script type="text/javascript" language="javascript">
        function AppIdSelect() {
            var returnValue = getCookie("dialogReturn_key");
            if (returnValue != null) {
                document.getElementById("<%=txtTerminalAppid.ClientID %>").value = returnValue;
                setCookie("dialogReturn_key", null);
            }
        }
    </script>
</asp:Content>
