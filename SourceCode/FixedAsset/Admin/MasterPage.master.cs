using System;
using System.Text;
namespace FixedAsset.Web.Admin
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if(!IsPostBack)
            {
                InitialScriptAndStyle();
            }
        }
        protected void InitialScriptAndStyle()
        {
            var content = new StringBuilder();
            content.AppendFormat(@"<script type=""text/javascript"" src=""{0}""></script>", ResolveUrl("~/Scripts/jquery-1.6.1.min.js")).AppendLine();
            content.AppendFormat(@"<script type=""text/javascript"" src=""{0}""></script>", ResolveUrl("~/Scripts/jquery-latest.js")).AppendLine();
            content.AppendFormat(@"<link href=""{0}"" rel=""stylesheet"" type=""text/css"" />", ResolveUrl("~/css/jquery.ui.all.css")).AppendLine();
            content.AppendFormat(@"<script type=""text/javascript"" src=""{0}""></script>", ResolveUrl("~/Scripts/jquery-1.6.2.js")).AppendLine();
            content.AppendFormat(@"<script type=""text/javascript"" src=""{0}""></script>", ResolveUrl("~/Scripts/jquery.ui.core.js")).AppendLine();
            content.AppendFormat(@"<script type=""text/javascript"" src=""{0}""></script>", ResolveUrl("~/Scripts/jquery.ui.widget.js")).AppendLine();
            content.AppendFormat(@"<script type=""text/javascript"" src=""{0}""></script>", ResolveUrl("~/Scripts/jquery.ui.datepicker.js")).AppendLine();
            content.AppendFormat(@"<script type=""text/javascript"" src=""{0}""></script>", ResolveUrl("~/Scripts/jquery.ui.datepicker-zh-CN.js")).AppendLine();
            litStyle.Text = content.ToString();
        }
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (!IsPostBack)
        //    {
        //        //UsersAndRoleAndApproveAndWAIT enUser = new UsersAndRoleAndApproveAndWAIT();
        //        //enUser = (UsersAndRoleAndApproveAndWAIT)Session["Login_user"];
        //        //lb_userName.Text = enUser.Username;
        //        //lb_userRole.Text = enUser.UserRole.Count > 0 ? ((SRoleEntity)enUser.UserRole[0]).Rolename : "";
        //        //list_band(enUser);
        //    }
        //}
        //protected void list_band(UsersAndRoleAndApproveAndWAIT enuser)
        //{
        //      string url=(string)Session["PreviousPageUrl"];
        //    DataTable dt = new DataTable();
        //    DataTable hdt = new DataTable();
        //    dt = SRoleDA.GetAll(enuser.UserRoleRights,out hdt);
        //    if (dt != null && dt.Rows.Count > 0)
        //    {          
        //        StringBuilder htmlstr = new StringBuilder();
        //        StringBuilder htmlstr2 = new StringBuilder();
        //        for (int j = 0; j < hdt.Rows.Count; j++)
        //        {
        //            htmlstr.Append("<h1 class='type'><a href='javascript:void(0)'>" + hdt.Rows[j]["h"].ToString() + "</a></h1>");
        //            htmlstr.Append("<div class='content'>");
        //            htmlstr.Append("<table width='100%' border='0' cellspacing='0' cellpadding='0'>");
        //            htmlstr.Append("<tr><td>");
        //            htmlstr.Append("<img src='images/menu_topline.gif' width=182 height=5 />");
        //            htmlstr.Append(" </td></tr></table><ul class='MM'>");
        //            DataRow[] pRow = dt.Select("h='" + hdt.Rows[j]["h"].ToString() + "'", "");
        //            for (int i = 0; i < pRow.Length; i++)
        //            {
        //                htmlstr.Append("<li><a href='" + pRow[i]["functionurl"].ToString() + "' target='aa'>" + pRow[i]["modulename"].ToString() + "</a></li>");

        //            }
        //            htmlstr.Append("</ul></div>");
        //        }
        //        //lb_menu.Text = htmlstr.ToString();
        //    }
        //}
        //protected void lbtn_out_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        Session["Login_user"] = null;
        //        string loginid = (string)WebCaching.LogUserCaching;
        //        SLoginlogEntity en = new SLoginlogEntity();
        //        en = SLoginlog.GetSLoginlogByID(loginid);
        //        en.LoginoutDate = DateTime.Now;
        //        SLoginlog.UpdateSLoginlog(en);
        //        WebCaching.LogUserCaching = null;
        //    }
        //    catch (Exception ex)
        //    { }
        //    finally
        //    {
        //        Response.Redirect("login.aspx");
        //    }
        //}
    }
}