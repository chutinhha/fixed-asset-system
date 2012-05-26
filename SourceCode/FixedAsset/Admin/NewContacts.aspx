<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="NewContacts.aspx.cs" Inherits="FixedAsset.Web.Admin.NewContacts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <script src="../Scripts/calendar.js" type="text/javascript"></script>
    <script type="text/javascript">
        function reset() {
            window.location.href = "NewContacts.aspx";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-box">
                <div class="content-box-header">
                    <h3 style="cursor: s-resize;">
                        <asp:Literal runat="server" ID="litTitle" Text="新增应用" />
                    </h3>
                </div>
                <div class="content-box-content">
                    <div class="tab-content default-tab">
                        <fieldset>
                            <table>
                                <tr>
                                    <td style="width: 180px;">
                                       合同编号:
                                    </td>
                                    <td>
                                        <asp:Label ID="litPsid" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        签订日期:<span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtContactscheduledate" class="text_inp" runat="server" Width="300"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtContactscheduledate"
                                            Display="Dynamic" ErrorMessage="请选择合同签订日期！"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td>
                                        供应商: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSuppliers" class="text_inp" runat="server" Width="300"></asp:TextBox>
                                        <asp:ImageButton ID="btnAppIdSelect" ImageUrl="../images/Button/PickUp.GIF" runat="server"
                                            OnClientClick="ShowTopDialogFrame('供应商选择', 'return_m2mApplication.aspx','AppIdSelect()',790,500);return false;" />
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td>
                                        创建日期: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtApplydate" class="text_inp" Width="150" onclick="new Calendar().show(this);"
                                            ReadOnly="true" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                                runat="server" ControlToValidate="txtApplydate" Display="Dynamic" ErrorMessage="请选择创建日期！"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div id="tag" class="thin blue">
                                            <ul id="tags">
                                                <li id="api" class="selectTag"><a href="#" onclick="tabChange('api','dapi','dflow','dquestion','dabilityRemark','MyFile')">
                                                    明细</a> </li>
                                            </ul>
                                            <p class="gap">
                                            </p>
                                        </div>
                                        <p class="c">
                                        </p>
                                        <div id="tagContent">
                                            <div id="MyFile" style="display: block;">
                                                <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                                                    align="center">
                                                    <asp:Repeater ID="rptProcureDetailList" runat="server">
                                                        <HeaderTemplate>
                                                            <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                                                                <td>
                                                                    设备类别
                                                                </td>
                                                                <td>
                                                                    设备名称
                                                                </td>
                                                                <td>
                                                                    设备数量
                                                                </td>
                                                                <td>
                                                                    单价
                                                                </td>
                                                               
                                                                <td>
                                                                    操作
                                                                </td>
                                                            </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td>
                                                                    <%#Eval("Assetcategoryid")%>
                                                                </td>
                                                                <td>
                                                                    <%#Eval("Assetname")%>
                                                                </td>
                                                                <td>
                                                                    <%#Eval("Plannumber")%>
                                                                </td>
                                                                <td>
                                                                    <%#Eval("Unitprice")%>
                                                                </td>
                                                                
                                                                <td align="right">
                                                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                                                        AlternateText="编辑" ToolTip="编辑" />
                                                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                                                        OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" />
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <AlternatingItemTemplate>
                                                            <tr class="alt-row">
                                                                <td>
                                                                    <%#Eval("Assetcategoryid")%>
                                                                </td>
                                                                <td>
                                                                    <%#Eval("Assetname")%>
                                                                </td>
                                                                 <td>
                                                                    <%#Eval("Plannumber")%>
                                                                </td>
                                                                <td>
                                                                    <%#Eval("Unitprice")%>
                                                                </td>
                                                              
                                                                <td align="right">
                                                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Button/edit.GIF"
                                                                        AlternateText="编辑" ToolTip="编辑" />
                                                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                                                        OnClientClick="return confirm('确认要删除吗？');" AlternateText="删除" ToolTip="删除" />
                                                                </td>
                                                            </tr>
                                                        </AlternatingItemTemplate>
                                                    </asp:Repeater>
                                                </table>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="text-align: center">
                                    <td colspan="2">
                                        <asp:Button ID="BtnSave" runat="server" Text="保 存" CssClass="button" ValidationGroup="Vaild"
                                            OnClick="BtnSave_Click" />
                                        <asp:Button ID="btnSubmit" runat="server" Text="确 定" CssClass="button" ValidationGroup="Vaild"
                                            OnClick="btnSubmit_Click" />
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
    </asp:UpdatePanel>
    <script type="text/javascript" language="javascript">
        function AppIdSelect() {
            var returnValue = getCookie("dialogReturn_key");
            if (returnValue != null) {
                document.getElementById("<%=txtSuppliers.ClientID %>").value = returnValue;
                setCookie("dialogReturn_key", null);
            }
        }
    </script>
</asp:Content>
