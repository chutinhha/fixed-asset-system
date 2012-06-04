using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using System.Web.UI.HtmlControls;
using SeallNet.Utility;

namespace FixedAsset.Web.Admin
{
    public partial class B_Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AssetCategories.Clear();
                LoadAssetCategory();
                LoadSubAssetCategory();
                InitFinanceCategory(ddlAccountingType, true);
                LoadData(0);
            }
        }
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
        protected void rptB_Account_ItemDataBound(object sender, RepeaterItemEventArgs e)
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

                var litSupplierName = e.Item.FindControl("LitSupplierName") as Literal;
                var assetsupplier = new AssetsupplierService().RetrieveAssetsupplierBySupplierid(assetInfo.Supplierid.ToString());
                litSupplierName.Text = assetsupplier.Suppliername;

            }
        }

        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            LoadData(e.PageIndex);
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
            if (ddlAccountingType.SelectedIndex > 0)
            {
                search.FinanceCategories.Add((FinanceCategory)Enum.Parse(typeof(FinanceCategory), ddlAccountingType.SelectedValue));
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
            var list = AssetService.RetrieveAssetsUsed(search, pageIndex, pcData.PageSize, out recordCount);
            rptB_Account.DataSource = list;
            rptB_Account.DataBind();
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
        protected void InitFinanceCategory(DropDownList dropDownList, bool isLoadAll)
        {
            if (isLoadAll)
            {
                dropDownList.Items.Add(new ListItem("全部", ""));
            }
            var dic = EnumUtil.RetrieveEnumDictionary(typeof(FinanceCategory));
            foreach (KeyValuePair<Enum, string> valuePair in dic)
            {
                dropDownList.Items.Add(new ListItem(valuePair.Value, valuePair.Key.ToString()));
            }
        }

        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            LoadData(0);
        }

        /// <summary>
        /// 进入B账
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnB_Account_Click(object sender, EventArgs e)
        {
            var intCount = 0;
            if (rptB_Account.Items.Count > 0)
            {
                foreach (RepeaterItem item in rptB_Account.Items)
                {
                    HtmlInputCheckBox check = (HtmlInputCheckBox)item.FindControl("ckbB_Account");
                    if (check.Checked == true)
                    {
                        intCount++;
                        Domain.Asset assetInfo = new Asset();
                        assetInfo.Financecategory = Domain.FinanceCategory.BAccount;
                        assetInfo.Assetno = check.Value;
                        AssetService.UpdateFinancecategoryByAssetno(assetInfo);
                        UIHelper.Alert(this, "转入B账成功");
                    }
                    else
                    {
                        if (intCount == 0)
                        {
                            UIHelper.Alert(this, "请选择要转入B账的设备");
                            return;
                        }
                    }
                }
                LoadData(pcData.CurrentIndex);
            }
            else
            {
                UIHelper.Alert(this, "没有待转入B账的设备");
                return;
            }
        }

    }
}