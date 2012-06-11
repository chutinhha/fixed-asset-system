using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using SeallNet.Utility;
using UiConst = FixedAsset.Web.AppCode.UiConst;

namespace FixedAsset.Web.Admin
{
    public partial class Remove_View :BasePage
    {
        #region 属性
        protected string RemoveId
        {
            get
            {
                if (ViewState["RemoveId"] == null)
                {
                    ViewState["RemoveId"] = string.Empty;
                }
                return ViewState["RemoveId"].ToString();
            }
            set { ViewState["RemoveId"] = value; }
        }
        protected List<Assetcategory> AssetCategories
        {
            get
            {
                if (Session["NewRemovingCategories"] == null)
                {
                    Session["NewRemovingCategories"] = new List<Assetcategory>();
                }
                return Session["NewRemovingCategories"] as List<Assetcategory>;
            }
        }
        protected List<Assetremovedetail> RemoveDetail
        {
            get
            {
                if (Session["Assetremovedetail"] == null)
                {
                    Session["Assetremovedetail"] = new List<Assetremovedetail>();
                }
                return Session["Assetremovedetail"] as List<Assetremovedetail>;
            }
        }
        protected IAssetremoveService AssetremoveService
        {
            get
            {
                return new AssetremoveService();
            }
        }
        protected IAssetremovedetailService AssetremovedetailService
        {
            get
            {
                return new AssetremovedetailService();
            }
        }
        protected IAssetService AssetService
        {
            get
            {
                return new AssetService();
            }
        }
        #endregion

        #region 方法
        protected override void OnLoad(EventArgs e)
        {
            if (!IsPostBack)
            {
                ucSeletedSystem.Enabled = false;
                ucSelectProject.IsShowName = true;
                AssetCategories.Clear();

                LoadAssetCategory();
                RemoveId = PageUtility.GetQueryStringValue("Assetremoveid");
                if (string.IsNullOrEmpty(RemoveId))
                {
                    Response.Redirect(ResolveUrl("~/Admin/RemoveList.aspx"));
                    return;
                }
                var headInfo = AssetremoveService.RetrieveAssetremoveByAssetremoveid(RemoveId);
                BindData(headInfo);
                BindDetails();
            }
        }

        protected void LoadAssetCategory()
        {
            var service = new AssetcategoryService();
            if (AssetCategories.Count == 0)
            {
                var list = service.RetrieveAllAssetcategory();
                AssetCategories.AddRange(list);
            }
        } 
        protected void BindData(Assetremove remove)
        {
            //bind setup
            litRemoveid.Text = remove.Assetremoveid;//申请单号
            ucSeletedSystem.Assetcategoryid = remove.Assetcategoryid; //所属系统
            if (remove.Applydate.HasValue)
            {
                litApplysetupdate.Text = remove.Applydate.Value.ToString(UiConst.DateFormat); //申请拆机日期
            }
            if (remove.Applydate.HasValue)
            {
                litApplyDate.Text = remove.Applydate.Value.ToString(UiConst.DateFormat);  //申请日期
            }
            litApplycontent.Text = remove.Applycontent;//申请内容
            ucApplyuser.UserId = remove.Applyuserid;//申请人
            litContactphone.Text = remove.Contactphone; //联系电话
            ucSelectProject.StorageId = remove.Storageid;
            ucSelectProject.Storagetitle = remove.Storagetitle;
            litProjectcontactorid.Text = remove.Projectcontactorid; // 项目体(分公司)联系人
            litProjectcontactorphone.Text = remove.Projectcontactorphone; //项目体(分公司)联系电话
            if (remove.Planremovedate.HasValue)
            {
                litPlansetupdate.Text = remove.Planremovedate.Value.ToString(UiConst.DateFormat); //计划拆机日期
            }
            if (remove.Approvedate.HasValue)
            {
                litApprovedate.Text = remove.Approvedate.Value.ToString(UiConst.DateTimeFormat);//回复时间    
            }
            litApproveuser.Text = remove.Approveuser;//审核人
            if (remove.Confirmdate.HasValue)
            {
                litConfirmdate.Text = remove.Confirmdate.Value.ToString(UiConst.DateTimeFormat);//确认日期 
            }
            if(remove.Actualremovedate.HasValue)
            {
                litActualsetupdate.Text = remove.Actualremovedate.Value.ToString(UiConst.DateFormat); //实际拆机日期
            }
            litConfirmuser.Text = remove.Confirmuser;//确认人
            litSetupcontent.Text = remove.Removedcontent;//已拆机明细
            litApproveresult.Text = EnumUtil.RetrieveEnumDescript(remove.Approveresult);//状态
        }

        protected void BindDetails()
        {
            rptAssetsList.DataSource = AssetremovedetailService.RetrieveAssetremovedetailListByAssetremoveid(RemoveId);
            rptAssetsList.DataBind();
        }
        #endregion

        #region 事件
        protected void rptAssetsList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var litCategoryName = e.Item.FindControl("litCategoryName") as Literal;
                var assetInfo = e.Item.DataItem as Assetremovedetail;
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
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Admin/RemoveList.aspx"));
        }
        #endregion
    }
}