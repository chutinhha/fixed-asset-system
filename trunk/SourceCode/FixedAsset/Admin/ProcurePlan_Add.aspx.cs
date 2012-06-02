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
    public partial class ProcurePlan_Add : BasePage
    {
        #region Properties
        protected string Psid
        {
            get
            {
                if (ViewState["Psid"] == null)
                {
                    ViewState["Psid"] = string.Empty;
                }
                return ViewState["Psid"].ToString();
            }
            set { ViewState["Psid"] = value; }
        }
        protected IProcurementscheduleheadService ProcurementscheduleheadService
        {
            get { return new ProcurementscheduleheadService(); }
        }
        protected IProcurementscheduledetailService ProcurementscheduledetailService
        {
            get { return new ProcurementscheduledetailService(); }
        }
        protected List<Procurementscheduledetail> ProcureScheduleDetails
        {
            get
            {
                if (Session["ProcurePlan_Add_Procurementscheduledetail"] == null)
                {
                    Session["ProcurePlan_Add_Procurementscheduledetail"] = new List<Procurementscheduledetail>();
                }
                return Session["ProcurePlan_Add_Procurementscheduledetail"] as List<Procurementscheduledetail>;
            }
        }
        protected IAssetcategoryService AssetcategoryService
        {
            get { return new AssetcategoryService(); }
        }
        protected List<Assetcategory> AssetCategories
        {
            get
            {
                if (Session["AssetCategories"] == null)
                {
                    Session["AssetCategories"] = new List<Assetcategory>();
                }
                return Session["AssetCategories"] as List<Assetcategory>;
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
                Psid = PageUtility.GetQueryStringValue("Psid");
                if (!string.IsNullOrEmpty(Psid))
                {
                    var headInfo = ProcurementscheduleheadService.RetrieveProcurementscheduleheadByPsid(Psid);
                    if (headInfo != null)
                    {
                        ReadEntityToControl(headInfo);
                        var list = ProcurementscheduledetailService.RetrieveProcurementscheduledetailListByPsid(Psid);
                        ProcureScheduleDetails.AddRange(list);
                    }
                }
                LoadDetailList();
            }
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            DateTime dateTime = DateTime.MinValue;
            if (!ucProcurementscheduledate.DateValue.HasValue)
            {
                UIHelper.Alert(UpdatePanel1, "请选择计划采购日期!");
                return;
            }
            if (string.IsNullOrEmpty(ucSubCompany.SubcompanyId))
            {
                UIHelper.Alert(UpdatePanel1, "请选择分公司!");
                return;
            }
            if (!ucApplydate.DateValue.HasValue)
            {
                UIHelper.Alert(UpdatePanel1, "请选择申请日期!");
                return;
            }
            Procurementschedulehead headInfo = null;
            if (string.IsNullOrEmpty(Psid))
            {
                //add
                headInfo = new Procurementschedulehead();
                WriteControlValueToEntity(headInfo);
                this.ProcurementscheduleheadService.CreateProcurementschedulehead(headInfo, ProcureScheduleDetails);
            }
            else
            {
                //edit
                headInfo = ProcurementscheduleheadService.RetrieveProcurementscheduleheadByPsid(Psid);
                if (headInfo == null) { UIHelper.Alert(this.UpdatePanel1, "对不起，计划已被删除,请重新录入！"); return; }
                WriteControlValueToEntity(headInfo);
                headInfo.Approveresult = ApproveResult.Draft;
                ProcurementscheduleheadService.UpdateProcurementscheduleheadByPsid(headInfo, ProcureScheduleDetails);
            }
            UIHelper.AlertMessageGoToURL(this.UpdatePanel1, "保存成功!", ResolveUrl("~/Admin/ProcurePlanList.aspx"));
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DateTime dateTime = DateTime.MinValue;
            if (!ucProcurementscheduledate.DateValue.HasValue)
            {
                UIHelper.Alert(UpdatePanel1, "请选择计划采购日期!");
                return;
            }
            if (string.IsNullOrEmpty(ucSubCompany.SubcompanyId))
            {
                UIHelper.Alert(UpdatePanel1, "请选择分公司!");
                return;
            }
            if (!ucApplydate.DateValue.HasValue)
            {
                UIHelper.Alert(UpdatePanel1, "请选择申请日期!");
                return;
            }
            if (ProcureScheduleDetails.Count == 0)
            {
                UIHelper.Alert(this.UpdatePanel1, "请录入采购计划明细！"); return;
            }
            Procurementschedulehead headInfo = null;
            if (string.IsNullOrEmpty(Psid))
            {
                //add
                headInfo = new Procurementschedulehead();
                WriteControlValueToEntity(headInfo);
                headInfo.Approveresult = ApproveResult.Approving;
                this.ProcurementscheduleheadService.CreateProcurementschedulehead(headInfo, ProcureScheduleDetails);
            }
            else
            {
                //edit
                headInfo = ProcurementscheduleheadService.RetrieveProcurementscheduleheadByPsid(Psid);
                if (headInfo == null) { UIHelper.Alert(this.UpdatePanel1, "对不起，计划已被删除,请重新录入！"); return; }
                WriteControlValueToEntity(headInfo);
                headInfo.Approveresult = ApproveResult.Approving;
                ProcurementscheduleheadService.UpdateProcurementscheduleheadByPsid(headInfo, ProcureScheduleDetails);
            }
            UIHelper.AlertMessageGoToURL(this.UpdatePanel1, "提交成功!", ResolveUrl("~/Admin/ProcurePlanList.aspx"));
        }

        #region 明细
        protected void BtnRefreshDetail_Click(object sender, EventArgs e)
        {
            LoadDetailList();
        }
        protected void rptProcureDetailList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var BtnEdit = e.Item.FindControl("BtnEdit") as ImageButton;
                var BtnDeleted = e.Item.FindControl("BtnDeleted") as ImageButton;
                var detailInfo = e.Item.DataItem as Procurementscheduledetail;
                if (string.IsNullOrEmpty(detailInfo.Detailid))
                {
                    BtnEdit.Visible = false;
                    BtnDeleted.Visible = false;
                }
                else
                {
                    BtnEdit.Attributes.Add("onclick", string.Format("ShowTopDialogFrame('修改明细', 'ProcurePlanDetail_Add.aspx?Detailid={0}','RefreshDetail()',790,500);return false;", detailInfo.Detailid));
                }
            }
        }
        protected void rptProcureDetailList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var detailId = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            {
                if (!string.IsNullOrEmpty(detailId))
                {
                    if (!string.IsNullOrEmpty(Psid)) { ProcurementscheduledetailService.DeleteProcurementscheduledetailByDetailid(detailId); }
                    var detailInfo = ProcureScheduleDetails.Where(p => p.Detailid == detailId).FirstOrDefault();
                    ProcureScheduleDetails.Remove(detailInfo);
                    LoadDetailList();
                }
            }
            if (e.CommandName.Equals("EditDetail"))
            {

            }
        }
        #endregion

        #endregion

        #region Methods
        protected void InitData()
        {
            AssetCategories.Clear();
            ProcureScheduleDetails.Clear();
            ucApplydate.DateValue = DateTime.Today;//申请日期，默认当天
            if (WebContext.Current.CurrentUser != null)
            {
                //txtApplyuser.Text = WebContext.Current.CurrentUser.Username;//默认当前登录用户
                ucApplyuser.UserId = WebContext.Current.CurrentUser.Id;//默认当前登录用户
                //ucApplyuser.Username = WebContext.Current.CurrentUser.Username;//默认当前登录用户
            }
            if (AssetCategories.Count == 0)
            {
                var list = AssetcategoryService.RetrieveAllAssetcategory();
                AssetCategories.AddRange(list);
            }
        }
        protected void ReadEntityToControl(Procurementschedulehead headInfo)
        {
            litPsid.Text = headInfo.Psid;
            if (headInfo.Procurementscheduledate.HasValue)
            {
                ucProcurementscheduledate.DateValue = headInfo.Procurementscheduledate;
            }
            txtReason.Text = headInfo.Reason;
            ucSubCompany.SubcompanyId = headInfo.Subcompany;
            //txtApplyuser.Text = headInfo.Applyuser;
            ucApplyuser.Username = headInfo.Applyuser;
            if (headInfo.Applydate.HasValue)
            {
                ucApplydate.DateValue = headInfo.Applydate;
            }
        }
        protected void WriteControlValueToEntity(Procurementschedulehead headInfo)
        {
            headInfo.Psid = litPsid.Text;
            headInfo.Procurementscheduledate = ucProcurementscheduledate.DateValue;
            headInfo.Reason = txtReason.Text;
            headInfo.Subcompany = ucSubCompany.SubcompanyId;
            headInfo.Applyuser = ucApplyuser.Username;
            headInfo.Applydate = ucApplydate.DateValue;
            if (!headInfo.Createddate.HasValue)
            {
                headInfo.Createddate = DateTime.Now;
            }
        }
        protected void LoadDetailList()
        {
            foreach (var detail in ProcureScheduleDetails)
            {
                var subCategory =
                    AssetCategories.Where(p => p.Assetcategoryid == detail.Assetcategoryid).FirstOrDefault();
                if (subCategory == null)
                {
                    detail.CategoryAllPathName = detail.Assetcategoryid;
                }
                else
                {
                    var category =
                        AssetCategories.Where(p => p.Assetcategoryid == subCategory.Assetparentcategoryid).
                            FirstOrDefault();
                    detail.CategoryAllPathName = string.Format(@"{0}-{1}", category.Assetcategoryname, subCategory.Assetcategoryname);
                }
            }
            rptProcureDetailList.DataSource = ProcureScheduleDetails;
            rptProcureDetailList.DataBind();
        }
        #endregion
    }
}