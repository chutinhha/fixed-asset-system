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
        protected string Assetno
        {
            get
            {
                if (ViewState["Assetno"] == null)
                {
                    ViewState["Assetno"] = string.Empty;
                }
                return ViewState["Assetno"].ToString();
            }
            set { ViewState["Assetno"] = value; }
        }
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
        protected List<Vstorageaddress> VStorageAddress
        {
            get
            {
                if (Session["VStorageAddress"] == null)
                {
                    Session["VStorageAddress"] = new List<Vstorageaddress>();
                }
                return Session["VStorageAddress"] as List<Vstorageaddress>;
            }
        }
        protected IAssetService AssetService
        {
            get { return new AssetService(); }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if(!IsPostBack)
            {
                Assetno = PageUtility.GetQueryStringValue("Assetno");
                litState.Text = EnumUtil.RetrieveEnumDescript(AssetState.NoUse);
                InitManageMode(ddlManagementModel, false);
                InitFinanceCategory(ddlFinancecategory, false);
                LoadAssetCategory();
                if(!string.IsNullOrEmpty(Assetno))
                {
                    var assetInfo = AssetService.RetrieveAssetByAssetno(Assetno);
                    if(assetInfo!=null)
                    {
                        ReadEntityToControl(assetInfo);
                    }
                    else
                    {
                        LoadSubAssetCategory();
                    }
                }
                else
                {
                    LoadSubAssetCategory();
                }
            }
        }
        protected void ddlAssetCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAssetCategory.SelectedIndex >= 0)
            {
                LoadSubAssetCategory();
            }
        }
        protected void ucSelectStorageAddress_SelectedStorageNodeChange(object sender, EventArgs e)
        {
            //litStorage.Text = ucSelectStorageAddress.Storagename;
            var currentInfo =
                VStorageAddress.Where(
                    p =>
                    p.Storagetitle == ucSelectStorageAddress.Storagetitle &&
                    p.Storageid == ucSelectStorageAddress.StorageId).FirstOrDefault();
            if (currentInfo == null)
            {
                litStorage.Text = string.Empty;
            } 
            else
            {
                litStorage.Text = currentInfo.Storagename;
            }
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtAssetname.Text))
            {
                UIHelper.Alert(this.UpdatePanel1, "请输入设备名称!");
                return;
            }
            if(string.IsNullOrEmpty(txtAssetspecification.Text))
            {
                UIHelper.Alert(this.UpdatePanel1, "请输入设备规格!");
                return;
            }
            if(!ucPurchasedate.DateValue.HasValue)
            {
                UIHelper.Alert(this.UpdatePanel1, "请选择购入日期!");
                return;
            }
            if (string.IsNullOrEmpty(ucSelectSubCompany.SubcompanyId))
            {
                UIHelper.Alert(UpdatePanel1, "请选择分公司!");
                return;
            }
            if (string.IsNullOrEmpty(ucSelectSupplier.Supplierid))
            {
                UIHelper.Alert(UpdatePanel1, "请选择供应商!");
                return;
            }
            Asset assetInfo = null;
            if(string.IsNullOrEmpty(Assetno))
            {
                assetInfo=new Asset();
            }
            else
            {
                assetInfo = AssetService.RetrieveAssetByAssetno(Assetno);
                if(assetInfo==null){assetInfo=new Asset();}
            }
            WriteControlValueToEntity(assetInfo);
            assetInfo.State = AssetState.NoUse;
            AssetService.SaveAssetInfo(assetInfo);
            UIHelper.AlertMessageGoToURL(this.UpdatePanel1, "保存成功!", ResolveUrl("~/Admin/EquipmentList.aspx"));
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
            //txtStorageflag.Text = asset.Storageflag;
            //txtStorage.Text = asset.Storage;  //存放地点要做特殊处理
            ucSelectStorageAddress.Storagetitle = asset.Storageflag;
            ucSelectStorageAddress.StorageId = asset.Storage; //存放地点
            litState.Text = EnumUtil.RetrieveEnumDescript(asset.State);//设备状态
            txtDepreciationyear.Text = asset.Depreciationyear.ToString(); //设备年限
            txtUnitprice.Text = asset.Unitprice.ToString();
            txtBrand.Text = asset.Brand;
            ddlManagementModel.SelectedValue = asset.Managemode.ToString();
            ddlManagementModel.SelectedValue = asset.Financecategory.ToString();
            ucSelectSupplier.Supplierid = asset.Supplierid;
            ucPurchasedate.DateValue = asset.Purchasedate;
            txtAssetspecification.Text = asset.Assetspecification;
            ucSelectSubCompany.SubcompanyId = asset.Subcompany;
        } 
        protected void WriteControlValueToEntity(Asset asset)
        {
            asset.Assetno = litAssetno.Text;
            asset.Subcompany = ucSelectSubCompany.SubcompanyId;
            asset.Assetcategoryid = ddlSubAssetCategory.SelectedValue;
            asset.Assetname = txtAssetname.Text;
            
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
            asset.Supplierid = ucSelectSupplier.Supplierid;
            if(ucPurchasedate.DateValue.HasValue)
            {
                asset.Purchasedate = ucPurchasedate.DateValue.Value;
                if (asset.Depreciationyear > 0)
                {
                    asset.Expireddate = asset.Purchasedate.Value.AddYears((int)asset.Depreciationyear);
                }
            }
            asset.Assetspecification = txtAssetspecification.Text;
            asset.Storageflag = ucSelectStorageAddress.Storagetitle;
            asset.Storage =ucSelectStorageAddress.StorageId;
        }
        #endregion
    }
}