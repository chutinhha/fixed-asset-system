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
    public partial class ContractList : BasePage
    {
        #region Properties
        protected IProcurementcontractService ProcurementcontractService
        {
            get { return new ProcurementcontractService(); }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            { LoadData(0); }
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
            var search = new ProcurementcontractSearch();
            search.Contractid = txtSrchPsid.Text;
          
            int recordCount = 0;
            var list = ProcurementcontractService.RetrieveProcurementcontractsPaging(search, pageIndex, pcData.PageSize, out recordCount);

            rptContactsList.DataSource = list;
            rptContactsList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}