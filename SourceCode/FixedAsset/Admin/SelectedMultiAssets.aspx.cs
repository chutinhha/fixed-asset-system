﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Web.Admin.UserControl;

namespace FixedAsset.Web.Admin
{
    public partial class SelectedMultiAssets : System.Web.UI.Page
    {
        #region Properties
        protected BillCategory BillCategory
        {
            get
            {
                if (ViewState["BillCategory"] == null)
                {
                    ViewState["BillCategory"] = BillCategory.SetupBill;
                }
                return (BillCategory)Enum.Parse(typeof(BillCategory), ViewState["BillCategory"].ToString());
            }
            set { ViewState["BillCategory"] = value; }
        }
        protected string AssetcategoryId
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
                if (Session["SelectedMultiAssets"] == null)
                {
                    Session["SelectedMultiAssets"] = new List<Assetcategory>();
                }
                return Session["SelectedMultiAssets"] as List<Assetcategory>;
            }
        }
        public List<string> AssetIds
        {
            get
            {
                if (ViewState["AssetIds"] == null)
                {
                    ViewState["AssetIds"] = new List<string>();
                }
                return ViewState["AssetIds"] as List<string>;
            }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                AssetcategoryId = PageUtility.GetQueryStringValue("Assetcategoryid");
                ClearBrowserCache();
                AssetCategories.Clear();
                AssetIds.Clear();
                LoadAssetCategory();
                LoadData(0);
            }
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            AssetIds.Clear();
            LoadData(0);
        }
        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            CheckSelectedAssetId();
            LoadData(e.PageIndex);
        }
        protected void rptAssetsList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var litCategoryName = e.Item.FindControl("litCategoryName") as Literal;
                var assetInfo = e.Item.DataItem as Asset;
                var subCategory = AssetCategories.Where(p => p.Assetcategoryid == assetInfo.Assetcategoryid).FirstOrDefault();
                if (subCategory == null)
                {
                    litCategoryName.Text = assetInfo.Assetcategoryid;
                }
                else
                {
                    var category = AssetCategories.Where(p => p.Assetcategoryid == subCategory.Assetparentcategoryid).
                            FirstOrDefault();
                    litCategoryName.Text = string.Format(@"{0}-{1}", category.Assetcategoryname, subCategory.Assetcategoryname);
                }
                if (AssetIds.Count > 0)
                {
                    var ckbAssetno = e.Item.FindControl("ckbAssetno") as CheckBox;
                    var litAssetno = e.Item.FindControl("litAssetno") as Literal;
                    if (AssetIds.Contains(litAssetno.Text.Trim()))
                    {
                        ckbAssetno.Checked = true;
                    }
                }
            }
        }
        protected void btnOk_Click(object sender, EventArgs e)
        {
            CheckSelectedAssetId();
            if(AssetIds.Count==0)
            {
                UIHelper.AlertMessage(this, "请选择！");
                return;
            }
            var returnValue = PageUtility.ListToString(AssetIds);
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>setCookie('dialogReturn_key','" + returnValue + "',1);CloseTopDialogFrame();</script>");
        }
        #endregion

        #region  Methods
        protected void CheckSelectedAssetId()
        {
            if (rptAssetsList.Items.Count > 0)
            {
                for (int i = 0; i < rptAssetsList.Items.Count; i++)
                {
                    var ckbAssetno = rptAssetsList.Items[i].FindControl("ckbAssetno") as CheckBox;
                    var litAssetno = rptAssetsList.Items[i].FindControl("litAssetno") as Literal;
                    if (ckbAssetno != null)
                    {
                        if (ckbAssetno.Checked)
                        {
                            //选中，加到viewstate中来
                            if (!AssetIds.Contains(litAssetno.Text.Trim()))
                            {
                                AssetIds.Add(litAssetno.Text.Trim());
                            }
                        }
                        else
                        {
                            //取消选择，需要从viewstate里删除
                            if (AssetIds.Contains(litAssetno.Text.Trim()))
                            {
                                AssetIds.Remove(litAssetno.Text.Trim());
                            }
                        }
                    }
                }
            }
            else
            {
                AssetIds.Clear();
            }
        }
        protected void ClearBrowserCache()
        {
            Response.Buffer = true;
            Response.Expires = 0;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
        }
        protected void LoadData(int pageIndex)
        {
            var search = new AssetSearch();
            search.Assetno = txtSrchAssetno.Text.Trim();
            var BillCategory =(BillCategory) Enum.Parse(typeof (BillCategory), PageUtility.GetQueryStringValue("BillCategory"));
            switch (BillCategory)
            {
                case   BillCategory.SetupBill:
                    search.States.Add(AssetState.NoUse);
                    break;
                case BillCategory.RepairBill:
                    search.States.Add(AssetState.InUse);
                    search.States.Add(AssetState.NoUse);
                    break;
                case BillCategory.RemoveBill:
                    search.States.Add(AssetState.InUse);
                    break;
                case BillCategory.MoveBill:
                    search.States.Add(AssetState.InUse);
                    break;
            }
            search.Storageflag = PageUtility.GetQueryStringValue("Storagetitle");
            search.Storage = PageUtility.GetQueryStringValue("StorageId");
            search.Assetname = txtSrchAssetname.Text;
            search.FirstLevelCategoryId = AssetcategoryId;
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
            }
        }
        #endregion
    }
}