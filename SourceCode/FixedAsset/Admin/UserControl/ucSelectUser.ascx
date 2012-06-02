<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSelectUser.ascx.cs"
    Inherits="FixedAsset.Web.Admin.UserControl.ucSelectUser" %>
<asp:TextBox ID="txtUsername"  MaxLength="100" CssClass="text_inp" runat="server" Width="300" />
<asp:ImageButton ID="btnSelectSingleUser" ImageUrl="../../images/Button/PickUp.GIF"
    runat="server" CausesValidation="false" OnClientClick="javascript:ShowTopDialogFrame('用户选择', 'SelectSingleUsers.aspx','SelectSingleUser()',680,400);" />
<script type="text/javascript" language="javascript">
    function SelectSingleUser() {
        var returnValue = getCookie("dialogReturn_key");
        if (returnValue != null) {
            document.getElementById("<%=hfId.ClientID %>").value = returnValue;
            document.getElementById("<%=BtnRetrieveUser.ClientID %>").click();
            setCookie("dialogReturn_key", null);
        }
    }
</script>
<div style="display: none">
    <asp:HiddenField ID="hfId" runat="server" />
    <asp:Button ID="BtnRetrieveUser" CausesValidation="false" runat="server" Text=""
        OnClick="BtnRetrieveUser_Click" Width="0px" Height="0px" />
</div>
