using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using SeallNet.Utility;
using UiConst = FixedAsset.Web.AppCode.UiConst;

namespace FixedAsset.Web.Admin
{
    public partial class AssetScrapped_View :BasePage
    {
        #region Properties
        protected string Assetscrappedid
        {
            get
            {
                if (ViewState["Assetscrappedid"] == null)
                {
                    ViewState["Assetscrappedid"] = string.Empty;
                }
                return ViewState["Assetscrappedid"].ToString();
            }
            set { ViewState["Assetscrappedid"] = value; }
        }

        protected IAssetscrappedService AssetscrappedService
        {
            get
            {
                return new AssetscrappedService();
            }
        }
        protected IAssetService AssetService
        {
            get { return new AssetService(); }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                Assetscrappedid = PageUtility.GetQueryStringValue("Assetscrappedid");
                if (string.IsNullOrEmpty(Assetscrappedid))
                {
                    Response.Redirect(ResolveUrl("~/admin/Asset_Scrapped.aspx"));
                    return;
                }
                var currentInfo = AssetscrappedService.RetrieveAssetscrappedByAssetscrappedid(Assetscrappedid);
                ReadEntityToControl(currentInfo);
            }
        }
        protected void ReadEntityToControl(Assetscrapped info)
        {
            litAssetscrappedid.Text = info.Assetscrappedid;//编号
            if (info.Scrappeddate.HasValue)
            {
                litScrappeddate.Text = info.Scrappeddate.Value.ToString(UiConst.DateFormat);//报废日期    
            }
            litScrappeduser.Text = info.Scrappeduser;//报废人
            litAssetno.Text = info.Assetno;//设备编号
            litApproveuser.Text = info.Approveuser;//审核人
            if (info.Approvedate.HasValue)
            {
                litApprovedate.Text = info.Approvedate.Value.ToString(UiConst.DateTimeFormat);//审核日期 
            }
            litRejectreason.Text = info.Rejectreason;//拒绝理由
            //litCreateddate.Text = info.Createddate;//创建日期
            //litCreator.Text = info.Creator;//创建人
            litApprovedstate.Text = EnumUtil.RetrieveEnumDescript(info.Approvedstate);//审核状态
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Admin/Asset_Scrapped.aspx"));
        }
        #endregion
    }
}