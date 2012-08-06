using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin
{
    public partial class Report_AssetStorageAddress : BasePage
    {
        protected IAssetService AssetService
        {
            get
            {
                return new AssetService();
            }
        }

        protected IAssetsupplierService AssetsupplierService
        {
            get {
                return new AssetsupplierService();
            }
        }

        protected ISubcompanyinfoService SubcompanyinfoService
        {
            get
            {
                return new SubcompanyinfoService();
            }
        }

        protected ILbfgsxmtService LbfgsxmtService
        {
            get
            {
                return new LbfgsxmtService();
            }
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                LoadData(0);
            }
        }

        protected void LoadData(int pageIndex)
        {
            List<Assetsupplier> assetSuppliers = AssetsupplierService.RetrieveAllAssetsupplier();
            List<Subcompanyinfo> subcompanyinfos = SubcompanyinfoService.RetrieveAllSubCompanyinfo();
            List<Lbfgsxmt> projectList = LbfgsxmtService.RetrieveAllLbfgsxmt();
            
            var list = AssetService.RetrieveAssetStorageReport();
            var dt = new System.Data.DataTable();
            dt.Columns.Add("AssetStorageCategory");
            dt.Columns.Add("AssetSubStorageCategory");
            dt.Columns.Add("AssetCount");

            foreach (Assetsupplier supplier in assetSuppliers)
            {
                System.Data.DataRow dr = dt.NewRow();
                dr["AssetStorageCategory"] = supplier.Suppliername;
                dr["AssetSubStorageCategory"] = string.Empty;
                dr["AssetCount"] = 0;
                var currentInfo =list.Where(p => p.Storagetitle == Vstorageaddress.Supplier && p.Storageid == supplier.Supplierid).
                        FirstOrDefault();
                if (currentInfo != null) { dr["AssetCount"] = currentInfo.Currentcount; }
                dt.Rows.Add(dr);
            }
            foreach (Subcompanyinfo subcom in subcompanyinfos)
            {
                System.Data.DataRow dr = dt.NewRow();
                dr["AssetStorageCategory"] = subcom.Subcompanyname;
                dr["AssetSubStorageCategory"] = string.Empty;
                dr["AssetCount"] = 0;
                var currentInfo = list.Where(p => p.Storagetitle == Vstorageaddress.Subcompany && p.Storageid == subcom.Subcompanyid.ToString()).
                        FirstOrDefault();
                if (currentInfo != null) { dr["AssetCount"] = currentInfo.Currentcount; }
                dt.Rows.Add(dr);
                var currentProjects = projectList.Where(p => p.Fgsid == subcom.Subcompanyid).ToList();
                foreach (var currentProject in currentProjects)
                {
                    System.Data.DataRow drproject = dt.NewRow();
                    drproject["AssetStorageCategory"] = subcom.Subcompanyname;
                    drproject["AssetSubStorageCategory"] = currentProject.Xmt;
                    drproject["AssetCount"] = 0;
                    currentInfo = list.Where(p => p.Storagetitle == Vstorageaddress.Project && p.Storageid == currentProject.Xmtid.ToString()).FirstOrDefault();
                    if (currentInfo != null) { drproject["AssetCount"] = currentInfo.Currentcount; }
                    dt.Rows.Add(drproject);
                }
            }
            rptAssetsStorageCategoryList.DataSource = dt;
            rptAssetsStorageCategoryList.DataBind();
        }
    }
}