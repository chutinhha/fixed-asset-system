using System;
using FixedAsset.IServices;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin.UserControl
{
    public partial class ucSeletedSystem : System.Web.UI.UserControl
    {
        #region Properties
        public string Assetcategoryid
        {
            get
            {
                if (ViewState["Assetcategoryid"] == null)
                {
                    ViewState["Assetcategoryid"] = string.Empty;
                }
                return ViewState["Assetcategoryid"].ToString();
            }
            set { ViewState["Assetcategoryid"] = value; }
        }
        protected IAssetsupplierService AssetsupplierService
        {
            get { return new AssetsupplierService(); }
        }
        #endregion

        #region Events
        public event EventHandler SelectedAssetCategoryChange;
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                LoadData();
                if(SelectedAssetCategoryChange!=null){SelectedAssetCategoryChange(this,new EventArgs());}
            }
        }
        protected void ddlSystemList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSystemList.SelectedIndex >= 0)
            {
                Assetcategoryid = ddlSystemList.SelectedValue;
            }
        }
        #endregion

        protected void LoadData()
        {
            var list = AssetsupplierService.RetrieveAllAssetsupplier();
            ddlSystemList.DataSource = list;
            ddlSystemList.DataTextField = @"System";
            ddlSystemList.DataValueField = @"Assetcategoryid";
            ddlSystemList.DataBind(); 
        }
    }
}