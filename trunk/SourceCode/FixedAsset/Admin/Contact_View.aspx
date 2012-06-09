<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="Contact_View.aspx.cs" Inherits="FixedAsset.Web.Admin.ContactDetail_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content-box">
        <div class="content-box-header">
            <h3 style="cursor: s-resize;">
                <asp:Literal runat="server" ID="litTitle" Text="合同明细查看" />
            </h3>
        </div>
        <div class="content-box-content">
            <div class="tab-content default-tab">
                <fieldset>
                    <table style="width: 80%;">
                        <tr>
                            <td style="width: 120px;">
                                合同编号:
                            </td>
                            <td>
                                <asp:Label ID="litPsid" class="text_inp" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                签订日期:
                            </td>
                            <td>
                                <asp:Label ID="litContactscheduledate" class="text_inp" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                分公司:
                            </td>
                            <td>
                                <asp:Label ID="lblSubCompany" class="text_inp" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                供应商:
                            </td>
                            <td>
                                <asp:Label ID="lblSelectSupplier" class="text_inp" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                创建日期:
                            </td>
                            <td>
                                <asp:Label ID="lblApplydate" class="text_inp" runat="server" />
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
                                        <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                                            align="center">
                                            <asp:Repeater ID="rptContactDetailList" runat="server" OnItemDataBound="rptContactDetailList_ItemDataBound"
                                                OnItemCommand="rptContactDetailList_ItemCommand">
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
                                                            采购数量
                                                        </td>
                                                        <td>
                                                            单价
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
                                                            <%#Eval("Procurenumber")%>
                                                        </td>
                                                        <td align="right">
                                                            <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
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
                                                            <%#Eval("Procurenumber")%>
                                                        </td>
                                                        <td align="right">
                                                            <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
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
                            <tr style="text-align: center">
                                <td colspan="2">
                                    <input type="button" class="button" runat="server" id="Button2" value="返 回" onclick="javascript:window.location.href = 'ContractList.aspx';" />
                                </td>
                            </tr>
                        </tr>
                    </table>
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>
