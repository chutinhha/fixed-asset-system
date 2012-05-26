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
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if(!IsPostBack){}
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
        #endregion
    }
}