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
                //var headInfo = ProcurementscheduleheadService.RetrieveProcurementscheduleheadByPsid(Psid);
                //if (headInfo == null) { return; }
                //if (headInfo.Approveresult == ApproveResult.Draft)
                //{
                //    Response.Redirect(ResolveUrl(string.Format("~/Admin/ProcurePlan_Add.aspx?Psid={0}", Psid)));
                //}
                //else if (headInfo.Approveresult == ApproveResult.Approving)
                //{
                //    Response.Redirect(ResolveUrl(string.Format("~/Admin/ProcurePlan_Approve.aspx?Psid={0}", Psid)));
                //}
                //else
                //{
                //    Response.Redirect(ResolveUrl(string.Format("~/Admin/ProcurePlan_View.aspx?Psid={0}", Psid)));
                //}
            }
        }
        #endregion

        #region  Methods
        protected void LoadData(int pageIndex)
        {
            RoleinfoSearch search = new RoleinfoSearch();
            //search.Roleid = txtSrchRoleid.Text;//角色ID
            search.Rolename = txtSrchRolename.Text;//角色名
            //search.Description = txtSrchDescription.Text;//角色描述
            //if (ucSrchStartCreateddate.DateValue.HasValue)
            //{
            //    search.StartCreateddate = ucSrchStartCreateddate.DateValue.Value;//创建时间
            //}
            //if (ucSrchEndCreateddate.DateValue.HasValue)
            //{
            //    search.EndCreateddate = ucSrchEndCreateddate.DateValue.Value;//创建时间
            //}
            //search.Creator = txtSrchCreator.Text;//创建者
            //if (ucSrchStartLastmodifieddate.DateValue.HasValue)
            //{
            //    search.StartLastmodifieddate = ucSrchStartLastmodifieddate.DateValue.Value;//最近修改时间
            //}
            //if (ucSrchEndLastmodifieddate.DateValue.HasValue)
            //{
            //    search.EndLastmodifieddate = ucSrchEndLastmodifieddate.DateValue.Value;//最近修改时间
            //}
            //search.Lstmofifiedby = txtSrchLstmofifiedby.Text;//最近修改者
            
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