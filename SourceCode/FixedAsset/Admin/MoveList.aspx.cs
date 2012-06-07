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
    public partial class MoveList : BasePage
    {
        #region Properties
        protected IAssetmoveService AssetmoveService
        {
            get
            {
                return new AssetmoveService();
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
        protected void rptMoveList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var BtnEdit = e.Item.FindControl("BtnEdit") as ImageButton;
                var BtnDeleted = e.Item.FindControl("BtnDeleted") as ImageButton;
                var BtnReply = e.Item.FindControl("BtnApprove") as ImageButton;
                var BtnComfirm = e.Item.FindControl("BtnComfirm") as ImageButton;
                var headInfo = e.Item.DataItem as Assetmove;
                BtnDeleted.Visible = false;
                BtnEdit.Visible = false;
                switch (headInfo.Approveresult)
                {
                    case AssetMoveState.Draft:
                        BtnDeleted.Visible = true;
                        BtnEdit.Visible = true;
                        break;
                    case AssetMoveState.Sumitted:
                        BtnReply.Visible = true;
                        break;
                    case AssetMoveState.Replied:
                        BtnComfirm.Visible = true;
                        break;
                }
            }
        }
        protected void rptMoveList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var assetMoveId = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            {
                if (!string.IsNullOrEmpty(assetMoveId))
                {
                    AssetmoveService.DeleteAssetmoveByAssetmoveid(assetMoveId);
                    UIHelper.Alert(this, "删除成功");
                    LoadData(pcData.CurrentIndex);
                }
            }
            if (e.CommandName.Equals("EditDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/NewMoving.aspx?Assetmoveid={0}", assetMoveId)));
            }
            else if (e.CommandName.Equals("ReplyDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/Move_Reply.aspx?Assetmoveid={0}", assetMoveId)));
            }
            else if (e.CommandName.Equals("ComfirmDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/Move_Reply.aspx?Assetmoveid={0}", assetMoveId)));//维修结束后确认
            }
            else
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/Move_View.aspx?Assetmoveid={0}", assetMoveId)));
            }
        }
        #endregion

        #region  Methods
        protected void LoadData(int pageIndex)
        {
            var search = new AssetmoveSearch();
            search.Assetmoveid = txtSrchAssetmoveid.Text;//移机单号
            if (ucSrchStartApplydate.DateValue.HasValue)
            {
                search.StartApplydate = ucSrchStartApplydate.DateValue.Value;//申请移机日期
            }
            if (ucSrchEndApplydate.DateValue.HasValue)
            {
                search.EndApplydate = ucSrchEndApplydate.DateValue.Value;//申请移机日期
            }
            search.Storagetitle = ucSelectProject.Storagetitle;//区分字段：分公司或项目体
            search.Storageid = ucSelectProject.StorageId;//项目体ID或分公司ID

            int recordCount = 0;
            var list = this.AssetmoveService.RetrieveAssetmovesPaging(search, pageIndex, pcData.PageSize, out recordCount);
            rptMoveList.DataSource = list;
            rptMoveList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}