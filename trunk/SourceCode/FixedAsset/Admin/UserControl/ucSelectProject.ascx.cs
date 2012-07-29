using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.IServices;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin.UserControl
{
    public partial class ucSelectProject : System.Web.UI.UserControl
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
        public bool IsShowName
        {
            get { return !btnSelectStorageAddress.Visible; }
            set { btnSelectStorageAddress.Visible = !value; }
        }
        #endregion

        #region Events
        public event EventHandler SelectedSubCompanyOrProjectChange;
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        protected void btnSelectStorageAddress_Click(object sender, EventArgs e)
        {
            UpdatePanel updatePanel = null;
            foreach (var control in this.Page.Controls)
            {
                if (control is UpdatePanel)
                {
                    updatePanel = control as UpdatePanel;
                    break;
                }
            }
            var script = new StringBuilder();
            script.AppendFormat(@"ShowTopDialogFrame('选择分公司或项目体', '{0}','SelectStorageAddress()',790,367);", ResolveUrl("~/Admin/SelectSingleProject.aspx"));
            if (updatePanel == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ucSelectProject",
                                                    script.ToString(), true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(updatePanel, updatePanel.GetType(), "ucSelectProject", script.ToString(), true);
            }
        }
        protected void BtnRetrieveStorageAddress_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(hfStorageAddress.Value))
            {
                var list = PageUtility.SplitToStrings(hfStorageAddress.Value);
                if (list.Count == 5)
                {
                    this.Storagetitle = list[0];
                    this.Subcompanyid = list[1];
                    this.Subcompanyname = list[2];
                    this.StorageId = list[3];
                    this.Storagename = list[4];
                }
                else if (list.Count == 3)
                {
                    this.Storagetitle = list[0];
                    this.Subcompanyid = list[1];
                    this.Subcompanyname = list[2];
                    this.StorageId = list[1];
                    this.Storagename = list[2];
                }
                LoadData();
            }
        }
        #endregion

        #region Methods
        protected void LoadData()
        {
            if (!string.IsNullOrEmpty(this.StorageId))
            {
                var currentInfo = AssetService.RetrieveVstorageaddressByStorageId(Storagetitle, StorageId);
                if (currentInfo == null)
                {
                    litStorage.Text = string.Empty;
                }
                else
                {
                    if (string.IsNullOrEmpty(currentInfo.Subcompanyname))
                    {
                        litStorage.Text = currentInfo.Storagename;
                    }
                    else if (currentInfo.Subcompanyname != currentInfo.Storagename)
                    {
                        litStorage.Text = string.Format(@"{0}->{1}", currentInfo.Subcompanyname, currentInfo.Storagename);
                    }
                    else
                    {
                        litStorage.Text = currentInfo.Storagename;
                    }
                }
                if(SelectedSubCompanyOrProjectChange!=null)
                {
                    SelectedSubCompanyOrProjectChange(this,new EventArgs());
                }
            }
        }
        #endregion
    }
}