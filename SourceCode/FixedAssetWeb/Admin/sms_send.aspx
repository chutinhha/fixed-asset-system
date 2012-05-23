<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="sms_send.aspx.cs" Inherits="Admin_sms_send" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function getSelectAll(obj1, obj2) {

        }
        function checkSelect(obj) {
            var cArray = document.getElementsByTagName("input");
            var i;
            for (i = 0; i < cArray.length; i++) {
                if (cArray[i].type == 'checkbox') {
                    if (obj.id = 'checkbox2' && obj.checked) {
                        cArray[i].checked = true;
                    }
                    else {
                        cArray[i].checked = false;
                    }

                }

            }
        }
        function SelectCheck() {
            var cArray = document.getElementsByTagName("input");
            var i;
            var bool = false;
            for (i = 0; i < cArray.length; i++) {
                if (cArray[i].type == 'checkbox') {
                    if (cArray[i].checked) {
                        bool = true;
                    }
                }
            }
            if (!bool) {
                alert("请选择消息");
                return false;
            }
            else
                return true;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="box_2 clear">
        <h2>
            <img src="img/email.gif" width="32" height="32" />已发消息</h2>
        <div class="text_login">
            <div class="titBar">
                <h2 class="fl">
                    <img width="25" height="23" src="images/icon_14.gif">已发消息</h2>
                <span class="fl"><a target="_parent" href="#"></a><span class="red"></span></span>
                <span class="fr"><span class="login_but3"><a href="sms_add.aspx">写新信</a></span></span>
            </div>
            <div class="search_barMsg">
                <div class="inner">
                    主题搜索:<asp:TextBox ID="keywords" CssClass="inp_01" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" CssClass="btn_gray" runat="server" 
                        Text="搜索" />
                </div>
            </div>
            <div class="btn_row">
                <asp:Button ID="Button4" CssClass="btn_gray hover_ored" runat="server" Text="删除"
                    OnClick="Button4_Click" OnClientClick="javascript:if(!SelectCheck())return false;" />
            </div>
            <div class="section">
                <asp:Repeater ID="gvMessage" runat="server">
                    <HeaderTemplate>
                        <table class="table_grayTH eoddTable" cellspacing="0" cellpadding="0" border="0"
                            width="100%">
                            <tr style="background-color: transparent;">
                                <th width="30px">
                                    <input id="checkbox2" type="checkbox" onclick="checkSelect(this);" runat="server"
                                        name="checkbox2">
                                </th>
                                <th style="padding: 0; width: 20px;">
                                    &nbsp;
                                </th>
                                <th style="text-align: left;">
                                    发件人
                                </th>
                                <th style="text-align: left;">
                                    主题
                                </th>
                                <th width="130">
                                    时间
                                </th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="txtCenter">
                                <input id="checkbox" class="js_checkbox" type="checkbox" runat="server" value='<%# DataBinder.Eval(Container.DataItem, "id")%>'
                                    name="checkbox">
                            </td>
                            <td style="padding: 0; width: 20px;">
                                <img align="middle" hspace="8" src="img/mail_icon.gif">
                            </td>
                            <td>
                                <%# DataBinder.Eval(Container.DataItem, "FROM_USER")%>
                            </td>
                            <td>
                                <a class="cGreen" href="sms_context_list.aspx?messageid=<%# DataBinder.Eval(Container.DataItem, "id")%>">
                                    <%# DataBinder.Eval(Container.DataItem, "message_title")%></a>
                            </td>
                            <td class="txtCenter">
                                <%# DataBinder.Eval(Container.DataItem, "create_date")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <div class="pageBar">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
