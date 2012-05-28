using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Domain;

namespace FixedAsset.Web.Admin.UserControl
{
    public partial class ucSelectStorageAddress : System.Web.UI.UserControl
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
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if(!IsPostBack)
            {
                
            }
        }
        #endregion

        #region Methods
        protected void InitData()
        {
            VStorageAddress.Clear();
            var list = AssetService.RetrieveAllVstorageaddress();
            VStorageAddress.AddRange(list);
        }
        #endregion
    }
}