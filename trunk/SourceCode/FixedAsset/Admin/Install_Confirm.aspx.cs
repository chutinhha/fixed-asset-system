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
    public partial class Install_Confirm : BasePage
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
        protected List<Assetsetupdetail> SetupDetail
        {
            get
            {
                if (Session["AssetSetupDetail"] == null)
                {
                    Session["AssetSetupDetail"] = new List<Assetsetupdetail>();
                }
                return Session["AssetSetupDetail"] as List<Assetsetupdetail>;
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
                ucActualsetupdate.DateValue = DateTime.Today;
                litConfirmdate.Text = DateTime.Now.ToString(UiConst.DateTimeFormat);
                ucConfirmuser.UserId = WebContext.Current.CurrentUser.Id;
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
                litApplyDate.Text = SetupInfo.Applydate.Value.ToString(UiConst.DateFormat);  //申请日期
            }
            litApplycontent.Text = SetupInfo.Applycontent;//申请内容
            ucApplyuser.UserId = SetupInfo.Applyuserid;//申请人
            litContactphone.Text = SetupInfo.Contactphone; //联系电话
            ucSelectProject.StorageId = SetupInfo.Storageid;
            ucSelectProject.Storagetitle = SetupInfo.Storagetitle;   
            litProjectcontactorid .Text= SetupInfo.Projectcontactorid; // 项目体分公司)联系人
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
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (!ucActualsetupdate.DateValue.HasValue)
            {
                UIHelper.Alert(this, "请选择实际安装日期!");
                return;
            }
            var setupInfo = AssetsetupinfoService.RetrieveAssetsetupinfoBySetupid(Setupid);
            setupInfo.Actualsetupdate = ucActualsetupdate.DateValue;//计划安装日期
            setupInfo.Approveresult = SetupState.Confirmed;
            setupInfo.Confirmdate = DateTime.Parse(litConfirmdate.Text);
            setupInfo.Confirmuser = ucConfirmuser.Username;
            setupInfo.Setupcontent = txtSetupcontent.Text;//已安装明细
            AssetsetupinfoService.UpdateAssetsetupinfoBySetupid(setupInfo);
            //更新设备状态,存放地点
            var detailInfos = AssetsetupdetailService.RetrieveAssetsetupdetailListBySetupid(setupInfo.Setupid);
            if(detailInfos.Count>0)
            {
                foreach (var assetsetupdetail in detailInfos)
                {
                    assetsetupdetail.Actualsetupdate = setupInfo.Actualsetupdate;
                    assetsetupdetail.Plansetupdate = setupInfo.Plansetupdate;
                    AssetsetupdetailService.UpdateAssetsetupdetailByDetailid(assetsetupdetail);
                }
                var assetInfos = AssetService.RetrieveAssetByAssetno(detailInfos.Select(p => p.Assetno).ToList());
                if(assetInfos.Count>0)
                {
                    foreach (var assetInfo in assetInfos)
                    {
                        assetInfo.State = AssetState.InUse;
                        assetInfo.Storageflag = setupInfo.Storagetitle;
                        assetInfo.Storage = setupInfo.Storageid;
                        AssetService.UpdateAssetByAssetno(assetInfo);
                    }
                }
            }
            UIHelper.AlertMessageGoToURL(this, "确认成功!", ResolveUrl("~/Admin/InstallList.aspx"));
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Admin/InstallList.aspx"));
        }
        #endregion
    }
}