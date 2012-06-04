<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="Report_AssetState.aspx.cs" Inherits="FixedAsset.Web.Admin.Report_AssetState" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <ul id="TabPage1">
        <li id="Tab1" title="状态统计">状态统计</li>
    </ul>
    <div id="cnt">
        <div id="dTab1" class="Box text_box">
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center">
                <asp:Repeater ID="rptAssetsList" runat="server" 
                  >
                    <HeaderTemplate>
                        <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                            <td align="center">
                                设备状态
                            </td>
                            <td>
                               设备数量
                            </td>
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
                        <tr class="alt-row">
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
        </div>
    </div>
</asp:Content>
