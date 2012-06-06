<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="ReplyInstall.aspx.cs" Inherits="FixedAsset.Web.Admin.ReplyInstall" %>

<%@ Register TagPrefix="uc1" TagName="ucSelectSubCompany" Src="~/Admin/UserControl/ucSelectSubCompany.ascx" %>
<%@ Register TagPrefix="uc1" TagName="DatePicker_1_1" Src="~/Admin/UserControl/ucDatePicker.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-box">
                <div class="content-box-header">
                    <h3 style="cursor: s-resize;">
                        <asp:Literal runat="server" ID="litTitle" Text="计划查看" />
                    </h3>
                </div>
                <div class="content-box-content">
                    <div class="tab-content default-tab">
                        <fieldset>
                            <table style="width: 80%;">
                                <tr>
                                    <td style="width: 180px;">
                                        单号:
                                    </td>
                                    <td>
                                        <asp:Label ID="litPsid" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        计划采购日期:
                                    </td>
                                    <td>
                                        <asp:Label ID="litProcurementscheduledate" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        采购事由:
                                    </td>
                                    <td style="word-wrap: break-word; overflow: hidden; width: 680px;">
                                        <asp:Label ID="litReason" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        分公司: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <uc1:ucSelectSubCompany ID="ucSubCompany" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        申请人:
                                    </td>
                                    <td>
                                        <asp:Label ID="litApplyuser" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        申请日期:
                                    </td>
                                    <td>
                                        <asp:Label ID="litApplydate" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        审核人:
                                    </td>
                                    <td>
                                        <asp:Label ID="litApproveuser" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        审核日期:
                                    </td>
                                    <td>
                                        <asp:Label ID="litApprovedate" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        审批结果:
                                    </td>
                                    <td>
                                        <asp:Label ID="litApproveresult" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        审批意见:
                                    </td>
                                    <td style="word-wrap: break-word; overflow: hidden; width: 680px;">
                                        <asp:Label ID="litRejectreason" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        创建日期:
                                    </td>
                                    <td>
                                        <asp:Label ID="litCreateddate" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div id="tag" class="thin blue">
                                            <ul id="tags">
                                                <li id="api" class="selectTag"><a href="#">设备明细</a> </li>
                                            </ul>
                                            <p class="gap">
                                            </p>
                                        </div>
                                        <p class="c">
                                        </p>
                                        <div id="tagContent">
                                            <div id="MyFile" style="display: block;">
                                                <table style="width: 100%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                                                    align="center" class="table_grayTH eoddTable">
                                                    <asp:Repeater ID="rptProcureDetailList" OnItemDataBound="rptProcureDetailList_ItemDataBound"
                                                        OnItemCommand="rptProcureDetailList_ItemCommand" runat="server">
                                                        <HeaderTemplate>
                                                            <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                                                                <td>
                                                                    设备类别
                                                                </td>
                                                                <td>
                                                                    设备名称
                                                                </td>
                                                                <td>
                                                                    设备规格
                                                                </td>
                                                                <td>
                                                                    单价
                                                                </td>
                                                                <td>
                                                                    计划采购数量
                                                                </td>
                                                            </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td>
                                                                    <%#Eval("CategoryAllPathName")%>
                                                                </td>
                                                                <td>
                                                                    <%#Eval("Assetname")%>
                                                                </td>
                                                                <td>
                                                                    <%#Eval("Assetspecification")%>
                                                                </td>
                                                                <td>
                                                                    <%#Eval("Unitprice")%>
                                                                </td>
                                                                <td>
                                                                    <%#Eval("Plannumber")%>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <AlternatingItemTemplate>
                                                            <tr class="alt-row">
                                                                <td>
                                                                    <%#Eval("CategoryAllPathName")%>
                                                                </td>
                                                                <td>
                                                                    <%#Eval("Assetname")%>
                                                                </td>
                                                                <td>
                                                                    <%#Eval("Assetspecification")%>
                                                                </td>
                                                                <td>
                                                                    <%#Eval("Unitprice")%>
                                                                </td>
                                                                <td>
                                                                    <%#Eval("Plannumber")%>
                                                                </td>
                                                            </tr>
                                                        </AlternatingItemTemplate>
                                                    </asp:Repeater>
                                                </table>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr id="trPlanInstalldate" runat="server">
                                    <td>
                                        计划安装日期:<span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <uc1:DatePicker_1 ID="ucPlanSetupDate" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_ucPlanSetupDate" ValidationGroup="Reply"
                                            runat="server" ControlToValidate="ucPlanSetupDate" Display="Dynamic" ErrorMessage="请选择设备计划安装日期！"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        实际安装日期: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <uc1:DatePicker_1_1 ID="ucActualSetupDate1" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_ucActualSetupDate" runat="server"
                                            ValidationGroup="Confirm" ControlToValidate="ucActualSetupDate" Display="Dynamic"
                                            ErrorMessage="请选择设备实际安装日期！"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        已安装明细: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtInstallDetail" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="text-align: center">
                                    <td colspan="2">
                                        <asp:Button ID="btnReplay" runat="server" Text="回 复" CssClass="button" ValidationGroup="Reply" />
                                        <asp:Button ID="btnConfirm" runat="server" Text="确 认" CssClass="button" ValidationGroup="Confirm" />
                                        <asp:Button ID="btnCancel" runat="server" Text="取 消" CssClass="button" CausesValidation="false"
                                            OnClientClick="javascript:window.location.href = 'InstallList.aspx';" />
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
