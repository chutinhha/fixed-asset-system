<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="Report_AssetIntall.aspx.cs" Inherits="FixedAsset.Web.Admin.Report_AssetIntall" %>

<%@ Register Src="~/Admin/UserControl/ucSelectProjectForTree.ascx" TagName="SelectStorageAddress"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content-box">
        <div class="content-box-header">
            <h3 style="cursor: s-resize;">
                <asp:Literal runat="server" ID="litTitle" Text="设备登记" /></h3>
        </div>
        <div class="content-box-content">
            <div class="tab-content default-tab">
                <div class="column-left" style="height: 300px; overflow-y: scroll;overflow-x: scroll; width: 28%;">
                    <b>分公司或项目体：</b>
                    <div class="listbox">
                        <uc1:SelectStorageAddress ID="ucSelectStorageAddress" runat="server" />
                    </div>
                </div>
                <div class="column-right">
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
