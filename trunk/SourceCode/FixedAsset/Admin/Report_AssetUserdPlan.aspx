<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="Report_AssetUserdPlan.aspx.cs" Inherits="FixedAsset.Web.Admin.Report_AssetUserdPlan" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Register Src="~/Admin/UserControl/ucSelectProjectForTree2.ascx" TagName="SelectStorageAddress"
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
    <div class="content-box" style="padding: 0 0 0 0; margin: 0 0 0 0;">
        <div class="content-box-header">
            <h3 style="cursor: s-resize;">
                <asp:Literal runat="server" ID="litTitle" Text="计划汇总" /></h3>
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
                    <div id="monthPlanContent" style="display: none;">
                        <asp:Literal ID="litMonthlyContent" runat="server"></asp:Literal>
                         <asp:Literal ID="litMonthlyBody" runat="server"></asp:Literal>
                        <div class="clear">
                        </div>
                    </div>
                    <div id="weeklyPlanContent" style="display: none;">
                        <asp:Literal ID="litWeeklyContent" runat="server"></asp:Literal>
                        <asp:Literal ID="litWeeklyBody" runat="server"></asp:Literal>
                        <div class="clear">
                        </div>
                    </div>                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>
