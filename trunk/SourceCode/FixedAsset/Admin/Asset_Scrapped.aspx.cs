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
    public partial class Asset_Scrapped : BasePage
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
        protected IAssetscrappedService AssetscrappedService
        {
            get
            {
                return new AssetscrappedService();
            }
        }
        protected List<Assetcategory> AssetCategories
        {
            get
            {
                if (Session["Asset_ScrappedAssetCategories"] == null)
                {
                    Session["Asset_ScrappedAssetCategories"] = new List<Assetcategory>();
                }
                return Session["Asset_ScrappedAssetCategories"] as List<Assetcategory>;
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
            if (!IsPostBack)
            {
                AssetCategories.Clear();
                LoadAssetCategory();
                LoadSubAssetCategory();
                LoadData(0);
            }
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
        protected void rptScrappedList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var litCategoryName = e.Item.FindControl("litCategoryName") as Literal;
                var currentInfo = e.Item.DataItem as Assetscrapped;
                var subCategory = AssetCategories.Where(p => p.Assetcategoryid == currentInfo.Assetcategoryid).FirstOrDefault();
                if (subCategory == null)
                {
                    litCategoryName.Text = currentInfo.Assetcategoryid;
                }
                else
                {
                    var category = AssetCategories.Where(p => p.Assetcategoryid == subCategory.Assetparentcategoryid).
                            FirstOrDefault();
                    litCategoryName.Text = string.Format(@"{0}-{1}", category.Assetcategoryname, subCategory.Assetcategoryname);
                }
                var BtnApprove = e.Item.FindControl("BtnApprove") as ImageButton;
                var BtnDetail = e.Item.FindControl("BtnDetail") as ImageButton;
                if(currentInfo.Approvedstate!=AssetScrappedState.None)
                {
                    BtnDetail.Visible = true;
                }
                if(currentInfo.Approvedstate==AssetScrappedState.Submitted)
                {
                    BtnApprove.Visible = true;
                }
            }
        }
        protected void rptScrappedList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var Assetscrappedid = e.CommandArgument.ToString();
            if (e.CommandName.Equals("ApproveDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/AssetScrapped_Approved.aspx?Assetscrappedid={0}", Assetscrappedid)));
            }
            else if (e.CommandName.Equals("ViewDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/AssetScrapped_View.aspx?Assetscrappedid={0}", Assetscrappedid)));
            }
        }
        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            CheckSelectedAssetId();
            LoadData(e.PageIndex);
        }  
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            LoadData(0);
        }
        protected void BtnBatchApply_Click(object sender,EventArgs e)
        {
            CheckSelectedAssetId();
            if(AssetIds.Count==0)
            {
                UIHelper.Alert(this, "请选择要申请报废的设备");
                return;
            }
            foreach (var assetId in AssetIds)
            {
                var assetScrappedInfo = new Assetscrapped();
                assetScrappedInfo.Assetscrappedid = string.Empty;
                assetScrappedInfo.Assetno = assetId;
                assetScrappedInfo.Scrappeddate = DateTime.Today;
                assetScrappedInfo.Scrappeduser = WebContext.Current.CurrentUser.Username;
                assetScrappedInfo.Createddate = DateTime.Now;
                assetScrappedInfo.Approvedstate = AssetScrappedState.Submitted;
                assetScrappedInfo.Creator = WebContext.Current.CurrentUser.Username;
                AssetscrappedService.CreateAssetscrapped(assetScrappedInfo);  
            }
            UIHelper.Alert(this, "申请成功！");
            LoadData(pcData.CurrentIndex);
        }
        #endregion

        #region Methods
        protected void CheckSelectedAssetId()
        {
            if (rptScrappedList.Items.Count > 0)
            {
                for (int i = 0; i < rptScrappedList.Items.Count; i++)
                {
                    var ckbAssetno = rptScrappedList.Items[i].FindControl("ckbAssetno") as CheckBox;
                    var litAssetno = rptScrappedList.Items[i].FindControl("litAssetno") as Literal;
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
        protected void LoadData(int pageIndex)
        {
            var search = new AssetSearch();
            search.Assetno = txtSrchAssetno.Text.Trim();
            search.Assetname = txtSrchAssetname.Text.Trim();

            if (ddlAssetCategory.SelectedIndex > 0)
            {
                if (ddlSubAssetCategory.SelectedIndex > 0)
                {
                    search.Assetcategoryid = ddlSubAssetCategory.SelectedValue;
                }
                else if (ddlSubAssetCategory.SelectedIndex == 0)
                {
                    search.Assetcategoryid = ddlAssetCategory.SelectedValue;
                }
            }
            if (ucStartPurchasedate.DateValue.HasValue)
            {
                search.StartPurchasedate = ucStartPurchasedate.DateValue.Value;
            }
            if (ucEndPurchasedate.DateValue.HasValue)
            {
                search.EndPurchasedate = ucEndPurchasedate.DateValue.Value;
            }
            if (ucStartExpireddate.DateValue.HasValue)
            {
                search.StartExpireddate = ucStartExpireddate.DateValue.Value;
            }
            if (ucEndExpireddate.DateValue.HasValue)
            {
                search.EndExpireddate = ucEndExpireddate.DateValue.Value;
            }

            int recordCount = 0;
            var list = AssetService.RetrieveAssetscrappedsRecord(search, pageIndex, pcData.PageSize, out recordCount);
            rptScrappedList.DataSource = list;
            rptScrappedList.DataBind();
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
                var categories = AssetCategories.Where(p => string.IsNullOrEmpty(p.Assetparentcategoryid)).ToList();
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