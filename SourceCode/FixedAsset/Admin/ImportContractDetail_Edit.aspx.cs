using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Services;
using FixedAsset.IServices;
using FixedAsset.Domain;
using SeallNet.Utility;

namespace FixedAsset.Web.Admin
{
    public partial class ImportContractDetail_Edit : BasePage
    {
        #region Properties
        protected string Detailid
        {
            get
            {
                if (ViewState["Detailid"] == null)
                {
                    ViewState["Detailid"] = string.Empty;
                }
                return ViewState["Detailid"].ToString();
            }
            set { ViewState["Detailid"] = value; }
        }
        protected IProcurementcontractdetailService ProcurementcontractdetailService
        {
            get { return new ProcurementcontractdetailService(); }
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
        protected List<ImportAssetContractdetail> ImportAssetContractdetailContractDetail
        {
            get
            {
                if (Session["ImportAssetFromContract_Procurementcontractdetail"] == null)
                {
                    Session["ImportAssetFromContract_Procurementcontractdetail"] = new List<ImportAssetContractdetail>();
                }
                return Session["ImportAssetFromContract_Procurementcontractdetail"] as List<ImportAssetContractdetail>;
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
        #endregion

        #region Events
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            txtPlannumber.Attributes.Add("onblur", string.Format("return ValidateInt32(this,{0});", 1));
            txtPlannumber.Text = 1.ToString();
            txtPlannumber.Attributes.Add("style", "text-align:right;");
            txtUnitprice.Attributes.Add("onblur", string.Format("return ValidatePrice(this,{0});", 1));
            txtUnitprice.Text = 1.ToString();
            txtUnitprice.Attributes.Add("style", "text-align:right;");
        }
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                Detailid = PageUtility.GetQueryStringValue("Contractdetailid");
                litState.Text = EnumUtil.RetrieveEnumDescript(AssetState.NoUse);
                InitManageMode(ddlManagementModel, false);
                LoadAssetCategory();

                if (!string.IsNullOrEmpty(Detailid))
                {
                    var detailInfo = ImportAssetContractdetailContractDetail.Where(p => p.Contractdetailid == Detailid).FirstOrDefault();
                    if (detailInfo != null)
                    {
                        ReadEntityToControl(detailInfo);
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
        protected void ucSelectStorageAddress_SelectedStorageNodeChange(object sender, EventArgs e)
        {
            //if (string.IsNullOrEmpty(ucSelectStorageAddress.StorageId) || string.IsNullOrEmpty(ucSelectStorageAddress.Storagename))
            //{
            //    litStorage.Text = string.Empty;
            //}
            //else
            //{
            //    if (string.IsNullOrEmpty(ucSelectStorageAddress.Subcompanyname))
            //    {
            //        litStorage.Text = ucSelectStorageAddress.Storagename;
            //    }
            //    else if (ucSelectStorageAddress.Subcompanyname != ucSelectStorageAddress.Storagename)
            //    {
            //        litStorage.Text = string.Format(@"{0}->{1}", ucSelectStorageAddress.Subcompanyname, ucSelectStorageAddress.Storagename);
            //    }
            //    else
            //    {
            //        litStorage.Text = ucSelectStorageAddress.Storagename;
            //    }
            //}
            var currentInfo = VStorageAddress.Where(p => p.Storagetitle == ucSelectStorageAddress.Storagetitle &&
                    p.Storageid == ucSelectStorageAddress.StorageId).FirstOrDefault();
            if (currentInfo == null)
            {
                litStorage.Text = string.Empty;
            }
            else
            {
                if (string.IsNullOrEmpty(currentInfo.Subcompanyname))
                {
                    litStorage.Text = currentInfo.Storagename;
                }
                else if (currentInfo.Subcompanyname != currentInfo.Storagename)
                {
                    litStorage.Text = string.Format(@"{0}->{1}", currentInfo.Subcompanyname, currentInfo.Storagename);
                }
                else
                {
                    litStorage.Text = currentInfo.Storagename;
                }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlSubAssetCategory.SelectedIndex < 0)
            {
                UIHelper.Alert(this, "请添加设备分类信息！");
                return;
            }
            var detailInfo = ImportAssetContractdetailContractDetail.Where(p => p.Contractdetailid == Detailid).FirstOrDefault();
            if (detailInfo == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ImportContractDetail_Edit", "CloseTopDialogFrame();", true);
                return;
            }
            WriteControlValueToEntity(detailInfo);
            if (detailInfo.Unitprice <= 0)
            {
                UIHelper.Alert(this, "单价不能小于等于0！");
                return;
            }
            if (detailInfo.ImportNumber <= 0)
            {
                UIHelper.Alert(this, "导入数量不能小于等于0！");
                return;
            }
            if (detailInfo.ImportNumber>(detailInfo.Procurenumber-detailInfo.Inputnumber))
            {
                UIHelper.Alert(this, "可导入数量不能大于（采购数量-已验证登记数量）！");
                return;
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ImportContractDetail_Edit", "setCookie('dialogReturn_key','1',1);CloseTopDialogFrame();", true);
        }
        protected void ddlAssetCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAssetCategory.SelectedIndex >= 0)
            {
                LoadSubAssetCategory();
            }
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
                var categories = AssetCategories.Where(p => string.IsNullOrEmpty(p.Assetparentcategoryid) || p.Assetparentcategoryid == Assetcategory.FixedAssetCategory).ToList();
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
        protected void ReadEntityToControl(ImportAssetContractdetail detailInfo)
        {
            var subCategory = AssetCategories.Where(p => p.Assetcategoryid == detailInfo.Assetcategoryid).FirstOrDefault();
            if (subCategory != null)
            {
                ddlAssetCategory.SelectedValue = subCategory.Assetparentcategoryid;
                LoadSubAssetCategory();
                ddlSubAssetCategory.SelectedValue = detailInfo.Assetcategoryid;
            }
            else
            {
                LoadSubAssetCategory();
            }
            txtAssetname.Text = detailInfo.Assetname;
            txtAssetspecification.Text = detailInfo.Assetspecification;
            txtUnitprice.Text = detailInfo.Unitprice.ToString();
            txtPlannumber.Text = detailInfo.ImportNumber.ToString();//可导入的数量
            ucPurchasedate.DateValue = detailInfo.Purchasedate;//购入日
            txtBrand.Text = detailInfo.Brand;//品牌
        }
        protected void WriteControlValueToEntity(ImportAssetContractdetail detailInfo)
        {
            //detailInfo.Assetno = txtAssetno.Text;//设备编号
            //设备类别
            if (ddlSubAssetCategory.SelectedIndex >= 0)
            {
                detailInfo.Assetcategoryid = ddlSubAssetCategory.SelectedValue;
            };
            detailInfo.Assetname = txtAssetname.Text;//设备名称
            detailInfo.Storageflag =ucSelectStorageAddress.Storagetitle;//存放地点标识来源
            detailInfo.Storage = ucSelectStorageAddress.StorageId;//存放地点
            //detailInfo.State = state;//设备状态
            if(ucPurchasedate.DateValue.HasValue)
            {
                detailInfo.Purchasedate = ucPurchasedate.DateValue;//购入日期
            }
            decimal depreciationyear = 0;
            if (decimal.TryParse(txtDepreciationyear.Text, out depreciationyear))
            {
                detailInfo.Depreciationyear = depreciationyear;//折旧年限
                if(detailInfo.Purchasedate.HasValue)
                {
                  detailInfo.Expireddate = detailInfo.Purchasedate.Value.AddYears((int)depreciationyear);//折旧到期日期  
                }
            }
            decimal unitprice = 0;
            if (decimal.TryParse(txtUnitprice.Text, out unitprice))
            {
                detailInfo.Unitprice = unitprice;//单价
            }
            detailInfo.Brand = txtBrand.Text;//品牌
            decimal plannumber = 0;
            if (decimal.TryParse(txtPlannumber.Text, out plannumber))
            {
                detailInfo.ImportNumber = plannumber;
            }
            detailInfo.Managemode = (ManageMode)Enum.Parse(typeof(ManageMode), ddlManagementModel.SelectedValue);//管理模式
            //detailInfo.Financecategory = (FinanceCategory)Enum.Parse(typeof(FinanceCategory), ddlFinancecategory.SelectedValue); //财务类别(A帐:0B帐:1)
            detailInfo.Assetspecification = txtAssetspecification.Text;//设备规格
            //detailInfo.Supplierid = txtSupplierid.Text;//供应商
            //detailInfo.Subcompany = txtSubcompany.Text;//分公司
            //detailInfo.Contractid = txtContractid.Text;//合同编号
            //detailInfo.Contractdetailid = txtContractdetailid.Text;//合同明细编号
        }
        #endregion
    }
}