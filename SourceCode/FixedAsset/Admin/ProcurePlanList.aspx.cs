﻿using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using SeallNet.Utility;

namespace FixedAsset.Web.Admin
{
    public partial class ProcurePlanList : BasePage
    {
        #region Properties
        protected IProcurementscheduleheadService ProcurementscheduleheadService
        {
            get { return new ProcurementscheduleheadService(); }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            { LoadData(0); }
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            LoadData(0);
        }
        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            LoadData(e.PageIndex);
        }
        protected void rptProcureList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var BtnEdit = e.Item.FindControl("BtnEdit") as ImageButton;
                var BtnDeleted = e.Item.FindControl("BtnDeleted") as ImageButton;
                var BtnApprove = e.Item.FindControl("BtnApprove") as ImageButton;
                var headInfo = e.Item.DataItem as Procurementschedulehead;
                BtnDeleted.Visible = false;
                BtnEdit.Visible = false;
                switch (headInfo.Approveresult)
                {
                    case ApproveResult.Draft:
                        BtnDeleted.Visible = true;
                        BtnEdit.Visible = true;
                        break;
                    case ApproveResult.Sumitted:
                        BtnApprove.Visible = true;
                        break;
                }
            }
        }
        protected void rptProcureList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var psId = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            {
                if (!string.IsNullOrEmpty(psId))
                {
                    ProcurementscheduleheadService.DeleteProcurementscheduleheadByPsid(psId);
                    UIHelper.Alert(this,"删除成功");
                    LoadData(pcData.CurrentIndex);
                    return;
                }
            }
            if (e.CommandName.Equals("EditDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/ProcurePlan_Add.aspx?Psid={0}", psId)));
            }
            else if(e.CommandName.Equals("ApproveDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/ProcurePlan_Approve.aspx?Psid={0}", psId)));
            }
            else
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/ProcurePlan_View.aspx?Psid={0}", psId)));
            }
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

            int recordCount = 0;
            var list = ProcurementscheduleheadService.RetrieveProcurementscheduleheadsPaging(search, pageIndex, pcData.PageSize, out recordCount);
            rptProcureList.DataSource = list;
            rptProcureList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}