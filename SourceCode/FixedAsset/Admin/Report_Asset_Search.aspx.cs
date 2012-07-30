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
    public partial class Report_Asset_Search : BasePage
    {
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
            InitFinanceCategory(ddlAccountingType, true);
            InitManageMode(ddlManagementModel, true);
        }
        protected void LoadData(int pageIndex)
        {
            var search = new AssetSearch();
            search.Assetno = txtSrchAssetno.Text;//设备编号
            //search.Assetcategoryid = txtSrchAssetcategoryid.Text;//设备类别
            //search.Assetname = txtSrchAssetname.Text;//设备名称
            //search.Storage = txtSrchStorage.Text;//存放地点
            //if (ddlSrchState.SelectedIndex > 0)
            //{
            //    search.States.Add((AssetState)Enum.Parse(typeof(AssetState), ddlSrchState.SelectedValue));//设备状态
            //}
            //search.Brand = txtSrchBrand.Text;//品牌
            //search.Supplierid = txtSrchSupplierid.Text;//供应商
            //if (ucSrchStartPurchasedate.DateValue.HasValue)
            //{
            //    search.StartPurchasedate = ucSrchStartPurchasedate.DateValue.Value;//购入日期
            //}
            //if (ucSrchEndPurchasedate.DateValue.HasValue)
            //{
            //    search.EndPurchasedate = ucSrchEndPurchasedate.DateValue.Value;//购入日期
            //}
            //if (ucSrchStartExpireddate.DateValue.HasValue)
            //{
            //    search.StartExpireddate = ucSrchStartExpireddate.DateValue.Value;//折旧到期日期
            //}
            //if (ucSrchEndExpireddate.DateValue.HasValue)
            //{
            //    search.EndExpireddate = ucSrchEndExpireddate.DateValue.Value;//折旧到期日期
            //}
            //search.Assetspecification = txtSrchAssetspecification.Text;//设备规格
            //search.Storageflag = txtSrchStorageflag.Text;//存放地点标识来源
            //search.Assetno = txtSrchAssetno.Text.Trim();
            //if (ddlEquipmentStatus.SelectedIndex > 0)
            //{
            //    search.States.Add((AssetState)Enum.Parse(typeof(AssetState), ddlEquipmentStatus.SelectedValue));
            //}
            //if (ddlAccountingType.SelectedIndex > 0)
            //{
            //    search.FinanceCategories.Add((FinanceCategory)Enum.Parse(typeof(FinanceCategory), ddlAccountingType.SelectedValue));
            //}
            //if (ddlManagementModel.SelectedIndex > 0)
            //{
            //    search.ManageModes.Add((ManageMode)Enum.Parse(typeof(ManageMode), ddlManagementModel.SelectedValue));
            //}
            //if (ucStartPurchasedate.DateValue.HasValue)
            //{
            //    search.StartPurchasedate = ucStartPurchasedate.DateValue.Value;
            //}
            //if (ucEndPurchasedate.DateValue.HasValue)
            //{
            //    search.EndPurchasedate = ucEndPurchasedate.DateValue.Value;
            //}
            //if (ddlAssetCategory.SelectedIndex > 0)
            //{
            //    search.FirstLevelCategoryId = ddlAssetCategory.SelectedValue;
            //    if (ddlSubAssetCategory.SelectedIndex > 0)
            //    {
            //        search.Assetcategoryid = ddlSubAssetCategory.SelectedValue;
            //    }
            //}
            //search.Assetname = txtSrchAssetname.Text;
            //search.Storage = txtSrchStorage.Text;
            //search.Brand = txtSrchBrand.Text;
            //search.Supplierid = txtSrchSupplierid.Text;
            //DateTime startpurchasedate = DateTime.MinValue;
            //if (DateTime.TryParse(txtSrchStartPurchasedate.Text, out startpurchasedate))
            //{
            //    search.StartPurchasedate = startpurchasedate;
            //}
            //DateTime endpurchasedate = DateTime.MinValue;
            //if (DateTime.TryParse(txtSrchEndPurchasedate.Text, out endpurchasedate))
            //{
            //    search.EndPurchasedate = endpurchasedate;
            //}
            //DateTime startexpireddate = DateTime.MinValue;
            //if (DateTime.TryParse(txtSrchStartExpireddate.Text, out startexpireddate))
            //{
            //    search.StartExpireddate = startexpireddate;
            //}
            //DateTime endexpireddate = DateTime.MinValue;
            //if (DateTime.TryParse(txtSrchEndExpireddate.Text, out endexpireddate))
            //{
            //    search.EndExpireddate = endexpireddate;
            //}
            //search.Assetspecification = txtSrchAssetspecification.Text;
            //search.Storageflag = txtSrchStorageflag.Text;
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