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
    public partial class ProcurePlan_Approve : BasePage
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
        protected void BtnApproved_Click(object sender, EventArgs e)
        {
            Procurementschedulehead headInfo = null;
            headInfo = ProcurementscheduleheadService.RetrieveProcurementscheduleheadByPsid(Psid);
            if (headInfo == null) { UIHelper.Alert(this.UpdatePanel1, "对不起，计划已被删除,请重新录入！"); return; }
            WriteControlValueToEntity(headInfo);
            headInfo.Approveresult = ApproveResult.Approved;
            ProcurementscheduleheadService.UpdateProcurementscheduleheadByPsid(headInfo, ProcureScheduleDetails);
            UIHelper.AlertMessageGoToURL(this.UpdatePanel1, "审批通过!", ResolveUrl("~/Admin/ProcurePlanList.aspx"));
        }
        protected void btnReject_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtRejectreason.Text))
            {
                UIHelper.Alert(this.UpdatePanel1, "请输入审批意见！");
                return;
            }
            Procurementschedulehead headInfo = null;
            headInfo = ProcurementscheduleheadService.RetrieveProcurementscheduleheadByPsid(Psid);
            if (headInfo == null) { UIHelper.Alert(this.UpdatePanel1, "对不起，计划已被删除,请重新录入！"); return; }
            WriteControlValueToEntity(headInfo);
            headInfo.Approveresult = ApproveResult.Rejected;
            ProcurementscheduleheadService.UpdateProcurementscheduleheadByPsid(headInfo, ProcureScheduleDetails);
            UIHelper.AlertMessageGoToURL(this.UpdatePanel1, "审批拒绝!", ResolveUrl("~/Admin/ProcurePlanList.aspx"));
        }

        #region 明细
        protected void rptProcureDetailList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
               
            }
        }
        protected void rptProcureDetailList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            
        }
        #endregion

        #endregion

        #region Methods
        protected void InitData()
        {
            ucSubCompany.IsShowSubCompanyName = true;
            AssetCategories.Clear();
            ProcureScheduleDetails.Clear();
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
                litProcurementscheduledate.Text = headInfo.Procurementscheduledate.Value.ToString(UiConst.DateFormat);
            }
            litReason.Text = headInfo.Reason;
            ucSubCompany.SubcompanyId = headInfo.Subcompany;
            litApplyuser.Text = headInfo.Applyuser;
            if (headInfo.Applydate.HasValue)
            {
                litApplydate.Text = headInfo.Applydate.Value.ToString(UiConst.DateFormat);
            }
        }
        protected void WriteControlValueToEntity(Procurementschedulehead headInfo)
        {
            headInfo.Rejectreason = string.IsNullOrEmpty(txtRejectreason.Text) ? "无意见" : txtRejectreason.Text;
            headInfo.Approvedate = DateTime.Now;
            if (WebContext.Current.CurrentUser != null)
            {
                headInfo.Approveuser = WebContext.Current.CurrentUser.Username;
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