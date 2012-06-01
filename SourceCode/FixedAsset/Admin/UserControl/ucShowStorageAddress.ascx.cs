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
    public partial class ucShowStorageAddress : System.Web.UI.UserControl
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
        #endregion

        #region Methods
        protected void LoadData()
        {
            if (!string.IsNullOrEmpty(StorageId))
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