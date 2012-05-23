<%@ Page Title="介绍维护" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="terminalintroduce_list.aspx.cs" Inherits="Admin_terminalintroduce_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function add() {
            window.location.href = "terminalintroduce_add.aspx";
        }
        function edit(terminalId) {
            window.location.href = "terminalintroduce_edit.aspx?TerminalId=" + terminalId;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <ul id="TabPage1" style="width: 100%">
        <li id="Tab1" title="介绍维护">介绍维护</li>
    </ul>
    <div id="cnt">
        <div id="dTab1" class="Box text_box">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        终端名称
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="txtTerminalName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        终端厂家
                    </td>
                    <td>
                        <asp:TextBox ID="txtTerminalCompany" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        是否通过电信测试
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTestFlag" runat="server">
                            <asp:ListItem Selected="True">--全部--</asp:ListItem>
                            <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="right">
                        <asp:Button ID="txtSearch" class="button" runat="server" Text="查询" OnClick="btnSearch_Click">
                        </asp:Button>
                        <input type="button" class="button" style="margin-left: 10px" id="btn_create" value="新增"
                            onclick="add()" />
                    </td>
                </tr>
            </table>
            <span border="1" style="padding-top: 5px; border: 1 solid green">
                <asp:DataList ID="dltTerminalList" RepeatColumns="1" RepeatDirection="Horizontal"
                    runat="server" OnItemCommand="dltTerminalList_ItemCommand">
                    <ItemTemplate>
                        <table style="margin-top: 10px; width: 100%; table-layout: fixed">
                            <tr>
                                <td style="width: 60px" rowspan="5">
                                    <img alt="" height="60" width="60" border="0" src='<%# ResolveUrl(Eval("TERMINAL_IMAGE") != DBNull.Value ? Eval("TERMINAL_IMAGE").ToString() : "~/img/no_img.png" )  %>' />
                                </td>
                                <%-- <td style="width: 80px">
                                    编号:
                                    <%#Eval("TERMINAL_ID")%>
                                </td>--%>
                                <td style="width: 80px">
                                    名称：
                                    <%#Eval("TERMINAL_NAME")%>
                                </td>
                                <td>
                                    通过电信测试：
                                    <%# Convert.ToInt16(Eval("TEST_FLG")) == 1 ? "是" : "否"%>
                                </td>
                                <td>
                                    <span style="margin-left: 10px">
                                        <asp:ImageButton ID="btnDelete" ImageUrl="../images/Button/delete.GIF" OnClientClick="return confirm('确定需要删除吗？');"
                                            CommandName="Remove" CommandArgument='<%#Eval("TERMINAL_ID") %>' runat="server">
                                        </asp:ImageButton><asp:ImageButton ID="btnEdit" ImageUrl="../images/Button/edit.GIF"
                                            Style="margin-left: 10px" CommandName="Modify" CommandArgument='<%#Eval("TERMINAL_ID") %>'
                                            runat="server"></asp:ImageButton></span>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 80px">
                                    简要介绍:
                                </td>
                                <td colspan="4">
                                    <%#Eval("SIMPLE_INTRODUCE").ToString()%>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 80px">
                                    详细介绍:
                                </td>
                                <td colspan="4">
                                    <asp:Label runat="server" Visible='<%#Eval("DETAIL_INTRODUCE") != DBNull.Value %>'
                                        ID="lblShow">
                            <a  href="<%#Eval("DETAIL_INTRODUCE") != DBNull.Value ? ResolveUrl(Eval("DETAIL_INTRODUCE").ToString()) : "#" %>">
                                文档下载</a></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <ItemStyle VerticalAlign="Top" Height="100px"></ItemStyle>
                    <AlternatingItemStyle BackColor="LightGray" Height="100px"></AlternatingItemStyle>
                </asp:DataList>
            </span>
        </div>
    </div>
</asp:Content>
