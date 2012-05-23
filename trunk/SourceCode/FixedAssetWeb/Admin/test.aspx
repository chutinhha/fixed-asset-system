<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="Admin_test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <script src="js/menu.js" type="text/javascript"></script>
<script src="js/prototype.lite.js" type="text/javascript"></script>
<script src="js/moo.fx.js" type="text/javascript"></script>
<script src="js/moo.fx.pack.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/default.css" type="text/css" />
<title>用户管理后台</title>
</head>

<body>
<div class="wrap">
</div>
<div class="wrap">
	<dl id="header">
		<dt></dt>
		<dd>
			<p class="title"><img src="img/Help_Circle.png"  /><a href="#">帮助</a></p>
			<p class="loginfor" height="37"> <a href="#" class="but3"><span>退出</span></a> <b>&nbsp;&nbsp;登录用户：apple.liao&nbsp;&nbsp;|&nbsp;&nbsp;身份：系统管理员&nbsp;&nbsp;|&nbsp;&nbsp;</b></p>
		</dd>
	</dl>
    <div id="contents">
    	<div class="left">
            <div id="container">
            	<h1 class="type"><a href="javascript:void(0)">网站常规管理</a></h1>
                <div class="content">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
                    </tr>
                  </table>
                  <ul class="MM">
                    <li><a href="#" target="main">基本设置</a></li>
                    <li><a href="#" target="main">邮件设置</a></li>
                    <li><a href="#" target="main">广告设置</a></li>
                    <li><a href="#" target="main">114增加</a></li>
                    <li><a href="#" target="main">114管理</a></li>
                    <li><a href="#" target="main">联系方式</a></li>
                    <li><a href="#" target="main">汇款方式</a></li>
                    <li><a href="#" target="main">增加链接</a></li>
                    <li><a href="#" target="main">管理链接</a></li>
                  </ul>
                </div>
                <h1 class="type"><a href="javascript:void(0)">栏目分类管理</a></h1>
                <div class="content">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
                    </tr>
                  </table>
                  <ul class="MM">
                    <li><a href="#" target="main">信息分类</a></li>
                    <li><a href="#" target="main">信息类型</a></li>
                    <li><a href="#" target="main">资讯分类</a></li>
                    <li><a href="#" target="main">地区设置</a></li>
                    <li><a target="main" href="#">市场联盟</a></li>
                    <li><a href="#" target="main">商家类型</a></li>
                    <li><a href="#" target="main">商家星级</a></li>
                    <li><a href="#" target="main">商品分类</a></li>
                    <li><a href="#" target="main">商品类型</a></li>
                  </ul>
                </div>
                <h1 class="type"><a href="javascript:void(0)">栏目内容管理</a></h1>
                <div class="content">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
                    </tr>
                  </table>
                  <ul class="MM">
                    <li><a href="#" target="main">信息管理</a></li>
                    <li><a href="#" target="main">张贴管理</a></li>
                    <li><a href="#" target="main">增加商家</a></li>
                    <li><a href="#" target="main">管理商家</a></li>
                    <li><a href="#" target="main">发布资讯</a></li>
                    <li><a href="#" target="main">资讯管理</a></li>
                    <li><a href="#" target="main">市场联盟</a></li>
                    <li><a href="#" target="main">名片管理</a></li>
                    <li><a href="#" target="main">商城管理</a></li>
                    <li><a href="#" target="main">商品管理</a></li>
                    <li><a href="#" target="main">商城留言</a></li>
                    <li><a href="#" target="main">商城公告</a></li>
                  </ul>
                </div>
                <h1 class="type"><a href="javascript:void(0)">注册用户管理</a></h1>
                <div class="content">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
                    </tr>
                  </table>
                  <ul class="MM">
                    <li><a href="#" target="main">会员管理</a></li>
                    <li><a href="#" target="main">留言管理</a></li>
                    <li><a href="#" target="main">回复管理</a></li>
                    <li><a href="#" target="main">订单管理</a></li>
                    <li><a href="#" target="main">举报管理</a></li>
                    <li><a href="#" target="main">评论管理</a></li>
                  </ul>
                </div>
                <h1 class="type"><a href="javascript:void(0)">其它参数管理</a></h1>
                  <div class="content">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
                      </tr>
                    </table>
                    <ul class="MM">
                      <li><a href="#" target="main">管理设置</a></li>
                      <li><a href="#" target="main">主机状态</a></li>
                      <li><a href="#" target="main">攻击状态</a></li>
                      <li><a href="#" target="main">登录记录</a></li>
                      <li><a href="#" target="main">运行状态</a></li>
                    </ul>
                  </div>
			</div>
            <script type="text/javascript">
                var contents = document.getElementsByClassName('content');
                var toggles = document.getElementsByClassName('type');

                var myAccordion = new fx.Accordion(
					toggles, contents, { opacity: true, duration: 400 }
				);
                myAccordion.showThisHideOpen(contents[0]);
			</script> 
        </div>
        <div class="right">
      
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>
