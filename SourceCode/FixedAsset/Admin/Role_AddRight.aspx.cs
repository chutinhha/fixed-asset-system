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
    public partial class Role_AddRight : BasePage
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
        protected IRolepermissionService RolepermissionService
        {
            get { return new RolepermissionService(); }
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
                    var currentRoleInfo = RoleinfoService.RetrieveRoleinfoByRoleid(Roleid);
                    if (currentRoleInfo != null)
                    {
                        ReadEntityToControl(currentRoleInfo);
                    }
                    LoadTreeView();
                }
            }
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (tvMenuItems.CheckedNodes.Count == 0)
            {
                UIHelper.Alert(this.UpdatePanel1, "请选择菜单项!");
                return;
            }
            RolepermissionService.DeleteRolepermissionByRoleidMenuid(new List<string>(){Roleid},new List<string>());
            for (int i = 0; i < tvMenuItems.CheckedNodes.Count; i++)
            {
                var currentInfo = new Rolepermission(){Roleid = Roleid,Lastmodifieddate = DateTime.Now,Remark=string.Empty};
                if (WebContext.Current.CurrentUser != null)
                {
                    currentInfo.Lastmodifiedby = WebContext.Current.CurrentUser.Username;
                }
                currentInfo.Menuid = tvMenuItems.CheckedNodes[i].Value;
                RolepermissionService.CreateRolepermission(currentInfo);
            }
            UIHelper.AlertMessageGoToURL(this.UpdatePanel1, "保存成功!", ResolveUrl("~/Admin/Role_List.aspx"));
        }
        protected void tvMenuItems_TreeNodeCheckChanged(object sender, TreeNodeEventArgs e)
        {
            if(e.Node.ChildNodes.Count>0)
            {
                for (int i = 0; i < e.Node.ChildNodes.Count; i++)
                {
                    e.Node.ChildNodes[i].Checked = e.Node.Checked;
                }
            }
        }
        #endregion

        #region Methods
        protected void ReadEntityToControl(Roleinfo roleinfo)
        {
            litRolename.Text = roleinfo.Rolename;//角色名
            litDescription.Text = roleinfo.Description;//角色描述
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
        protected void LoadTreeView()
        {
            var menuItems = RolepermissionService.RetrieveMenuItemsByRoleId(Roleid);
            if(menuItems.Count==0)
            {
                var list = RolepermissionService.RetrieveAllMenuitems();
                menuItems.AddRange(list);
            }
            else
            {
                var list = RolepermissionService.RetrieveAllMenuitems();
                foreach (var menuitem in list)
                {
                    var existInfo = menuItems.Where(p => p.Menuid == menuitem.Menuid).FirstOrDefault();
                    if(existInfo==null){menuItems.Add(menuitem);}
                }
            }
            menuItems = (from p in menuItems
                         orderby p.Menuid ascending
                         select p).ToList();
            //菜单支持到2级
            var rootMenuItems = menuItems.Where(p => p.Parentmenuid == Menuitem.DefaultParentCode).ToList();
            foreach (var rootMenuItem in rootMenuItems)
            {
                var currentNode = new TreeNode(rootMenuItem.Menuname, rootMenuItem.Menuid);
                currentNode.SelectAction = TreeNodeSelectAction.Select;
                currentNode.ShowCheckBox = true;
                currentNode.Checked = !string.IsNullOrEmpty(rootMenuItem.Roleid);
                LoadSubTreeView(currentNode, rootMenuItem, menuItems);
                tvMenuItems.Nodes.Add(currentNode);
            }
            tvMenuItems.ShowExpandCollapse = true; 
        }
        protected void LoadSubTreeView(TreeNode currentRootNode,Menuitem currentRootMenuItem,List<Menuitem> menuItems)
        {
            var subMenuItems = menuItems.Where(p => p.Parentmenuid == currentRootMenuItem.Menuid).ToList();
            if(subMenuItems.Count==0){return;}
            foreach (var subMenuItem in subMenuItems)
            {
                var currentNode = new TreeNode(subMenuItem.Menuname, subMenuItem.Menuid);
                currentNode.ShowCheckBox = true;
                currentNode.Checked = !string.IsNullOrEmpty(subMenuItem.Roleid);
                LoadSubTreeView(currentNode, subMenuItem, menuItems);
                currentRootNode.ChildNodes.Add(currentNode);
            }
        }
        #endregion
    }
}