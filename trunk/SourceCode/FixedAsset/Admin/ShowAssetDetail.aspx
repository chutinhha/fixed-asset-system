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
   <%-- <div class="content-box-content">--%>
        <div class="tab-content default-tab">
            <table>
                <tr>
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
                <tr>
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
                <tr>
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
                <tr>
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
                <tr>
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
                <tr>
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
                        <asp:Literal ID="litBrand" runat="server" />年
                    </td>
                </tr>
                <tr>
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
                        <asp:Literal ID="litFinancecategory" runat="server" />年
                    </td>
                </tr>
            </table>
            <div id="tag" class="thin blue">
                <ul id="tags">
                    <li id="api" class="selectTag"><a href="#" onclick="tabChange('api','dapi','dflow','dquestion','dabilityRemark','MyFile')">
                        安装</a> </li>
                    <li id="flow"><a href="#" onclick="tabChange('flow','dflow','dquestion','dapi','dabilityRemark','MyFile')">
                        报修</a> </li>
                    <li id="question"><a href="#" onclick="tabChange('question','dquestion','dapi','dflow','dabilityRemark','MyFile')">
                        移机</a></li>
                    <li id="abilityRemark"><a href="#" onclick="tabChange('abilityRemark','dabilityRemark','dquestion','dapi','dflow','MyFile')">
                        拆机</a></li>
                    <%--<li id="sdk"><a href="#" onclick="tabChange('sdk','MyFile','dquestion','dapi','dflow','dabilityRemark')">
                            SDK文档&nbsp;</a> </li>--%>
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
                    <%--<asp:Repeater ID="rptAbility" runat="server">
                        <ItemTemplate>
                            <a href="DownFile.aspx?file=<%# DataBinder.Eval(Container.DataItem, "SDK_PATH")%>&filename=<%# DataBinder.Eval(Container.DataItem, "SDK_PATHOLD")%>">
                                <%# DataBinder.Eval(Container.DataItem, "SDK_PATHOLD")%></a>
                        </ItemTemplate>
                    </asp:Repeater>--%>
                </div>
            </div>
            <tr>
                <td colspan="2">
                    <input type="button" value="关闭" class="button" onclick="javascript:CloseTopDialogFrame();" />
                </td>
            </tr>
        </div>
    <%--</div>--%>
</asp:Content>
