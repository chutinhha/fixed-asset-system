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
namespace FixedAsset.Web.Admin
{
    public partial class Report_AssetCategory : BasePage
    {
        protected IAssetService AssetService
        {
            get
            {
                return new AssetService();
            }
        }

        protected IAssetcategoryService AssetCategoryService
        {
            get
            {
                return new AssetcategoryService();
            }
        }
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                LoadData(0);
            }
        }

        protected void LoadData(int pageIndex)
        {
            List<Assetcategory> assetcategory = AssetCategoryService.RetrieveAllAssetcategory();
            var categories = assetcategory.Where(p => !string.IsNullOrEmpty(p.Assetparentcategoryid) && p.Assetparentcategoryid != Assetcategory.FixedAssetCategory).ToList();
            var parentcategories = assetcategory.Where(p => string.IsNullOrEmpty(p.Assetparentcategoryid) || p.Assetparentcategoryid == Assetcategory.FixedAssetCategory).ToList();
            var list = AssetService.ReportAssetCategory();
            var dt = new System.Data.DataTable();
            dt.Columns.Add("AssetCategory");
            dt.Columns.Add("AssetSubCategory");
            dt.Columns.Add("AssetCount");
            foreach (Assetcategory category in categories)
            {
                var dr = dt.NewRow();
                dr["AssetCategory"] = parentcategories.Where(p => p.Assetcategoryid.ToLower().Equals(category.Assetparentcategoryid.ToLower())).Select(obj => obj.Assetcategoryname).FirstOrDefault();
                dr["AssetSubCategory"] = category.Assetcategoryname;
                dr["AssetCount"] = 0;
                var currentInfo = list.Where(p => p.Assetcategoryid == category.Assetcategoryid).FirstOrDefault();
                if(currentInfo!=null)
                {
                    dr["AssetCount"] = currentInfo.Currentcount;
                }
                dt.Rows.Add(dr);
            }
            rptAssetsCategoryList.DataSource = dt;
            rptAssetsCategoryList.DataBind();
        }
    }
}