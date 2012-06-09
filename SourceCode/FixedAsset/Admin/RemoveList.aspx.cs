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
    public partial class RemoveList : BasePage
    {
        #region Properties
        protected IAssetremoveService AssetremoveService
        {
            get
            {
                return new AssetremoveService();
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
        protected void rptRemoveList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var BtnEdit = e.Item.FindControl("BtnEdit") as ImageButton;
                var BtnDeleted = e.Item.FindControl("BtnDeleted") as ImageButton;
                var BtnReply = e.Item.FindControl("BtnReply") as ImageButton;
                var BtnComfirm = e.Item.FindControl("BtnComfirm") as ImageButton;
                var headInfo = e.Item.DataItem as Assetremove;
                BtnDeleted.Visible = false;
                BtnEdit.Visible = false;
                switch (headInfo.Approveresult)
                {
                    case AssetRemoveState.Draft:
                        BtnDeleted.Visible = true;
                        BtnEdit.Visible = true;
                        break;
                    case AssetRemoveState.Sumitted:
                        BtnReply.Visible = true;
                        break;
                    case AssetRemoveState.Replied:
                        BtnComfirm.Visible = true;
                        break;
                }
            }
        }
        protected void rptRemoveList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var assetRemoveId = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            {
                if (!string.IsNullOrEmpty(assetRemoveId))
                {
                    AssetremoveService.DeleteAssetremoveByAssetremoveid(assetRemoveId);
                    UIHelper.Alert(this, "删除成功");
                    LoadData(pcData.CurrentIndex);

                }
            }
            else if (e.CommandName.Equals("EditDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/NewRemoving.aspx?Assetremoveid={0}", assetRemoveId)));
            }
            else if (e.CommandName.Equals("ReplyDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/Remove_Reply.aspx?Assetremoveid={0}", assetRemoveId)));
            }
            else if (e.CommandName.Equals("ComfirmDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/Remove_Confirm.aspx?Assetremoveid={0}", assetRemoveId)));//拆机结束后确认
            }
            else
            {
               
                Response.Redirect(ResolveUrl(string.Format("~/Admin/Remove_View.aspx?Assetremoveid={0}", assetRemoveId)));
            }
        }
        #endregion

        #region  Methods
        protected void LoadData(int pageIndex)
        {
            var search = new AssetremoveSearch();
            search.Assetremoveid = txtSrchAssetremoveid.Text;//拆机单号
            if (ucSrchStartApplydate.DateValue.HasValue)
            {
                search.StartApplydate = ucSrchStartApplydate.DateValue.Value;//申请拆机日期
            }
            if (ucSrchEndApplydate.DateValue.HasValue)
            {
                search.EndApplydate = ucSrchEndApplydate.DateValue.Value;//申请拆机日期
            }
            search.Storagetitle = ucSelectProject.Storagetitle;//区分字段：分公司或项目体
            search.Storageid = ucSelectProject.StorageId;//项目体ID或分公司ID

            int recordCount = 0;
            var list = AssetremoveService.RetrieveAssetremovesPaging(search, pageIndex, pcData.PageSize, out recordCount);
            rptRemoveList.DataSource = list;
            rptRemoveList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}