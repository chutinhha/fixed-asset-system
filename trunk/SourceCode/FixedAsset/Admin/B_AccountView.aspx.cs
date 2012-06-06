using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Domain;
namespace FixedAsset.Web.Admin
{
    public partial class B_AccountView : BasePage
    {
        #region Properties

        protected string AssetNo
        {
            get
            {
                if (ViewState["AssetNo"] == null)
                {
                    ViewState["AssetNo"] = string.Empty;
                }
                return ViewState["AssetNo"].ToString();
            }
            set { ViewState["AssetNo"] = value; }
        }
        protected IAssetService AssetService
        {
            get
            {
                return new AssetService();
            }
        }

        protected IBaccountService BaccountService
        {
            get
            {
                return new BaccountService();
            }
        }
       
        #endregion
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            AssetNo = PageUtility.GetQueryStringValue("AssetNo");
            if (!string.IsNullOrEmpty(AssetNo))
            {
                Baccount baccountinfo = BaccountService.RetrieveBaccountByAssetno(AssetNo);
                if (baccountinfo != null)
                {
                    ReadEntityToControl(baccountinfo);
                  
                }
            }
        }

        protected void ReadEntityToControl(Baccount baccountinfo)
        {
            lblAssetNo.Text = baccountinfo.Assetno;
            if (baccountinfo.Createddate.HasValue)
            {

                litApplydate.Text = Convert.ToDateTime(baccountinfo.Createddate.Value).ToString("yyyy-MM-dd"); ;
            }
            if (baccountinfo.Accounteddate.HasValue)
            {
                lblAccountDate.Text = Convert.ToDateTime(baccountinfo.Accounteddate).ToString("yyyy-MM-dd");
            }
            lblAssetName.Text = baccountinfo.Assetname;
            litApplyuser.Text = baccountinfo.Accounteduser;
            litCreateduser.Text = baccountinfo.Createduser;
        }
    }
}