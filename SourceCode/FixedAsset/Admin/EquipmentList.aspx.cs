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
    public partial class EquipmentList : BasePage
    { 
        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
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
        protected void InitData()
        {
            InitAssetState(ddlEquipmentStatus,true);
            InitFinanceCategory(ddlAccountingType,true);
            InitManageMode(ddlManagementModel,true);
        }
        protected void LoadData(int pageIndex)
        {
            AssetSearch search = new AssetSearch();
            search.Assetno = txtSrchAssetno.Text;
            //search.Assetcategoryid = txtSrchAssetcategoryid.Text;
            //search.Assetname = txtSrchAssetname.Text;
            //search.Storage = txtSrchStorage.Text;
            //search.Brand = txtSrchBrand.Text;
            //search.Supplierid = txtSrchSupplierid.Text;
            //DateTime startpurchasedate = DateTime.MinValue;
            //if (DateTime.TryParse(txtSrchStartPurchasedate.Text, out startpurchasedate))
            //{
            //    search.StartPurchasedate = startpurchasedate;
            //}
            //DateTime endpurchasedate = DateTime.MinValue;
            //if (DateTime.TryParse(txtSrchEndPurchasedate.Text, out endpurchasedate))
            //{
            //    search.EndPurchasedate = endpurchasedate;
            //}
            //DateTime startexpireddate = DateTime.MinValue;
            //if (DateTime.TryParse(txtSrchStartExpireddate.Text, out startexpireddate))
            //{
            //    search.StartExpireddate = startexpireddate;
            //}
            //DateTime endexpireddate = DateTime.MinValue;
            //if (DateTime.TryParse(txtSrchEndExpireddate.Text, out endexpireddate))
            //{
            //    search.EndExpireddate = endexpireddate;
            //}
            //search.Assetspecification = txtSrchAssetspecification.Text;
            //search.Storageflag = txtSrchStorageflag.Text;
            AssetService assetservice = new AssetService();
            int recordCount = 0;
            var list = assetservice.RetrieveAssetsPaging(search, pageIndex, pcData.PageSize, out recordCount);
            rptAssetsList.DataSource = list;
            rptAssetsList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}