using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin
{

    public partial class Report_AssetIntall :BasePage
    {
        #region Properties
        protected IAssetService AssetService
        {
            get
            {
                return new AssetService();
            }
        }
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
        protected void ucSelectStorageAddress_SelectedStorageNodeChange(object sender, EventArgs e)
        {
            //ucSelectStorageAddress.StorageId
            //ucSelectStorageAddress.Storagetitle
            LoadCurrentData();
        }
        #endregion

        #region Methods  
        protected void LoadCurrentData()
        {

        }
        #endregion
    }
}