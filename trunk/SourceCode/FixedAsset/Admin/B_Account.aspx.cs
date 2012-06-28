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
    public partial class B_Account : BasePage
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
        protected IBaccountService BaccountService
        {
            get
            {
                return new BaccountService();
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
                AssetCategories.Clear();
                LoadAssetCategory();
                LoadSubAssetCategory();
                InitFinanceCategory(ddlAccountingType, true);
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
                var ckbAssetno = e.Item.FindControl("ckbAssetno") as CheckBox;
                var litAssetno = e.Item.FindControl("litAssetno") as Literal;
                ckbAssetno.Checked = AssetIds.Contains(litAssetno.Text.Trim());
                var BtnDetail = e.Item.FindControl("BtnDetail") as ImageButton;
                BtnDetail.Visible = assetInfo.Financecategory == FinanceCategory.BAccount;
            }
        } 
        protected void rptB_Account_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var AssetNo = e.CommandArgument.ToString();
            if (e.CommandName.Equals("ViewDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/B_AccountView.aspx?AssetNo={0}", AssetNo)));
            }
        }
        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            CheckSelectedAssetId();
            LoadData(e.PageIndex);
        }
        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            AssetIds.Clear();
            LoadData(0);
        } 
        /// <summary>
        /// 进入B账
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnB_Account_Click(object sender, EventArgs e)
        {
            CheckSelectedAssetId();
            if(AssetIds.Count==0)
            {
                UIHelper.Alert(this, "请选择要转入B账的设备!");
                return;
            }
            var assetInfos = AssetService.RetrieveAssetByAssetno(AssetIds);
            //var noBAccountAssetInfos = assetInfos.Where(p => p.Financecategory != FinanceCategory.BAccount).ToList();
            var bAccountInfos = BaccountService.RetrieveBaccountByAssetno(AssetIds);
            bool isAllB = true;
            foreach (var assetInfo in assetInfos)
            {
                var existInfo = bAccountInfos.Where(p => p.Assetno == assetInfo.Assetno).FirstOrDefault();
                if(existInfo==null)
                {
                    isAllB = false;
                    var bAccount = new Baccount();
                    bAccount.Assetno = assetInfo.Assetno;//设备编号
                    bAccount.Assetname = assetInfo.Assetname;//设备名称（冗余字段）
                    bAccount.Accounteddate = DateTime.Now;//入账日期
                    bAccount.Accounteduser = WebContext.Current.CurrentUser.Username; //入账人
                    bAccount.Createddate = DateTime.Now;//操作时间
                    bAccount.Createduser = WebContext.Current.CurrentUser.Username; ;//操作人
                    assetInfo.Financecategory = FinanceCategory.BAccount;
                    AssetService.UpdateAssetByAssetno(assetInfo);
                    BaccountService.CreateBaccount(bAccount);
                }
                else
                {
                    if (assetInfo.Financecategory == FinanceCategory.AAccount)
                    {
                        assetInfo.Financecategory = FinanceCategory.BAccount;
                        AssetService.UpdateAssetByAssetno(assetInfo);
                    }
                }
            }
            if (isAllB)
            {
                UIHelper.Alert(this, "对不起,您选择的设备已进入B账!");
                return;
            }
            else
            {
                UIHelper.Alert(this, "转入B账成功");
            } 
            LoadData(pcData.CurrentIndex);
        }
        #endregion

        #region Methods
        protected void CheckSelectedAssetId()
        {
            if (rptB_Account.Items.Count > 0)
            {
                for (int i = 0; i < rptB_Account.Items.Count; i++)
                {
                    var ckbAssetno = rptB_Account.Items[i].FindControl("ckbAssetno") as CheckBox;
                    var litAssetno = rptB_Account.Items[i].FindControl("litAssetno") as Literal;
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
        #endregion
    }
}