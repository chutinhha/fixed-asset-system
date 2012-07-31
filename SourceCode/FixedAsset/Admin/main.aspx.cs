using System;
using System.Text;
using System.Web;
using System.Linq;
using FixedAsset.Domain;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin
{
    public partial class main : System.Web.UI.Page
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!this.IsPostBack)
            {
                if (WebContext.Current.CurrentUser != null)
                { 
                    LoadUserMenuItems();
                    litUsername.Text = WebContext.Current.CurrentUser.Username;//用户姓名
                    litUserRole.Text = WebContext.Current.CurrentUser.Rolename;//角色名
                }
            }
        }
        protected void LoadUserMenuItems()
        {
            litMenuItems.Text = string.Empty;
            var menuItems = WebContext.Current.UserMenuItems;
            if(menuItems==null||menuItems.Count==0){return;}
            var rootMenuItems = (from p in menuItems
                                 orderby p.Orderby ascending
                                 where p.Parentmenuid == Menuitem.DefaultParentCode
                                 select p).ToList();
            var content=new StringBuilder();
            foreach (var rootMenuItem in rootMenuItems)
            {
                content.AppendLine("<h1 class='type'>");
                content.AppendFormat("    <a href='javascript:void(0)'>{0}</a></h1>",rootMenuItem.Menuname).AppendLine();
                content.AppendLine(@"<div class='content' style=""height: auto;"">");
                content.AppendLine("    <ul class='MM'>");
                var subMenuItems = (from p in menuItems
                                    orderby p.Orderby ascending
                                    where p.Parentmenuid == rootMenuItem.Menuid
                                    select p).ToList();
                foreach (var subMenuItem in subMenuItems)
                {
                    content.AppendFormat("        <li><a href='{0}' target='aa'>{1}</a></li>",ResolveUrl(subMenuItem.Menuaddress),subMenuItem.Menuname); 
                }
                content.AppendLine("    </ul>");
                content.AppendLine("</div>");
            }
            litMenuItems.Text = content.ToString();
        }  
        //退出系统
        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Response.SetCookie(new HttpCookie("ASP.NET_SessionId"));
            Response.Redirect(ResolveUrl("~/admin/Login.aspx"));
        }
    }
}