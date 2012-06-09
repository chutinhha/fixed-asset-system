using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin
{
    public partial class NewRemoving : BasePage
    {
        #region 属性
        protected string Removeid
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
        protected IAssetremoveService Assetremoveservice
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
        #endregion

        #region 方法
        protected override void OnLoad(EventArgs e)
        {
            if (!IsPostBack)
            {
                RemoveDetail.Clear();
                AssetCategories.Clear();
                ucApplyDate.DateValue = DateTime.Today;
                ucApplyRemoveDate.DateValue = DateTime.Today;
                ucApplyuser.UserId = WebContext.Current.CurrentUser.Id;
                LoadAssetCategory();
                Removeid = PageUtility.GetQueryStringValue("Assetremoveid");
                if (!string.IsNullOrEmpty(Removeid))
                {
                    var RemoveInfo = Assetremoveservice.RetrieveAssetremoveByAssetremoveid(Removeid);
                    RemoveDetail.AddRange(AssetremovedetailService.RetrieveAssetremovedetailListByAssetremoveid(RemoveInfo.Assetremoveid));
                    BindData(RemoveInfo);
                    BindDetails();
                }
                else //新增
                {
                    //Removeid = new CoderuleManagement().GenerateCodeRule(AssetRemoveinfo.RuleCode + DateTime.Today.ToString("yyyyMM"), false);
                    litRemoveid.Text = Removeid;
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

        protected void BindData(Assetremove RemoveInfo)
        {
            //bind Remove
            litRemoveid.Text = RemoveInfo.Assetremoveid;//申请单号
            ucSeletedSystem.Assetcategoryid = RemoveInfo.Assetcategoryid;
            ucApplyRemoveDate.DateValue = RemoveInfo.Applydate;
            ucApplyDate.DateValue = RemoveInfo.Applydate;
            txtApplycontent.Text = RemoveInfo.Applycontent;//申请内容
            ucApplyuser.UserId = RemoveInfo.Applyuserid;
            txtContactphone.Text = RemoveInfo.Contactphone; //联系电话
            ucSelectProject.StorageId = RemoveInfo.Storageid;
            ucSelectProject.Storagetitle = RemoveInfo.Storagetitle;
            ucProjectcontactorid.UserId = RemoveInfo.Projectcontactorid; // 项目体(分公司)联系人
            txtProjectcontactorphone.Text = RemoveInfo.Projectcontactorphone; //项目体(分公司)联系电话
        }

        protected void BindDetails()
        {
            rptAssetsList.DataSource = RemoveDetail;
            rptAssetsList.DataBind();
        }

        protected void SaveData(AssetRemoveState RemoveState)
        {
            Assetremove RemoveInfo = null;
            if (!string.IsNullOrEmpty(PageUtility.GetQueryStringValue("Assetremoveid"))) //修改
            {
                RemoveInfo = Assetremoveservice.RetrieveAssetremoveByAssetremoveid(Removeid);
                if (RemoveInfo == null) { return; }
                ExtractData(RemoveInfo);
                RemoveInfo.Approveresult = RemoveState;
                Assetremoveservice.UpdateAssetremoveByAssetremoveid(RemoveInfo);
                foreach (Assetremovedetail Assetremovedetail in RemoveDetail)
                {
                    Assetremovedetail.Assetremoveid = RemoveInfo.Assetremoveid;
                    if (AssetremovedetailService.RetrieveAssetremovedetailByDetailid(Assetremovedetail.Detailid) == null)
                    {
                        AssetremovedetailService.CreateAssetremovedetail(Assetremovedetail);
                    }
                    else
                    {
                        AssetremovedetailService.UpdateAssetremovedetailByDetailid(Assetremovedetail);
                    }
                }
            }
            else //新增
            {
                RemoveInfo = new Assetremove();
                ExtractData(RemoveInfo);
                RemoveInfo.Approveresult = RemoveState;
                Assetremoveservice.CreateAssetremove(RemoveInfo);
                foreach (Assetremovedetail Assetremovedetail in RemoveDetail)
                {
                    Assetremovedetail.Assetremoveid = RemoveInfo.Assetremoveid;
                    AssetremovedetailService.CreateAssetremovedetail(Assetremovedetail);
                }
            }
        }

        protected void ExtractData(Assetremove assetRemoveinfo)
        {
            assetRemoveinfo.Assetremoveid = Removeid;//申请单号
            assetRemoveinfo.Assetcategoryid = ucSeletedSystem.Assetcategoryid;//(系统)设备大类
            assetRemoveinfo.Applydate = ucApplyRemoveDate.DateValue;//申请拆机日期
            assetRemoveinfo.Applycontent = txtApplycontent.Text;//申请内容
            assetRemoveinfo.Applydate = ucApplyDate.DateValue;//申请日期
            assetRemoveinfo.Applyuserid = ucApplyuser.UserId;//申请人                                   
            assetRemoveinfo.Storagetitle = ucSelectProject.Storagetitle;//区分字段：分公司或项目体
            assetRemoveinfo.Storageid = ucSelectProject.StorageId;//项目体ID或分公司ID            
            assetRemoveinfo.Contactphone = txtContactphone.Text;//联系电话
            assetRemoveinfo.Projectcontactorid = ucProjectcontactorid.UserId;//项目体联系人
            assetRemoveinfo.Projectcontactorphone = txtProjectcontactorphone.Text;//项目体联系电话
            assetRemoveinfo.Createddate = DateTime.Now;//创建日期
            assetRemoveinfo.Creator = WebContext.Current.CurrentUser.Id;//创建人
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
                    if (RemoveDetail.Where(p => p.Assetno == assetNo).Count() == 0) { assetNos.Add(assetNo); }
                }
                var assetInfos = AssetService.RetrieveAssetByAssetno(assetNos);
                if (assetInfos.Count > 0)
                {
                    foreach (var entity in assetInfos)
                    {
                        Assetremovedetail data = new Assetremovedetail();
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
                        RemoveDetail.Add(data);
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
        protected void rptAssetsList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var Detailid = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            {
                if (!string.IsNullOrEmpty(Removeid))
                {
                    var existInfo = RemoveDetail.Where(p => p.Detailid == Detailid).FirstOrDefault();
                    if (existInfo != null)
                    {
                        RemoveDetail.Remove(existInfo);
                        AssetremovedetailService.DeleteAssetremovedetailByDetailid(existInfo.Detailid);
                    }
                    UIHelper.Alert(this, "删除成功");
                    BindDetails();
                }
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (!ucApplyRemoveDate.DateValue.HasValue)
            {
                UIHelper.Alert(this, "请选择申请拆机日期!");
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
            SaveData(AssetRemoveState.Draft);
            UIHelper.AlertMessageGoToURL(this, "保存成功!", ResolveUrl("~/Admin/RemoveList.aspx"));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!ucApplyRemoveDate.DateValue.HasValue)
            {
                UIHelper.Alert(this, "请选择申请拆机日期!");
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
            if (RemoveDetail.Count == 0)
            {
                UIHelper.Alert(this, "请选择设备!");
                return;
            }
            SaveData(AssetRemoveState.Sumitted);
            UIHelper.AlertMessageGoToURL(this, "提交成功!", ResolveUrl("~/Admin/RemoveList.aspx"));
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Admin/RemoveList.aspx"));
        }
        #endregion  
    }
}