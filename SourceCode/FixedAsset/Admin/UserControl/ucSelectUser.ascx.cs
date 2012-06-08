using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.IServices;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin.UserControl
{
    public partial class ucSelectUser : System.Web.UI.UserControl
    {
        public string ClientScriptId
        {
            get
            {
                if (ViewState["ClientScriptId"] == null)
                {
                    ViewState["ClientScriptId"] = Guid.NewGuid().ToString("N").Substring(0,6);
                }
                return ViewState["ClientScriptId"].ToString();
            }
            set { ViewState["ClientScriptId"] = value; }
        }
        public bool IsShowUserName
        {
            get { return txtUsername.Enabled; }
            set
            {
                txtUsername.Enabled = !value;
                btnSelectSingleUser.Visible = !value;
            }
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
                btnSelectSingleUser.Attributes.Add("onclick", string.Format("javascript:ShowTopDialogFrame('用户选择', '{0}','Select{1}SingleUser()',680,400);return false;", ResolveUrl("~/Admin/SelectSingleUsers.aspx"), this.ID));
                if (!string.IsNullOrEmpty(UserId))
                {
                    LoadData();
                }
            }
            RegisterRefreshMethod();
        }
        protected void RegisterRefreshMethod()
        {
            UpdatePanel updatePanel = null;
            foreach (var control in this.Page.Controls)
            {
                if (control is UpdatePanel)
                {
                    updatePanel = control as UpdatePanel;
                    break;
                }
            }
            var script = new StringBuilder();
            script.AppendFormat("        function Select{0}SingleUser()", this.ID).AppendLine();
            script.AppendLine("        {");
            script.AppendLine(@"            var returnValue = getCookie(""dialogReturn_key"");");
            script.AppendLine("            if (returnValue != null)");
            script.AppendLine("            {");
            script.AppendFormat(@"                document.getElementById(""{0}"").value = returnValue;",hfId.ClientID).AppendLine();
            script.AppendFormat(@"                document.getElementById(""{0}"").click();",BtnRetrieveUser.ClientID).AppendLine();
            script.AppendLine(@"                setCookie(""dialogReturn_key"", null);");
            script.AppendLine("            }");
            script.AppendLine("        }");
            
            if (updatePanel == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), Guid.NewGuid().ToString("N"),
                                                    script.ToString(), true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(updatePanel, updatePanel.GetType(), Guid.NewGuid().ToString("N"), script.ToString(), true);
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