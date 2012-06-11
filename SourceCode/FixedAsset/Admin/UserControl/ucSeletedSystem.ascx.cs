using System;
using System.Linq;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin.UserControl
{
    public partial class ucSeletedSystem : System.Web.UI.UserControl
    {
        #region Properties

        public bool Enabled
        {
            get { return ddlSystemList.Visible; }
            set
            {
                ddlSystemList.Visible = value;
                litSystemName.Visible = !value;
            }
        }
        public string Assetcategoryid
        {
            get
            {
                if (ddlSystemList.SelectedIndex >= 0)
                {
                    return ddlSystemList.SelectedValue;
                }
                else
                {
                    return string.Empty;
                }
            }
            set
            {
                if(ddlSystemList.Items.Count==0)
                {
                    LoadData();
                }
                for (int i = 0; i < ddlSystemList.Items.Count; i++)
                {
                    if (ddlSystemList.Items[i].Value.Equals(value))
                    {
                        ddlSystemList.SelectedIndex = i;
                        litSystemName.Text = ddlSystemList.SelectedItem.Text;
                        break;
                    }
                }
            }
        }
        protected IAssetcategoryService AssetcategoryService
        {
            get { return new AssetcategoryService(); }
        }
        //protected IAssetsupplierService AssetsupplierService
        //{
        //    get { return new AssetsupplierService(); }
        //}
        #endregion

        #region Events
        public event EventHandler SelectedAssetCategoryChange;
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                LoadData();
                if(SelectedAssetCategoryChange!=null)
                {
                    SelectedAssetCategoryChange(this,new EventArgs());
                }
            }
        }
        protected void ddlSystemList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSystemList.SelectedIndex >= 0)
            {
                Assetcategoryid = ddlSystemList.SelectedValue;
                if (SelectedAssetCategoryChange != null)
                {
                    SelectedAssetCategoryChange(this, new EventArgs());
                }
            }
        }
        #endregion

        protected void LoadData()
        {
            //var list = AssetsupplierService.RetrieveAllAssetsupplier();
            //if (AssetCategories.Count == 0)
            //{
            var list = AssetcategoryService.RetrieveAllAssetcategory();
            //    AssetCategories.AddRange(list);
            //}
            var categories = list.Where(p => string.IsNullOrEmpty(p.Assetparentcategoryid)).ToList();
            //categories.Insert(0, new Assetcategory() { Assetcategoryid = string.Empty, Assetcategoryname = "全部" });
            //ddlAssetCategory.DataTextField = "Assetcategoryname";
            //ddlAssetCategory.DataValueField = "Assetcategoryid";
            //ddlAssetCategory.DataSource = categories;
            //ddlAssetCategory.DataBind();
            ddlSystemList.DataSource = categories;
            ddlSystemList.DataTextField = @"System";
            ddlSystemList.DataValueField = @"Assetcategoryid";
            ddlSystemList.DataBind(); 
        }
    }
}