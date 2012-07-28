﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="AssetUsedPlan.aspx.cs" Inherits="FixedAsset.Web.Admin.AssetUsedPlan" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Register Src="~/Admin/UserControl/ucSelectProjectForTree.ascx" TagName="SelectStorageAddress"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link href="css/mail.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content-box">
        <div class="content-box-header">
            <h3 style="cursor: s-resize;">
                <asp:Literal runat="server" ID="litTitle" Text="用工计划" /></h3>
        </div>
        <div class="content-box-content">
            <div class="tab-content default-tab">
                <div class="column-left" style="height: 300px; overflow-y: scroll; overflow-x: scroll;
                    width: 20%;">
                    <b>分公司或项目体：</b>
                    <div class="listbox">
                        <uc1:SelectStorageAddress ID="ucSelectStorageAddress" runat="server" OnSelectedStorageNodeChange="ucSelectStorageAddress_SelectedStorageNodeChange" />
                    </div>
                </div>
                <div class="column-right" style="width: 79%;">
                    <asp:Repeater ID="rptAssetUsedPlan" runat="server">
                        <HeaderTemplate>
                            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                                align="center" class="gridtable">
                                <tr class="thbg" style="padding: 0 0 0 0">
                                    <th align="left" style="width: 20%">
                                        系统
                                    </th>
                                    <th align="left" style="width: 40%">
                                        设备
                                    </th>
                                    <th align="left" style="width: 20%">
                                        计划数量
                                    </th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td style="width: 20%" align="left" runat="server" id="tdAssetparentcategoryname">
                                    <%#Eval("Assetparentcategoryname")%>
                                </td>
                                <td align="left" style="width: 40%">
                                    <%#Eval("Assetsubcategoryname")%>
                                </td>
                                <td align="left" style="width: 20%">
                                    <asp:TextBox Width="100px" ID="txtPlanCount" runat="server" Text='<%#Eval("AssetCount") %>'></asp:TextBox>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr>
                                <td style="width: 20%" align="left" runat="server" id="tdAssetparentcategoryname">
                                    <%#Eval("Assetparentcategoryname")%>
                                </td>
                                <td style="width: 40%" align="left">
                                    <%#Eval("Assetsubcategoryname")%>
                                </td>
                                <td align="left" style="width: 20%">
                                    <asp:TextBox Width="100px" ID="txtPlanCount" runat="server" Text='<%#Eval("AssetCount") %>'></asp:TextBox>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>