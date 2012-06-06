using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.DataAccess;
using FixedAsset.Domain;
using FixedAsset.Services;
using FixedAsset.Web.Admin.UserControl;
using SeallNet.Utility;

namespace FixedAsset.Web.Admin
{
    public partial class NewInstall : BasePage
    {
        #region 属性
        protected string SetupId
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
                if (Session["EquipmentListAssetCategories"] == null)
                {
                    Session["EquipmentListAssetCategories"] = new List<Assetcategory>();
                }
                return Session["EquipmentListAssetCategories"] as List<Assetcategory>;
            }
        }

        protected Assetsetupinfo SetupInfo
        {
            get
            {
                if (Session["AssetSetupInfo"] == null)
                {
                    Session["AssetSetupInfo"] = new Assetsetupinfo();
                }
                return Session["AssetSetupInfo"] as Assetsetupinfo;
            }

            set { Session["AssetSetupInfo"] = value; }

        }

        protected List<Asset> Assets
        {
            get
            {
                if (Session["Asset"] == null)
                {
                    Session["Asset"] = new Asset();
                }
                return Session["Asset"] as List<Asset>;
            }

            set { Session["Asset"] = value; }

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

            set { Session["AssetSetupDetail"] = value; }
        }
        #endregion

        #region 方法
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAssetCategory();
                SetupId = PageUtility.GetQueryStringValue("SetupId");
                ////修改、回复、确认
                if (!string.IsNullOrEmpty(SetupId))
                {
                    var setupService = new AssetsetupinfoService();
                    SetupInfo = setupService.RetrieveAssetsetupinfoBySetupid(SetupId);
                    var setupdetailService = new AssetsetupdetailService();
                    SetupDetail = setupdetailService.RetrieveAssetsetupdetailListBySetupid(SetupInfo.Setupid);
                    var assetService = new AssetService();
                    Assets = assetService.RetrieveAssetByAssetno(SetupDetail.Select(src => src.Assetno).ToList());
                    BindData();
                }
                else //新增
                {
                    SetupId = new CoderuleManagement().GenerateCodeRule(Assetsetupinfo.RuleCode + DateTime.Today.ToString("yyyyMM"), false);
                    litSetupid.Text = SetupId;
                }
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

        protected void BindData()
        {
            //bind setup
            ucSeletedSystem.Assetcategoryid = SetupInfo.Assetcategoryid;
            ucApplySetupDate.DateValue = SetupInfo.Applysetupdate;
            ucApplyDate.DateValue = SetupInfo.Applydate;
            txtApplycontent.Text = SetupInfo.Applycontent;
            txtApplier.Text = WebContext.Current.CurrentUser.Username;
            hfdApplyUserId.Value = WebContext.Current.CurrentUser.Id;//申请人
            txtContactNum.Text = SetupInfo.Contactphone;
            ucSelectProject.StorageId = SetupInfo.Storageid;
            ucSelectProject.Storagetitle = SetupInfo.Storagetitle;
            txtProjectContact.Text = SetupInfo.Projectcontactorid;
            txtProjectContactNum.Text = SetupInfo.Projectcontactorphone;
            BindAsset();
        }

        protected void BindAsset()
        {
            rptAssetsList.DataSource = Assets;
            rptAssetsList.DataBind();
        }

        protected void SaveData()
        {
            ExtractData(SetupInfo);
            var setupService = new AssetsetupinfoService();
            var setupdetailService = new AssetsetupdetailService();
            if (!string.IsNullOrEmpty(PageUtility.GetQueryStringValue("SetupId"))) //修改
            {
                setupService.UpdateAssetsetupinfoBySetupid(SetupInfo);
                foreach (Assetsetupdetail assetsetupdetail in SetupDetail)
                {
                    if (setupdetailService.RetrieveAssetsetupdetailByDetailid(assetsetupdetail.Detailid) != null)
                        setupdetailService.CreateAssetsetupdetail(assetsetupdetail);
                    else setupdetailService.UpdateAssetsetupdetailByDetailid(assetsetupdetail);
                }
            }
            else //新增
            {
                setupService.CreateAssetsetupinfo(SetupInfo);
                foreach (Assetsetupdetail assetsetupdetail in SetupDetail)
                {
                    setupdetailService.CreateAssetsetupdetail(assetsetupdetail);
                }
            }
        }

        protected void ExtractData(Assetsetupinfo assetsetupinfo)
        {
            assetsetupinfo.Setupid = SetupId;//申请单号
            assetsetupinfo.Assetcategoryid = ucSeletedSystem.Assetcategoryid;//(系统)设备大类
            assetsetupinfo.Applysetupdate = ucApplySetupDate.DateValue;//申请安装日期
            assetsetupinfo.Applycontent = txtApplycontent.Text;//申请内容
            assetsetupinfo.Applydate = ucApplyDate.DateValue;//申请日期
            assetsetupinfo.Applyuserid = hfdApplyUserId.Value;//申请人                                   
            assetsetupinfo.Storagetitle = ucSelectProject.Storagetitle;//区分字段：分公司或项目体
            assetsetupinfo.Storageid = ucSelectProject.StorageId;//项目体ID或分公司ID            
            assetsetupinfo.Contactphone = txtContactNum.Text;//联系电话
            assetsetupinfo.Projectcontactorid = txtContactNum.Text;//项目体联系人
            assetsetupinfo.Projectcontactorphone = txtProjectContact.Text;//项目体联系电话
            assetsetupinfo.Createddate = DateTime.Now;//创建日期
            assetsetupinfo.Creator = WebContext.Current.CurrentUser.Id;//创建人
        }

        #endregion


        #region 事件
        protected void ucSeletedSystem_SelectedAssetCategoryChange(object sender, EventArgs e)
        {
            ucSelectedMultiAssets.AssetCategoryId = ucSeletedSystem.Assetcategoryid;
        }

        protected void ucSelectedMultiAssets_SelectAssetChange(object sender, EventArgs e)
        {
            if (ucSelectedMultiAssets.AssetIds.Count > 0)
            {
                //更新设备列表
                SetupDetail.RemoveAll(src => ucSelectedMultiAssets.AssetIds.Contains(src.Assetno));
                SetupDetail.AddRange(ucSelectedMultiAssets.AssetIds.Select(src => new Assetsetupdetail()
                {
                    Detailid = Guid.NewGuid().ToString(),
                    Assetno = src,
                    Setupid = SetupId
                }));
                //
                Assets.RemoveAll(src => ucSelectedMultiAssets.AssetIds.Contains(src.Assetno));
                var assetnew = new AssetService().RetrieveAssetByAssetno(ucSelectedMultiAssets.AssetIds);
                Assets.AddRange(assetnew);
                BindAsset();
            }
        }

        protected void rptAssetsList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var litCategoryName = e.Item.FindControl("litCategoryName") as Literal;
                var assetInfo = e.Item.DataItem as Asset;
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
        protected void rptAssetsList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var assetno = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            {
                if (!string.IsNullOrEmpty(SetupId))
                {
                    Assets.RemoveAll(src => src.Assetno == assetno);
                    SetupDetail.RemoveAll(src => src.Assetno == assetno);
                    UIHelper.Alert(this, "删除成功");
                }
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            SetupInfo.Approveresult = SetupState.Draft;
            SaveData();
            UIHelper.AlertMessageGoToURL(this.UpdatePanel1, "保存成功!", ResolveUrl("~/Admin/InstallList.aspx"));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SetupInfo.Approveresult = SetupState.Sumitted;
            SaveData();
            UIHelper.AlertMessageGoToURL(this.UpdatePanel1, "提交成功!", ResolveUrl("~/Admin/InstallList.aspx"));
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Admin/InstallList.aspx"));
        }
        #endregion






    }
}