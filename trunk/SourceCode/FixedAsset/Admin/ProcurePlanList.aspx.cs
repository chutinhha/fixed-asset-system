using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin
{
    public partial class ProcurePlanList : System.Web.UI.Page
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            LoadData(0);
        }
        protected void LoadData(int pageIndex)
        {
            var search = new ProcurementscheduleheadSearch();
            search.Psid = txtSrchPsid.Text;
            //DateTime startprocurementscheduledate = DateTime.MinValue;
            //if (DateTime.TryParse(txtSrchStartProcurementscheduledate.Text, out startprocurementscheduledate))
            //{
            //    search.StartProcurementscheduledate = startprocurementscheduledate;
            //}
            //DateTime endprocurementscheduledate = DateTime.MinValue;
            //if (DateTime.TryParse(txtSrchEndProcurementscheduledate.Text, out endprocurementscheduledate))
            //{
            //    search.EndProcurementscheduledate = endprocurementscheduledate;
            //}
            //search.Reason = txtSrchReason.Text;
            //search.Subcompany = txtSrchSubcompany.Text;
            //search.Applyuser = txtSrchApplyuser.Text;
            //DateTime startapplydate = DateTime.MinValue;
            //if (DateTime.TryParse(txtSrchStartApplydate.Text, out startapplydate))
            //{
            //    search.StartApplydate = startapplydate;
            //}
            //DateTime endapplydate = DateTime.MinValue;
            //if (DateTime.TryParse(txtSrchEndApplydate.Text, out endapplydate))
            //{
            //    search.EndApplydate = endapplydate;
            //}
            //search.Approveuser = txtSrchApproveuser.Text;
            //DateTime startapprovedate = DateTime.MinValue;
            //if (DateTime.TryParse(txtSrchStartApprovedate.Text, out startapprovedate))
            //{
            //    search.StartApprovedate = startapprovedate;
            //}
            //DateTime endapprovedate = DateTime.MinValue;
            //if (DateTime.TryParse(txtSrchEndApprovedate.Text, out endapprovedate))
            //{
            //    search.EndApprovedate = endapprovedate;
            //}
            //search.Rejectreason = txtSrchRejectreason.Text;
            //DateTime startcreateddate = DateTime.MinValue;
            //if (DateTime.TryParse(txtSrchStartCreateddate.Text, out startcreateddate))
            //{
            //    search.StartCreateddate = startcreateddate;
            //}
            //DateTime endcreateddate = DateTime.MinValue;
            //if (DateTime.TryParse(txtSrchEndCreateddate.Text, out endcreateddate))
            //{
            //    search.EndCreateddate = endcreateddate;
            //}
            var procurementscheduleheadservice = new ProcurementscheduleheadService();
            int recordCount = 0;
            var list = procurementscheduleheadservice.RetrieveProcurementscheduleheadsPaging(search, pageIndex, 10, out recordCount);
            rptProcureList.DataSource = list;
            rptProcureList.DataBind();
        }
    }
}