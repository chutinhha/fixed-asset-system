using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using SeallNet.Utility;

namespace FixedAsset.Web.Admin
{
    public partial class Role_Add : BasePage
    {
        #region Properties
        protected string Roleid
        {
            get
            {
                if (ViewState["Roleid"] == null)
                {
                    ViewState["Roleid"] = string.Empty;
                }
                return ViewState["Roleid"].ToString();
            }
            set { ViewState["Roleid"] = value; }
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
                Roleid = PageUtility.GetQueryStringValue("Roleid");
                if (!string.IsNullOrEmpty(Roleid))
                {
                    var info = RoleinfoService.RetrieveRoleinfoByRoleid(Roleid);
                    if (info != null)
                    {
                        ReadEntityToControl(info);
                    }
                }
            }
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtRolename.Text))
            {
                UIHelper.Alert(this.UpdatePanel1, "请输入角色名!");
                return;
            }
            var existInfo = RoleinfoService.RetrieveRoleinfoByRoleName(txtRolename.Text.Trim());
            if(existInfo!=null&&existInfo.Roleid!=Roleid)
            {
                UIHelper.Alert(this.UpdatePanel1, "角色名重复，请重新输入角色名!");
                return;
            }
            Roleinfo roleInfo = null;
            if (string.IsNullOrEmpty(Roleid))
            {
                roleInfo = new Roleinfo();
            }
            else
            {
                //roleInfo = RoleinfoService.RetrieveRoleinfoByRoleid(Roleid);
                roleInfo = existInfo;
                if (roleInfo == null) { roleInfo = new Roleinfo(); }
            }
            WriteControlValueToEntity(roleInfo);
            if(string.IsNullOrEmpty(roleInfo.Roleid))
            {
                roleInfo.Roleid = Guid.NewGuid().ToString("N");
                RoleinfoService.CreateRoleinfo(roleInfo);
            }
            else
            {
                RoleinfoService.UpdateRoleinfoByRoleid(roleInfo);
            }
            UIHelper.AlertMessageGoToURL(this.UpdatePanel1, "保存成功!", ResolveUrl("~/Admin/Role_List.aspx"));
        }
        #endregion

        #region Methods
        protected void ReadEntityToControl(Roleinfo roleinfo)
        {
            txtRolename.Text = roleinfo.Rolename;//角色名
            //txtRolestate.Text = roleinfo.Rolestate.ToString(UiConst.MoneyFormat);//角色状态
            txtDescription.Text = roleinfo.Description;//角色描述
            //txtAllowedit.Text = roleinfo.Allowedit.ToString(UiConst.MoneyFormat);//允许编辑
            if (roleinfo.Createddate.HasValue)
            {
                litCreateddate.Text = roleinfo.Createddate.Value.ToString(UiConst.DateFormat);//创建时间
            }
            litCreator.Text = roleinfo.Creator;//创建者
            if (roleinfo.Lastmodifieddate.HasValue)
            {
                litLastmodifieddate.Text = roleinfo.Lastmodifieddate.Value.ToString(UiConst.DateFormat);//最近修改时间
            }
            litLstmofifiedby.Text = roleinfo.Lastmodifiedby;//最近修改者
        }

        protected void WriteControlValueToEntity(Roleinfo roleinfo)
        {
            roleinfo.Roleid = Roleid;//角色ID
            roleinfo.Rolename = txtRolename.Text;//角色名
            roleinfo.Rolestate = RoleState.Normal;//角色状态
            roleinfo.Description = txtDescription.Text;//角色描述
            roleinfo.Allowedit = true;//允许编辑
            roleinfo.Createddate = DateTime.Now;//创建时间
            if (WebContext.Current.CurrentUser != null)
            {
                roleinfo.Creator = WebContext.Current.CurrentUser.Username; //创建者
            }
            if(!string.IsNullOrEmpty(roleinfo.Roleid))
            {
                roleinfo.Lastmodifieddate = DateTime.Now;//最近修改时间
                if (WebContext.Current.CurrentUser != null)
                {
                    roleinfo.Lastmodifiedby = WebContext.Current.CurrentUser.Username; //最近修改者
                }
            }
        }
        #endregion
    }
}