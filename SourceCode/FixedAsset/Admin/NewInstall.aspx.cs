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
    public partial class NewInstall : BasePage
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
        #endregion

        #region 方法
        protected override void  OnLoad(EventArgs e)
        {
            if (!IsPostBack)
            {
                SetupDetail.Clear();
                AssetCategories.Clear();
                ucApplyDate.DateValue = DateTime.Today;
                ucApplySetupDate.DateValue = DateTime.Today;
                ucApplyuser.UserId = WebContext.Current.CurrentUser.Id;
                LoadAssetCategory();
                Setupid = PageUtility.GetQueryStringValue("SetupId");
                if (!string.IsNullOrEmpty(Setupid))
                {
                    var SetupInfo = AssetsetupinfoService.RetrieveAssetsetupinfoBySetupid(Setupid);
                    SetupDetail.AddRange(AssetsetupdetailService.RetrieveAssetsetupdetailListBySetupid(SetupInfo.Setupid));
                    BindData(SetupInfo);
                    BindDetails();
                }
                else //新增
                {
                    //Setupid = new CoderuleManagement().GenerateCodeRule(Assetsetupinfo.RuleCode + DateTime.Today.ToString("yyyyMM"), false);
                    litSetupid.Text = Setupid;
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

        protected void BindData(Assetsetupinfo SetupInfo)
        {
            //bind setup
            litSetupid.Text = SetupInfo.Setupid;//申请单号
            ucSeletedSystem.Assetcategoryid = SetupInfo.Assetcategoryid;
            ucApplySetupDate.DateValue = SetupInfo.Applysetupdate;
            ucApplyDate.DateValue = SetupInfo.Applydate;
            txtApplycontent.Text = SetupInfo.Applycontent;//申请内容
            ucApplyuser.UserId = SetupInfo.Applyuserid;
            txtContactphone.Text = SetupInfo.Contactphone; //联系电话
            ucSelectProject.StorageId = SetupInfo.Storageid;
            ucSelectProject.Storagetitle = SetupInfo.Storagetitle;
            ucProjectcontactorid.UserId = SetupInfo.Projectcontactorid; // 项目体(分公司)联系人
            txtProjectcontactorphone.Text = SetupInfo.Projectcontactorphone; //项目体(分公司)联系电话
        }

        protected void BindDetails()
        {
            rptAssetsList.DataSource = SetupDetail;
            rptAssetsList.DataBind();
        }

        protected void SaveData(SetupState setupState)
        {
            Assetsetupinfo SetupInfo = null;
            if (!string.IsNullOrEmpty(PageUtility.GetQueryStringValue("Setupid"))) //修改
            {
                SetupInfo = AssetsetupinfoService.RetrieveAssetsetupinfoBySetupid(Setupid);
                if (SetupInfo==null){return;}
                ExtractData(SetupInfo);
                SetupInfo.Approveresult = setupState;
                AssetsetupinfoService.UpdateAssetsetupinfoBySetupid(SetupInfo);
                foreach (Assetsetupdetail assetsetupdetail in SetupDetail)
                {
                    assetsetupdetail.Setupid = SetupInfo.Setupid;
                    if (AssetsetupdetailService.RetrieveAssetsetupdetailByDetailid(assetsetupdetail.Detailid) == null)
                    {
                        AssetsetupdetailService.CreateAssetsetupdetail(assetsetupdetail);
                    }
                    else
                    {
                        AssetsetupdetailService.UpdateAssetsetupdetailByDetailid(assetsetupdetail);
                    }
                }
            }
            else //新增
            {
                SetupInfo=new Assetsetupinfo();
                ExtractData(SetupInfo);
                SetupInfo.Approveresult = setupState;
                AssetsetupinfoService.CreateAssetsetupinfo(SetupInfo);
                foreach (Assetsetupdetail assetsetupdetail in SetupDetail)
                {
                    assetsetupdetail.Setupid = SetupInfo.Setupid;
                    AssetsetupdetailService.CreateAssetsetupdetail(assetsetupdetail);
                }
            }
        }

        protected void ExtractData(Assetsetupinfo assetsetupinfo)
        {
            assetsetupinfo.Setupid = Setupid;//申请单号
            assetsetupinfo.Assetcategoryid = ucSeletedSystem.Assetcategoryid;//(系统)设备大类
            assetsetupinfo.Applysetupdate = ucApplySetupDate.DateValue;//申请安装日期
            assetsetupinfo.Applycontent = txtApplycontent.Text;//申请内容
            assetsetupinfo.Applydate = ucApplyDate.DateValue;//申请日期
            assetsetupinfo.Applyuserid = ucApplyuser.UserId;//申请人                                   
            assetsetupinfo.Storagetitle = ucSelectProject.Storagetitle;//区分字段：分公司或项目体
            assetsetupinfo.Storageid = ucSelectProject.StorageId;//项目体ID或分公司ID            
            assetsetupinfo.Contactphone = txtContactphone.Text;//联系电话
            assetsetupinfo.Projectcontactorid = ucProjectcontactorid.UserId;//项目体联系人
            assetsetupinfo.Projectcontactorphone = txtProjectcontactorphone.Text;//项目体联系电话
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
                var assetNos = new List<string>();
                foreach (var assetNo in ucSelectedMultiAssets.AssetIds)
                {
                    if (SetupDetail.Where(p => p.Assetno == assetNo).Count() == 0) { assetNos.Add(assetNo); }
                }
                var assetInfos = AssetService.RetrieveAssetByAssetno(assetNos);
                if(assetInfos.Count>0)
                {
                    foreach (var entity in assetInfos)
                    {
                        Assetsetupdetail data = new Assetsetupdetail();
                        data.Detailid = Guid.NewGuid().ToString("N");
                        data.Assetno = entity.Assetno;//设备编号
                        data.Assetcategoryid = entity.Assetcategoryid;//设备类别
                        data.Assetname = entity.Assetname;//设备名称
                        //data.Storage = entity.Storage;//存放地点
                        data.State = entity.State;//设备状态
                        //data.Depreciationyear = entity.Depreciationyear;//折旧年限
                        data.Unitprice = entity.Unitprice;//单价
                        data.Brand = entity.Brand;//品牌
                        //data.Managemode = entity.Managemode;//管理模式，托管:0自管:1
                        data.Financecategory = entity.Financecategory;//财务类别(A帐:0B帐:1)
                        //data.Supplierid = entity.Supplierid;//供应商
                        data.Purchasedate = entity.Purchasedate;//购入日期
                        //data.Expireddate = entity.Expireddate;//折旧到期日期
                        //data.Assetspecification = entity.Assetspecification;//设备规格
                        //data.Storageflag = entity.Storageflag;//存放地点标识来源
                        //data.Subcompany = entity.Subcompany;//分公司
                        //data.Contractid = entity.Contractid;//合同编号
                        //data.Contractdetailid = entity.Contractdetailid;//合同明细编号
                        SetupDetail.Add(data);
                    }
                    BindDetails();
                }
            }
        } 
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
        protected void rptAssetsList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var Detailid = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            {
                if (!string.IsNullOrEmpty(Setupid))
                {
                    var existInfo = SetupDetail.Where(p => p.Detailid == Detailid).FirstOrDefault();
                    if(existInfo!=null)
                    {
                        SetupDetail.Remove(existInfo);
                        AssetsetupdetailService.DeleteAssetsetupdetailByDetailid(existInfo.Detailid);
                    }
                    UIHelper.Alert(this, "删除成功");
                    BindDetails();
                }
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (!ucApplySetupDate.DateValue.HasValue)
            {
                UIHelper.Alert(this, "请选择申请安装日期!");
                return;
            }
            if (string.IsNullOrEmpty(ucSelectProject.StorageId))
            {
                UIHelper.Alert(this, "请选择项目体或分公司!");
                return;
            }
            if (string.IsNullOrEmpty(ucProjectcontactorid.UserId))
            {
                UIHelper.Alert(this, "请选择项目体(分公司)联系人!");
                return;
            }
            if (!ucApplyDate.DateValue.HasValue)
            {
                UIHelper.Alert(this, "请选择申请日期!");
                return;
            }
            if (string.IsNullOrEmpty(ucApplyuser.UserId))
            {
                UIHelper.Alert(this, "请选择申请人!");
                return;
            }
            SaveData(SetupState.Draft);
            UIHelper.AlertMessageGoToURL(this, "保存成功!", ResolveUrl("~/Admin/InstallList.aspx"));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!ucApplySetupDate.DateValue.HasValue)
            {
                UIHelper.Alert(this, "请选择申请安装日期!");
                return;
            }
            if (string.IsNullOrEmpty(ucSelectProject.StorageId))
            {
                UIHelper.Alert(this, "请选择项目体或分公司!");
                return;
            }
            if (string.IsNullOrEmpty(ucProjectcontactorid.UserId))
            {
                UIHelper.Alert(this, "请选择项目体(分公司)联系人!");
                return;
            }
            if (!ucApplyDate.DateValue.HasValue)
            {
                UIHelper.Alert(this, "请选择申请日期!");
                return;
            }
            if (string.IsNullOrEmpty(ucApplyuser.UserId))
            {
                UIHelper.Alert(this, "请选择申请人!");
                return;
            }
            if(SetupDetail.Count==0)
            {
                UIHelper.Alert(this, "请选择设备!");
                return;
            }
            SaveData(SetupState.Sumitted);
            UIHelper.AlertMessageGoToURL(this, "提交成功!", ResolveUrl("~/Admin/InstallList.aspx"));
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Admin/InstallList.aspx"));
        }
        #endregion  
    }
}