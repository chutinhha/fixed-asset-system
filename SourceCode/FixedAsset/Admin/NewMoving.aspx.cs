using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.IServices;
using FixedAsset.Domain;
using FixedAsset.Services;
using FixedAsset.Web.AppCode;

namespace FixedAsset.Web.Admin
{
    public partial class NewMoving : BasePage
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
            //if (!ucApplySetupDate.DateValue.HasValue)
            //{
            //    UIHelper.Alert(this, "请选择申请安装日期!");
            //    return;
            //}
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
            SaveData(AssetMoveState.Draft);
            UIHelper.AlertMessageGoToURL(this, "保存成功!", ResolveUrl("~/Admin/RepairList.aspx"));
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //if (!ucApplySetupDate.DateValue.HasValue)
            //{
            //    UIHelper.Alert(this, "请选择申请安装日期!");
            //    return;
            //}
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
            if (Details.Count == 0)
            {
                UIHelper.Alert(this, "请选择设备!");
                return;
            }
            SaveData(AssetMoveState.Sumitted);
            UIHelper.AlertMessageGoToURL(this, "提交成功!", ResolveUrl("~/Admin/RepairList.aspx"));
        }
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
                    if (Details.Where(p => p.Assetno == assetNo).Count() == 0) { assetNos.Add(assetNo); }
                }
                var assetInfos = AssetService.RetrieveAssetByAssetno(assetNos);
                if (assetInfos.Count > 0)
                {
                    foreach (var entity in assetInfos)
                    {
                        var data = new Assetmovedetail();
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
                        Details.Add(data);
                    }
                    LoadDetailList();
                }
            }
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
        protected void rptAssetsList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var Detailid = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            {
                if (!string.IsNullOrEmpty(Assetmoveid))
                {
                    var existInfo = Details.Where(p => p.Detailid == Detailid).FirstOrDefault();
                    if (existInfo != null)
                    {
                        Details.Remove(existInfo);
                        AssetmovedetailService.DeleteAssetmovedetailByDetailid(existInfo.Detailid);
                    }
                    UIHelper.Alert(this, "删除成功");
                    LoadDetailList();
                }
            }
        }
        #endregion

        #region Methods
        protected void InitData()
        {
            AssetCategories.Clear();
            Details.Clear();
            ucApplyDate.DateValue = DateTime.Today;//申请日期，默认当天
            if (WebContext.Current.CurrentUser != null)
            {
                ucApplyuser.UserId = WebContext.Current.CurrentUser.Id;//默认当前登录用户
            }
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
            ucApplyDate.DateValue = headInfo.Applydate;//申请维修日期
            ucApplyuser.UserId = headInfo.Applyuserid;//申请人
            txtApplycontent.Text = headInfo.Applycontent;//申请内容 
            ucSelectProject.StorageId = headInfo.Storageid; //区分字段：分公司或项目体
            ucSelectProject.Storagetitle = headInfo.Storagetitle; //项目体ID或分公司ID
            txtContactphone.Text = headInfo.Contactphone;//联系电话
            ucProjectcontactorid.UserId = headInfo.Projectcontactorid; // 项目体(分公司)联系人
            txtProjectcontactorphone.Text = headInfo.Projectcontactorphone; //项目体(分公司)联系电话
        }
        protected void WriteControlValueToEntity(Assetmove headInfo)
        {
            headInfo.Assetmoveid = Assetmoveid;//移机单号
            headInfo.Assetcategoryid = ucSeletedSystem.Assetcategoryid;//(系统)设备大类 
            headInfo.Applycontent = txtApplycontent.Text;//申请内容
            headInfo.Applydate = ucApplyDate.DateValue;//申请日期
            headInfo.Applyuserid = ucApplyuser.UserId;//申请人                                   
            headInfo.Storagetitle = ucSelectProject.Storagetitle;//区分字段：分公司或项目体
            headInfo.Storageid = ucSelectProject.StorageId;//项目体ID或分公司ID            
            headInfo.Contactphone = txtContactphone.Text;//联系电话
            headInfo.Projectcontactorid = ucProjectcontactorid.UserId;//项目体联系人
            headInfo.Projectcontactorphone = txtProjectcontactorphone.Text;//项目体联系电话
            if (string.IsNullOrEmpty(headInfo.Assetmoveid))
            {
                headInfo.Createddate = DateTime.Now;//创建日期
                headInfo.Creator = WebContext.Current.CurrentUser.Id;//创建人  
            }
        }
        protected void LoadDetailList()
        {
            rptAssetsList.DataSource = Details;
            rptAssetsList.DataBind();
        }
        protected void SaveData(AssetMoveState maintainState)
        {
            Assetmove headInfo = null;
            if (!string.IsNullOrEmpty(PageUtility.GetQueryStringValue("Assetmoveid"))) //修改
            {
                headInfo = AssetmoveService.RetrieveAssetmoveByAssetmoveid(Assetmoveid);
                if (headInfo == null) { return; }
                WriteControlValueToEntity(headInfo);
                headInfo.Approveresult = maintainState;
                AssetmoveService.UpdateAssetmoveByAssetmoveid(headInfo);
                foreach (var detail in Details)
                {
                    detail.Assetmoveid = headInfo.Assetmoveid;
                    if (AssetmovedetailService.RetrieveAssetmovedetailByDetailid(detail.Detailid) == null)
                    {
                        AssetmovedetailService.CreateAssetmovedetail(detail);
                    }
                    else
                    {
                        AssetmovedetailService.UpdateAssetmovedetailByDetailid(detail);
                    }
                }
            }
            else //新增
            {
                headInfo = new Assetmove();
                WriteControlValueToEntity(headInfo);
                headInfo.Approveresult = maintainState;
                AssetmoveService.CreateAssetmove(headInfo);
                foreach (var detail in Details)
                {
                    detail.Assetmoveid = headInfo.Assetmoveid;
                    AssetmovedetailService.CreateAssetmovedetail(detail);
                }
            }
        }
        #endregion
    }
}