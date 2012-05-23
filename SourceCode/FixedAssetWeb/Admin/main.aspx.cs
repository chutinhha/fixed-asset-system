public partial class Admin_main : System.Web.UI.Page
{
    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    if (!IsPostBack)
    //    {
    //        //加载当前Session信息
    //        UsersAndRoleAndApproveAndWAIT enUser = new UsersAndRoleAndApproveAndWAIT();
    //        enUser = (UsersAndRoleAndApproveAndWAIT)Session["Login_user"];
    //        lb_userName.Text = enUser.Username;
    //        lb_userRole.Text = enUser.UserRole.Count > 0 ? ((SRoleEntity)enUser.UserRole[0]).Rolename : "";
    //        list_band(enUser);
    //    }
    //}
    ////加载菜单
    //protected void list_band(UsersAndRoleAndApproveAndWAIT enuser)
    //{
    //    string url = (string)Session["PreviousPageUrl"];
    //    DataTable dt = new DataTable();
    //    DataTable hdt = new DataTable();
    //    dt = SRoleDA.GetAll(enuser.UserRoleRights, out hdt);
    //    if (dt != null && dt.Rows.Count > 0)
    //    {
    //        StringBuilder htmlstr = new StringBuilder();
    //        StringBuilder htmlstr2 = new StringBuilder();
    //        for (int j = 0; j < hdt.Rows.Count; j++)
    //        {
    //            htmlstr.Append("<h1 class='type'><a href='javascript:void(0)'>" + hdt.Rows[j]["h"].ToString() + "</a></h1>");
    //            htmlstr.Append("<div class='content'>");
    //            htmlstr.Append("");
    //            htmlstr.Append("");
    //            htmlstr.Append("");
    //            htmlstr.Append(" <ul class='MM'>");
    //            DataRow[] pRow = dt.Select("h='" + hdt.Rows[j]["h"].ToString() + "'", "");
    //            for (int i = 0; i < pRow.Length; i++)
    //            {
    //                htmlstr.Append("<li><a href='" + pRow[i]["functionurl"].ToString() + "' target='aa'>" + pRow[i]["modulename"].ToString() + "</a></li>");

    //            }
    //            htmlstr.Append("</ul></div>");
    //        }
    //        lb_menu.Text = htmlstr.ToString();
    //    }
    //}
    ////退出系统
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