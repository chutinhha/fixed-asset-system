using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.Services;
using SeallNet.Utility;

namespace FixedAsset.Web.Admin.UserControl
{
    
    /// <summary>
    /// 查询同1大类的资产
    /// </summary>
    public partial class ucSelectedMultiAssets : System.Web.UI.UserControl
    {
        public BillCategory BillCategory
        {
            get
            {
                if (ViewState["BillCategory"] == null)
                {
                    ViewState["BillCategory"] = BillCategory.SetupBill;
                }
                return (BillCategory)Enum.Parse(typeof(BillCategory), ViewState["BillCategory"].ToString());
            }
            set { ViewState["BillCategory"] = value; }
        }
        public string AssetCategoryId
        {
            get
            {
                if (ViewState["AssetCategoryId"] == null)
                {
                    ViewState["AssetCategoryId"] = string.Empty;
                }
                return ViewState["AssetCategoryId"].ToString();
            }
            set { ViewState["AssetCategoryId"] = value; }
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
        public List<string> AssetIds
        {
            get
            {
                if (ViewState["AssetIds"] == null)
                {
                    ViewState["AssetIds"] = new List<string>();
                }
                return ViewState["AssetIds"] as List<string>;
            }
        }
        public event EventHandler SelectAssetChange;

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                AssetIds.Clear();
            }
        }
        protected void btnSelectedMultiAssets_Click(object sender, EventArgs e)
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
            if (string.IsNullOrEmpty(AssetCategoryId))
            {
                if (updatePanel == null)
                {
                    UIHelper.AlertMessage(this.Page, "请选择所属系统！");
                }
                else
                {
                    UIHelper.AlertMessage(updatePanel, "请选择所属系统！");
                }
            }
            else
            {

                var script = new StringBuilder();  //return false;
                script.AppendFormat(@"ShowTopDialogFrame('{3}资产选择', '{0}?AssetCategoryId={1}&BillCategory={2}&Storagetitle={4}&StorageId={5}','SelectedMultiAssets()',790,420);"
                                    ,ResolveUrl("~/Admin/SelectedMultiAssets.aspx")
                                    ,AssetCategoryId, BillCategory
                                    , EnumUtil.RetrieveEnumDescript(BillCategory), Storagetitle, StorageId);
                if (updatePanel == null)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "SelectedMultiAssets",
                                                        script.ToString(), true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(updatePanel, updatePanel.GetType(), "SelectedMultiAssets", script.ToString(), true);
                }
            }
        }
        protected void BtnRetrieveSelectedMultiAssets_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(hfAssetIds.Value))
            {
                LoadData();
            }
        }
        #endregion

        protected void LoadData()
        {
            AssetIds.AddRange(PageUtility.SplitToStrings(hfAssetIds.Value));
            if (SelectAssetChange != null)
            {
                SelectAssetChange(this, new EventArgs());
            }
        }
    }
}