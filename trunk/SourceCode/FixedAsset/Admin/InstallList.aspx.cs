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
    public partial class InstallList : BasePage
    {
        public IAssetsetupinfoService AssetSetupinfoService
        {
            get { return new AssetsetupinfoService(); }
        }
        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                InitSetupStates(ddlSetupStates, true);
                LoadData(0);
            }
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            LoadData(0);
        }
        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            LoadData(e.PageIndex);
        }
        #endregion

        #region  Methods
        protected void LoadData(int pageIndex)
        {
            var search = new AssetsetupinfoSearch();
            search.Setupid = txtSrchSetupid.Text;
            search.StartApplydate = ucSrchStartApplydate.DateValue;
            search.EndApplydate = ucSrchEndApplydate.DateValue;
            int recordCount = 0;
            var list = AssetSetupinfoService.RetrieveAssetsetupinfosPaging(search, pageIndex, pcData.PageSize, out recordCount);
            rptAssetSetupList.DataSource = list;
            rptAssetSetupList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}