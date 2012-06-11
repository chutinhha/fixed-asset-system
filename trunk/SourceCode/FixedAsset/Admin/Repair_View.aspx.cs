﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using SeallNet.Utility;
using UiConst = FixedAsset.Web.AppCode.UiConst;

namespace FixedAsset.Web.Admin
{
    public partial class Repair_View : BasePage
    {
        #region Properties
        protected string Assetmaintainid
        {
            get
            {
                if (ViewState["Assetmaintainid"] == null)
                {
                    ViewState["Assetmaintainid"] = string.Empty;
                }
                return ViewState["Assetmaintainid"].ToString();
            }
            set { ViewState["Assetmaintainid"] = value; }
        }
        protected List<Assetcategory> AssetCategories
        {
            get
            {
                if (Session["NewRepairingCategories"] == null)
                {
                    Session["NewRepairingCategories"] = new List<Assetcategory>();
                }
                return Session["NewRepairingCategories"] as List<Assetcategory>;
            }
        }
        protected List<Assetmaintaindetail> Details
        {
            get
            {
                if (Session["Assetmaintaindetail"] == null)
                {
                    Session["Assetmaintaindetail"] = new List<Assetmaintaindetail>();
                }
                return Session["Assetmaintaindetail"] as List<Assetmaintaindetail>;
            }
        }
        protected IAssetmaintainService AssetmaintainService
        {
            get
            {
                return new AssetmaintainService();
            }
        }
        protected IAssetmaintaindetailService AssetmaintaindetailService
        {
            get
            {
                return new AssetmaintaindetailService();
            }
        }
        protected IAssetService AssetService
        {
            get
            {
                return new AssetService();
            }
        }
        protected IAssetcategoryService AssetcategoryService
        {
            get
            {
                return new AssetcategoryService();
            }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                InitData();
                Assetmaintainid = PageUtility.GetQueryStringValue("Assetmaintainid");
                if (!string.IsNullOrEmpty(Assetmaintainid))
                {
                    var headInfo = AssetmaintainService.RetrieveAssetmaintainByAssetmaintainid(Assetmaintainid);
                    if (headInfo != null)
                    {
                        ReadEntityToControl(headInfo);
                        Details.AddRange(AssetmaintaindetailService.RetrieveAssetmaintaindetailListByAssetmaintainid(Assetmaintainid));
                        LoadDetailList();
                    }
                }
            }
        } 
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Admin/RepairList.aspx"));
        }
        protected void rptAssetsList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var litCategoryName = e.Item.FindControl("litCategoryName") as Literal;
                var assetInfo = e.Item.DataItem as Assetmaintaindetail;
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
            }
        }

        #endregion

        #region Methods
        protected void InitData()
        {
            AssetCategories.Clear();
            Details.Clear();
            AssetCategories.Clear();
            ucSeletedSystem.Enabled = false;
            ucSelectProject.IsShowName = true;
            //ucActualmaintaindate.DateValue = DateTime.Today;
            //litConfirmdate.Text = DateTime.Now.ToString(UiConst.DateTimeFormat);//默认当前日期为确认日期
            //ucConfirmuser.UserId = WebContext.Current.CurrentUser.Id;
            if (AssetCategories.Count == 0)
            {
                var list = AssetcategoryService.RetrieveAllAssetcategory();
                AssetCategories.AddRange(list);
            }
            ucMaintaintype.CategoryId = Assetmaintain.C_MaintainType;
            ucMaintaintype.Enabled = false;
        }
        protected void ReadEntityToControl(Assetmaintain headInfo)
        {
            litAssetmaintainid.Text = headInfo.Assetmaintainid;//维修单编号
            ucSeletedSystem.Assetcategoryid = headInfo.Assetcategoryid;//(系统)设备大类
            ucMaintaintype.Configid = headInfo.Maintaintype; //保修来源：(项目体、自检、月检）数据字典
            if (headInfo.Applydate.HasValue)
            {
                litApplydate.Text = headInfo.Applydate.Value.ToString(UiConst.DateFormat);//申请维修日期  
            }
            ucApplyuser.UserId = headInfo.Applyuserid;//申请人
            litApplycontent.Text = headInfo.Applycontent;//申请内容 
            ucSelectProject.StorageId = headInfo.Storageid; //区分字段：分公司或项目体
            ucSelectProject.Storagetitle = headInfo.Storagetitle; //项目体ID或分公司ID
            litContactphone.Text = headInfo.Contactphone;//联系电话
            ucProjectcontactorid.UserId = headInfo.Projectcontactorid; // 项目体(分公司)联系人
            litProjectcontactorphone.Text = headInfo.Projectcontactorphone; //项目体(分公司)联系电话
            
            if (headInfo.Planmaintaindate.HasValue)
            {
                litPlanmaintaindate.Text = headInfo.Planmaintaindate.Value.ToString(UiConst.DateFormat);//计划维修日期  
            }
            if (headInfo.Approvedate.HasValue)
            {
                litApprovedate.Text = headInfo.Approvedate.Value.ToString(UiConst.DateTimeFormat);//回复时间    
            }
            litApproveuser.Text = headInfo.Approveuser;//回复人
            litMaintaincontent.Text = headInfo.Maintaincontent;//已维修明细
            if (headInfo.Confirmdate.HasValue)
            {
                litConfirmdate.Text = headInfo.Confirmdate.Value.ToString(UiConst.DateFormat);//确认日期  
            }
            if (headInfo.Actualmaintaindate.HasValue)
            {
                litActualmaintaindate.Text = headInfo.Actualmaintaindate.Value.ToString(UiConst.DateFormat);//实际维修日期
            }
            litConfirmuser.Text = headInfo.Confirmuser;//确认人
            litApproveresult.Text = EnumUtil.RetrieveEnumDescript(headInfo.Approveresult); //状态
        }
        protected void LoadDetailList()
        {
            rptAssetsList.DataSource = Details;
            rptAssetsList.DataBind();
        }
        #endregion
    }
}