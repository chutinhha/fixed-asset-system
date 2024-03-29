﻿using System;
using System.Collections.Generic;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using SeallNet.Utility;
using UiConst = SeallNet.Utility.UiConst;

namespace FixedAsset.Web.Admin
{
    public partial class ShowAssetDetail : BasePage
    {
        #region Properties
        protected string Assetno
        {
            get
            {
                if (ViewState["Assetno"] == null)
                {
                    ViewState["Assetno"] = string.Empty;
                }
                return ViewState["Assetno"].ToString();
            }
            set { ViewState["Assetno"] = value; }
        }
        protected IAssetService AssetService
        {
            get
            {
                return new AssetService();
            }
        }
        protected IAssetcategoryService AssetcategoryService
        {
            get { return new AssetcategoryService(); }
        }
        protected IAssetsetupdetailService AssetsetupdetailService
        {
            get
            {
                return new AssetsetupdetailService();
            }
        }
        protected IAssetmaintaindetailService AssetmaintaindetailService
        {
            get
            {
                return new AssetmaintaindetailService();
            }
        }
        protected IAssetmovedetailService AssetmovedetailService
        {
            get
            {
                return new AssetmovedetailService();
            }
        }
        protected IAssetremovedetailService AssetremovedetailService
        {
            get
            {
                return new AssetremovedetailService();
            }
        }
        protected IAssetscrappedService AssetscrappedService
        {
            get
            {
                return new AssetscrappedService();
            }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                Assetno = PageUtility.GetQueryStringValue("Assetno");
                if (string.IsNullOrEmpty(Assetno)) { return; }
                DateTime startDate = DateTime.Now;
                var currentInfo = AssetService.RetrieveAssetByAssetno(Assetno);
                DateTime endDate = DateTime.Now;
                Log.Info("RetrieveAssetByAssetno cost time:" + (endDate - startDate).ToString());
                if (currentInfo != null)
                {
                    ReadEntityToControl(currentInfo);
                    LoadSetupData();
                    LoadRepairData();
                    LoadMoveData();
                    LoadRemoveData();
                    LoadScrappedData();
                }
            }
        }
        #endregion

        #region Methods
        protected void ReadEntityToControl(Asset info)
        {
            litAssetno.Text = info.Assetno;//设备编号
            litAssetcategoryid.Text = info.Assetcategoryid;//设备类别
            var currentCategory = AssetcategoryService.RetrieveAssetcategoryByAssetcategoryid(info.Assetcategoryid);
            if (currentCategory != null)
            {
                var parentCategory =
                    AssetcategoryService.RetrieveAssetcategoryByAssetcategoryid(currentCategory.Assetparentcategoryid);
                if (parentCategory == null)
                {
                    litAssetcategoryid.Text = currentCategory.Assetcategoryname;
                }
                else
                {
                    litAssetcategoryid.Text = string.Format(@"{0}-{1}", parentCategory.Assetcategoryname, currentCategory.Assetcategoryname);
                }
            }
            litAssetname.Text = info.Assetname;//设备名称
            litState.Text = EnumUtil.RetrieveEnumDescript(info.State);//设备状态
            litDepreciationyear.Text = info.Depreciationyear.ToString();//折旧年限
            litUnitprice.Text = info.Unitprice.ToString(UiConst.MoneyFormat);//单价
            litBrand.Text = info.Brand;//品牌
            litManagemode.Text = EnumUtil.RetrieveEnumDescript(info.Managemode);//管理模式，托管:0自管:1
            litFinancecategory.Text = EnumUtil.RetrieveEnumDescript(info.Financecategory); ;//财务类别(A帐:0B帐:1)
            ucSelectSupplier.Supplierid = info.Supplierid;//供应商
            if (info.Purchasedate.HasValue)
            {
                litPurchasedate.Text = info.Purchasedate.Value.ToString(UiConst.DateFormat);//购入日期
            }
            //litExpireddate.Text = info.Expireddate;//折旧到期日期
            litAssetspecification.Text = info.Assetspecification;//设备规格
            ucSelectSubCompany.SubcompanyId = info.Subcompany;//分公司
            ucShowStorageAddress.Storagetitle = info.Storageflag;//存放地点标识来源
            ucShowStorageAddress.StorageId = info.Storage;//存放地点
        }
        protected void LoadSetupData()
        {
            var search = new AssetsetupdetailSearch();
            search.Assetno = Assetno;//设备编号
            int recordCount = 0;
            var list = AssetsetupdetailService.RetrieveAssetsetupdetailsPaging(search, 0, 100, out recordCount);
            rptSetupList.DataSource = list;
            rptSetupList.DataBind();
        }
        protected void LoadRepairData()
        {
            var search = new AssetmaintaindetailSearch();
            search.Assetno = Assetno;//设备编号
            int recordCount = 0;
            var list = AssetmaintaindetailService.RetrieveAssetmaintaindetailsPaging(search, 0, 100, out recordCount);
            rptRepairList.DataSource = list;
            rptRepairList.DataBind();
        }
        protected void LoadMoveData()
        {
            var search = new AssetmovedetailSearch();
            search.Assetno = Assetno;//设备编号
            int recordCount = 0;
            var list = AssetmovedetailService.RetrieveAssetmovedetailsPaging(search, 0, 100, out recordCount);
            rptMoveList.DataSource = list;
            rptMoveList.DataBind();
        }
        protected void LoadRemoveData()
        {
            var search = new AssetremovedetailSearch();
            search.Assetno = Assetno;//设备编号
            int recordCount = 0;
            var list = AssetremovedetailService.RetrieveAssetremovedetailsPaging(search, 0, 100, out recordCount);
            rptRemoveList.DataSource = list;
            rptRemoveList.DataBind();
        }
        protected void LoadScrappedData()
        {
            var list = AssetscrappedService.RetrieveAssetscrappedByAssetNo(new List<string>() {Assetno});
            rptScrappedAsset.DataSource = list;
            rptScrappedAsset.DataBind();
        }
        #endregion
    }
}