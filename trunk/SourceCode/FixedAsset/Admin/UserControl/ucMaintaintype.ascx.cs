using System;
using FixedAsset.IServices;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin.UserControl
{
    public partial class ucMaintaintype : System.Web.UI.UserControl
    {
        #region Properties
        public bool Enabled
        {
            get { return ddlConfig.Visible; }
            set { ddlConfig.Visible = value;
                litConfigName.Visible = !value;
            }
        }
        public string CategoryId
        {
            get
            {
                if (ViewState["CategoryId"] == null)
                {
                    ViewState["CategoryId"] = string.Empty;
                }
                return ViewState["CategoryId"].ToString();
            }
            set { ViewState["CategoryId"] = value; }
        }
        public string Configid
        {
            get
            {
                if (ddlConfig.SelectedIndex >= 0)
                {
                    return ddlConfig.SelectedValue;
                }
                else
                {
                    return string.Empty;
                }
            }
            set
            {
                if (ddlConfig.Items.Count==0)
                {
                    LoadData();
                }
                for (int i = 0; i < ddlConfig.Items.Count; i++)
                {
                    if (ddlConfig.Items[i].Value.Equals(value))
                    {
                        ddlConfig.SelectedIndex = i;
                        litConfigName.Text = ddlConfig.SelectedItem.Text;
                        break;
                    }
                }
            }
        }
        protected IAssetconfigService AssetconfigService
        {
            get
            {
                return new AssetconfigService();
            }
        }
        #endregion

        #region Events
        
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                LoadData(); 
            }
        }
        
        #endregion

        protected void LoadData()
        {
            var list = AssetconfigService.RetrieveAssetconfigByCategoryId(CategoryId);
            ddlConfig.DataSource = list;
            ddlConfig.DataTextField = @"Configname";
            ddlConfig.DataValueField = @"Configid";
            ddlConfig.DataBind(); 
        }
    }
}