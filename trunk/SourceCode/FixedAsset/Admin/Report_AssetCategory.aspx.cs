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
            var categories = assetcategory.Where(p => !string.IsNullOrEmpty(p.Assetparentcategoryid)).ToList();
            var parentcategories = assetcategory.Where(p => string.IsNullOrEmpty(p.Assetparentcategoryid)).ToList();
            List<Asset> list = AssetService.RetrieveAllAsset();
            System.Data.DataTable dt = new System.Data.DataTable();
            dt.Columns.Add("AssetCategory");
            dt.Columns.Add("AssetSubCategory");
            dt.Columns.Add("AssetCount");
            foreach (Assetcategory category in categories)
            {
                System.Data.DataRow dr = dt.NewRow();
                dr["AssetCategory"] =parentcategories.Where(p=>p.Assetcategoryid.ToLower().Equals(category.Assetparentcategoryid.ToLower())).Select(obj=>obj.Assetcategoryname).FirstOrDefault();
                dr["AssetSubCategory"]= category.Assetcategoryname;
                dr["AssetCount"] = list.Where(p => p.Assetcategoryid.ToLower().Equals(category.Assetcategoryid.ToLower())).ToList().Count;
                dt.Rows.Add(dr);
            }
            int recordCount = 0;
            rptAssetsCategoryList.DataSource = dt;
            rptAssetsCategoryList.DataBind();
           // pcData.RecordCount = recordCount;
           // pcData.CurrentIndex = pageIndex;
        }

        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            LoadData(e.PageIndex);
        }
    }
}