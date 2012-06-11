using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.IServices;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        #region Properties
        protected string Loginid
        {
            get
            {
                if (ViewState["Loginid"] == null)
                {
                    ViewState["Loginid"] = string.Empty;
                }
                return ViewState["Loginid"].ToString();
            }
            set { ViewState["Loginid"] = value; }
        }
        protected string Userpassword
        {
            get
            {
                if (ViewState["Userpassword"] == null)
                {
                    ViewState["Userpassword"] = string.Empty;
                }
                return ViewState["Userpassword"].ToString();
            }
            set { ViewState["Userpassword"] = value; }
        }

        public ITuserService TuserService
        {
            get
            {
                return new TuserService();
            }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if(!IsPostBack)
            {
                Loginid = PageUtility.GetQueryStringValue("Loginid");
                Userpassword = PageUtility.GetQueryStringValue("Userpassword");
                if(!string.IsNullOrEmpty(Loginid)&&!string.IsNullOrEmpty(Userpassword))
                {
                    var errorMsg = string.Empty;
                    bool isSuccess = TuserService.ValidateUserLogin(Loginid, Userpassword, out errorMsg);
                    if (isSuccess)
                    {
                        Response.Redirect("main.aspx");
                    }
                }
                else
                {
                    //txtLoginid.Text = "admin";
                    //txtUserpassword.Text = "admin";
                }
            }
        }
        protected void Login_Click(object sender, EventArgs e)
        {
            
            if(string.IsNullOrEmpty(txtLoginid.Text))
            {
                Page.RegisterStartupScript("ShowMessage", "<script language='javascript' type='text/javascript'>alert('请输入用户名!')</script>");
                return;
            }
            if (string.IsNullOrEmpty(txtUserpassword.Text))
            {
                Page.RegisterStartupScript("ShowMessage", "<script language='javascript' type='text/javascript'>alert('请输入密码!')</script>");
                return;
            }
            var errorMsg = string.Empty;
            bool isSuccess = TuserService.ValidateUserLogin(txtLoginid.Text.Trim(), txtUserpassword.Text, out errorMsg);
            if(isSuccess)
            {
                Response.Redirect("main.aspx");
            }
            else
            {
                Page.RegisterStartupScript("ShowMessage", string.Format("<script language='javascript' type='text/javascript'>alert('{0}!')</script>",errorMsg)); 
            }
        }
        #endregion
    }
}