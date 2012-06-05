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
    public partial class Asset_Scrapped : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AssetCategories.Clear();
                LoadAssetCategory();
                LoadSubAssetCategory();
                LoadData(0);
            }
        }

        #region Properties
        protected IAssetcategoryService AssetcategoryService
        {
            get { return new AssetcategoryService(); }
        }
        protected IAssetService AssetService
        {
            get
            {
                return new AssetService();
            }
        }
        protected IAssetscrappedService AssetscrappedService
        {
            get
            {
                return new AssetscrappedService();
            }
        }
        protected List<Assetcategory> AssetCategories
        {
            get
            {
                if (Session["EquipmentListAssetCategories"] == null)
                {
                    Session["EquipmentListAssetCategories"] = new List<Assetcategory>();
                }
                return Session["EquipmentListAssetCategories"] as List<Assetcategory>;
            }
        }
        #endregion

        protected void ddlAssetCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAssetCategory.SelectedIndex > 0)
            {
                LoadSubAssetCategory();
            }
            else if (ddlAssetCategory.SelectedIndex == 0)
            {
                ddlSubAssetCategory.Items.Clear();
            }
        }

        protected void LoadData(int pageIndex)
        {
            var search = new AssetSearch();
            search.Assetno = txtSrchAssetno.Text.Trim();
            search.Assetname = txtSrchAssetname.Text.Trim();

            if (ddlAssetCategory.SelectedIndex > 0)
            {
                if (ddlSubAssetCategory.SelectedIndex > 0)
                {
                    search.Assetcategoryid = ddlSubAssetCategory.SelectedValue;
                }
                else if (ddlSubAssetCategory.SelectedIndex == 0)
                {
                    search.Assetcategoryid = ddlAssetCategory.SelectedValue;
                }
            }
            if (ucStartPurchasedate.DateValue.HasValue)
            {
                search.StartPurchasedate = ucStartPurchasedate.DateValue.Value;
            }
            if (ucEndPurchasedate.DateValue.HasValue)
            {
                search.EndPurchasedate = ucEndPurchasedate.DateValue.Value;
            }
            if (ucStartExpireddate.DateValue.HasValue)
            {
                search.StartExpireddate = ucStartExpireddate.DateValue.Value;
            }
            if (ucEndExpireddate.DateValue.HasValue)
            {
                search.EndExpireddate = ucEndExpireddate.DateValue.Value;
            }

            int recordCount = 0;
            //var list = AssetscrappedService.RetrieveAssetscrappedsRecord(search, pageIndex, pcData.PageSize, out recordCount);
            rptScrappedList.DataSource = null;
            rptScrappedList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }

        protected void LoadAssetCategory()
        {
            if (!IsPostBack)
            {
                if (AssetCategories.Count == 0)
                {
                    var list = AssetcategoryService.RetrieveAllAssetcategory();
                    AssetCategories.AddRange(list);
                }
                var categories = AssetCategories.Where(p => string.IsNullOrEmpty(p.Assetparentcategoryid)).ToList();
                categories.Insert(0, new Assetcategory() { Assetcategoryid = string.Empty, Assetcategoryname = "全部" });
                ddlAssetCategory.DataTextField = "Assetcategoryname";
                ddlAssetCategory.DataValueField = "Assetcategoryid";
                ddlAssetCategory.DataSource = categories;
                ddlAssetCategory.DataBind();
            }
        }
        protected void LoadSubAssetCategory()
        {
            if (ddlAssetCategory.SelectedIndex >= 0)
            {
                var subAssetCategories =
                    AssetCategories.Where(p => p.Assetparentcategoryid == ddlAssetCategory.SelectedValue).ToList();
                subAssetCategories.Insert(0, new Assetcategory() { Assetcategoryid = string.Empty, Assetcategoryname = "全部" });
                ddlSubAssetCategory.DataTextField = "Assetcategoryname";
                ddlSubAssetCategory.DataValueField = "Assetcategoryid";
                ddlSubAssetCategory.DataSource = subAssetCategories;
                ddlSubAssetCategory.DataBind();
            }
        }

        protected void rptScrappedList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            LoadData(e.PageIndex);
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            LoadData(0);
        }

    }
}