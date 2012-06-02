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
        function tabChange(objId, id, dflow, dquestion, dabilityRemark, MyFile) {
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
            document.getElementById(MyFile).style.display = "none";
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
                            <li id="api" class="selectTag"><a href="javascript:tabChange('api','dapi','dflow','dquestion','dabilityRemark','MyFile')">
                                安装</a> </li>
                            <li id="flow"><a href="javascript:tabChange('flow','dflow','dquestion','dapi','dabilityRemark','MyFile')">
                                报修</a> </li>
                            <li id="question"><a href="javascript:tabChange('question','dquestion','dapi','dflow','dabilityRemark','MyFile')">
                                移机</a></li>
                            <li id="abilityRemark"><a href="javascript:tabChange('abilityRemark','dabilityRemark','dquestion','dapi','dflow','MyFile')">
                                拆机</a></li>
                        </ul>
                        <p class="gap">
                        </p>
                    </div>
                    <p class="c">
                    </p>
                    <div id="tagContent">
                        <div id="dapi" style="display: block;">
                            <asp:Label ID="txtAblityExplanation" runat="server" Text=""></asp:Label>
                        </div>
                        <div id="dflow" style="display: none;">
                            <asp:Label ID="txtAblityIntroduce" runat="server" Text=""></asp:Label>
                        </div>
                        <div id="dquestion" style="display: none;">
                            <asp:Label ID="txtAbilityDemo" runat="server" Text=""></asp:Label>
                        </div>
                        <div id="dabilityRemark" style="display: none;">
                            <asp:Label ID="txtablity_REMARK" runat="server" Text=""></asp:Label>
                        </div>
                        <div id="MyFile" style="display: none;">
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
