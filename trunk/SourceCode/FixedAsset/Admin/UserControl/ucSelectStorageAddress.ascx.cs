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
    public partial class ucSelectStorageAddress : System.Web.UI.UserControl
    {
        #region Properties
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
            if(!IsPostBack)
            {
               InitData(); 
               LoadTreeView();
            }
        }
        protected void tvStorageAddress_SelectedNodeChanged(object sender, EventArgs e)
        {
            if(tvStorageAddress.SelectedNode.ChildNodes.Count>0)
            {
                return;
            }
            var rootNode = tvStorageAddress.SelectedNode.Parent;
            if(rootNode.Parent==null)
            {
                Storagetitle = rootNode.Value;
            }
            else
            {
                Storagetitle = rootNode.Parent.Value;
            }
            var currentInfo = VStorageAddress.Where(p => p.Storagetitle == this.Storagetitle && p.Storageid == tvStorageAddress.SelectedNode.Value).FirstOrDefault();
            if (currentInfo.Storagetitle == Vstorageaddress.Supplier || currentInfo.Storagetitle == Vstorageaddress.Subcompany)
            {
                this.StorageId = currentInfo.Storageid;
                this.Storagename = currentInfo.Storagename;
            }
            else if (currentInfo.Storagetitle == Vstorageaddress.Project)
            {
                this.StorageId = currentInfo.Storageid;
                this.Storagename = currentInfo.Storagename;
                this.Subcompanyid = currentInfo.Subcompanyid;
                this.Subcompanyname = currentInfo.Subcompanyname;
            }
            if(SelectedStorageNodeChange!=null)
            {
                SelectedStorageNodeChange(this,new EventArgs());
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
            //供应商
            var trNodeSupplier = new TreeNode("供应商", Vstorageaddress.Supplier);
            var infos = VStorageAddress.Where(p => p.Storagetitle == Vstorageaddress.Supplier);
            foreach (var info in infos)
            {
               //trNodeSupplier.ChildNodes.Add(new TreeNode(info.Storagename,string.Format("{0}-{1}",info.Storagetitle,info.StorageId)));
                trNodeSupplier.ChildNodes.Add(new TreeNode(info.Storagename, info.Storageid));
            }
            tvStorageAddress.Nodes.Add(trNodeSupplier);
            var trNodeSubCommpanies = new TreeNode("分公司", Vstorageaddress.Subcompany);
            infos = VStorageAddress.Where(p => p.Storagetitle == Vstorageaddress.Subcompany);
            foreach (var info in infos)
            {
                //trNodeSubCommpanies.ChildNodes.Add(new TreeNode(info.Storagename, string.Format("{0}-{1}", info.Storagetitle, info.StorageId)));
                trNodeSubCommpanies.ChildNodes.Add(new TreeNode(info.Storagename, info.Storageid));
            }
            tvStorageAddress.Nodes.Add(trNodeSubCommpanies);
            //分公司项目体
            var trNodeProjects = new TreeNode("分公司项目体", Vstorageaddress.Project);
            infos = VStorageAddress.Where(p => p.Storagetitle == Vstorageaddress.Project);
            var subCompanies = infos.Select(p => p.Subcompanyid).Distinct();
            foreach (var subCompany in subCompanies)
            {
                var currentSubCompany = infos.Where(p => p.Subcompanyid == subCompany).FirstOrDefault();
                var currentSubCompanyNode = new TreeNode(currentSubCompany.Subcompanyname, subCompany);
                var currentProjects = infos.Where(p => p.Subcompanyid == subCompany).ToList();
                foreach (var currentProject in currentProjects)
                {
                    //currentSubCompanyNode.ChildNodes.Add(new TreeNode(currentProject.Storagename, Server.HtmlEncode(string.Format("{0}-{1}", currentProject.Storagetitle, currentProject.StorageId))));
                    currentSubCompanyNode.ChildNodes.Add(new TreeNode(currentProject.Storagename, currentProject.Storageid));
                }
                trNodeProjects.ChildNodes.Add(currentSubCompanyNode);
            }
            tvStorageAddress.Nodes.Add(trNodeProjects);
        }
        #endregion
    }
}