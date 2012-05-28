﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Services;
using FixedAsset.IServices;
using FixedAsset.Domain;

namespace FixedAsset.Web.Admin
{
    public partial class ContactDetail_Add : BasePage
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
        protected IProcurementcontractdetailService ProcurementcontractdetailService
        {
            get { return new ProcurementcontractdetailService(); }
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
        protected List<Procurementcontractdetail> ProcurementContractDetail
        {
            get
            {
                if (Session["NewContacts_Procurementcontractdetail"] == null)
                {
                    Session["NewContacts_Procurementcontractdetail"] = new List<Procurementcontractdetail>();
                }
                return Session["NewContacts_Procurementcontractdetail"] as List<Procurementcontractdetail>;
            }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                //AssetCategories.Clear();
                Detailid = PageUtility.GetQueryStringValue("Detailid");
                LoadAssetCategory();

                if (!string.IsNullOrEmpty(Detailid))
                {
                    var detailInfo = ProcurementContractDetail.Where(p => p.Contractdetailid == Detailid).FirstOrDefault();
                    if (detailInfo != null)
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
            if (ddlSubAssetCategory.SelectedIndex < 0)
            {
                UIHelper.Alert(this.UpdatePanel1, "请添加设备分类信息！");
                return;
            }
            var detailInfo = ProcurementContractDetail.Where(p => p.Contractdetailid == Detailid).FirstOrDefault();
            if (detailInfo == null)
            {
                detailInfo = new Procurementcontractdetail();
                ProcurementContractDetail.Add(detailInfo);
                detailInfo.Contractdetailid = Guid.NewGuid().ToString("N");
            }
            WriteControlValueToEntity(detailInfo);
            ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString("N"), "setCookie('dialogReturn_key','1',1);CloseTopDialogFrame();", true);
        }
        protected void ddlAssetCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAssetCategory.SelectedIndex >= 0)
            {
                LoadSubAssetCategory();
            }
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
                var categories = AssetCategories.Where(p => string.IsNullOrEmpty(p.Assetparentcategoryid)).ToList();
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
                ddlSubAssetCategory.DataTextField = "Assetcategoryname";
                ddlSubAssetCategory.DataValueField = "Assetcategoryid";
                ddlSubAssetCategory.DataSource = subAssetCategories;
                ddlSubAssetCategory.DataBind();
            }
        }
        protected void ReadEntityToControl(Procurementcontractdetail detailInfo)
        {
            var subCategory = AssetCategories.Where(p => p.Assetcategoryid == detailInfo.Assetcategoryid).FirstOrDefault();
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
            txtPlannumber.Text = detailInfo.Procurenumber.ToString();
        }
        protected void WriteControlValueToEntity(Procurementcontractdetail detailInfo)
        {
            if (ddlSubAssetCategory.SelectedIndex >= 0)
            { detailInfo.Assetcategoryid = ddlSubAssetCategory.SelectedValue; }
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
                detailInfo.Procurenumber = plannumber;
            }
        }
        #endregion
    }
}