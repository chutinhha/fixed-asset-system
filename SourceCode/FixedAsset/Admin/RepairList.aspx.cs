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
    public partial class RepairList : BasePage
    {
        #region Properties
        protected IAssetmaintainService AssetmaintainService
        {
            get
            {
                return new AssetmaintainService();
            }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                LoadData(0);
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
        protected void rptRepairList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var BtnEdit = e.Item.FindControl("BtnEdit") as ImageButton;
                var BtnDeleted = e.Item.FindControl("BtnDeleted") as ImageButton;
                var BtnReply = e.Item.FindControl("BtnApprove") as ImageButton;
                var BtnComfirm = e.Item.FindControl("BtnComfirm") as ImageButton;
                //
                var headInfo = e.Item.DataItem as Assetmaintain;
                BtnDeleted.Visible = false;
                BtnEdit.Visible = false;
                switch (headInfo.Approveresult)
                {
                    case AssetMaintainState.Draft:
                        BtnDeleted.Visible = true;
                        BtnEdit.Visible = true;
                        break;
                    case AssetMaintainState.Sumitted:
                        BtnReply.Visible = true;
                        break;
                    case AssetMaintainState.Replied:
                        BtnComfirm.Visible = true;
                        break;
                }
            }
        }
        protected void rptRepairList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var assetMaintainId = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            {
                if (!string.IsNullOrEmpty(assetMaintainId))
                {
                    AssetmaintainService.DeleteAssetmaintainByAssetmaintainid(assetMaintainId);
                    UIHelper.Alert(this, "删除成功");
                    LoadData(pcData.CurrentIndex);
                }
            }
            if (e.CommandName.Equals("EditDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/NewRepairing.aspx?Assetmaintainid={0}", assetMaintainId)));
            }
            else if (e.CommandName.Equals("ReplyDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/Repair_Reply.aspx?Assetmaintainid={0}", assetMaintainId)));
            }
            else if (e.CommandName.Equals("ComfirmDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/Repair_Reply.aspx?Assetmaintainid={0}", assetMaintainId)));//维修结束后确认
            }
            else
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/Repair_View.aspx?Assetmaintainid={0}", assetMaintainId)));
            }
        }
        #endregion

        #region  Methods
        protected void LoadData(int pageIndex)
        {
            var search = new AssetmaintainSearch();
            search.Assetmaintainid = txtSrchAssetmaintainid.Text;//维修单编号
            //search.Assetcategoryid = txtSrchAssetcategoryid.Text;//(系统)设备大类
            //search.Maintaintype = txtSrchMaintaintype.Text;//保修来源：(项目体、自检、月检）数据字典
            if (ucSrchStartApplydate.DateValue.HasValue)
            {
                search.StartApplydate = ucSrchStartApplydate.DateValue.Value;//申请维修日期
            }
            if (ucSrchEndApplydate.DateValue.HasValue)
            {
                search.EndApplydate = ucSrchEndApplydate.DateValue.Value;//申请维修日期
            }
            

            search.Storagetitle = ucSelectProject.Storagetitle;//区分字段：分公司或项目体
            search.Storageid = ucSelectProject.StorageId;//项目体ID或分公司ID
            
            #region deleted Code
            //search.Applyuserid = txtSrchApplyuserid.Text;//申请人
            //search.Applycontent = txtSrchApplycontent.Text;//申请内容
            //search.Approveuser = txtSrchApproveuser.Text;//审核人
            //if (ucSrchStartApprovedate.DateValue.HasValue)
            //{
            //    search.StartApprovedate = ucSrchStartApprovedate.DateValue.Value;//审核日期
            //}
            //if (ucSrchEndApprovedate.DateValue.HasValue)
            //{
            //    search.EndApprovedate = ucSrchEndApprovedate.DateValue.Value;//审核日期
            //}
            //search.Rejectreason = txtSrchRejectreason.Text;//拒绝理由
            //if (ucSrchStartPlanmaintaindate.DateValue.HasValue)
            //{
            //    search.StartPlanmaintaindate = ucSrchStartPlanmaintaindate.DateValue.Value;//计划维修日期
            //}
            //if (ucSrchEndPlanmaintaindate.DateValue.HasValue)
            //{
            //    search.EndPlanmaintaindate = ucSrchEndPlanmaintaindate.DateValue.Value;//计划维修日期
            //}
            //if (ucSrchStartActualmaintaindate.DateValue.HasValue)
            //{
            //    search.StartActualmaintaindate = ucSrchStartActualmaintaindate.DateValue.Value;//实际维修日期
            //}
            //if (ucSrchEndActualmaintaindate.DateValue.HasValue)
            //{
            //    search.EndActualmaintaindate = ucSrchEndActualmaintaindate.DateValue.Value;//实际维修日期
            //}
            //if (ucSrchStartConfirmdate.DateValue.HasValue)
            //{
            //    search.StartConfirmdate = ucSrchStartConfirmdate.DateValue.Value;//确认日期
            //}
            //if (ucSrchEndConfirmdate.DateValue.HasValue)
            //{
            //    search.EndConfirmdate = ucSrchEndConfirmdate.DateValue.Value;//确认日期
            //}
            //search.Confirmuser = txtSrchConfirmuser.Text;//确认人
            //search.Maintaincontent = txtSrchMaintaincontent.Text;//已维修明细
            //search.Subcompany = txtSrchSubcompany.Text;//分公司
            //search.Subcompanycontactorid = txtSrchSubcompanycontactorid.Text;//分公司联系人
            //search.Contactphone = txtSrchContactphone.Text;//联系电话
            //search.Projectcontactorid = txtSrchProjectcontactorid.Text;//项目体联系人
            //search.Projectcontactorphone = txtSrchProjectcontactorphone.Text;//项目体联系电话
            //search.Creator = txtSrchCreator.Text;//创建人
            //if (ucSrchStartCreateddate.DateValue.HasValue)
            //{
            //    search.StartCreateddate = ucSrchStartCreateddate.DateValue.Value;//创建日期
            //}
            //if (ucSrchEndCreateddate.DateValue.HasValue)
            //{
            //    search.EndCreateddate = ucSrchEndCreateddate.DateValue.Value;//创建日期
            //}
            #endregion

            int recordCount = 0;
            var list = this.AssetmaintainService.RetrieveAssetmaintainsPaging(search, pageIndex, pcData.PageSize, out recordCount);
            rptRepairList.DataSource = list;
            rptRepairList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}