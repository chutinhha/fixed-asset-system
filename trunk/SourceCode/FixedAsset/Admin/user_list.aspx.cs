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
    public partial class User_List :BasePage
    {
        #region Properties
        protected ITuserService TuserService
        {
            get
            {
                return new TuserService();
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
        /// <summary>
        /// 数据查询事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            LoadData(0);
        }
        /// <summary>
        /// 分页事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            LoadData(e.PageIndex);
        }
        protected void rptUserRoleList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var BtnEdit = e.Item.FindControl("BtnEdit") as ImageButton;
                var BtnDeleted = e.Item.FindControl("BtnDeleted") as ImageButton;
            }
        }
        protected void rptUserRoleList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var userId = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            {
                if (!string.IsNullOrEmpty(userId))
                {
                    //RoleinfoService.DeleteRoleinfoByRoleid(roleId);
                    //UIHelper.Alert(this, "删除成功");
                    //LoadData(pcData.CurrentIndex);
                }
            }
            if (e.CommandName.Equals("EditDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/User_AddRole.aspx?UserId={0}", userId)));
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

        #region Methods 
        protected void LoadData(int pageIndex)
        {
            var search = new TuserSearch();
            search.Username = txtSrchUsername.Text;//用户姓名
            search.Loginid = txtSrchLoginid.Text;//登录账号
            int recordCount = 0;
            var list = TuserService.RetrieveTusersPaging(search, pageIndex, pcData.PageSize, out recordCount);
            rptUserRoleList.DataSource = list;
            rptUserRoleList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}