using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using SeallNet.Utility;

namespace FixedAsset.Web.Admin
{
    public partial class Report_AssetState : BasePage
    {
        protected IAssetService AssetService
        {
            get
            {
                return new AssetService();
            }
        }
        protected override void OnLoad(EventArgs e)
        {
             base.OnLoad(e);
             if (!IsPostBack)
             {
                 LoadData();
             }
        }

        protected void LoadData()
        {
            var list = AssetService.ReportAssetState();
            DataTable dt = new System.Data.DataTable();
            dt.Columns.Add("State");
            dt.Columns.Add("AssetCount");

            System.Data.DataRow drInUse = dt.NewRow();
            drInUse["State"] = EnumUtil.RetrieveEnumDescript(AssetState.InUse);
            drInUse["AssetCount"] = 0; 
            var currentInfo = list.Where(p => p.State == AssetState.InUse).FirstOrDefault();
            if (currentInfo != null) { drInUse["AssetCount"] = currentInfo.Currentcount; }
            dt.Rows.Add(drInUse);

            var drNoUse = dt.NewRow();
            drNoUse["State"] = EnumUtil.RetrieveEnumDescript(AssetState.NoUse);
            drNoUse["AssetCount"] = 0;
            currentInfo = list.Where(p => p.State == AssetState.NoUse).FirstOrDefault();
            if (currentInfo != null) { drNoUse["AssetCount"] = currentInfo.Currentcount; }
            dt.Rows.Add(drNoUse);

            var drScrapped = dt.NewRow();
            drScrapped["State"] = EnumUtil.RetrieveEnumDescript(AssetState.Scrapped);
            drScrapped["AssetCount"] = 0;
            currentInfo = list.Where(p => p.State == AssetState.Scrapped).FirstOrDefault();
            if (currentInfo != null) { drScrapped["AssetCount"] = currentInfo.Currentcount; }
            dt.Rows.Add(drScrapped);
            
            rptAssetsList.DataSource = dt;
            rptAssetsList.DataBind();
        }
    }
}