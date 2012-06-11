<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectMultiProcurePlan.aspx.cs"
    Inherits="FixedAsset.Web.Admin.SelectMultiProcurePlan" %>

<%@ Import Namespace="SeallNet.Utility" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Register Assembly="iKC.Web" Namespace="iKC.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Assembly="KFSQ.Web.Controls" Namespace="KFSQ.Web.Controls" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="css/default.css" type="text/css" />
    <link href="../App_Themes/Control_Theme/Dialog.css" rel="stylesheet" type="text/css" />
    <link href="css/mail.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <script language="javascript" type="text/javascript" src="../Scripts/Extjs/ext-base.js"></script>
    <script language="javascript" type="text/javascript" src="../Scripts/Extjs/ext-all.js"></script>
    <script language="javascript" type="text/javascript" src="../Scripts/Dialog.js"></script>
    <script language="javascript" type="text/javascript" src="../Scripts/Ajax.js"></script>
    <form id="form1" runat="server">
    <div id="contents">
        <div id="dTab1" class="Box text_box">
            分公司名称
            <asp:TextBox class="text-input small-input" ID="txtSrchPsid" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" class="button" runat="server" Text="查询" OnClick="btnSearch_Click" />
            <table style="width: 98%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                align="center" class="gridtable" id="tbProcureList">
                <asp:Repeater ID="rptProcureList" runat="server" OnItemDataBound="rptProcureList_ItemDataBound">
                    <HeaderTemplate>
                        <tr class="thbg" style="padding:0 0 0 0">
                            <th align="center">
                                单号<input id="ckbAllSelected" onclick="javascript:AllChooseOrNoChoose('tbProcureList',this);"
                                    type="checkbox" />
                            </th>
                            <th>
                                计划采购日期
                            </th>
                            <th>
                                分公司
                            </th>
                            <th>
                                申请人
                            </th>
                            <th>
                                申请日期
                            </th>
                            <th>
                                审核人
                            </th>
                            <th>
                                审核日期
                            </th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td align="left">
                                <asp:CheckBox ID="ckbPsId" runat="server" />
                                <asp:Literal ID="litPsId" runat="server" Text='<%#Eval("Psid")%>' />
                            </td>
                            <td>
                                <%#((DateTime)Eval("Procurementscheduledate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Subcompanyname")%>
                            </td>
                            <td>
                                <%#Eval("Applyuser")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Applydate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Approveuser")%>
                            </td>
                            <td>
                                <%# Eval("Approvedate")==null?"":((DateTime)Eval("Approvedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="even">
                            <td >
                                <asp:CheckBox ID="ckbPsId" runat="server" />
                                <asp:Literal ID="litPsId" runat="server" Text='<%#Eval("Psid")%>' />
                            </td>
                            <td>
                                <%#((DateTime)Eval("Procurementscheduledate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Subcompanyname")%>
                            </td>
                            <td>
                                <%#Eval("Applyuser")%>
                            </td>
                            <td>
                                <%#((DateTime)Eval("Applydate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                            <td>
                                <%#Eval("Approveuser")%>
                            </td>
                            <td>
                                <%# Eval("Approvedate")==null?"":((DateTime)Eval("Approvedate")).ToString(FixedAsset.Web.AppCode.UiConst.DateFormat)%>
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="9" style="height: 30px; width: 98%;" align="center">
                        <cc1:PagingControl ID="pcData" runat="server" MaxNavigatePageCount="7" OnPageIndexClick="pcData_PageIndexClick" />
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnOk" runat="server" Text="确定" class="button" OnClick="btnOk_Click" />
            <input type="button" value="取消" class="button" onclick="javascript:CloseTopDialogFrame();" />
        </div>
    </div>
    </form>
</body>
</html>
