<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSelectedMultiAssets.ascx.cs"
    Inherits="FixedAsset.Web.Admin.UserControl.ucSelectedMultiAssets" %>
<asp:ImageButton ID="btnSelectedMultiAssets" ImageUrl="../../images/Button/PickUp.GIF"
    runat="server" CausesValidation="false" OnClick="btnSelectedMultiAssets_Click" />
<script type="text/javascript" language="javascript">
    function SelectedMultiAssets() {
        var returnValue = getCookie("dialogReturn_key");
        if (returnValue != null) {
            document.getElementById("<%=hfAssetIds.ClientID %>").value = returnValue;
            document.getElementById("<%=BtnRetrieveSelectedMultiAssets.ClientID %>").click();
            setCookie("dialogReturn_key", null);
        }
    }
</script>
<div style="display: none">
    <asp:HiddenField ID="hfAssetIds" runat="server" />
    <asp:Button ID="BtnRetrieveSelectedMultiAssets" CausesValidation="false" runat="server" Text=""
        OnClick="BtnRetrieveSelectedMultiAssets_Click" Width="0px" Height="0px" />
</div>
