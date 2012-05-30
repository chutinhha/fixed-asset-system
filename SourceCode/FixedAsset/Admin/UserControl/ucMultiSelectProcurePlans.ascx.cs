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

    public partial class ucMultiSelectProcurePlans : System.Web.UI.UserControl
    {

        public List<string> PsIds
        {
            get
            {
                if (ViewState["PsIds"] == null)
                {
                    ViewState["PsIds"] = new List<string>();
                }
                return ViewState["PsIds"] as List<string>;
            }
        }
        public event EventHandler SelectProcurePlanChange;

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                PsIds.Clear();
            }
        }
        protected void btnProcurePlan_Click(object sender, EventArgs e)
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
            script.AppendFormat(@"ShowTopDialogFrame('采购计划选择', '{0}','MultiSelectProcurePlans()',790,500);", ResolveUrl("~/Admin/SelectMultiProcurePlan.aspx"));
            if (updatePanel == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ucMultiSelectProcurePlans",
                                                    script.ToString(), true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(updatePanel, updatePanel.GetType(), "ucMultiSelectProcurePlans", script.ToString(), true);
            }
        }
        protected void BtnRetrieveProcurePlan_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(hfProcurePlanIds.Value))
            {
                LoadData();
            }
        }
        #endregion

        protected void LoadData()
        {
            PsIds.AddRange(PageUtility.SplitToStrings(hfProcurePlanIds.Value));
            if (SelectProcurePlanChange != null)
            {
                SelectProcurePlanChange(this, new EventArgs());
            }
        }
    }
}