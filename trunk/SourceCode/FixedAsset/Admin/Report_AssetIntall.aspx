<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="Report_AssetIntall.aspx.cs" Inherits="FixedAsset.Web.Admin.Report_AssetIntall" %>

<%@ Import Namespace="FixedAsset.Domain" %>
<%@ Register Src="~/Admin/UserControl/ucSelectProjectForTree.ascx" TagName="SelectStorageAddress"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link href="css/mail.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content-box">
        <div class="content-box-header">
            <h3 style="cursor: s-resize;">
                <asp:Literal runat="server" ID="litTitle" Text="安装台账" /></h3>
        </div>
        <div class="content-box-content">
            <div class="tab-content default-tab">
                <div class="column-left" style="height: 300px; overflow-y: scroll; overflow-x: scroll;
                    width: 28%;">
                    <b>分公司或项目体：</b>
                    <div class="listbox">
                        <uc1:SelectStorageAddress ID="ucSelectStorageAddress" runat="server" OnSelectedStorageNodeChange="ucSelectStorageAddress_SelectedStorageNodeChange" />
                    </div>
                </div>
                <div class="column-right" style="width: 70%;">
                    <p>
                        用户姓名<asp:TextBox ID="txtSrchUsername" Width="150" CssClass="" runat="server" />
                        登录账号<asp:TextBox ID="txtSrchLoginid" Width="150" CssClass="" runat="server" />
                        <asp:Button ID="BtnSearch" runat="server" CssClass="button" Text="查询" />
                    </p>
                    <table style="width: 100%; padding-top: 0px;" cellspacing="0px" cellpadding="0px"
                        align="center" class="gridtable">
                        <tr class="thbg" style="padding: 0 0 0 0">
                            <th rowspan="2" class="thbg">
                                序号
                            </th>
                            <th rowspan="2" class="thbg">
                                分公司/项目体
                            </th>
                            <th colspan="4">
                                浦江
                            </th>
                            <th>
                                科技网
                            </th>
                            <th colspan="9">
                                光显
                            </th>
                        </tr>
                        <tr class="thbg" style="padding: 0 0 0 0">
                            <th>
                                电脑
                            </th>
                            <th>
                                闸机
                            </th>
                            <th>
                                LED显示屏
                            </th>
                            <th>
                                发卡器
                            </th>
                            <th>
                                交换机
                            </th>
                            <th>
                                DVR主机
                            </th>
                            <th>
                                DVS主机
                            </th>
                            <th>
                                球机
                            </th>
                            <th>
                                枪机
                            </th>
                            <th>
                                19显示器
                            </th>
                            <th>
                                42显示器
                            </th>
                            <th>
                                拼接大屏
                            </th>
                            <th>
                                解码器
                            </th>
                            <th>
                                控制器
                            </th>
                        </tr>
                        <tr style="padding: 0 0 0 0">
                            <td>
                                序号
                            </td>
                            <td>
                                分公司/项目体
                            </td>
                            <td>
                                电脑
                            </td>
                            <td>
                                闸机
                            </td>
                            <td>
                                LED显示屏
                            </td>
                            <td>
                                发卡器
                            </td>
                            <td>
                                交换机
                            </td>
                            <td>
                                DVR主机
                            </td>
                            <td>
                                DVS主机
                            </td>
                            <td>
                                球机
                            </td>
                            <td>
                                枪机
                            </td>
                            <td>
                                19显示器
                            </td>
                            <td>
                                42显示器
                            </td>
                            <td>
                                拼接大屏
                            </td>
                            <td>
                                解码器
                            </td>
                            <td>
                                控制器
                            </td>
                        </tr>
                        <tr class="even" style="padding: 0 0 0 0">
                            <td>
                                序号
                            </td>
                            <td>
                                分公司/项目体
                            </td>
                            <td>
                                电脑
                            </td>
                            <td>
                                闸机
                            </td>
                            <td>
                                LED显示屏
                            </td>
                            <td>
                                发卡器
                            </td>
                            <td>
                                交换机
                            </td>
                            <td>
                                DVR主机
                            </td>
                            <td>
                                DVS主机
                            </td>
                            <td>
                                球机
                            </td>
                            <td>
                                枪机
                            </td>
                            <td>
                                19显示器
                            </td>
                            <td>
                                42显示器
                            </td>
                            <td>
                                拼接大屏
                            </td>
                            <td>
                                解码器
                            </td>
                            <td>
                                控制器
                            </td>
                        </tr>
                    </table>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
