﻿using System;
using System.Collections.Generic;
using FixedAsset.Domain;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin
{
    public partial class ProcurePlanList:BasePage
    {
        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if(!IsPostBack)
            { LoadData(0);}
        }
        protected void BtnSearch_Click(object sender,EventArgs e)
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
            var list = new List<Procurementschedulehead>();
            for (int i = 0; i < 6; i++)
            {
                Procurementschedulehead data = new Procurementschedulehead();
                data.Psid = Guid.NewGuid().ToString("N");
                data.Procurementscheduledate = DateTime.Today;
                data.Reason = "购买";
                data.Subcompany = "华为";
                data.Applyuser = "华为";
                data.Applydate = DateTime.Today;
                data.Approveuser = "华为1";
                data.Approvedate = DateTime.Now.AddDays(3);
                data.Approveresult = ApproveResult.Draft;
                data.Rejectreason = "华为1";
                data.Createddate = DateTime.Now;
                //procurementscheduleheadservice.CreateProcurementschedulehead(data); 
                list.Add(data);
            }

            int recordCount = list.Count; 
            //Procurementschedulehead data=new Procurementschedulehead();
            //data.Psid = Guid.NewGuid().ToString("N");
            //data.Procurementscheduledate = DateTime.Today;
            //data.Reason = "购买";
            //data.Subcompany = "华为";
            //data.Applyuser = "华为";
            //data.Applydate = DateTime.Today;
            //data.Approveuser = "华为1";
            //data.Approvedate = DateTime.Now.AddDays(3);
            //data.Approveresult = ApproveResult.Draft;
            //data.Rejectreason = "华为1";
            //data.Createddate =DateTime.Now;
            //procurementscheduleheadservice.CreateProcurementschedulehead(data);

            //int recordCount = 0;
            //var list = procurementscheduleheadservice.RetrieveProcurementscheduleheadsPaging(search, pageIndex, pageControl.PageSize, out recordCount);
            rptProcureList.DataSource = list;
            rptProcureList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}