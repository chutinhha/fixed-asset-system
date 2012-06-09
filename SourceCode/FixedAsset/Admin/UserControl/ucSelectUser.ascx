<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSelectUser.ascx.cs"
    Inherits="FixedAsset.Web.Admin.UserControl.ucSelectUser" %>
<asp:TextBox ID="txtUsername" MaxLength="100" CssClass="text_inp" runat="server"
    Width="300" />
<asp:Literal ID="litUserName" runat="server" Visible="false"/>
<asp:ImageButton ID="btnSelectSingleUser" ImageUrl="../../images/Button/PickUp.GIF"
    runat="server" CausesValidation="false" />
<div style="display: none">
    <asp:HiddenField ID="hfId" runat="server" />
    <asp:Button ID="BtnRetrieveUser" CausesValidation="false" runat="server" Text=""
        OnClick="BtnRetrieveUser_Click" Width="0px" Height="0px" />
</div>
