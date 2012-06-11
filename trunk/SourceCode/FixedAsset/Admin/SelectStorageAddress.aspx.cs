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
    public partial class SelectStorageAddress : System.Web.UI.Page
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
            if(!IsPostBack)
            {
                this.ClearBrowserCache();
            }
        }
        protected void ucSelectStorageAddress_SelectedStorageNodeChange(object sender, EventArgs e)
        {
            var currentInfo =
                VStorageAddress.Where(p =>
                    p.Storagetitle == ucSelectStorageAddress.Storagetitle &&
                    p.Storageid == ucSelectStorageAddress.StorageId).FirstOrDefault();
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
            if(string.IsNullOrEmpty(ucSelectStorageAddress.StorageId))
            {
                UIHelper.AlertMessage(UpdatePanel1,"请选择存放地点!");
                return;
            }
            var content=new StringBuilder();
            content.Append(ucSelectStorageAddress.Storagetitle).Append(",");
            content.Append(ucSelectStorageAddress.Subcompanyid).Append(",");
            content.Append(ucSelectStorageAddress.Subcompanyname).Append(",");
            content.Append(ucSelectStorageAddress.StorageId).Append(",");
            content.Append(ucSelectStorageAddress.Storagename);

            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "SelectStorageAddress", "setCookie('dialogReturn_key','" + content.ToString() + "',1);CloseTopDialogFrame();", true);
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