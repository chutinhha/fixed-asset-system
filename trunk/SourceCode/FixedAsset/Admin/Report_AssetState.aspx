<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="Report_AssetState.aspx.cs" Inherits="FixedAsset.Web.Admin.Report_AssetState" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/mail.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content-box">
        <div class="content-box-header">
            <h3 style="cursor: s-resize;">
                设备状态统计
            </h3>
        </div>
        <div class="content-box-content">
            <div class="tab-content default-tab">
                <fieldset>
                    <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                        align="center" class="gridtable">
                        <asp:Repeater ID="rptAssetsList" runat="server">
                            <HeaderTemplate>
                                <tr class="thbg" style="padding:0 0 0 0">
                                    <th align="center">
                                        设备状态
                                    </th>
                                    <th>
                                        设备数量
                                    </th>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td align="center">
                                        <%#Eval("State")%>
                                    </td>
                                    <td>
                                        <%#Eval("AssetCount") %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr  class="even">
                                    <td align="center">
                                        <%#Eval("State")%>
                                    </td>
                                    <td>
                                        <%#Eval("AssetCount")%>
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                        </asp:Repeater>
                    </table>
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>
