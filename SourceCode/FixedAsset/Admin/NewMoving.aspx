<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="NewMoving.aspx.cs" Inherits="FixedAsset.Web.Admin.NewMoving" %>

<%@ Import Namespace="SeallNet.Utility" %>
<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Register TagPrefix="uc1" TagName="ucShowAssetDetail" Src="~/Admin/UserControl/ucShowAssetDetail.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SelectStorageAddress" Src="~/Admin/UserControl/ucSelectStorageAddress.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SelectedMultiAssets" Src="~/Admin/UserControl/ucSelectedMultiAssets.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SelectStorageAddress2" Src="~/Admin/UserControl/ucSelectStorageAddress2.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucDatePicker" Src="~/Admin/UserControl/ucDatePicker.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucSelectUser" Src="~/Admin/UserControl/ucSelectUser.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucSeletedSystem" Src="~/Admin/UserControl/ucSeletedSystem.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucMaintaintype" Src="~/Admin/UserControl/ucMaintaintype.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SelectProject" Src="~/Admin/UserControl/ucSelectProject.ascx" %>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link href="css/mail.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="content-box">
        <div class="content-box-header">
            <h3 style="cursor: s-resize;">
                <asp:Literal runat="server" ID="litTitle" Text="移机申请" />
            </h3>
        </div>
        <div class="content-box-content">
            <div class="tab-content default-tab">
                <fieldset>
                     <table>
                        <tr>
                            <td>
                                所属系统:<span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:ucSeletedSystem ID="ucSeletedSystem" runat="server" OnSelectedAssetCategoryChange="ucSeletedSystem_SelectedAssetCategoryChange" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: auto;">
                                移机单号:
                            </td>
                            <td>
                                <asp:Literal ID="litAssetmoveid"  runat="server"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                申请内容: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtApplycontent" Width="600" runat="server" MaxLength="1000" Rows="10"
                                    TextMode="MultiLine" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                申请人: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:ucSelectUser ID="ucApplyuser" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                申请日期: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:ucDatePicker ID="ucApplyDate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                项目体(分公司): <span style="color: Red">*</span>
                            </td>
                            <td>
                                <uc1:SelectProject ID="ucSelectProject" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                项目体(分公司)联系人: <span style="color: Red">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtProjectcontactorid" MaxLength="100" CssClass="text_inp" runat="server"
    Width="300" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                项目体(分公司)联系电话: 
                            </td>
                            <td>
                                <asp:TextBox ID="txtProjectcontactorphone" class="text_inp" runat="server" Width="300"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 180px;">
                                联系电话:
                            </td>
                            <td>
                                <asp:TextBox ID="txtContactphone" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div id="tag" class="thin blue">
                                    <ul id="tags">
                                        <li id="api" class="selectTag"><a href="#">设备明细</a> </li>
                                    </ul>
                                    <p class="gap">
                                    </p>
                                </div>
                                <p class="c">
                                </p>
                                <div id="tagContent">
                                    <div id="MyFile" style="display: block;">
                                        <table style="width: 100%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                                            align="center" class="gridtable">
                                            <tr style="border-bottom-width: 1px;">
                                                <td colspan="6" align="right">
                                                    设备选择<uc1:SelectedMultiAssets ID="ucSelectedMultiAssets" BillCategory="MoveBill" runat="server" OnSelectAssetChange="ucSelectedMultiAssets_SelectAssetChange" />
                                                </td>
                                            </tr>
                                            <asp:Repeater ID="rptAssetsList" runat="server" OnItemDataBound="rptAssetsList_ItemDataBound"
                                                OnItemCommand="rptAssetsList_ItemCommand">
                                                <HeaderTemplate>
                                                    <tr class="thbg" style="padding: 0 0 0 0">
                                                        <th style="width: 100px;" align="center">
                                                            设备编号
                                                        </th>
                                                        <th>
                                                            设备类别
                                                        </th>
                                                        <th>
                                                            设备名称
                                                        </th>
                                                        <th>
                                                            设备状态
                                                        </th>
                                                        <th>
                                                            购入日期
                                                        </th>
                                                        <th>
                                                            单价
                                                        </th>
                                                        <th>
                                                            品牌
                                                        </th>
                                                        <th>
                                                            账务类别
                                                        </th>
                                                        <th>
                                                            操作
                                                        </th>
                                                    </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td align="center">
                                                            <a href='javascript:ShowTopDialogFrame("设备明细", "ShowAssetDetail.aspx?Assetno=<%#Eval("Assetno")%>","",900,560);'>
                                                                <%#Eval("Assetno")%></a>
                                                        </td>
                                                        <td>
                                                            <asp:Literal ID="litCategoryName" runat="server" />
                                                        </td>
                                                        <td>
                                                            <%#Eval("Assetname")%>
                                                        </td>
                                                        <td>
                                                            <%#EnumUtil.RetrieveEnumDescript((AssetState)Eval("State"))%>
                                                        </td>
                                                        <td>
                                                            <%#((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                                        </td>
                                                          <td align="right">
                                                            <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
                                                        </td>
                                                        <td>
                                                            <%#Eval("Brand")%>
                                                        </td>
                                                        <td>
                                                            <%#EnumUtil.RetrieveEnumDescript((FinanceCategory)Eval("Financecategory"))%>
                                                        </td>
                                                        <td align="right">
                                                            <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                                                CommandArgument='<%#Eval("Detailid")%>' CommandName="DeleteDetail" AlternateText="删除"
                                                                ToolTip="删除" />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <AlternatingItemTemplate>
                                                    <tr class="even">
                                                        <td align="center">
                                                            <a href='javascript:ShowTopDialogFrame("设备明细", "ShowAssetDetail.aspx?Assetno=<%#Eval("Assetno")%>","",900,560);'>
                                                                <%#Eval("Assetno")%></a>
                                                        </td>
                                                        <td>
                                                            <asp:Literal ID="litCategoryName" runat="server" />
                                                        </td>
                                                        <td>
                                                            <%#Eval("Assetname")%>
                                                        </td>
                                                        <td>
                                                            <%#EnumUtil.RetrieveEnumDescript((AssetState)Eval("State"))%>
                                                        </td>
                                                        <td>
                                                            <%#((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                                        </td>
                                                          <td align="right">
                                                            <%#((decimal)Eval("Unitprice")).ToString(FixedAsset.Web.AppCode.UiConst.MoneyFormat)%>
                                                        </td>
                                                        <td>
                                                            <%#Eval("Brand")%>
                                                        </td>
                                                        <td>
                                                            <%#EnumUtil.RetrieveEnumDescript((FinanceCategory)Eval("Financecategory"))%>
                                                        </td>
                                                        <td align="right">
                                                            <asp:ImageButton ID="BtnDeleted" runat="server" ImageUrl="~/images/Button/delete.GIF"
                                                                CommandArgument='<%#Eval("Detailid")%>' CommandName="DeleteDetail" AlternateText="删除"
                                                                ToolTip="删除" />
                                                        </td>
                                                    </tr>
                                                </AlternatingItemTemplate>
                                            </asp:Repeater>
                                        </table>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td colspan="2">
                                <asp:Button ID="BtnSave" runat="server" Text="保 存" CssClass="button" ValidationGroup="Vaild"
                                    OnClick="BtnSave_Click" />
                                <asp:Button ID="btnSubmit" runat="server" Text="提 交" CssClass="button" ValidationGroup="Vaild"
                                    OnClick="btnSubmit_Click" />
                                <input type="button" class="button" runat="server" id="Button2" value="重 置" onclick="javascript:window.location.href = 'NewMoving.aspx';" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />    
    <script type="text/javascript">
        function reset() {
            window.location.href = "NewMoving.aspx";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="content-box">
                <div class="content-box-header">
                    <h3 style="cursor: s-resize;">
                        <asp:Literal runat="server" ID="litTitle" Text="移机申请" />
                    </h3>
                </div>
                <div class="content-box-content">
                    <div class="tab-content default-tab">
                        <fieldset>
                            <table>
                                <tr>
                                    <td style="width: 180px;">
                                        设备编号:
                                    </td>
                                    <td>
                                        <asp:Label ID="litPsid" class="text_inp" runat="server" />
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td style="width: 180px;">
                                        设备名称:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEquipmentName" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        申请移机日期:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMovingDate" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        申请日期:
                                    </td>
                                    <td>
                                       <asp:TextBox ID="txtApplyDate" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        申请人:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtApplyer" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        联系电话:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtContactNum" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        项目体:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProject" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 180px;">
                                        项目体联系人:
                                    </td>
                                    <td>
                                       <asp:TextBox ID="txtProjectContact" runat="server" class="text_inp" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        项目体联系电话: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProjectContactNum" class="text_inp" runat="server" Width="300"></asp:TextBox>
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        计划移机日期:<span style="color: Red">*</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEquipmentMovedate" class="text_inp" runat="server" Width="300"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEquipmentMovedate"
                                            Display="Dynamic" ErrorMessage="请选择设备计划移机日期！"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        实际移机日期: <span style="color: Red">*</span>
                                    </td>
                                    <td>
                                           <asp:TextBox ID="txtActualMoveDate" class="text_inp" runat="server" Width="300"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtActualMoveDate"
                                            Display="Dynamic" ErrorMessage="请选择设备实际移机日期！"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr style="text-align: center">
                                    <td colspan="2">
                                        <asp:Button ID="BtnSave" runat="server" Text="保 存" CssClass="button" ValidationGroup="Vaild"
                                            OnClick="BtnSave_Click" />
                                        <asp:Button ID="btnSubmit" runat="server" Text="提 交" CssClass="button" ValidationGroup="Vaild"
                                            OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnReset" runat="server" Text="重 置" CssClass="button" CausesValidation="false"
                                            OnClientClick="javascript:reset();" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
   
</asp:Content>--%>