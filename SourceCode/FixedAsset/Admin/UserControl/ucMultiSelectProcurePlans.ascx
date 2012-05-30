<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMultiSelectProcurePlans.ascx.cs" Inherits="FixedAsset.Web.Admin.UserControl.ucMultiSelectProcurePlans" %>
<asp:Literal ID="litSubCompanyName" runat="server" />
<asp:ImageButton ID="btnProcurePlan" ImageUrl="../../images/Button/PickUp.GIF"
    runat="server" CausesValidation="false" OnClick="btnProcurePlan_Click" />
<script type="text/javascript" language="javascript">
    function MultiSelectProcurePlans() {
        var returnValue = getCookie("dialogReturn_key");
        if (returnValue != null) {
            document.getElementById("<%=hfProcurePlanIds.ClientID %>").value = returnValue;
            document.getElementById("<%=BtnRetrieveProcurePlan.ClientID %>").click();
            setCookie("dialogReturn_key", null);
        }
    }
</script>
<div style="display: none">
    <asp:HiddenField ID="hfProcurePlanIds" runat="server" />
    <asp:Button ID="BtnRetrieveProcurePlan" CausesValidation="false" runat="server" Text=""
        OnClick="BtnRetrieveProcurePlan_Click" Width="0px" Height="0px" />
</div>