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
    public partial class ucSelectStorageAddress2 : System.Web.UI.UserControl
    {
        #region Properties
        public string Storagetitle
        {
            get
            {
                if (ViewState["Storagetitle"] == null)
                {
                    ViewState["Storagetitle"] = string.Empty;
                }
                return ViewState["Storagetitle"].ToString();
            }
            set { ViewState["Storagetitle"] = value; }
        }
        public string Subcompanyid
        {
            get
            {
                if (ViewState["Subcompanyid"] == null)
                {
                    ViewState["Subcompanyid"] = string.Empty;
                }
                return ViewState["Subcompanyid"].ToString();
            }
            set { ViewState["Subcompanyid"] = value; }
        }
        public string Subcompanyname
        {
            get
            {
                if (ViewState["Subcompanyname"] == null)
                {
                    ViewState["Subcompanyname"] = string.Empty;
                }
                return ViewState["Subcompanyname"].ToString();
            }
            set { ViewState["Subcompanyname"] = value; }
        }
        public string StorageId
        {
            get
            {
                if (ViewState["StorageId"] == null)
                {
                    ViewState["StorageId"] = string.Empty;
                }
                return ViewState["StorageId"].ToString();
            }
            set { ViewState["StorageId"] = value; }
        }
        public string Storagename
        {
            get
            {
                if (ViewState["Storagename"] == null)
                {
                    ViewState["Storagename"] = string.Empty;
                }
                return ViewState["Storagename"].ToString();
            }
            set { ViewState["Storagename"] = value; }
        }
        protected IAssetService AssetService
        {
            get
            {
                return new AssetService();
            }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        protected void btnSelectStorageAddress_Click(object sender, EventArgs e)
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
            script.AppendFormat(@"ShowTopDialogFrame('存放地点选择', '{0}','SelectStorageAddress()',790,367);", ResolveUrl("~/Admin/SelectStorageAddress.aspx"));
            if (updatePanel == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ucSelectStorageAddress2",
                                                    script.ToString(), true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(updatePanel, updatePanel.GetType(), "ucSelectStorageAddress2", script.ToString(), true);
            }
        }
        protected void BtnRetrieveStorageAddress_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(hfStorageAddress.Value))
            {
                var values = hfStorageAddress.Value.Split(new char[] { ',' });
                Storagetitle = values[0];
                StorageId = values[3];
                LoadData();
            }
        }
        #endregion

        #region Methods
        protected void LoadData()
        {
            if (!string.IsNullOrEmpty(this.StorageId))
            {
                var currentInfo = AssetService.RetrieveVstorageaddressByStorageId(Storagetitle, StorageId);
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
        }
        #endregion
    }
}