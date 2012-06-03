<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="SelectSingleProject.aspx.cs" Inherits="FixedAsset.Web.Admin.SelectSingleProject" %>

<%@ Register Src="~/Admin/UserControl/ucSelectProjectForTree.ascx" TagName="SelectProjectForTree"
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
                        <div class="column-left">
                            <b>选中分公司或项目体：</b>
                            <div class="listbox">
                                <uc1:SelectProjectForTree ID="ucSelectProjectForTree" runat="server" OnSelectedStorageNodeChange="ucSelectProjectForTree_SelectedStorageNodeChange" />
                            </div>
                        </div>
                        <div class="column-right">
                            <table>
                                <tr>
                                    <td style="width: auto;">
                                        分公司或项目体:
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
