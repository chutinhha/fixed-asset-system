using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin
{
    public partial class SelectSingleSupplier : System.Web.UI.Page
    {
        #region Events
        protected IAssetsupplierService AssetsupplierService
        {
            get { return new AssetsupplierService(); }
        }
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

            foreach (GridViewRow row in gvSuppliers.Rows)
            {
                var radioButton = row.FindControl("radioSelected") as RadioButton;
                if (radioButton == rdb) continue;
                radioButton.Checked = false;
            }
        }
        protected void btnOk_Click(object sender, EventArgs e)
        {
            string returnValue = string.Empty;
            foreach (GridViewRow gvr in gvSuppliers.Rows)
            {
                if (((RadioButton)gvr.FindControl("radioSelected")).Checked)
                {
                    returnValue = (gvr.FindControl("lblSupplierid") as Label).Text;
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
            var search = new AssetsupplierSearch();
            search.Suppliername = txtSrchSuppliername.Text;
            int recordCount = 0;
            var list = AssetsupplierService.RetrieveAssetsuppliersPaging(search, pageIndex, pcData.PageSize, out recordCount);
            gvSuppliers.DataSource = list;
            gvSuppliers.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}