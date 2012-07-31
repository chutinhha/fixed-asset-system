using System;
using System.Collections.Generic;
using System.Linq;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin
{
    public partial class Report_Asset_Search : BasePage
    {
        #region Properties
        protected IAssetcategoryService AssetcategoryService
        {
            get { return new AssetcategoryService(); }
        } 
        protected ISubcompanyinfoService SubcompanyinfoService
        {
            get { return new SubcompanyinfoService(); }
        }
        protected IAssetService AssetService
        {
            get
            {
                return new AssetService();
            }
        }
        protected IAssetsupplierService AssetsupplierService
        {
            get { return new AssetsupplierService(); }
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

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                AssetCategories.Clear();
                LoadAssetCategory();
                LoadSubAssetCategory();
                InitData();
                LoadData(0);
            }
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            LoadData(0);
        }
        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            LoadData(e.PageIndex);
        }
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
        #endregion

        #region  Methods
        protected void InitData()
        {
            InitAssetState(ddlSrchState, true);
            InitFinanceCategory(ddlFinancecategory, true);
            InitManageMode(ddlManagementModel, true);
            LoadSupplierData();
            LoadSubCompanyData();
        }
        protected void LoadSupplierData()
        {
            var search = new AssetsupplierSearch();
            int recordCount = 0;
            var list = AssetsupplierService.RetrieveAssetsuppliersPaging(search, 0, 10, out recordCount);
            list.Insert(0, new Assetsupplier() { Supplierid = string.Empty, Suppliername = "全部" });
            ddlSuppliers.DataTextField = "Suppliername";
            ddlSuppliers.DataValueField = "Supplierid";
            ddlSuppliers.DataSource = list;
            ddlSuppliers.DataBind();
        }
        protected void LoadSubCompanyData()
        {
            var search = new SubcompanyinfoSearch();
            int recordCount = 0;
            var list = SubcompanyinfoService.RetrieveSubcompanyinfosPaging(search, 0, 10, out recordCount);
            list.Insert(0, new Subcompanyinfo() { Subcompanyid = 0, Subcompanyname = "全部" });
            ddlSubCompanies.DataTextField = "Subcompanyname";
            ddlSubCompanies.DataValueField = "Subcompanyid";
            ddlSubCompanies.DataSource = list;
            ddlSubCompanies.DataBind();
            
        }
        protected void LoadData(int pageIndex)
        {
            var search = new AssetSearch();
            search.Assetno = txtSrchAssetno.Text;//设备编号
            if (ddlAssetCategory.SelectedIndex > 0)
            {
                //设备类别
                search.FirstLevelCategoryId = ddlAssetCategory.SelectedValue;
                if (ddlSubAssetCategory.SelectedIndex > 0)
                {
                    search.Assetcategoryid = ddlSubAssetCategory.SelectedValue;
                }
            }
            if (ucStartPurchasedate.DateValue.HasValue)
            {
                search.StartPurchasedate = ucStartPurchasedate.DateValue.Value;//购入日期
            }
            if (ucEndPurchasedate.DateValue.HasValue)
            {
                search.EndPurchasedate = ucEndPurchasedate.DateValue.Value;//购入日期
            }
            search.Assetname = txtSrchAssetname.Text;//设备名称
            
            if (ddlSrchState.SelectedIndex > 0)
            {
                search.States.Add((AssetState)Enum.Parse(typeof(AssetState), ddlSrchState.SelectedValue));//设备状态
            }
            search.Storageflag = ucSelectStorageAddressForSearch.Storagetitle; //存放地点
            search.Storage = ucSelectStorageAddressForSearch.StorageId;
            if(ddlSuppliers.SelectedIndex>0)
            {
                search.Supplierid = ddlSuppliers.SelectedValue;//供应商  
            }
            if(ddlSubCompanies.SelectedIndex>0)
            {
                search.Subcompany = ddlSubCompanies.SelectedValue;//分公司
            } 
            if (ddlFinancecategory.SelectedIndex > 0)
            {
                search.FinanceCategories.Add((FinanceCategory)Enum.Parse(typeof(FinanceCategory), ddlFinancecategory.SelectedValue));//财务类别
            }
            if (ddlManagementModel.SelectedIndex > 0)
            {
                search.ManageModes.Add((ManageMode)Enum.Parse(typeof(ManageMode), ddlManagementModel.SelectedValue));//管理模式
            }
            int recordCount = 0;
            var list = AssetService.RetrieveAssetsPagingForZongheSearch(search, pageIndex, pcData.PageSize, out recordCount);
            rptAssetsList.DataSource = list;
            rptAssetsList.DataBind();
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
                var categories = AssetCategories.Where(p => string.IsNullOrEmpty(p.Assetparentcategoryid) || p.Assetparentcategoryid == Assetcategory.FixedAssetCategory).ToList();
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
        #endregion
    }
}