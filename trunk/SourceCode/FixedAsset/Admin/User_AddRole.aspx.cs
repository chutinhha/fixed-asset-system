using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Web.AppCode;

namespace FixedAsset.Web.Admin
{
    public partial class User_AddRole : BasePage
    {
        #region Properties
        protected string UserId
        {
            get
            {
                if (ViewState["Id"] == null)
                {
                    ViewState["Id"] = string.Empty;
                }
                return ViewState["Id"].ToString();
            }
            set { ViewState["Id"] = value; }
        }
        protected ITuserService TuserService
        {
            get
            {
                return new TuserService();
            }
        }
        protected IUsermaproleinfoService UsermaproleinfoService
        {
            get
            {
                return new UsermaproleinfoService();
            }
        }
        protected IRoleinfoService RoleinfoService
        {
            get
            {
                return new RoleinfoService();
            }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                InitRoles();
                UserId = PageUtility.GetQueryStringValue("UserId");
                if(string.IsNullOrEmpty(UserId))
                {
                    Response.Redirect("~/admin/user_list.aspx");
                }
                var userInfo = TuserService.RetrieveTuserById(UserId);
                if(userInfo!=null)
                {
                    ReadEntityToControl(userInfo);
                }
            }
        }
        ///<summary>
        ///保存
        ///</summary>
        ///<param name="sender"></param>
        ///<param name="e"></param>
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (ddlRoleList.SelectedIndex == 0)
            {
                UIHelper.AlertMessage(this.UpdatePanel1, "请选择角色!");
                return;
            }
            var ownRoles = UsermaproleinfoService.RetrieveUsermaproleinfoByUseridRoleid(
                new List<string>() { UserId }, new List<string>());
            if(ownRoles.Count>0)
            {
                UsermaproleinfoService.DeleteUsermaproleinfoByUseridRoleid(new List<string>(){UserId},new List<string>());
            }
            var mapRoleInfo=new Usermaproleinfo(){Lastmodifieddate =DateTime.Now,Roleid = ddlRoleList.SelectedValue,Userid = UserId};
            if(WebContext.Current.CurrentUser!=null)
            {
                mapRoleInfo.Lastmodifiedby = WebContext.Current.CurrentUser.Username;
            }
            UsermaproleinfoService.CreateUsermaproleinfo(mapRoleInfo);
            UIHelper.AlertMessageGoToURL(this.UpdatePanel1, "保存成功!", ResolveUrl("~/Admin/user_list.aspx"));
        }
        #endregion

        #region Methods
        protected void InitRoles()
        {
            var search = new RoleinfoSearch();
            int recordCount = 0;
            search.Rolestates.Add(RoleState.Normal);
            var list = RoleinfoService.RetrieveRoleinfosPaging(search, 0, int.MaxValue, out recordCount);
            list.Insert(0, new Roleinfo() { Rolename = "==请选择==", Roleid = string.Empty });
            ddlRoleList.DataTextField = "Rolename";
            ddlRoleList.DataValueField = "Roleid";
            ddlRoleList.DataSource = list;
            ddlRoleList.DataBind();
        }
        protected void ReadEntityToControl(Tuser userInfo)
        {
            litUsername.Text = userInfo.Username;//用户姓名
            litLoginid.Text = userInfo.Loginid;//登录账号
            litNote.Text = userInfo.Note;//备注
            var ownRoles = UsermaproleinfoService.RetrieveUsermaproleinfoByUseridRoleid(
                new List<string>() {userInfo.Id}, new List<string>());
            if(ownRoles.Count>0)
            {
                //已分配角色
                litLstmofifiedby.Text = ownRoles[0].Lastmodifiedby;
                if (ownRoles[0].Lastmodifieddate.HasValue)
                {
                    litLastmodifieddate.Text = ownRoles[0].Lastmodifieddate.Value.ToString(UiConst.DateFormat);
                }
                ddlRoleList.SelectedValue = ownRoles[0].Roleid;
            }
        }
        #endregion
    }
}