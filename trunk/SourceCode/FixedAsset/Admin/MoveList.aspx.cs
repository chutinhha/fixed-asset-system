using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FixedAsset.Web.Admin
{
    public partial class MoveList : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                //LoadData(0);
            }
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            LoadData(0);
        }
        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            LoadData(e.PageIndex);
        }
        #endregion

        #region  Methods
        protected void LoadData(int pageIndex)
        {

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

            int recordCount = 0;
            //var list = ProcurementscheduleheadService.RetrieveProcurementscheduleheadsPaging(search, pageIndex, pcData.PageSize, out recordCount);
            //rptProcureList.DataSource = list;
            //rptProcureList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}