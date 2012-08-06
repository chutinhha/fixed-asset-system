using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Domain;

namespace FixedAsset.Web.Admin.UserControl
{
    public partial class ucSelectProjectForTree2 : System.Web.UI.UserControl
    {
        #region Properties
        public bool HasSupplier
        {
            get
            {
                if (ViewState["HasSupplier"] == null)
                {
                    ViewState["HasSupplier"] = false;
                }
                return bool.Parse(ViewState["HasSupplier"].ToString());
            }
            set { ViewState["HasSupplier"] = value; }
        }
        public string Storagetitle
        {
            get
            {
                if (ViewState["Storagetitle"] == null)
                {
                    ViewState["Storagetitle"] = string.Empty;
                }
                return ViewState["Storagetitle"].ToString();
            }
            set { ViewState["Storagetitle"] = value; }
        }
        public string Subcompanyid
        {
            get
            {
                if (ViewState["Subcompanyid"] == null)
                {
                    ViewState["Subcompanyid"] = string.Empty;
                }
                return ViewState["Subcompanyid"].ToString();
            }
            set { ViewState["Subcompanyid"] = value; }
        }
        public string Subcompanyname
        {
            get
            {
                if (ViewState["Subcompanyname"] == null)
                {
                    ViewState["Subcompanyname"] = string.Empty;
                }
                return ViewState["Subcompanyname"].ToString();
            }
            set { ViewState["Subcompanyname"] = value; }
        }
        public string StorageId
        {
            get
            {
                if (ViewState["StorageId"] == null)
                {
                    ViewState["StorageId"] = string.Empty;
                }
                return ViewState["StorageId"].ToString();
            }
            set { ViewState["StorageId"] = value; }
        }
        public string Storagename
        {
            get
            {
                if (ViewState["Storagename"] == null)
                {
                    ViewState["Storagename"] = string.Empty;
                }
                return ViewState["Storagename"].ToString();
            }
            set { ViewState["Storagename"] = value; }
        }
        protected IAssetService AssetService
        {
            get
            {
                return new AssetService();
            }
        }
        protected List<Vstorageaddress> VStorageAddress
        {
            get
            {
                if (Session["VStorageAddress"] == null)
                {
                    Session["VStorageAddress"] = new List<Vstorageaddress>();
                }
                return Session["VStorageAddress"] as List<Vstorageaddress>;
            }
        }
        #endregion

        #region Events
        public event EventHandler SelectedStorageNodeChange;
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                InitData();
                LoadTreeView();
                //加载选中节点
                if (!string.IsNullOrEmpty(StorageId))
                {
                    if (SelectedStorageNodeChange != null)
                    {
                        SelectedStorageNodeChange(this, new EventArgs());
                    }
                }
            }
        }
        protected void tvStorageAddress_SelectedNodeChanged(object sender, EventArgs e)
        {
            if (tvStorageAddress.SelectedNode == null)
            {
                return;
            }
            if (tvStorageAddress.SelectedNode.Value.Contains(Vstorageaddress.RootCompany))
            {
                Storagetitle = Vstorageaddress.RootCompany;
                StorageId = Vstorageaddress.RootCompany;
            }
            else
            {
                 if (tvStorageAddress.SelectedNode.Value.Contains(Vstorageaddress.Subcompany))
                 {
                     Storagetitle = Vstorageaddress.Subcompany;
                 }
                 else if (tvStorageAddress.SelectedNode.Value.Contains(Vstorageaddress.Project))
                 {
                     Storagetitle = Vstorageaddress.Project;
                 }
                 else if (tvStorageAddress.SelectedNode.Value.Contains(Vstorageaddress.Supplier))
                 {
                     Storagetitle = Vstorageaddress.Supplier;
                 }
                 else
                 {
                     return;
                 }
                 var currentInfo = VStorageAddress.Where(p => p.Storagetitle == this.Storagetitle && p.Storageid == tvStorageAddress.SelectedNode.Value.Substring(Storagetitle.Length)).FirstOrDefault();
                 if (currentInfo == null)
                 {
                     return;
                 }
                 if (currentInfo.Storagetitle == Vstorageaddress.Supplier || currentInfo.Storagetitle == Vstorageaddress.Subcompany)
                 {
                     StorageId = currentInfo.Storageid;
                     Storagename = currentInfo.Storagename;
                 }
                 else if (currentInfo.Storagetitle == Vstorageaddress.Project)
                 {
                     StorageId = currentInfo.Storageid;
                     Storagename = currentInfo.Storagename;
                     Subcompanyid = currentInfo.Subcompanyid;
                     Subcompanyname = currentInfo.Subcompanyname;
                 }
            }

            if (SelectedStorageNodeChange != null)
            {
                SelectedStorageNodeChange(this, new EventArgs());
            }
        }
        #endregion

        #region Methods
        protected void InitData()
        {
            VStorageAddress.Clear();
            var list = AssetService.RetrieveAllVstorageaddress();
            VStorageAddress.AddRange(list);
        }
        protected void LoadTreeView()
        {
            var rootCompanyNode = new TreeNode("上海建工七建集团有限公司", string.Format(@"{0}{0}", Vstorageaddress.RootCompany));
            var infos = VStorageAddress.Where(p => p.Storagetitle == Vstorageaddress.Supplier).ToList();
            if (HasSupplier)
            {
                //供应商仓库
                foreach (var currentInfo in infos)
                {
                    rootCompanyNode.ChildNodes.Add(new TreeNode(currentInfo.Storagename,string.Format(@"{0}{1}", Vstorageaddress.Supplier,currentInfo.Storageid)));
                }
            }
            //分公司项目体
            infos = VStorageAddress.Where(p => p.Storagetitle == Vstorageaddress.Project).ToList();
            var subCompanies = VStorageAddress.Where(p => p.Storagetitle == Vstorageaddress.Subcompany).ToList();
            foreach (var subCompany in subCompanies)
            {
                var currentSubCompanyNode = new TreeNode(subCompany.Subcompanyname, string.Format(@"{0}{1}", Vstorageaddress.Subcompany, subCompany.Subcompanyid));
                var currentProjects = infos.Where(p => p.Subcompanyid == subCompany.Subcompanyid).ToList();
                foreach (var currentProject in currentProjects)
                {
                    currentSubCompanyNode.ChildNodes.Add(new TreeNode(currentProject.Storagename, string.Format(@"{0}{1}", Vstorageaddress.Project, currentProject.Storageid)));
                }
                currentSubCompanyNode.Expanded = false;
                rootCompanyNode.ChildNodes.Add(currentSubCompanyNode);
            }
            tvStorageAddress.Nodes.Add(rootCompanyNode);
            tvStorageAddress.ShowExpandCollapse = true;
        }
        #endregion
    }
}