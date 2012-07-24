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
    public partial class Report_AssetMove_Detail : System.Web.UI.Page
    {
        #region Events
        protected IAssetmoveService AssetmoveService
        {
            get
            {
                return new AssetmoveService();
            }
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
        /// 分页事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            LoadData(e.PageIndex);
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
            var search = new AssetRunTimeSearch();
            search.Assetcategoryid = PageUtility.GetQueryStringValue("Assetcategoryid");
            search.Storagetitle = Server.UrlDecode(PageUtility.GetQueryStringValue("Storagetitle")); //Storagetitle;
            search.Storageid = Server.UrlDecode(PageUtility.GetQueryStringValue("Storageid"));//StorageId;
            if (!string.IsNullOrEmpty(PageUtility.GetQueryStringValue("StartActualDate")))
            {
                search.StartActualDate = DateTime.Parse(PageUtility.GetQueryStringValue("StartActualDate"));
            }
            if (!string.IsNullOrEmpty(PageUtility.GetQueryStringValue("EndActualDate")))
            {
                search.EndActualDate = DateTime.Parse(PageUtility.GetQueryStringValue("EndActualDate"));
            }
            int recordCount = 0;
            var list = AssetmoveService.RetrieveAssetReportDetailInfoPaging(search, pageIndex, pcData.PageSize, out recordCount);
            gvDetails.DataSource = list;
            gvDetails.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}