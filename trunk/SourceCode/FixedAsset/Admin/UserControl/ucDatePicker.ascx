<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucDatePicker.ascx.cs" Inherits="FixedAsset.Web.Admin.UserControl.ucDatePicker" %>
<script type="text/javascript">
    $(function () {
        $("#<%= txtDatePicker.ClientID%>").datepicker(
        {
            changeMonth: true,
            changeYear: true,
            minDate: $get("<%=this.hfMinDate.ClientID%>").value,
            maxDate: $get("<%=this.hfMaxDate.ClientID%>").value
        });
        $("#<%= txtDatePicker.ClientID%>").datepicker($.datepicker.regional["zh-CN"]);
    });
</script>
<asp:TextBox ID="txtDatePicker" runat="server" Width="120"></asp:TextBox>
<asp:HiddenField ID="hfMinDate" runat="server" />
<asp:HiddenField ID="hfMaxDate" runat="server" />