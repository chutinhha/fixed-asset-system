<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSelectStorageAddress.ascx.cs"
    Inherits="FixedAsset.Web.Admin.UserControl.ucSelectStorageAddress" %>
<asp:TreeView ID="tvStorageAddress" runat="server" OnInit="tvAssets_Init" OnTreeNodeExpanded="tvAssets_TreeNodeExpanded"
    ShowLines="True" OnSelectedNodeChanged="tvAssets_SelectedNodeChanged" OnPreRender="tvAssets_PreRender">
    <SelectedNodeStyle Font-Bold="True" ForeColor="#9966FF" />
</asp:TreeView>
