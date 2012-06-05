<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="Report_AssetStorageAddress.aspx.cs" Inherits="FixedAsset.Web.Admin.Report_AssetStorageAddress" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
  <ul id="TabPage1">
        <li id="Tab1" title="存放地点统计">存放地点统计</li>
    </ul>
    <div id="cnt">
        <div id="dTab1" class="Box text_box">
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center">
                <asp:Repeater ID="rptAssetsStorageCategoryList" runat="server">
                    <HeaderTemplate>
                        <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                            <td align="center">
                                存放地址大类
                            </td>
                            <td align="center">
                                存放地址小类
                            </td>
                             <td align="center">
                                资产数量
                            </td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td align="center">
                                <%#Eval("AssetStorageCategory")%>
                            </td>
                              <td align="center">
                                <%#Eval("AssetSubStorageCategory")%>
                            </td>
                            <td align="center">
                                <%#Eval("AssetCount") %>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="alt-row">
                          <td align="center">
                                <%#Eval("AssetStorageCategory")%>
                            </td>
                              <td align="center">
                                <%#Eval("AssetSubStorageCategory")%>
                            </td>
                            <td align="center">
                                <%#Eval("AssetCount") %>
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>

                  <tr>
                    <td>
                    </td>
                    <td  colspan="2" style="height: 30px; ">
                      <%--  <cc1:pagingcontrol ID="pcData" runat="server" MaxNavigatePageCount="7" 
                            OnPageIndexClick="pcData_PageIndexClick" />--%>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
