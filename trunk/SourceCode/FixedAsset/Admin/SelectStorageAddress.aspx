<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="SelectStorageAddress.aspx.cs" Inherits="FixedAsset.Web.Admin.SelectStorageAddress" %>

<%@ Register Src="~/Admin/UserControl/ucSelectStorageAddress.ascx" TagName="SelectStorageAddress"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-box">
                <div class="content-box-content">
                    <div class="tab-content default-tab">
                        <div class="column-left" style="height:300px; overflow-y:scroll;">
                            <b>选中存放地点：</b>
                            <div class="listbox">
                                <uc1:SelectStorageAddress ID="ucSelectStorageAddress" runat="server" OnSelectedStorageNodeChange="ucSelectStorageAddress_SelectedStorageNodeChange" />
                            </div>
                        </div>
                        <div class="column-right">
                            <table>
                                <tr>
                                    <td style="width: auto;">
                                        存放地点:
                                    </td>
                                    <td>
                                        <asp:Literal runat="server" ID="litStorage" />
                                    </td>
                                </tr>
                                <tr style="text-align: center">
                                    <td colspan="2">
                                        <asp:Button ID="btnOk" runat="server" Text="确定" class="button" OnClick="btnOk_Click" />
                                        <input type="button" value="取消" class="button" onclick="javascript:CloseTopDialogFrame();" />
                                    </td>
                                </tr>
                            </table>
                            <div class="clear">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
