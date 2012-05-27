using System;
using System.Collections.Generic;
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
    public partial class NewEquipment : BasePage
    {
        #region Properties
        protected IAssetcategoryService AssetcategoryService
        {
            get { return new AssetcategoryService(); }
        }
        protected List<Assetcategory> AssetCategories
        {
            get
            {
                if (Session["AssetCategories"] == null)
                {
                    Session["AssetCategories"] = new List<Assetcategory>();
                }
                return Session["AssetCategories"] as List<Assetcategory>;
            }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if(!IsPostBack)
            {
                litState.Text = EnumUtil.RetrieveEnumDescript(AssetState.NoUse);
                InitManageMode(ddlManagementModel, false);
                InitFinanceCategory(ddlFinancecategory, true);
                LoadAssetCategory();
            }
        }
        protected void ddlAssetCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAssetCategory.SelectedIndex >= 0)
            {
                LoadSubAssetCategory();
            }
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }
        #endregion

        #region Methods
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
                ddlSubAssetCategory.DataTextField = "Assetcategoryname";
                ddlSubAssetCategory.DataValueField = "Assetcategoryid";
                ddlSubAssetCategory.DataSource = subAssetCategories;
                ddlSubAssetCategory.DataBind();
            }
        }
        protected void ReadEntityToControl(Asset asset)
        {
            litAssetno.Text = asset.Assetno;
            var subCategory = AssetCategories.Where(p => p.Assetcategoryid == asset.Assetcategoryid).FirstOrDefault();
            if (subCategory != null)
            {
                ddlAssetCategory.SelectedValue = subCategory.Assetparentcategoryid;
                LoadSubAssetCategory();
                ddlSubAssetCategory.SelectedValue = asset.Assetcategoryid;
            }
            else
            {
                LoadSubAssetCategory();
            }
            txtAssetname.Text = asset.Assetname;
            txtStorage.Text = asset.Storage;  //存放地点要做特殊处理
            litState.Text = EnumUtil.RetrieveEnumDescript(asset.State);//设备状态
            txtDepreciationyear.Text = asset.Depreciationyear.ToString(); //设备年限
            txtUnitprice.Text = asset.Unitprice.ToString();
            txtBrand.Text = asset.Brand;
            ddlManagementModel.SelectedValue = asset.Managemode.ToString();
            ddlManagementModel.SelectedValue = asset.Financecategory.ToString();
            //txtSupplierid.Text = asset.Supplierid;
            if (asset.Purchasedate.HasValue)
            {
                txtPurchasedate.Text = asset.Purchasedate.Value.ToString(UiConst.DateFormat);
            }
            txtAssetspecification.Text = asset.Assetspecification;
            //txtStorageflag.Text = asset.Storageflag;
        }

        protected void WriteControlValueToEntity(Asset asset)
        {
            asset.Assetno = litAssetno.Text;
            asset.Assetcategoryid = ddlSubAssetCategory.SelectedValue;
            asset.Assetname = txtAssetname.Text;
            asset.Storage = txtStorage.Text;
            decimal depreciationyear = 0;
            if (decimal.TryParse(txtDepreciationyear.Text, out depreciationyear))
            {
                asset.Depreciationyear = depreciationyear;
            }
            decimal unitprice = 0;
            if (decimal.TryParse(txtUnitprice.Text, out unitprice))
            {
                asset.Unitprice = unitprice;
            }
            asset.Brand = txtBrand.Text;
            asset.Managemode = (ManageMode) Enum.Parse(typeof (ManageMode), ddlManagementModel.SelectedValue); 
            asset.Financecategory = (FinanceCategory)Enum.Parse(typeof(FinanceCategory), ddlFinancecategory.SelectedValue);
            //asset.Supplierid = txtSupplierid.Text;
            DateTime purchasedate = DateTime.MinValue;
            if (DateTime.TryParse(txtPurchasedate.Text, out purchasedate))
            {
                asset.Purchasedate = purchasedate;
                if(asset.Depreciationyear>0)
                {
                    asset.Expireddate = asset.Purchasedate.Value.AddYears((int)asset.Depreciationyear);
                }
            }
            asset.Assetspecification = txtAssetspecification.Text;
            //asset.Storageflag = txtStorageflag.Text;
        }
        #endregion
    }
}