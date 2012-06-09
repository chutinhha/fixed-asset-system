using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Web.AppCode;

namespace FixedAsset.Web.Admin
{
    public partial class Remove_Reply : BasePage
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
                if (Session["NewInstallCategories"] == null)
                {
                    Session["NewInstallCategories"] = new List<Assetcategory>();
                }
                return Session["NewInstallCategories"] as List<Assetcategory>;
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
                AssetCategories.Clear();
                ucSeletedSystem.Enabled = false;
                ucSelectProject.IsShowName = true;
                ucPlansetupdate.DateValue = DateTime.Today;
                litApprovedate.Text = DateTime.Now.ToString(UiConst.DateTimeFormat);
                ucApproveuser.UserId = WebContext.Current.CurrentUser.Id;
                LoadAssetCategory();
                RemoveId = PageUtility.GetQueryStringValue("Assetremoveid");
                if (string.IsNullOrEmpty(RemoveId))
                {
                    Response.Redirect(ResolveUrl("~/Admin/RemoveList.aspx"));
                    return;
                }
                var remove = AssetremoveService.RetrieveAssetremoveByAssetremoveid(RemoveId);
                BindData(remove);
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

        protected void BindData(Assetremove assetremove)
        {
            //bind setup
            litRemoveId.Text = assetremove.Assetremoveid;//申请单号
            ucSeletedSystem.Assetcategoryid = assetremove.Assetcategoryid; //所属系统
            if (assetremove.Applydate.HasValue)
            {
                litApplysetupdate.Text = assetremove.Applydate.Value.ToString(UiConst.DateFormat); //申请拆机日期
            }
            if (assetremove.Applydate.HasValue)
            {
                //litApplyDate.Text = SetupInfo.Applydate.Value.ToString(UiConst.DateFormat);  //申请日期
            }
            litApplycontent.Text = assetremove.Applycontent;//申请内容
            ucApplyuser.UserId = assetremove.Applyuserid;
            litContactphone.Text = assetremove.Contactphone; //联系电话
            ucSelectProject.StorageId = assetremove.Storageid;
            ucSelectProject.Storagetitle = assetremove.Storagetitle;
            ucProjectcontactorid.UserId = assetremove.Projectcontactorid; // 项目体(分公司)联系人
            litProjectcontactorphone.Text = assetremove.Projectcontactorphone; //项目体(分公司)联系电话
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
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (!ucPlansetupdate.DateValue.HasValue)
            {
                UIHelper.Alert(this, "请选择计划拆机日期!");
                return;
            }
            var remove = AssetremoveService.RetrieveAssetremoveByAssetremoveid(RemoveId);
            remove.Planremovedate = ucPlansetupdate.DateValue;//计划拆机日期
            remove.Approveresult = AssetRemoveState.Replied;
            remove.Approvedate = DateTime.Parse(litApprovedate.Text);
            remove.Approveuser = ucApproveuser.Username;
            AssetremoveService.UpdateAssetremoveByAssetremoveid(remove);
            UIHelper.AlertMessageGoToURL(this, "回复成功!", ResolveUrl("~/Admin/RemoveList.aspx"));
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Admin/RemoveList.aspx"));
        }
        #endregion
    }
}