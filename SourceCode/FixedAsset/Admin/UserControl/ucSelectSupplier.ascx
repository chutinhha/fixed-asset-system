<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSelectSupplier.ascx.cs" Inherits="FixedAsset.Web.Admin.UserControl.ucSelectSupplier" %>
<asp:Literal ID="litSupplier" runat="server" />
<asp:ImageButton ID="btnSelectSingleSupplier" ImageUrl="../../images/Button/PickUp.GIF" runat="server" CausesValidation="false" />
<script type="text/javascript" language="javascript">
    function SelectSingleSupplier() {
        var returnValue = getCookie("dialogReturn_key");
        if (returnValue != null) {
            document.getElementById("<%=hfSupplierid.ClientID %>").value = returnValue;
            document.getElementById("<%=BtnRetrieveSupplieres.ClientID %>").click();
            setCookie("dialogReturn_key", null);
        }
    }
</script>
<div style="display: none">
    <asp:HiddenField ID="hfSupplierid" runat="server" />
    <asp:Button ID="BtnRetrieveSupplieres" CausesValidation="false" runat="server" Text="" OnClick="BtnRetrieveSupplieres_Click"
        Width="0px" Height="0px" />
</div>