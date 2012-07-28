<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="Report_AssetRepair.aspx.cs" Inherits="FixedAsset.Web.Admin.Report_AssetRepair" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Register Src="~/Admin/UserControl/ucSelectProjectForTree2.ascx" TagName="SelectStorageAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/Admin/UserControl/ucDatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link href="css/mail.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content-box">
        <div class="content-box-header">
            <h3 style="cursor: s-resize;">
                <asp:Literal runat="server" ID="litTitle" Text="维修台账" /></h3>
        </div>
        <div class="content-box-content">
            <div class="tab-content default-tab">
                <div class="column-left" style="height: 350px; overflow-y: scroll; overflow-x: scroll;
                    width: 20%;">
                    <b>分公司或项目体：</b>
                    <div class="listbox">
                        <uc1:SelectStorageAddress ID="ucSelectStorageAddress" runat="server" OnSelectedStorageNodeChange="ucSelectStorageAddress_SelectedStorageNodeChange" />
                    </div>
                </div>
                <div class="column-right" style="width: 79%;">
                    <p>
                        实际完成日期
                        <uc1:DatePicker ID="ucStartDate" runat="server" />
                        ~
                        <uc1:DatePicker ID="ucEndDate" runat="server" />
                        <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="查询" OnClick="BtnSearch_Click" />
                    </p>
                    <asp:Literal ID="litContent" runat="server"></asp:Literal>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
