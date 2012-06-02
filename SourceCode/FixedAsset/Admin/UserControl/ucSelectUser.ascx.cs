using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.IServices;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin.UserControl
{
    public partial class ucSelectUser : System.Web.UI.UserControl
    {
        public bool IsShowUserName
        {
            get
            {
                if (ViewState["IsShowUserName"] == null)
                {
                    ViewState["IsShowUserName"] = false;
                }
                return bool.Parse(ViewState["IsShowUserName"].ToString());
            }
            set { ViewState["IsShowUserName"] = value; }
        }
        public string UserId
        {
            get
            {
                if (ViewState["Id"] == null)
                {
                    ViewState["Id"] = string.Empty;
                }
                return ViewState["Id"].ToString();
            }
            set { ViewState["Id"] = value; }
        }
        public string  Username
        {
            get
            {
                if(txtUsername.Text.Trim()!=UserId)
                {
                    UserId = string.Empty;
                }
                return txtUsername.Text.Trim();
            }
            set { txtUsername.Text = value; }
        }
        protected ITuserService TuserService
        {
            get
            {
                return new TuserService();
            }
        }
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(UserId))
                {
                    LoadData();
                }
            }
        }
        protected void BtnRetrieveUser_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(hfId.Value))
            {
                UserId = hfId.Value;
                LoadData();
            }
        }
        protected void LoadData()
        {
            var currentInfo = TuserService.RetrieveTuserById(UserId);
            if(currentInfo!=null)
            {
                txtUsername.Text = currentInfo.Username;
            }
        }
    }
}