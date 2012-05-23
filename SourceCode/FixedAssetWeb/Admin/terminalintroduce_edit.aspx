<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="terminalintroduce_edit.aspx.cs" Inherits="Admin_terminalintroduce_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function reset() {
            window.location.href = "terminalintroduce_edit.aspx";
        }

        function limitInput(maxlen) {
            var txt = document.getElementById('<%=txtTerminalName.ClientID %>');
            if (txt.value.length >= maxlen) {
                txt.value = txt.value.substr(0, maxlen);
                txt.blur();
            }

            return;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-box">
                <div class="content-box-header">
                    <h3 style="cursor: s-resize;">
                        编辑介绍
                    </h3>
                </div>
                <div class="content-box-content">
                    <div class="tab-content default-tab">
                        <fieldset>
                            <table>
                                <tr>
                                    <td>
                                        终端名称: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTerminalName" class="text_inp" runat="server" Width="200" MaxLength="255"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTerminalName"
                                            Display="Dynamic" ErrorMessage="请输入终端名称！" ValidationGroup="Vaild"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        终端厂家: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTerminalCompany" class="text_inp" runat="server" Width="200"
                                            MaxLength="255"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTerminalCompany"
                                            Display="Dynamic" ErrorMessage="请输入终端厂家！" ValidationGroup="Vaild"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        通过电信测试:
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlTestFlag" runat="server">
                                            <asp:ListItem Value="1">是</asp:ListItem>
                                            <asp:ListItem Value="0">否</asp:ListItem>
                                        </asp:DropDownList>
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
                                        简要介绍: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSimpleIntroduce" class="text_inp" runat="server" Width="300px"
                                            onchange="limitInput(1000);" onblur="limitInput(1000);" onkeypress="limitInput(1000);"
                                            Height="200" MaxLength="1000" TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtSimpleIntroduce"
                                            Display="Dynamic" ErrorMessage="请输入简要介绍！" ValidationGroup="Vaild"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        详细介绍:
                                    </td>
                                    <td>
                                        <asp:FileUpload ID="fudTxt" runat="server" /><br />
                                        <b class="note">支持（pdf/word 格式＜5M）
                                            <asp:Label ID="lblTxt" runat="server"></asp:Label></b>
                                    </td>
                                </tr>
                                <tr style="text-align: center">
                                    <td colspan="2">
                                        <asp:Button ID="btnSubmit" runat="server" Text="确 定" CssClass="button" OnClick="btnSubmit_Click"
                                            ValidationGroup="Vaild" />
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
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
