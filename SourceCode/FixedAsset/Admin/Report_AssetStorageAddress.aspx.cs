using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using System.Data;

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
            List<Lbfgsxmt> Project = LbfgsxmtService.RetrieveAllLbfgsxmt();
            List<Asset> list = AssetService.RetrieveAllAsset();

            System.Data.DataTable dt = new System.Data.DataTable();
            dt.Columns.Add("AssetStorageCategory");
            dt.Columns.Add("AssetSubStorageCategory");
            dt.Columns.Add("AssetCount");

            foreach (Assetsupplier supplier in assetSuppliers)
            {
                System.Data.DataRow dr = dt.NewRow();
                dr["AssetStorageCategory"] = supplier.Suppliername;
                dr["AssetSubStorageCategory"] = "";
                dr["AssetCount"] = list.Where(p => p.Storageflag.ToLower().Equals("supplier") && p.Storage.ToLower().Equals(supplier.Supplierid.ToString().ToLower())).Count();
                dt.Rows.Add(dr);
            }
            foreach (Subcompanyinfo subcom in subcompanyinfos)
            {
                System.Data.DataRow dr = dt.NewRow();
                dr["AssetStorageCategory"] = subcom.Subcompanyname;
                dr["AssetSubStorageCategory"] = "";
                dr["AssetCount"] = list.Where(o =>o.Storageflag.ToLower().Equals("subcompany") &&o.Storage.ToLower().Equals(subcom.Subcompanyid.ToString().ToLower())).Count();
                dt.Rows.Add(dr);
                foreach (Lbfgsxmt lbfgsxmt in Project.Where(o => o.Fgsid.ToString().ToLower().Equals(subcom.Subcompanyid.ToString().ToLower())).ToList())
                {
                    System.Data.DataRow drproject = dt.NewRow();
                    drproject["AssetStorageCategory"] = subcom.Subcompanyname;
                    drproject["AssetSubStorageCategory"] = lbfgsxmt.Xmt;
                    drproject["AssetCount"] = list.Where(p => p.Storageflag.ToLower().Equals("project") && p.Storage.ToLower().Equals(lbfgsxmt.Xmtid.ToString().ToLower())).Count();
                    dt.Rows.Add(drproject);
                }
            }

            //int recordCount = 0;
            rptAssetsStorageCategoryList.DataSource = dt;
            rptAssetsStorageCategoryList.DataBind();
            //pcData.RecordCount = dt.Rows.Count;
            //pcData.CurrentIndex = pageIndex;
        }

        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            LoadData(e.PageIndex);
        }
     


    }
}