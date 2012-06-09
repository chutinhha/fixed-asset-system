using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Web.AppCode;

namespace FixedAsset.Web.Admin
{
    public partial class Move_Reply : BasePage
    {
        #region Properties
        protected string Assetmoveid
        {
            get
            {
                if (ViewState["Assetmoveid"] == null)
                {
                    ViewState["Assetmoveid"] = string.Empty;
                }
                return ViewState["Assetmoveid"].ToString();
            }
            set { ViewState["Assetmoveid"] = value; }
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
        protected IAssetmoveService AssetmoveService
        {
            get
            {
                return new AssetmoveService();
            }
        }
        protected IAssetmovedetailService AssetmovedetailService
        {
            get
            {
                return new AssetmovedetailService();
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
        protected List<Assetmovedetail> Details
        {
            get
            {
                if (Session["Assetmaintaindetail"] == null)
                {
                    Session["Assetmaintaindetail"] = new List<Assetmovedetail>();
                }
                return Session["Assetmaintaindetail"] as List<Assetmovedetail>;
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
                Assetmoveid = PageUtility.GetQueryStringValue("Assetmoveid");
                if (!string.IsNullOrEmpty(Assetmoveid))
                {
                    var headInfo = AssetmoveService.RetrieveAssetmoveByAssetmoveid(Assetmoveid);
                    if (headInfo != null)
                    {
                        ReadEntityToControl(headInfo);
                        Details.AddRange(AssetmovedetailService.RetrieveAssetmovedetailListByAssetmoveid(Assetmoveid));
                        LoadDetailList();
                    }
                }
            }
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (!ucPlanmovedate.DateValue.HasValue)
            {
                UIHelper.Alert(this, "请选择计划移机日期!");
                return;
            }
            var headInfo = AssetmoveService.RetrieveAssetmoveByAssetmoveid(Assetmoveid);
            headInfo.Planmovedate = ucPlanmovedate.DateValue;//计划移机日期
            headInfo.Approveresult = AssetMoveState.Replied;
            headInfo.Approvedate = DateTime.Parse(litApprovedate.Text);
            headInfo.Approveuser = ucApproveuser.Username;
            AssetmoveService.UpdateAssetmoveByAssetmoveid(headInfo);
            UIHelper.AlertMessageGoToURL(this, "回复成功!", ResolveUrl("~/Admin/MoveList.aspx"));
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Admin/MoveList.aspx"));
        }
        protected void rptAssetsList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var litCategoryName = e.Item.FindControl("litCategoryName") as Literal;
                var assetInfo = e.Item.DataItem as Assetmovedetail;
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
            ucPlanmovedate.DateValue = DateTime.Today;
            litApprovedate.Text = DateTime.Now.ToString(UiConst.DateTimeFormat);
            ucApproveuser.UserId = WebContext.Current.CurrentUser.Id;
            if (AssetCategories.Count == 0)
            {
                var list = AssetcategoryService.RetrieveAllAssetcategory();
                AssetCategories.AddRange(list);
            }
        }
        protected void ReadEntityToControl(Assetmove headInfo)
        {
            litAssetmoveid.Text = headInfo.Assetmoveid;//移机单号
            ucSeletedSystem.Assetcategoryid = headInfo.Assetcategoryid;//(系统)设备大类
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
        }
        protected void LoadDetailList()
        {
            rptAssetsList.DataSource = Details;
            rptAssetsList.DataBind();
        }
        #endregion
    }
}