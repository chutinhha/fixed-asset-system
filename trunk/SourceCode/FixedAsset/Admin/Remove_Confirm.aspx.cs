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
    public partial class Remove_Confirm : System.Web.UI.Page
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
                if (Session["NewRemoveCategories"] == null)
                {
                    Session["NewRemoveCategories"] = new List<Assetcategory>();
                }
                return Session["NewRemoveCategories"] as List<Assetcategory>;
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
                ucActualsetupdate.DateValue = DateTime.Today;
                litConfirmdate.Text = DateTime.Now.ToString(UiConst.DateTimeFormat);
                ucConfirmuser.UserId = WebContext.Current.CurrentUser.Id;
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

        protected void BindData(Assetremove remove)
        {
            //bind setup
            litRemoveId.Text = remove.Assetremoveid;//申请单号
            ucSeletedSystem.Assetcategoryid = remove.Assetcategoryid; //所属系统
            if (remove.Applydate.HasValue)
            {
                litApplysetupdate.Text = remove.Applydate.Value.ToString(UiConst.DateFormat); //申请安装日期
            }
            if (remove.Applydate.HasValue)
            {
                //litApplyDate.Text = remove.Applydate.Value.ToString(UiConst.DateFormat);  //申请日期
            }
            litApplycontent.Text = remove.Applycontent;//申请内容
            ucApplyuser.UserId = remove.Applyuserid;//申请人
            litContactphone.Text = remove.Contactphone; //联系电话
            ucSelectProject.StorageId = remove.Storageid;
            ucSelectProject.Storagetitle = remove.Storagetitle;
            ucProjectcontactorid.UserId = remove.Projectcontactorid; // 项目体(分公司)联系人
            litProjectcontactorphone.Text = remove.Projectcontactorphone; //项目体(分公司)联系电话
            if (remove.Planremovedate.HasValue)
            {
                litPlansetupdate.Text = remove.Planremovedate.Value.ToString(UiConst.DateFormat); //计划安装日期
            }
            if (remove.Approvedate.HasValue)
            {
                litApprovedate.Text = remove.Approvedate.Value.ToString(UiConst.DateTimeFormat);//回复时间    
            }
            litApproveuser.Text = remove.Approveuser;//审核人
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
            if (!ucActualsetupdate.DateValue.HasValue)
            {
                UIHelper.Alert(this, "请选择实际安装日期!");
                return;
            }
            var remove = AssetremoveService.RetrieveAssetremoveByAssetremoveid(RemoveId);
            remove.Actualremovedate = ucActualsetupdate.DateValue;//计划安装日期
            remove.Approveresult = AssetRemoveState.Confirmed;
            remove.Confirmdate = DateTime.Parse(litConfirmdate.Text);
            remove.Confirmuser = ucConfirmuser.Username;
            AssetremoveService.UpdateAssetremoveByAssetremoveid(remove);
            //更新设备状态,存放地点
            var detailInfos = AssetremovedetailService.RetrieveAssetremovedetailListByAssetremoveid(remove.Assetremoveid);
            if (detailInfos.Count > 0)
            {
                foreach (var assetsetupdetail in detailInfos)
                {
                    assetsetupdetail.Actualremovedate = remove.Actualremovedate;
                    assetsetupdetail.Planremovedate = remove.Planremovedate;
                    AssetremovedetailService.UpdateAssetremovedetailByDetailid(assetsetupdetail);
                }
                var assetInfos = AssetService.RetrieveAssetByAssetno(detailInfos.Select(p => p.Assetno).ToList());
                if (assetInfos.Count > 0)
                {
                    foreach (var assetInfo in assetInfos)
                    {
                        assetInfo.State = AssetState.InUse;
                        assetInfo.Storageflag = remove.Storagetitle;
                        assetInfo.Storage = remove.Storageid;
                        AssetService.UpdateAssetByAssetno(assetInfo);
                    }
                }
            }
            UIHelper.AlertMessageGoToURL(this, "确认成功!", ResolveUrl("~/Admin/RemoveList.aspx"));
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Admin/RemoveList.aspx"));
        }
        #endregion
    }
}