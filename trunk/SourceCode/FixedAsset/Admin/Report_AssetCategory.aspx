<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="Report_AssetCategory.aspx.cs" Inherits="FixedAsset.Web.Admin.Report_AssetCategory" %>

<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/mail.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content-box">
        <div class="content-box-header">
            <h3 style="cursor: s-resize;">
                资产类别统计
            </h3>
        </div>
        <div class="content-box-content">
            <div class="tab-content default-tab">
                <fieldset>
                    <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                        align="center"  class="gridtable">
                        <asp:Repeater ID="rptAssetsCategoryList" runat="server">
                            <HeaderTemplate>
                                <tr class="thbg" style="padding:0 0 0 0">
                                    <th align="left">
                                        资产大类
                                    </th>
                                    <th align="left">
                                        资产小类
                                    </th>
                                    <th align="center">
                                        资产数量
                                    </th>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td align="left">
                                        <%#Eval("AssetCategory")%>
                                    </td>
                                    <td align="left">
                                        <%#Eval("AssetSubCategory")%>
                                    </td>
                                    <td align="center">
                                        <%#Eval("AssetCount") %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr class="even">
                                    <td align="left">
                                        <%#Eval("AssetCategory")%>
                                    </td>
                                    <td align="left">
                                        <%#Eval("AssetSubCategory")%>
                                    </td>
                                    <td align="center">
                                        <%#Eval("AssetCount") %>
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
