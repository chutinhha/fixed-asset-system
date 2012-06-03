using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;

namespace FixedAsset.Web.Admin
{
    public partial class SelectSingleProject : System.Web.UI.Page
    {
        #region Properties
        protected List<Vstorageaddress> VStorageAddress
        {
            get
            {
                if (Session["VStorageAddress"] == null)
                {
                    Session["VStorageAddress"] = new List<Vstorageaddress>();
                }
                return Session["VStorageAddress"] as List<Vstorageaddress>;
            }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                ClearBrowserCache();
            }
        }
        protected void ucSelectProjectForTree_SelectedStorageNodeChange(object sender, EventArgs e)
        {
            var currentInfo = VStorageAddress.Where(p => p.Storagetitle == ucSelectProjectForTree.Storagetitle && p.Storageid == ucSelectProjectForTree.StorageId).FirstOrDefault();
            if (currentInfo == null)
            {
                litStorage.Text = string.Empty;
            }
            else
            {
                if (string.IsNullOrEmpty(currentInfo.Subcompanyname))
                {
                    litStorage.Text = currentInfo.Storagename;
                }
                else if (currentInfo.Subcompanyname != currentInfo.Storagename)
                {
                    litStorage.Text = string.Format(@"{0}->{1}", currentInfo.Subcompanyname, currentInfo.Storagename);
                }
                else
                {
                    litStorage.Text = currentInfo.Storagename;
                }
            }
        }
        protected void btnOk_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ucSelectProjectForTree.StorageId))
            {
                UIHelper.AlertMessage(UpdatePanel1, "选中分公司或项目体!");
                return;
            }
            var content = new StringBuilder();
            content.Append(ucSelectProjectForTree.Storagetitle).Append(",");
            content.Append(ucSelectProjectForTree.Subcompanyid).Append(",");
            content.Append(ucSelectProjectForTree.Subcompanyname).Append(",");
            content.Append(ucSelectProjectForTree.StorageId).Append(",");
            content.Append(ucSelectProjectForTree.Storagename);
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "SelectSingleProject", "setCookie('dialogReturn_key','" + content.ToString() + "',1);CloseTopDialogFrame();", true);
        }
        #endregion

        #region Methods
        protected void ClearBrowserCache()
        {
            Response.Buffer = true;
            Response.Expires = 0;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
        }
        #endregion
    }
}