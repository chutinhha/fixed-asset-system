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

namespace FixedAsset.Web
{
    public partial class AssetUsedList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData(0);
            }
        }
        #region Properties
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
        #endregion

        protected void rptUsedList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var litCategoryName = e.Item.FindControl("litCategoryName") as Literal;
                var assetInfo = e.Item.DataItem as Asset;
                //var subCategory = AssetCategories.Where(p => p.Assetcategoryid == assetInfo.Assetcategoryid).FirstOrDefault();
                //if (subCategory == null)
                //{
                //    litCategoryName.Text = assetInfo.Assetcategoryid;
                //}
                //else
                //{
                //    var category = AssetCategories.Where(p => p.Assetcategoryid == subCategory.Assetparentcategoryid).
                //            FirstOrDefault();
                //    litCategoryName.Text = string.Format(@"{0}-{1}", category.Assetcategoryname, subCategory.Assetcategoryname);
                //}

            }
        }

        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            LoadData(e.PageIndex);
        }

        protected void LoadData(int pageIndex)
        {
            var search = new AssetSearch();
 
            int recordCount = 0;
            var list = AssetService.RetrieveAssetsUsed(search, pageIndex, pcData.PageSize, out recordCount);
            rptUsedList.DataSource = list;
            rptUsedList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }

        protected void BtnApplicate_Click(object sender, EventArgs e)
        {
            var intCount = 0;

            if (rptUsedList.Items.Count > 0)
            {
                foreach (RepeaterItem item in rptUsedList.Items)
                {
                    HtmlInputCheckBox check = (HtmlInputCheckBox)item.FindControl("ckbScrapped");
                    if (check.Checked == true)
                    {
                        intCount++;
                        Domain.Assetscrapped assetScrappedInfo = new Assetscrapped();
                        assetScrappedInfo.Assetscrappedid = Guid.NewGuid().ToString("N");
                        assetScrappedInfo.Assetno = check.Value;
                        assetScrappedInfo.Createddate = System.DateTime.Now;
                        assetScrappedInfo.Creator = WebContext.Current.CurrentUser.Username;

                        AssetscrappedService.CreateAssetscrapped(assetScrappedInfo);

                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>CloseTopDialogFrame();</script>");
                        //UIHelper.Alert(this, "报废申请成功，请等待审核");
                    }
                    else
                    {
                        if (intCount == 0)
                        {
                            UIHelper.Alert(this, "请选择要申请报废的设备");
                            return;
                        }
                    }
                }
            }
            else {
                UIHelper.Alert(this, "没有待申请报废的设备");
                return;
            }
        }
    }
}