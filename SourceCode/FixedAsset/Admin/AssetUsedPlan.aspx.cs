using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Domain;
using System.Data;
using System.Web.UI.HtmlControls;

namespace FixedAsset.Web.Admin
{
    public partial class AssetUsedPlan : BasePage
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
                if (Session["Report_AssetIntallAssetCategories"] == null)
                {
                    Session["Report_AssetIntallAssetCategories"] = new List<Assetcategory>();
                }
                return Session["Report_AssetIntallAssetCategories"] as List<Assetcategory>;
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
     
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                AssetCategories.Clear();
                LoadAssetCategory();
            }
        }
        protected void ucSelectStorageAddress_SelectedStorageNodeChange(object sender, EventArgs e)
        {
            LoadCurrentData();
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            LoadCurrentData();
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
            }
        }
        protected void LoadCurrentData()
        {

            System.Data.DataTable dt = new System.Data.DataTable();
        //    DataColumn[] indexcolumn=new DataColumn[0];
           // indexcolumn[0].ColumnName="Index";
            dt.Columns.Add("Index");
         //   dt.Columns.Add(indexcolumn[0]);
            dt.Columns.Add("Assetparentcategoryid");
            dt.Columns.Add("Assetparentcategoryname");
            dt.Columns.Add("Assetsubcategoryname");
            dt.Columns.Add("Assetsubcategoryid");
             dt.Columns.Add("AssetCount");
           //  dt.PrimaryKey = indexcolumn;
            var categories = AssetCategories.Where(p => string.IsNullOrEmpty(p.Assetparentcategoryid) || p.Assetparentcategoryid == Assetcategory.FixedAssetCategory).ToList();
           // int i = 0;
            foreach (var assetcategory in categories)
            {
             
                var subCategories = AssetCategories.Where(p => p.Assetparentcategoryid == assetcategory.Assetcategoryid).ToList();
                foreach (var subCategory in subCategories)
                {
                    DataRow dr = dt.NewRow();
                   // dr["Index"] = i + 1;
                    dr["Assetparentcategoryid"] = assetcategory.Assetcategoryid;
                    dr["Assetparentcategoryname"] = assetcategory.Assetcategoryname;
                    dr["Assetsubcategoryid"] = subCategory.Assetcategoryid;
                    dr["Assetsubcategoryname"] = subCategory.Assetcategoryname;
                    dr["AssetCount"] = "";
                    dt.Rows.Add(dr);
                  //  i++;
                }
            }
            rptAssetUsedPlan.DataSource = dt;
            rptAssetUsedPlan.DataBind();

            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            // 合并单元格
            for (int i = rptAssetUsedPlan.Items.Count - 1; i > 0; i--)
            {
                HtmlTableCell oCell_previous = rptAssetUsedPlan.Items[i - 1].FindControl("tdAssetparentcategoryname") as HtmlTableCell;
                HtmlTableCell oCell = rptAssetUsedPlan.Items[i].FindControl("tdAssetparentcategoryname") as HtmlTableCell;

                oCell.RowSpan = (oCell.RowSpan == -1) ? 1 : oCell.RowSpan;
                oCell_previous.RowSpan = (oCell_previous.RowSpan == -1) ? 1 : oCell_previous.RowSpan;

                if (oCell.InnerText == oCell_previous.InnerText)
                {
                    oCell.Visible = false;
                    oCell_previous.RowSpan += oCell.RowSpan;
                }
            }

            // 合并单元格
            for (int i = Repeater1.Items.Count - 1; i > 0; i--)
            {
                HtmlTableCell oCell_previous = Repeater1.Items[i - 1].FindControl("tdAssetparentcategoryname") as HtmlTableCell;
                HtmlTableCell oCell = Repeater1.Items[i].FindControl("tdAssetparentcategoryname") as HtmlTableCell;

                oCell.RowSpan = (oCell.RowSpan == -1) ? 1 : oCell.RowSpan;
                oCell_previous.RowSpan = (oCell_previous.RowSpan == -1) ? 1 : oCell_previous.RowSpan;

                if (oCell.InnerText == oCell_previous.InnerText)
                {
                    oCell.Visible = false;
                    oCell_previous.RowSpan += oCell.RowSpan;
                }
            }

            ClientScript.RegisterStartupScript(this.GetType(), "a", "document.getElementById('weeklyPlanContent').style.display='none';", true);

        }
        #endregion
    }
}