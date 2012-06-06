using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin.UserControl
{
    /// <summary>
    /// 查询同1大类的资产
    /// </summary>
    public partial class ucSelectedMultiAssets : System.Web.UI.UserControl
    {
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
                //btnSelectedMultiAssets_Click(null, null);
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
                //throw new NullReferenceException("请选择所属系统!");
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
                script.AppendFormat(@"ShowTopDialogFrame('资产选择', '{0}?AssetCategoryId={1}','SelectedMultiAssets()',790,360);", ResolveUrl("~/Admin/SelectedMultiAssets.aspx"), AssetCategoryId);
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