using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin
{
    public partial class SelectMultiProcurePlan : System.Web.UI.Page
    {
        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                this.ClearBrowserCache();
                LoadData(0);
            }
        }
        /// <summary>
        /// 数据查询事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadData(0);
        }
        /// <summary>
        /// 分页事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            LoadData(e.PageIndex);
        }
        protected void radioSelected_CheckedChanged(object sender, EventArgs e)
        {
            var rdb = sender as RadioButton;

            foreach (GridViewRow row in gvSubCompanies.Rows)
            {
                var radioButton = row.FindControl("radioSelected") as RadioButton;
                if (radioButton == rdb) continue;
                radioButton.Checked = false;
            }
        }
        protected void btnOk_Click(object sender, EventArgs e)
        {
            string returnValue = string.Empty;
            foreach (GridViewRow gvr in gvSubCompanies.Rows)
            {
                if (((RadioButton)gvr.FindControl("radioSelected")).Checked)
                {
                    returnValue = (gvr.FindControl("lblSubCompanyId") as Label).Text;
                    break;
                }
            }
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>setCookie('dialogReturn_key','" + returnValue + "',1);CloseTopDialogFrame();</script>");
        }
        #endregion

        #region Methods
        protected void ClearBrowserCache()
        {
            Response.Buffer = true;
            Response.Expires = 0;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
        }
        protected void LoadData(int pageIndex)
        {
            var search = new SubcompanyinfoSearch();
            search.Subcompanyname = txtSrchSubcompanyname.Text;
            var subcompanyinfoService = new SubcompanyinfoService();
            int recordCount = 0;
            var list = subcompanyinfoService.RetrieveSubcompanyinfosPaging(search, pageIndex, pcData.PageSize, out recordCount);
            gvSubCompanies.DataSource = list;
            gvSubCompanies.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}