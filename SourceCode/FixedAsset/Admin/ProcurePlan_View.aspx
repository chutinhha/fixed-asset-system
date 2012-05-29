<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="ProcurePlan_View.aspx.cs" Inherits="FixedAsset.Web.Admin.ProcurePlan_View" %>

<%@ Register Assembly="WebCalendar" Namespace="WebCalendar" TagPrefix="cc2" %>
<%@ Register Src="~/Admin/UserControl/ucSelectSubCompany.ascx" TagName="ucSelectSubCompany"
    TagPrefix="uc1" %>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <script src="../Scripts/calendar.js" type="text/javascript"></script>
    <script type="text/javascript">
        function reset() {
            window.location.href = '<%=ResolveUrl("~/Admin/ProcurePlanList.aspx") %>';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
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
                                <tr style="text-align: center">
                                    <td colspan="2">
                                        <%--<asp:Button ID="BtnNewContract" runat="server" Text="生成合同" CssClass="button" 
                                            OnClick="BtnNewContract_Click" Visible="false" />--%>
                                        <input type="button" class="button" runat="server" id="Button2" value="返 回" onclick="javascript:reset();" />
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
