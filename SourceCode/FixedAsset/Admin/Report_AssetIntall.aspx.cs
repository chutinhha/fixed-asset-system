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

    public partial class Report_AssetIntall :BasePage
    {
        #region Properties
        protected IAssetsetupinfoService AssetsetupinfoService
        {
            get
            {
                return new AssetsetupinfoService();
            }
        }
        protected List<Vstorageaddress> VStorageAddress
        {
            get
            {
                if (Session["VStorageAddress"] == null)
                {
                    Session["VStorageAddress"] = new List<Vstorageaddress>();
                }
                return Session["VStorageAddress"] as List<Vstorageaddress>;
            }
        }
        #endregion

        #region Events
        protected void ucSelectStorageAddress_SelectedStorageNodeChange(object sender, EventArgs e)
        {
            LoadCurrentData();
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            
        }
        #endregion

        #region Methods  
        protected void LoadCurrentData()
        {
            var search = new AssetRunTimeSearch();
            search.Storagetitle = ucSelectStorageAddress.Storagetitle;
            search.Storageid = ucSelectStorageAddress.StorageId;
            if(search.Storagetitle==Vstorageaddress.Subcompany)
            {
                var currentProjects = VStorageAddress.Where(p => p.Subcompanyid == ucSelectStorageAddress.StorageId).ToList();
                search.ProjectIds.AddRange(currentProjects.Select(p=>p.Storageid));
            }
            if (ucStartDate.DateValue.HasValue)
            {
                search.StartActualDate = ucStartDate.DateValue.Value;
            }
            if (ucEndDate.DateValue.HasValue)
            {
                search.EndActualDate = ucEndDate.DateValue.Value;
            }
            var currentReportData = AssetsetupinfoService.RetrieveAssetRunTimeReport(search);
        }
        #endregion
    }
}