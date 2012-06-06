using System;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using SeallNet.Utility;

namespace FixedAsset.Web.Admin
{
    public partial class Role_View : BasePage
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
        
        #endregion

        #region Methods
        protected void ReadEntityToControl(Roleinfo roleinfo)
        {
            litRolename.Text = roleinfo.Rolename;//角色名
            //txtRolestate.Text = roleinfo.Rolestate.ToString(UiConst.MoneyFormat);//角色状态
            litDescription.Text = roleinfo.Description;//角色描述
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
        #endregion
    }
}