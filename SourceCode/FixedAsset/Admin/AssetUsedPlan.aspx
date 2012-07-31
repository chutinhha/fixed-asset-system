<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="AssetUsedPlan.aspx.cs" Inherits="FixedAsset.Web.Admin.AssetUsedPlan" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Register Src="~/Admin/UserControl/ucSelectProjectForTree.ascx" TagName="SelectStorageAddress"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link href="css/mail.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        function tabChange(tabId, currentContentId, otherContent1) {
            var obj = document.getElementById(tabId);
            var arrayli = document.getElementById("tags").getElementsByTagName("li"); //获取ul数组
            for (i = 0; i < arrayli.length; i++) {
                if (arrayli[i] == obj) {
                    arrayli[i].className = "selectTag";
                }
                else {
                    arrayli[i].className = "";
                }
            }
            document.getElementById(currentContentId).style.display = "";
            document.getElementById(otherContent1).style.display = "none";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content-box" style="padding:0 0 0 0; margin:0 0 0 0;">
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
                    <div id="tag" class="thin blue">
                        <ul id="tags">
                            <li id="weeklyPlan"><a href="javascript:tabChange('weeklyPlan','weeklyPlanContent','monthPlanContent')">
                                周计划</a> </li>
                            <li id="monthPlan" class="selectTag"><a href="#" onclick="javascript:tabChange('monthPlan','monthPlanContent','weeklyPlanContent')">
                                月计划</a> </li>
                        </ul>
                        <p class="gap">
                        </p>
                    </div>
                    <div id="monthPlanContent" style="display: block;">
                        <asp:Literal ID="litMonthlyContent" runat="server"></asp:Literal>
                        <table style="width: 100%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                            align="center" class="gridtable">
                            <asp:Repeater ID="rptMonthlyData" runat="server">
                                <HeaderTemplate>
                                    <tr class="thbg" style="padding: 0 0 0 0">
                                        <th align="left" style="width: 20%">
                                            系统
                                        </th>
                                        <th align="left" style="width: 60%">
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
                                        <td align="left" style="width: 60%">
                                            <%#Eval("Assetsubcategoryname")%>
                                        </td>
                                        <td align="left" style="width: 20%">
                                            <asp:HiddenField ID="hfPlanid" runat="server" Value='<%#Eval("Planid") %>' />
                                            <asp:HiddenField ID="hfAssetcategoryid" runat="server" Value='<%#Eval("Assetcategoryid") %>' />
                                            <asp:TextBox Width="100px" ID="txtPlanCount" runat="server" Text='<%#Eval("AssetCount") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tr>
                                        <td style="width: 20%" align="left" runat="server" id="tdAssetparentcategoryname">
                                            <%#Eval("Assetparentcategoryname")%>
                                        </td>
                                        <td style="width: 60%" align="left">
                                            <%#Eval("Assetsubcategoryname")%>
                                        </td>
                                        <td align="left" style="width: 20%">
                                            <asp:HiddenField ID="hfPlanid" runat="server" Value='<%#Eval("Planid") %>' />
                                            <asp:HiddenField ID="hfAssetcategoryid" runat="server" Value='<%#Eval("Assetcategoryid") %>' />
                                            <asp:TextBox Width="100px" ID="txtPlanCount" runat="server" Text='<%#Eval("AssetCount") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>
                        </table>
                        <div class="clear">
                        </div>
                    </div>
                    <div id="weeklyPlanContent" style="display: block;">
                        <asp:Literal ID="litWeeklyContent" runat="server"></asp:Literal>
                        <table style="width: 100%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                            align="center" class="gridtable">
                            <asp:Repeater ID="rptWeeklyData" runat="server">
                                <HeaderTemplate>
                                    <tr class="thbg" style="padding: 0 0 0 0">
                                        <th align="left" style="width: 20%">
                                            系统
                                        </th>
                                        <th align="left" style="width: 60%">
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
                                        <td align="left" style="width: 60%">
                                            <%#Eval("Assetsubcategoryname")%>
                                        </td>
                                        <td align="left" style="width: 20%">
                                            <asp:HiddenField ID="hfPlanid" runat="server" Value='<%#Eval("Planid") %>' />
                                            <asp:HiddenField ID="hfAssetcategoryid" runat="server" Value='<%#Eval("Assetcategoryid") %>' />
                                            <asp:TextBox Width="100px" ID="txtPlanCount" runat="server" Text='<%#Eval("AssetCount") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tr>
                                        <td style="width: 20%" align="left" runat="server" id="tdAssetparentcategoryname">
                                            <%#Eval("Assetparentcategoryname")%>
                                        </td>
                                        <td style="width: 60%" align="left">
                                            <%#Eval("Assetsubcategoryname")%>
                                        </td>
                                        <td align="left" style="width: 20%">
                                            <asp:HiddenField ID="hfPlanid" runat="server" Value='<%#Eval("Planid") %>' />
                                            <asp:HiddenField ID="hfAssetcategoryid" runat="server" Value='<%#Eval("Assetcategoryid") %>' />
                                            <asp:TextBox Width="100px" ID="txtPlanCount" runat="server" Text='<%#Eval("AssetCount") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>
                        </table>
                        <div class="clear">
                        </div>
                    </div>
                    <div style="text-align:center">
                      <asp:Button ID="BtnSave" runat="server" Text="保存" CssClass="button" OnClick="BtnSave_Click" />
                    </div>
                  
                </div>
            </div>
        </div>
    </div>
</asp:Content>
