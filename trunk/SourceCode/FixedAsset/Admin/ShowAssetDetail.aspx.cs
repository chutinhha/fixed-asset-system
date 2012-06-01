using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Web.AppCode;
using SeallNet.Utility;
using UiConst = SeallNet.Utility.UiConst;

namespace FixedAsset.Web.Admin
{
    public partial class ShowAssetDetail : System.Web.UI.Page
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

        public IAssetService AssetService
        {
            get
            {
                return new AssetService();
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
                if(string.IsNullOrEmpty(Assetno)){return;}
                var currentInfo = AssetService.RetrieveAssetByAssetno(Assetno);
                if(currentInfo!=null)
                {
                    ReadEntityToControl(currentInfo);
                }
            }
        }
        protected void ReadEntityToControl(Asset info)
        {
            litAssetno.Text = info.Assetno;//设备编号
            litAssetcategoryid.Text = info.Assetcategoryid;//设备类别
            litAssetname.Text = info.Assetname;//设备名称
            
            litState.Text = EnumUtil.RetrieveEnumDescript(info.State);//设备状态
            litDepreciationyear.Text = info.Depreciationyear.ToString();//折旧年限
            litUnitprice.Text = info.Unitprice.ToString();//单价
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
        #endregion
    }
}