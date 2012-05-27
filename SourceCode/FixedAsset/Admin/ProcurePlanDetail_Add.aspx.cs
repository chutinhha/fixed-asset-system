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
    public partial class ProcurePlanDetail_Add :BasePage
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
        protected IProcurementscheduledetailService ProcurementscheduledetailService
        {
            get { return new ProcurementscheduledetailService(); }
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
        protected List<Procurementscheduledetail> ProcureScheduleDetails
        {
            get
            {
                if (Session["ProcurePlan_Add_Procurementscheduledetail"] == null)
                {
                    Session["ProcurePlan_Add_Procurementscheduledetail"] = new List<Procurementscheduledetail>();
                }
                return Session["ProcurePlan_Add_Procurementscheduledetail"] as List<Procurementscheduledetail>;
            }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if(!IsPostBack)
            {
                //AssetCategories.Clear();
                Detailid = PageUtility.GetQueryStringValue("Detailid");
                LoadAssetCategory();
                
                if(!string.IsNullOrEmpty(Detailid))
                {
                    var detailInfo = ProcureScheduleDetails.Where(p => p.Detailid == Detailid).FirstOrDefault();
                    if(detailInfo!=null)
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
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(ddlSubAssetCategory.SelectedIndex<0)
            {
                UIHelper.Alert(this.UpdatePanel1,"请添加设备分类信息！");
                return;
            }
            var detailInfo = ProcureScheduleDetails.Where(p => p.Detailid == Detailid).FirstOrDefault();
            if (detailInfo == null)
            {
                detailInfo = new Procurementscheduledetail();
                ProcureScheduleDetails.Add(detailInfo);
                detailInfo.Detailid = Guid.NewGuid().ToString("N");
            }
            WriteControlValueToEntity(detailInfo);
            ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString("N"), "setCookie('dialogReturn_key','1',1);CloseTopDialogFrame();",true);
        }
        protected void ddlAssetCategory_SelectedIndexChanged(object sender,EventArgs e)
        {
            if(ddlAssetCategory.SelectedIndex>=0)
            {
                LoadSubAssetCategory();
            }
        }
        #endregion

        #region Methods
        protected void LoadAssetCategory()
        {
             if(!IsPostBack)
             {
                 if (AssetCategories.Count == 0)
                 {
                     var list = AssetcategoryService.RetrieveAllAssetcategory();
                     AssetCategories.AddRange(list);
                 }
                 var categories = AssetCategories.Where(p => string.IsNullOrEmpty(p.Assetparentcategoryid)).ToList();
                 ddlAssetCategory.DataTextField = "Assetcategoryname";
                 ddlAssetCategory.DataValueField = "Assetcategoryid";
                 ddlAssetCategory.DataSource = categories;
                 ddlAssetCategory.DataBind();
             }
        }
        protected void LoadSubAssetCategory()
        {
             if(ddlAssetCategory.SelectedIndex>=0)
             {
                 var subAssetCategories =
                     AssetCategories.Where(p => p.Assetparentcategoryid == ddlAssetCategory.SelectedValue).ToList();
                 ddlSubAssetCategory.DataTextField = "Assetcategoryname";
                 ddlSubAssetCategory.DataValueField = "Assetcategoryid";
                 ddlSubAssetCategory.DataSource = subAssetCategories;
                 ddlSubAssetCategory.DataBind();
             }
        }
        protected void ReadEntityToControl(Procurementscheduledetail detailInfo)
        {
            var subCategory =AssetCategories.Where(p => p.Assetcategoryid == detailInfo.Assetcategoryid).FirstOrDefault();
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
            txtPlannumber.Text = detailInfo.Plannumber.ToString();
        }
        protected void WriteControlValueToEntity(Procurementscheduledetail detailInfo)
        {
            if (ddlSubAssetCategory.SelectedIndex>=0)
            {detailInfo.Assetcategoryid = ddlSubAssetCategory.SelectedValue;}
            detailInfo.Assetname = txtAssetname.Text;
            detailInfo.Assetspecification = txtAssetspecification.Text;
            decimal unitprice = 0;
            if (decimal.TryParse(txtUnitprice.Text, out unitprice))
            {
                detailInfo.Unitprice = unitprice;
            }
            decimal plannumber = 0;
            if (decimal.TryParse(txtPlannumber.Text, out plannumber))
            {
                detailInfo.Plannumber = plannumber;
            }
        }
        #endregion
    }
}