using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.DataAccess;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Web.Admin.UserControl;
using SeallNet.Utility;

namespace FixedAsset.Web.Admin
{
    public partial class Install_View : BasePage
    {
        #region 属性
        protected string Setupid
        {
            get
            {
                if (ViewState["SetupId"] == null)
                {
                    ViewState["SetupId"] = string.Empty;
                }
                return ViewState["SetupId"].ToString();
            }
            set { ViewState["SetupId"] = value; }
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
        protected IAssetsetupinfoService AssetsetupinfoService
        {
            get
            {
                return new AssetsetupinfoService();
            }
        }
        protected IAssetsetupdetailService AssetsetupdetailService
        {
            get
            {
                return new AssetsetupdetailService();
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
                Setupid = PageUtility.GetQueryStringValue("SetupId");
                if (string.IsNullOrEmpty(Setupid))
                {
                    Response.Redirect(ResolveUrl("~/Admin/InstallList.aspx"));
                    return;
                }
                var SetupInfo = AssetsetupinfoService.RetrieveAssetsetupinfoBySetupid(Setupid);
                BindData(SetupInfo);
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

        protected void BindData(Assetsetupinfo SetupInfo)
        {
            //bind setup
            litSetupid.Text = SetupInfo.Setupid;//申请单号
            ucSeletedSystem.Assetcategoryid = SetupInfo.Assetcategoryid; //所属系统
            if (SetupInfo.Applysetupdate.HasValue)
            {
                litApplysetupdate.Text = SetupInfo.Applysetupdate.Value.ToString(UiConst.DateFormat); //申请安装日期
            }
            if (SetupInfo.Applydate.HasValue)
            {
                //litApplyDate.Text = SetupInfo.Applydate.Value.ToString(UiConst.DateFormat);  //申请日期
            }
            litApplycontent.Text = SetupInfo.Applycontent;//申请内容
            ucApplyuser.UserId = SetupInfo.Applyuserid;//申请人
            litContactphone.Text = SetupInfo.Contactphone; //联系电话
            ucSelectProject.StorageId = SetupInfo.Storageid;
            ucSelectProject.Storagetitle = SetupInfo.Storagetitle;
            ucProjectcontactorid.UserId = SetupInfo.Projectcontactorid; // 项目体(分公司)联系人
            litProjectcontactorphone.Text = SetupInfo.Projectcontactorphone; //项目体(分公司)联系电话
            if (SetupInfo.Plansetupdate.HasValue)
            {
                litPlansetupdate.Text = SetupInfo.Plansetupdate.Value.ToString(UiConst.DateFormat); //计划安装日期
            }
            if (SetupInfo.Approvedate.HasValue)
            {
                litApprovedate.Text = SetupInfo.Approvedate.Value.ToString(UiConst.DateTimeFormat);//回复时间    
            }
            litApproveuser.Text = SetupInfo.Approveuser;//审核人
            if (SetupInfo.Confirmdate.HasValue)
            {
                litConfirmdate.Text = SetupInfo.Confirmdate.Value.ToString(UiConst.DateTimeFormat);//确认日期 
            }
            litConfirmuser.Text = SetupInfo.Confirmuser;//确认人
            litSetupcontent.Text = SetupInfo.Setupcontent;//已安装明细
            litApproveresult.Text = EnumUtil.RetrieveEnumDescript(SetupInfo.Approveresult);//状态
        }

        protected void BindDetails()
        {
            rptAssetsList.DataSource = AssetsetupdetailService.RetrieveAssetsetupdetailListBySetupid(Setupid);
            rptAssetsList.DataBind();
        }
        #endregion

        #region 事件
        protected void rptAssetsList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var litCategoryName = e.Item.FindControl("litCategoryName") as Literal;
                var assetInfo = e.Item.DataItem as Assetsetupdetail;
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
            Response.Redirect(ResolveUrl("~/Admin/InstallList.aspx"));
        }
        #endregion
    }
}