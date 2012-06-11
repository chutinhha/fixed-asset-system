<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssetUsedList.aspx.cs"
    Inherits="FixedAsset.Web.AssetUsedList" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Import Namespace="SeallNet.Utility" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/default.css" type="text/css" />
    <script src="../Scripts/Dialog.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            //全选/反选
            $("#chkAll").click(function () {
                $("input[type='checkbox']").attr("checked", this.checked);
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="cnt">
            <div id="dTab1" class="Box text_box">
                <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                    align="center">
                    <asp:Repeater ID="rptUsedList" runat="server" OnItemDataBound="rptUsedList_ItemDataBound">
                        <HeaderTemplate>
                            <tr style="background-color: #EFFFEA; border-bottom-width: 1px;">
                                <td style="width: 10%">
                                    <input type="checkbox" id="chkAll"  title="全选/反选"/>
                                </td>
                                <td align="center" style="width: 12%">
                                    设备编号
                                </td>
                                <%--                            <td style="width: 8%">
                                设备类别
                            </td>--%>
                                <td style="width: 9%">
                                    设备名称
                                </td>
                                <td style="width: 7%">
                                    设备状态
                                </td>
                                <td style="width: 7%">
                                    折旧年限
                                </td>
                                <td style="width: 6%">
                                    存放地点
                                </td>
                                <td style="width: 8%">
                                    入账日期
                                </td>
                                <td style="width: 10%">
                                    预计折旧日期
                                </td>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td align="center">
                                    <input type="checkbox" runat="server" id="ckbScrapped" value='<%#Eval("Assetno")%>' />
                                </td>
                                <td align="center">
                                    <%#Eval("Assetno")%>
                                </td>
                                <%--                            <td>
                                <asp:Literal ID="litCategoryName" runat="server" />
                            </td>--%>
                                <td>
                                    <%#Eval("Assetname")%>
                                </td>
                                <td>
                                    <%#EnumUtil.RetrieveEnumDescript((AssetState)Eval("State"))%>
                                </td>
                                <td>
                                    <%#Eval("Depreciationyear")%>
                                </td>
                                <td>
                                    <%#Eval("STORAGEFLAG")%>
                                </td>
                                <td>
                                    <%#((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                </td>
                                <td>
                                    <%#((DateTime)Eval("Expireddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr class="alt-row">
                                <td align="center">
                                    <input type="checkbox" runat="server" id="ckbScrapped" value='<%#Eval("Assetno")%>' />
                                </td>
                                <td align="center">
                                    <%#Eval("Assetno")%>
                                </td>
                                <%--                            <td>
                                <asp:Literal ID="litCategoryName" runat="server" />
                            </td>--%>
                                <td>
                                    <%#Eval("Assetname")%>
                                </td>
                                <td>
                                    <%#EnumUtil.RetrieveEnumDescript((AssetState)Eval("State"))%>
                                </td>
                                <td>
                                    <%#Eval("Depreciationyear")%>
                                </td>
                                <td>
                                    <%#Eval("STORAGEFLAG")%>
                                </td>
                                <td>
                                    <%#((DateTime)Eval("Purchasedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                </td>
                                <td>
                                    <%#((DateTime)Eval("Expireddate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <tr>
                        <td colspan="8" style="height: 30px; width: 98%;" align="left">
                            <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8" style="height: 30px; width: 98%;" align="left">
                            <asp:Button ID="BtnApplicate" runat="server" CssClass="button" Text="申请报废" OnClick="BtnApplicate_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
