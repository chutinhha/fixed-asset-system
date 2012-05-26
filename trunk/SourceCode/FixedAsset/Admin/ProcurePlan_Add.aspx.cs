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
        public IProcurementscheduledetailService ProcurementscheduledetailService
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
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if(!IsPostBack)
            {
                ProcureScheduleDetails.Clear();
                Psid = PageUtility.GetQueryStringValue("Psid");
                if(!string.IsNullOrEmpty(Psid))
                {
                    var headInfo = ProcurementscheduleheadService.RetrieveProcurementscheduleheadByPsid(Psid);
                    if(headInfo!=null)
                    {
                        ReadEntityToControl(headInfo);
                        var list = ProcurementscheduledetailService.RetrieveProcurementscheduledetailListByPsid(Psid);
                        ProcureScheduleDetails.AddRange(list);
                    }
                }
                LoadDetailList();
            }
        }
        protected void BtnSave_Click(object sender,EventArgs e)
        {
            Procurementschedulehead headInfo = null;
            if(string.IsNullOrEmpty(Psid))
            {
                //add
                headInfo=new Procurementschedulehead();
                WriteControlValueToEntity(headInfo);
                this.ProcurementscheduleheadService.CreateProcurementschedulehead(headInfo);
            }
            else
            {
                //edit
                headInfo = ProcurementscheduleheadService.RetrieveProcurementscheduleheadByPsid(Psid);
                if(headInfo==null){UIHelper.Alert(this.UpdatePanel1,"对不起，计划已被删除,请重新录入！");return;}
                WriteControlValueToEntity(headInfo);
                ProcurementscheduleheadService.UpdateProcurementscheduleheadByPsid(headInfo);
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Procurementschedulehead headInfo = null;
            if (string.IsNullOrEmpty(Psid))
            {
                //add
                headInfo = new Procurementschedulehead();
                WriteControlValueToEntity(headInfo);
                headInfo.Approveresult = ApproveResult.Approving;
                this.ProcurementscheduleheadService.CreateProcurementschedulehead(headInfo);
            }
            else
            {
                //edit
                headInfo = ProcurementscheduleheadService.RetrieveProcurementscheduleheadByPsid(Psid);
                if (headInfo == null) { UIHelper.Alert(this.UpdatePanel1, "对不起，计划已被删除,请重新录入！"); return; }
                WriteControlValueToEntity(headInfo);
                headInfo.Approveresult = ApproveResult.Approving;
                ProcurementscheduleheadService.UpdateProcurementscheduleheadByPsid(headInfo);
            }
        }

        #region 明细
        protected void BtnAddContractDetail_Click(object sender, EventArgs e)
        {
            //var script = new StringBuilder();
            //script.AppendFormat("EditContractDetail('{0}','{1}');", string.Format(ResolveUrl(@"~/Contract/AddContractDetail.aspx?RentContractState={0}"), RentContractState), BtnRefreshDetail.ClientID);
            //this.ScriptStartup(script.ToString());
        }
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
                if(string.IsNullOrEmpty(detailInfo.Detailid))
                {
                    BtnEdit.Visible = false;
                    BtnDeleted.Visible = false;
                }
            }
        }
        protected void rptProcureDetailList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var detailId = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            { 
                if(!string.IsNullOrEmpty(detailId))
                {
                    ProcurementscheduledetailService.DeleteProcurementscheduledetailByDetailid(detailId);
                    var detailInfo = ProcureScheduleDetails.Where(p => p.Detailid == detailId).FirstOrDefault();
                    ProcureScheduleDetails.Remove(detailInfo);
                }
            }
            if (e.CommandName.Equals("EditDetail"))
            {
                
            }
        }
        #endregion

        #endregion

        #region Methods
        protected void ReadEntityToControl(Procurementschedulehead headInfo)
        {
            litPsid.Text = headInfo.Psid;
            if (headInfo.Procurementscheduledate.HasValue)
            {
                txtProcurementscheduledate.Text =headInfo.Procurementscheduledate.Value.ToString(UiConst.DateFormat);
            }
            txtReason.Text = headInfo.Reason;
            txtSubcompany.Text = headInfo.Subcompany;
            txtApplyuser.Text = headInfo.Applyuser;
            if (headInfo.Applydate.HasValue)
            {
                txtApplydate.Text = headInfo.Applydate.Value.ToString(UiConst.DateFormat);
            }
            //txtApproveuser.Text = procurementschedulehead.Approveuser;
            //if (procurementschedulehead.Approvedate != DateTime.MinValue)
            //{
            //    txtApprovedate.Text = procurementschedulehead.Approvedate.ToString(PageConst.DateFormat);
            //}
            //txtApproveresult.Text = procurementschedulehead.Approveresult.ToString(PageConst.MoneyFormat);
            //txtRejectreason.Text = procurementschedulehead.Rejectreason;
            //if (procurementschedulehead.Createddate != DateTime.MinValue)
            //{
            //    txtCreateddate.Text = procurementschedulehead.Createddate.ToString(PageConst.DateFormat);
            //}
        }  
        protected void WriteControlValueToEntity(Procurementschedulehead headInfo)
        {
            headInfo.Psid = Guid.NewGuid().ToString("N");
            DateTime procurementscheduledate = DateTime.MinValue;
            if (DateTime.TryParse(txtProcurementscheduledate.Text, out procurementscheduledate))
            {
                headInfo.Procurementscheduledate = procurementscheduledate;
            }
            headInfo.Reason = txtReason.Text;
            headInfo.Subcompany = txtSubcompany.Text;
            headInfo.Applyuser = txtApplyuser.Text;
            DateTime applydate = DateTime.MinValue;
            if (DateTime.TryParse(txtApplydate.Text, out applydate))
            {
                headInfo.Applydate = applydate;
            }
            //procurementschedulehead.Approveuser = txtApproveuser.Text;
            //DateTime approvedate = DateTime.MinValue;
            //if (DateTime.TryParse(txtApprovedate.Text, out approvedate))
            //{
            //    procurementschedulehead.Approvedate = approvedate;
            //}
            //decimal approveresult = 0;
            //if (decimal.TryParse(txtApproveresult.Text, out approveresult))
            //{
            //    procurementschedulehead.Approveresult = approveresult;
            //}
            //procurementschedulehead.Rejectreason = txtRejectreason.Text;
            //DateTime createddate = DateTime.MinValue;
            //if (DateTime.TryParse(txtCreateddate.Text, out createddate))
            //{
            //    procurementschedulehead.Createddate = createddate;
            //}
            if (!headInfo.Createddate.HasValue)
            {
                headInfo.Createddate = DateTime.Now;
            }
        }
        protected void LoadDetailList()
        { 
            if(ProcureScheduleDetails.Count==0)
            {
                for (int i = 0; i < 3; i++)
                {
                    ProcureScheduleDetails.Add(new Procurementscheduledetail(){Detailid = string.Empty});
                }
            }
            else
            {
                var nullInfos = ProcureScheduleDetails.Where(p => string.IsNullOrEmpty(p.Detailid)).ToList();
                foreach (var info in nullInfos)
                {
                    ProcureScheduleDetails.Remove(info);
                }
            }
            rptProcureDetailList.DataSource = ProcureScheduleDetails;
            rptProcureDetailList.DataBind();
        }
        #endregion
    }
}