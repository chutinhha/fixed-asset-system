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
    public partial class InstallList : BasePage
    {
        public IAssetsetupinfoService AssetSetupinfoService
        {
            get { return new AssetsetupinfoService(); }
        }
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
        protected void rptAssetSetupList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var BtnEdit = e.Item.FindControl("BtnEdit") as ImageButton;
                var BtnDeleted = e.Item.FindControl("BtnDeleted") as ImageButton;
                var BtnReply = e.Item.FindControl("BtnApprove") as ImageButton;
                var BtnComfirm = e.Item.FindControl("BtnComfirm") as ImageButton;
                var headInfo = e.Item.DataItem as Assetsetupinfo;
                BtnDeleted.Visible = false;
                BtnEdit.Visible = false;
                switch (headInfo.Approveresult)
                {
                    case SetupState.Draft:
                        BtnDeleted.Visible = true;
                        BtnEdit.Visible = true;
                        break;
                    case SetupState.Sumitted:
                        BtnReply.Visible = true;
                        break;
                    case SetupState.Replied:
                        BtnComfirm.Visible = true;
                        break;
                }
            }
        }
        protected void rptMoveList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var setupId = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            {
                if (!string.IsNullOrEmpty(setupId))
                {
                    AssetSetupinfoService.DeleteAssetsetupinfoBySetupid(setupId);
                    UIHelper.Alert(this, "删除成功");
                    LoadData(pcData.CurrentIndex);
                }
            }
            if (e.CommandName.Equals("EditDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/NewInstall.aspx?Setupid={0}", setupId)));
            }
            else if (e.CommandName.Equals("ReplyDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/ReplyInstall.aspx?Setupid={0}", setupId)));
            }
            else if (e.CommandName.Equals("ComfirmDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/ReplyInstall.aspx?Setupid={0}", setupId)));//安装结束后确认
            }
            else
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/ViewInstall.aspx?Setupid={0}", setupId)));
            }
        }
        #endregion

        #region  Methods
        protected void LoadData(int pageIndex)
        {
            var search = new AssetsetupinfoSearch();
            search.Setupid = txtSrchSetupid.Text;
            search.StartApplydate = ucSrchStartApplydate.DateValue;
            search.EndApplydate = ucSrchEndApplydate.DateValue;
            search.Storagetitle = ucSelectProject.Storagetitle;//区分字段：分公司或项目体
            search.Storageid = ucSelectProject.StorageId;//项目体ID或分公司ID
            int recordCount = 0;
            var list = AssetSetupinfoService.RetrieveAssetsetupinfosPaging(search, pageIndex, pcData.PageSize, out recordCount);
            rptAssetSetupList.DataSource = list;
            rptAssetSetupList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}