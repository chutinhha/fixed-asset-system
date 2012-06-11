<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="ShowAssetDetail.aspx.cs" Inherits="FixedAsset.Web.Admin.ShowAssetDetail" %>

<%@ Register Src="~/Admin/UserControl/ucShowStorageAddress.ascx" TagName="ShowStorageAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/Admin/UserControl/ucSelectSubCompany.ascx" TagName="SelectSubCompany"
    TagPrefix="uc1" %>
<%@ Register Src="~/Admin/UserControl/ucSelectSupplier.ascx" TagName="SelectSupplier"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
        function tabChange(objId, id, dflow, dquestion, dabilityRemark) {
            var obj = document.getElementById(objId);
            var arrayli = document.getElementById("tags").getElementsByTagName("li"); //获取ul数组
            for (i = 0; i < arrayli.length; i++) {
                if (arrayli[i] == obj) {
                    arrayli[i].className = "selectTag";
                }
                else {
                    arrayli[i].className = "";
                }
            }
            document.getElementById(id).style.display = "block";
            document.getElementById(dflow).style.display = "none";
            document.getElementById(dquestion).style.display = "none";
            document.getElementById(dabilityRemark).style.display = "none";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="tab-content default-tab">
        <table style="width: 100%;">
            <tr style="height: 22px;">
                <td>
                    设备编号：
                </td>
                <td>
                    <asp:Literal ID="litAssetno" runat="server" />
                </td>
                <td>
                    设备类别：
                </td>
                <td>
                    <asp:Literal ID="litAssetcategoryid" runat="server" />
                </td>
            </tr>
            <tr style="height: 22px;">
                <td>
                    设备名称：
                </td>
                <td>
                    <asp:Literal ID="litAssetname" runat="server" />
                </td>
                <td>
                    设备规格：
                </td>
                <td>
                    <asp:Literal ID="litAssetspecification" runat="server" />
                </td>
            </tr>
            <tr style="height: 22px;">
                <td>
                    存放地点：
                </td>
                <td>
                    <uc1:ShowStorageAddress ID="ucShowStorageAddress" runat="server" />
                </td>
                <td>
                    设备状态：
                </td>
                <td>
                    <asp:Literal ID="litState" runat="server" />
                </td>
            </tr>
            <tr style="height: 22px;">
                <td>
                    供应商：
                </td>
                <td>
                    <uc1:SelectSupplier ID="ucSelectSupplier" runat="server" IsShowSupplierName="true" />
                </td>
                <td>
                    分公司：
                </td>
                <td>
                    <uc1:SelectSubCompany ID="ucSelectSubCompany" runat="server" IsShowSubCompanyName="true" />
                </td>
            </tr>
            <tr style="height: 22px;">
                <td>
                    购入日期：
                </td>
                <td>
                    <asp:Literal ID="litPurchasedate" runat="server" />
                </td>
                <td>
                    折旧年限：
                </td>
                <td>
                    <asp:Literal ID="litDepreciationyear" runat="server" />年
                </td>
            </tr>
            <tr style="height: 22px;">
                <td>
                    单价：
                </td>
                <td>
                    <asp:Literal ID="litUnitprice" runat="server" />
                </td>
                <td>
                    品牌：
                </td>
                <td>
                    <asp:Literal ID="litBrand" runat="server" />
                </td>
            </tr>
            <tr style="height: 22px;">
                <td>
                    管理模式：
                </td>
                <td>
                    <asp:Literal ID="litManagemode" runat="server" />
                </td>
                <td>
                    财务类别：
                </td>
                <td>
                    <asp:Literal ID="litFinancecategory" runat="server" />
                </td>
            </tr>
            <tr style="height: auto;">
                <td colspan="4">
                    <div id="tag" class="thin blue">
                        <ul id="tags">
                            <li id="setupBill" class="selectTag"><a href="#" onclick="javascript:tabChange('setupBill','setupBillContent','repairBillContent','moveBillContent','removeBillContent')">
                                安装</a> </li>
                            <li id="repairBill"><a href="javascript:tabChange('repairBill','repairBillContent','setupBillContent','moveBillContent','removeBillContent')">
                                报修</a> </li>
                            <li id="moveBill"><a href="javascript:tabChange('moveBill','moveBillContent','setupBillContent','repairBillContent','removeBillContent')">
                                移机</a></li>
                            <li id="removeBill"><a href="javascript:tabChange('removeBill','removeBillContent','setupBillContent','repairBillContent','moveBillContent')">
                                拆机</a></li>
                        </ul>
                        <p class="gap">
                        </p>
                    </div>
                    <p class="c">
                    </p>
                    <div id="tagContent">
                        <div id="setupBillContent" style="display: block;">
                            <asp:Repeater ID="rptSetupList" runat="server">
                                <HeaderTemplate>
                                    <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                                        <td>
                                            安装单号
                                        </td>
                                        <td>
                                            计划安装日期
                                        </td>
                                        <td>
                                            实际安装日期
                                        </td>
                                    </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%#Eval("Setupid")%>
                                        </td>
                                        <td>
                                            <%# Eval("Plansetupdate") == null ? "" : ((DateTime)Eval("Plansetupdate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                        </td>
                                        <td>
                                            <%# Eval("Actualsetupdate") == null ? "" : ((DateTime)Eval("Actualsetupdate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tr class="alt-row">
                                        <td>
                                            <%#Eval("Setupid")%>
                                        </td>
                                        <td>
                                            <%# Eval("Plansetupdate") == null ? "" : ((DateTime)Eval("Plansetupdate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                        </td>
                                        <td>
                                            <%# Eval("Actualsetupdate") == null ? "" : ((DateTime)Eval("Actualsetupdate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div id="repairBillContent" style="display: none;">
                            <asp:Repeater ID="rptRepairList" runat="server">
                                <HeaderTemplate>
                                    <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                                        <td>
                                            设备维修编号
                                        </td>
                                        <td>
                                            计划维修日期
                                        </td>
                                        <td>
                                            实际维修日期
                                        </td>
                                    </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%#Eval("Assetmaintainid")%>
                                        </td>
                                        <td>
                                            <%# Eval("Plandate") == null ? "" : ((DateTime)Eval("Plandate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                        </td>
                                        <td>
                                            <%# Eval("Actualdate") == null ? "" : ((DateTime)Eval("Actualdate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tr class="alt-row">
                                        <td>
                                            <%#Eval("Assetmaintainid")%>
                                        </td>
                                        <td>
                                            <%# Eval("Plandate") == null ? "" : ((DateTime)Eval("Plandate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                        </td>
                                        <td>
                                            <%# Eval("Actualdate") == null ? "" : ((DateTime)Eval("Actualdate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div id="moveBillContent" style="display: none;">
                            <asp:Repeater ID="rptMoveList" runat="server">
                                <HeaderTemplate>
                                    <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                                        <td>
                                            移机单号
                                        </td>
                                        <td>
                                            计划移机日期
                                        </td>
                                        <td>
                                            实际移机日期
                                        </td>
                                    </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%#Eval("Assetmoveid")%>
                                        </td>
                                        <td>
                                            <%# Eval("Planmovedate") == null ? "" : ((DateTime)Eval("Planmovedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                        </td>
                                        <td>
                                            <%# Eval("Actualmovedate") == null ? "" : ((DateTime)Eval("Actualmovedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tr class="alt-row">
                                        <td>
                                            <%#Eval("Assetmoveid")%>
                                        </td>
                                        <td>
                                            <%# Eval("Planmovedate") == null ? "" : ((DateTime)Eval("Planmovedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                        </td>
                                        <td>
                                            <%# Eval("Actualmovedate") == null ? "" : ((DateTime)Eval("Actualmovedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div id="removeBillContent" style="display: none;">
                            <asp:Repeater ID="rptRemoveList" runat="server">
                                <HeaderTemplate>
                                    <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                                        <td>
                                            拆机单号
                                        </td>
                                        <td>
                                            计划拆机日期
                                        </td>
                                        <td>
                                            实际拆机日期
                                        </td>
                                    </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%#Eval("Assetremoveid")%>
                                        </td>
                                        <td>
                                            <%# Eval("Planremovedate") == null ? "" : ((DateTime)Eval("Planremovedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                        </td>
                                        <td>
                                            <%# Eval("Actualremovedate") == null ? "" : ((DateTime)Eval("Actualremovedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tr class="alt-row">
                                        <td>
                                            <%#Eval("Assetremoveid")%>
                                        </td>
                                        <td>
                                            <%# Eval("Planremovedate") == null ? "" : ((DateTime)Eval("Planremovedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                        </td>
                                        <td>
                                            <%# Eval("Actualremovedate") == null ? "" : ((DateTime)Eval("Actualremovedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                            </asp:Repeater>
                        </div>                        
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <input type="button" value="关闭" class="button" onclick="javascript:CloseTopDialogFrame();" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
