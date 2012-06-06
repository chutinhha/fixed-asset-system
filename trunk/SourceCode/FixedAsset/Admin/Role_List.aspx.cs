using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using SeallNet.Utility;

namespace FixedAsset.Web.Admin
{
    public partial class Role_List : BasePage
    {
        #region Properties
        protected IRoleinfoService RoleinfoService
        {
            get { return new RoleinfoService(); }
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
        protected void rptRoleList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var BtnEdit = e.Item.FindControl("BtnEdit") as ImageButton;
                var BtnDeleted = e.Item.FindControl("BtnDeleted") as ImageButton;
                var headInfo = e.Item.DataItem as Roleinfo;
                //BtnEdit.AlternateText = EnumUtil.RetrieveEnumDescript(headInfo.Approveresult);
                //if (headInfo.Approveresult == ApproveResult.Draft)
                //{
                //    BtnDeleted.Visible = true;
                //}
                //else
                //{
                //    BtnDeleted.Visible = false;
                //}
            }
        }
        protected void rptRoleList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var roleId = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            {
                if (!string.IsNullOrEmpty(roleId))
                {
                    RoleinfoService.DeleteRoleinfoByRoleid(roleId);
                    UIHelper.Alert(this, "删除成功");
                    LoadData(pcData.CurrentIndex);
                }
            }
            if (e.CommandName.Equals("EditDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/Role_Add.aspx?roleId={0}", roleId)));
            }
            if(e.CommandName.Equals("AddRight"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/Role_AddRight.aspx?roleId={0}", roleId)));
            }
            if(e.CommandName.Equals("ViewDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/Role_View.aspx?roleId={0}", roleId)));
            }
        }
        #endregion

        #region  Methods
        protected void LoadData(int pageIndex)
        {
            RoleinfoSearch search = new RoleinfoSearch();
            search.Rolename = txtSrchRolename.Text;//角色名
            int recordCount = 0;
            var list = this.RoleinfoService.RetrieveRoleinfosPaging(search, pageIndex, pcData.PageSize, out recordCount);
            rptRoleList.DataSource = list;
            rptRoleList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}