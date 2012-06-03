<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSelectProject.ascx.cs" Inherits="FixedAsset.Web.Admin.UserControl.ucSelectProject" %>
<asp:Literal ID="litStorage" runat="server"/>
<asp:ImageButton ID="btnSelectStorageAddress" ImageUrl="../../images/Button/PickUp.GIF" runat="server" CausesValidation="false" OnClick="btnSelectStorageAddress_Click" />
<script type="text/javascript" language="javascript">
    function SelectStorageAddress() {
        var returnValue = getCookie("dialogReturn_key");
        if (returnValue != null) {
            document.getElementById("<%=hfStorageAddress.ClientID %>").value = returnValue;
            document.getElementById("<%=BtnRetrieveStorageAddress.ClientID %>").click();
            setCookie("dialogReturn_key", null);
        }
    }
</script>
<div style="display: none">
    <asp:HiddenField ID="hfStorageAddress" runat="server" />
    <asp:Button ID="BtnRetrieveStorageAddress" CausesValidation="false" runat="server" Text="" OnClick="BtnRetrieveStorageAddress_Click"
        Width="0px" Height="0px" />
</div>

