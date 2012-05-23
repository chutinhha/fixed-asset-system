﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeBehind="404.aspx.cs" Inherits="FixedAsset.Web._404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/common.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="box">
        <div class="wrap clear">
            <div class="pd_nav">
                <img src="img/signup-error.gif" width="150" height="42" /></div>
            <div class="text_body4">
                <div class="error">
                    <a href="#" class="fl">
                        <img border="0" src="images/space.gif" width="210" height="161" alt="">
                    </a>
                    <div class="fl">
                        <p>
                            <img border="0" src="images/space.gif" width="160" height="41" alt=""></p>
                        <p>
                            很抱歉！你访问的网页可能已经被移除了。
                        </p>
                        <p>
                            放轻松，这也不是什么大问题，可以访问以下地址找找看</p>
                        <ul>
                            <li><a href="index.aspx">首页</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
