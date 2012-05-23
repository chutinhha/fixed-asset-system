<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="user_list.aspx.cs" Inherits="FixedAsset.Web.Admin.user_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <ul id="TabPage1">
        <li id="Tab1" title="用户管理">用户管理</li>
    </ul>
    <div id="cnt">
        <div id="dTab1" class="Box text_box">
            <p>
                用户名称
                <asp:TextBox class="text-input small-input" ID="txt_userName" runat="server"></asp:TextBox>
                <input type="button" class="button" runat="server" id="Button1" value="查询" onclick="window.location='user_edit.aspx'" />
                
                <input type="button" class="button" runat="server" id="btnAdd" value="新增" onclick="window.location='user_add.aspx'" />
            </p>
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center">
                <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                    <td align="center">
                        登录用户名
                    </td>
                    <td>
                        中文姓名
                    </td>
                    <td>
                        用户状态
                    </td>
                    <td>
                        性别
                    </td>
                    <td>
                        手机号码
                    </td>
                    <td>
                        联系电话
                    </td>
                    <td>
                        操作
                    </td>
                </tr>
                <tr>
                    <td>
                        GeJianLei
                    </td>
                    <td>
                        葛剑磊
                    </td>
                    <td>
                        激活
                    </td>
                    <td>
                        男
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td align="right">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/edit.GIF"
                            AlternateText="编辑" ToolTip="编辑" />
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/Button/delete.GIF"
                            OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" />
                    </td>
                </tr>
                <tr class="alt-row">
                    <td>
                        JinWei
                    </td>
                    <td>
                        金玮
                    </td>
                    <td>
                        激活
                    </td>
                    <td>
                        男
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td align="right">
                        <asp:ImageButton ID="btnUpdate" runat="server" ImageUrl="~/images/Button/edit.GIF"
                            AlternateText="编辑" ToolTip="编辑" />
                        <asp:ImageButton ID="btnDel" runat="server" ImageUrl="~/images/Button/delete.GIF"
                            OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" />
                    </td>
                </tr>
                <tr>
                    <td>
                        GeJianLei
                    </td>
                    <td>
                        葛剑磊
                    </td>
                    <td>
                        激活
                    </td>
                    <td>
                        男
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td align="right">
                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/Button/edit.GIF"
                            AlternateText="编辑" ToolTip="编辑" />
                        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/images/Button/delete.GIF"
                            OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" />
                    </td>
                </tr>
                <tr class="alt-row">
                    <td>
                        JinWei
                    </td>
                    <td>
                        金玮
                    </td>
                    <td>
                        激活
                    </td>
                    <td>
                        男
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td align="right">
                        <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/images/Button/edit.GIF"
                            AlternateText="编辑" ToolTip="编辑" />
                        <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/images/Button/delete.GIF"
                            OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" />
                    </td>
                </tr>
                <tr>
                    <td>
                        GeJianLei
                    </td>
                    <td>
                        葛剑磊
                    </td>
                    <td>
                        激活
                    </td>
                    <td>
                        男
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td align="right">
                        <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/images/Button/edit.GIF"
                            AlternateText="编辑" ToolTip="编辑" />
                        <asp:ImageButton ID="ImageButton8" runat="server" ImageUrl="~/images/Button/delete.GIF"
                            OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" />
                    </td>
                </tr>
                <tr class="alt-row">
                    <td>
                        JinWei
                    </td>
                    <td>
                        金玮
                    </td>
                    <td>
                        激活
                    </td>
                    <td>
                        男
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td align="right">
                        <asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="~/images/Button/edit.GIF"
                            AlternateText="编辑" ToolTip="编辑" />
                        <asp:ImageButton ID="ImageButton10" runat="server" ImageUrl="~/images/Button/delete.GIF"
                            OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
