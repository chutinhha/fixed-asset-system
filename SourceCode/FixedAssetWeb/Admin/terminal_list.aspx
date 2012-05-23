<%@ Page Title="终端维护" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="terminal_list.aspx.cs" Inherits="Admin_terminal_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function add() {
            window.location.href = "terminal_add.aspx";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <ul id="TabPage1" style="width: 100%">
        <li id="Tab1" title="终端维护">终端维护</li>
    </ul>
    <div id="cnt">
        <div id="dTab1" class="Box text_box">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        终端编号ID
                    </td>
                    <td>
                        <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        终端名称
                    </td>
                    <td>
                        <asp:TextBox ID="txtTerminalName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        终端状态
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTerminalState" runat="server">
                            <asp:ListItem Selected="True">--全部--</asp:ListItem>
                            <asp:ListItem Value="0">在线</asp:ListItem>
                            <asp:ListItem Value="1">离线</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        终端使用状态
                    </td>
                    <td>
                        <asp:DropDownList ID="dllTerminalUseState" runat="server">
                            <asp:ListItem Selected="True">--全部--</asp:ListItem>
                            <asp:ListItem Value="0">占用</asp:ListItem>
                            <asp:ListItem Value="1">空闲</asp:ListItem>
                            <asp:ListItem Value="2">维护中</asp:ListItem>
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
                <tr>
                    <td colspan="4">
                        <div style="padding-top: 5px">
                            <asp:DataList ID="dltTerminalList" RepeatColumns="1" RepeatDirection="Horizontal"
                                runat="server" OnItemCommand="dltTerminalList_ItemCommand" OnItemDataBound="dltTerminalList_ItemDataBound">
                                <ItemTemplate>
                                    <table width="98%" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td style="width: 60px" rowspan="5">
                                                <img alt="" height="60" width="60" border="0" src='<%# ResolveUrl(Eval("TERMINAL_IMG") != DBNull.Value ? Eval("TERMINAL_IMG").ToString() : "~/img/no_img.png" )  %>' />
                                            </td>
                                            <td style="width: 220px">
                                                编号:
                                                <%#Eval("ID")%>
                                            </td>
                                            <td style="width: 220px">
                                                M2M终端ID：
                                                <%#Eval("M2M_ID")%>
                                            </td>
                                            <td style="width: 220px">
                                                名称：<%#Eval("TERMINAL_NAME")%>
                                            </td>
                                            <td style="width: 220px">
                                                <span style="margin-left: 10px">
                                                    <asp:ImageButton ID="btnDelete" ImageUrl="../images/Button/delete.GIF" OnClientClick="return confirm('确定需要删除吗？');"
                                                        CommandName="Remove" ToolTip="删除" CommandArgument='<%#Eval("ID") %>' runat="server">
                                                    </asp:ImageButton><asp:ImageButton ID="btnEdit" ImageUrl="../images/Button/edit.GIF"
                                                        Style="margin-left: 10px" CommandName="Modify" ToolTip="编辑" CommandArgument='<%#Eval("ID") %>'
                                                        runat="server"></asp:ImageButton><asp:ImageButton ID="btnUp" ImageUrl="../images/Button/up.GIF"
                                                            Style="margin-left: 10px" CommandName="Up" ToolTip="上架" CommandArgument='<%#Eval("ID") %>'
                                                            runat="server"></asp:ImageButton><asp:ImageButton ID="btnDown" ImageUrl="../images/Button/down.GIF"
                                                                Style="margin-left: 10px" CommandName="Down" ToolTip="下架" CommandArgument='<%#Eval("ID") %>'
                                                                runat="server"></asp:ImageButton><asp:ImageButton ID="btnUpgrade" ImageUrl="../images/Button/starttask.gif"
                                                                    ToolTip="更新" Style="margin-left: 10px" CommandName="Upgrade" CommandArgument='<%#Eval("ID") %>'
                                                                    runat="server"></asp:ImageButton></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                终端状态：
                                                <%# CommonHelper.GetTerminalState(int.Parse(Eval("TERMINAL_STATE").ToString()))%>
                                            </td>
                                            <td>
                                                终端使用状态：
                                                <%# CommonHelper.GetTerminalUseState(int.Parse(Eval("TERMINAL_USE_STATE").ToString()))%>
                                            </td>
                                            <td>
                                                终端上架时间：
                                                <%#Eval("TERMINAL_UPDATE") != DBNull.Value ? Convert.ToDateTime(Eval("TERMINAL_UPDATE")).ToString("yyyy-MM-dd HH:mm:ss") : ""%>
                                            </td>
                                            <td>
                                                MDMP协议版本号：
                                                <%#Eval("MDMP_VERSION")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                终端下架时间：
                                                <%#Eval("TERMINAL_DOWNDATE") != DBNull.Value ? Convert.ToDateTime(Eval("TERMINAL_DOWNDATE")).ToString("yyyy-MM-dd HH:mm:ss") : ""%>
                                            </td>
                                            <td>
                                                终端绑定应用ID：
                                                <%#Eval("TERMINAL_APPID")%>
                                            </td>
                                            <td>                                                
                                                状态：<%#Convert.ToInt16(Eval("STATE")) == 0 ? "有效" : "失效"%>
                                            </td>
                                            <td>
                                                生效时间：
                                                <%#Eval("EFF_DATE") != null ? Convert.ToDateTime(Eval("EFF_DATE")).ToString("yyyy-MM-dd") : ""%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                失效时间：
                                                <%#Eval("EXP_DATE") != null ? Convert.ToDateTime(Eval("EXP_DATE")).ToString("yyyy-MM-dd") : ""%>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Height="100px"></ItemStyle>
                                <AlternatingItemStyle BackColor="LightGray" Height="100px"></AlternatingItemStyle>
                            </asp:DataList>
                            <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="4" OnPageIndexClick="pcData_PageIndexClick" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
