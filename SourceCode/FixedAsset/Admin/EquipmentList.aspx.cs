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
    public partial class EquipmentList : BasePage
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
        protected void rptAssetsList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var litCategoryName = e.Item.FindControl("litCategoryName") as Literal;
                var assetInfo = e.Item.DataItem as Asset;
                var subCategory =AssetCategories.Where(p => p.Assetcategoryid == assetInfo.Assetcategoryid).FirstOrDefault();
                if (subCategory == null)
                {
                    litCategoryName.Text = assetInfo.Assetcategoryid;
                }
                else
                {
                    var category =AssetCategories.Where(p => p.Assetcategoryid == subCategory.Assetparentcategoryid).
                            FirstOrDefault();
                    if (category != null) { litCategoryName.Text = string.Format(@"{0}-{1}", category.Assetcategoryname, subCategory.Assetcategoryname); }
                }
                //var BtnEdit = e.Item.FindControl("BtnEdit") as ImageButton;
                //var BtnDeleted = e.Item.FindControl("BtnDeleted") as ImageButton;
                //var headInfo = e.Item.DataItem as Procurementschedulehead;
                //BtnEdit.AlternateText = EnumUtil.RetrieveEnumDescript(headInfo.Approveresult);
                //if (headInfo.Approveresult == ApproveResult.Draft)
                //{
                //    BtnDeleted.Visible = true;
                //}
                //else
                //{
                //    BtnDeleted.Visible = false;
                //}
            }
        }
        protected void rptAssetsList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var assetno = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            {
                if (!string.IsNullOrEmpty(assetno))
                {
                    var currentAsset = AssetService.RetrieveAssetByAssetno(assetno);
                    if(currentAsset!=null)
                    {
                        currentAsset.State = AssetState.LogicalDeleted;
                        //AssetService.UpdateAssetByAssetno(currentAsset);
                        AssetService.DeleteAssetByAssetno(assetno);
                        UIHelper.Alert(this, "删除成功");
                        LoadData(pcData.CurrentIndex);  
                    }
                }
            }
            if (e.CommandName.Equals("EditDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/NewEquipment.aspx?assetno={0}", assetno)));
            }
        }
        protected void ddlAssetCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAssetCategory.SelectedIndex > 0)
            {
                LoadSubAssetCategory();
            }
            else if (ddlAssetCategory.SelectedIndex==0)
            {
                ddlSubAssetCategory.Items.Clear();
            }
        }
        #endregion

        #region  Methods
        protected void InitData()
        {
            InitAssetState(ddlEquipmentStatus,true);
            InitFinanceCategory(ddlAccountingType,true);
            InitManageMode(ddlManagementModel,true);
        }
        protected void LoadData(int pageIndex)
        {
            var search = new AssetSearch();
            search.Assetno = txtSrchAssetno.Text.Trim();
            if(ddlEquipmentStatus.SelectedIndex>0)
            {
                search.States.Add((AssetState)Enum.Parse(typeof(AssetState),ddlEquipmentStatus.SelectedValue));
            }
            if (ddlAccountingType.SelectedIndex > 0)
            {
                search.FinanceCategories.Add((FinanceCategory)Enum.Parse(typeof(FinanceCategory), ddlAccountingType.SelectedValue));
            }
            if (ddlManagementModel.SelectedIndex > 0)
            {
                search.ManageModes.Add((ManageMode)Enum.Parse(typeof(ManageMode), ddlManagementModel.SelectedValue));
            }
            if(ucStartPurchasedate.DateValue.HasValue)
            {
                search.StartPurchasedate = ucStartPurchasedate.DateValue.Value;
            }
            if(ucEndPurchasedate.DateValue.HasValue)
            {
                search.EndPurchasedate = ucEndPurchasedate.DateValue.Value;
            }
            if (ddlAssetCategory.SelectedIndex > 0)
            {
                search.FirstLevelCategoryId = ddlAssetCategory.SelectedValue;
                if (ddlSubAssetCategory.SelectedIndex > 0)
                {
                    search.Assetcategoryid = ddlSubAssetCategory.SelectedValue;
                }
            }
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
            var list = AssetService.RetrieveAssetsPaging(search, pageIndex, pcData.PageSize, out recordCount);
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
                subAssetCategories.Insert(0,new Assetcategory(){Assetcategoryid = string.Empty,Assetcategoryname = "全部"});
                ddlSubAssetCategory.DataTextField = "Assetcategoryname";
                ddlSubAssetCategory.DataValueField = "Assetcategoryid";
                ddlSubAssetCategory.DataSource = subAssetCategories;
                ddlSubAssetCategory.DataBind();
            }
        }
        #endregion
    }
}