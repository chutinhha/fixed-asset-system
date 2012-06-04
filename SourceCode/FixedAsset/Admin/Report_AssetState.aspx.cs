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
            List<Asset> list = AssetService.RetrieveAllAsset();
            System.Data.DataTable dt = new System.Data.DataTable();
            dt.Columns.Add("State");
            dt.Columns.Add("AssetCount");
            System.Data.DataRow drInUse = dt.NewRow();
            drInUse["State"] = "在用";
            drInUse["AssetCount"] = list.Where(p => p.State.Equals(FixedAsset.Domain.AssetState.InUse)).Count();
            dt.Rows.Add(drInUse);
            System.Data.DataRow drNoUse = dt.NewRow();
            drNoUse["State"] = "未用";
            drNoUse["AssetCount"] = list.Where(p => p.State.Equals(FixedAsset.Domain.AssetState.NoUse)).Count();
            dt.Rows.Add(drNoUse);
            System.Data.DataRow drScrapped = dt.NewRow();
            drScrapped["State"] = "报废";
            drScrapped["AssetCount"] = list.Where(p => p.State.Equals(FixedAsset.Domain.AssetState.Scrapped)).Count();
            dt.Rows.Add(drScrapped);
            System.Data.DataRow drLogicalDeleted = dt.NewRow();
            drLogicalDeleted["State"] = "已废除";
            drLogicalDeleted["AssetCount"] = list.Where(p => p.State.Equals(FixedAsset.Domain.AssetState.LogicalDeleted)).Count();
            dt.Rows.Add(drLogicalDeleted);
            rptAssetsList.DataSource = dt;
            rptAssetsList.DataBind();
        }
    }
}