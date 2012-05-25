<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSelectUser.ascx.cs"
    Inherits="FixedAsset.Web.Admin.UserControl.ucSelectUser" %>
<%--imgCustomerSelect.OnClientClick = "ShowTopDialogFrame('用户选择', 'return_user.aspx','FillCustomer()',790,500);return false;";
function FillCustomer() {
            var returnValue = getCookie("dialogReturn_key");
            if (returnValue != null) {
                var array = returnValue.split(',');
                if (array.length == 3) {
                    document.getElementById("<%=txt_userName.ClientID %>").value = array[1];
                    document.getElementById("<%=hf_userid.ClientID %>").value = array[0];
                }
                else {
                    document.getElementById("<%=txt_userName.ClientID %>").value = "";
                }
               // $("<%=hf_userid.ClientID %>").value = array[0];
               // $("<%=hf_departmentid.ClientID %>").value = array[2];
               /// setCookie("dialogReturn_key", null);

            }
        }--%>