using System;
using FixedAsset.IServices;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin.UserControl
{
    public partial class ucSeletedSystem : System.Web.UI.UserControl
    {
        #region Properties
        public bool Enabled
        {
            get { return ddlSystemList.Enabled; }
            set { ddlSystemList.Enabled = value; }
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
                        break;
                    }
                }
            }
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
            var list = AssetsupplierService.RetrieveAllAssetsupplier();
            ddlSystemList.DataSource = list;
            ddlSystemList.DataTextField = @"System";
            ddlSystemList.DataValueField = @"Assetcategoryid";
            ddlSystemList.DataBind(); 
        }
    }
}