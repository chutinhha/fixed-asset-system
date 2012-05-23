<%@ Page Language="C#" MasterPageFile="~/Portal/MasterPageView.master" AutoEventWireup="true"
    CodeFile="404.aspx.cs" Inherits="_404" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="head">
    <link href="Styles/common.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="box">
        <div class="wrap clear">
            <div class="pd_nav">
                <img src="img/signup-error.gif" width="150" height="42" /></div>
            <div class="text_body4">
                <div class="error">
                    <a href="#" class="fl">
                        <img border="0" src="images/space.gif" width="210" height="161">
                    </a>
                    <div class="fl">
                        <p>
                            <img border="0" src="images/space.gif" width="160" height="41"></p>
                        <p>
                            很抱歉！你访问的网页可能已经被移除了。
                        </p>
                        <p>
                            放轻松，这也不是什么大问题，可以访问以下地址找找看</p>
                        <ul>

                            <li><a href="default.htm">物联网开放社区平台首页</a></li>

                            <li><a href="#">资讯频道</a></li>
                            <li><a href="#">社区论坛</a></li>
                            <li><a href="#">工具文档频道</a></li>
                            <li><a href="#">终端信息库</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
       
    </div>
</asp:Content>
