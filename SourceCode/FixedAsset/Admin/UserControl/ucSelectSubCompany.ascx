<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSelectSubCompany.ascx.cs"
    Inherits="FixedAsset.Web.Admin.UserControl.ucSelectSubCompany" %>
<asp:Literal ID="litSubCompanyName" runat="server" />
<asp:ImageButton ID="btnAppIdSelect" ImageUrl="../../images/Button/PickUp.GIF" runat="server"
    OnClientClick="ShowTopDialogFrame('分公司选择', '../SelectSingleSubCompany.aspx','SelectSingleSubCompany()',790,500);return false;" />
<script type="text/javascript" language="javascript">
    function SelectSingleSubCompany() {
        var returnValue = getCookie("dialogReturn_key");
        if (returnValue != null) {
            document.getElementById("<%=hfSubcompanyId.ClientID %>").value = returnValue;
            document.getElementById("<%=BtnRetrieveSubcompany.ClientID %>").click();
            setCookie("dialogReturn_key", null);
        }
    }
</script>
<div style="display: none">
    <asp:HiddenField ID="hfSubcompanyId" runat="server" />
    <asp:Button ID="BtnRetrieveSubcompany" CausesValidation="false" runat="server" Text="" OnClick="BtnRetrieveSubcompany_Click"
        Width="0px" Height="0px" />
</div>
