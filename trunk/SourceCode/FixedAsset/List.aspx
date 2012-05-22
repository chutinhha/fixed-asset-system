<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="List.aspx.cs" Inherits="FixedAsset.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <ul id="TabPage1">
        <li id="Tab1" title="能力管理">能力管理</li>
    </ul>
    <div id="cnt">
        <div id="dTab1" class="Box text_box">
            <p>
                能力名称
                <asp:TextBox class="text-input small-input" ID="txtABLITY_NAME" runat="server"></asp:TextBox>
                <asp:Button ID="btn_Show" class="button" runat="server" Text="查询" />
            </p>
            <br />
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
                        <a href='ViewDetail.aspx'>编辑</a>
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
                        <a href='ViewDetail.aspx'>编辑</a>
                    </td>
                </tr>
                <tr class="alt-row">
                    <td>
                        ZhangWei
                    </td>
                    <td>
                        张苇
                    </td>
                    <td>
                        激活
                    </td>
                    <td>
                        女
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td align="right">
                        <a href='ViewDetail.aspx'>编辑</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        QianYanHong
                    </td>
                    <td>
                        钱艳红
                    </td>
                    <td>
                        激活
                    </td>
                    <td>
                        女
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td align="right">
                        <a href='ViewDetail.aspx'>编辑</a>
                    </td>
                </tr>
                <tr class="alt-row">
                    <td>
                        ShenYiPing
                    </td>
                    <td>
                        沈依萍
                    </td>
                    <td>
                        激活
                    </td>
                    <td>
                        女
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td align="right">
                        <a href='ViewDetail.aspx'>编辑</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
