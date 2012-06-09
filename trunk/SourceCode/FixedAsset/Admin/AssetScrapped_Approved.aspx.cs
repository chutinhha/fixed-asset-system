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

namespace FixedAsset.Web.Admin
{
    public partial class AssetScrapped_Approved : BasePage
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
                if(string.IsNullOrEmpty(Assetscrappedid))
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
                litApprovedate.Text = info.Approvedate.Value.ToString(UiConst.DateFormat);//审核日期 
            }
            //litRejectreason.Text = info.Rejectreason;//拒绝理由
            //litCreateddate.Text = info.Createddate;//创建日期
            //litCreator.Text = info.Creator;//创建人
            //litApprovedstate.Text = info.Approvedstate;//审核状态
        }
        protected void BtnAccept_Click(object sender, EventArgs e)
        {
            var currentInfo = AssetscrappedService.RetrieveAssetscrappedByAssetscrappedid(Assetscrappedid);
            if(currentInfo==null)
            {
                Response.Redirect(ResolveUrl("~/admin/Asset_Scrapped.aspx"));
                return;
            }
            currentInfo.Approvedstate = AssetScrappedState.Approved;
            currentInfo.Approveuser = WebContext.Current.CurrentUser.Username;
            currentInfo.Approvedate = DateTime.Now;
            currentInfo.Rejectreason = txtRejectreason.Text;
            AssetscrappedService.UpdateAssetscrappedByAssetscrappedid(currentInfo);
            //资产作废
            var currentAsset = AssetService.RetrieveAssetByAssetno(currentInfo.Assetno);
            if(currentAsset!=null)
            {
                currentAsset.State = AssetState.Scrapped;
                AssetService.UpdateAssetByAssetno(currentAsset);
            }
            UIHelper.AlertMessageGoToURL(this, "审核通过!", ResolveUrl("~/Admin/Asset_Scrapped.aspx"));
        } 
        protected void btnDecline_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtRejectreason.Text))
            {
                UIHelper.Alert(this, "请输入拒绝理由！");
                return;
            } var currentInfo = AssetscrappedService.RetrieveAssetscrappedByAssetscrappedid(Assetscrappedid);
            if (currentInfo == null)
            {
                Response.Redirect(ResolveUrl("~/admin/Asset_Scrapped.aspx"));
                return;
            }
            currentInfo.Approvedstate = AssetScrappedState.Rejected;
            currentInfo.Approveuser = WebContext.Current.CurrentUser.Username;
            currentInfo.Approvedate = DateTime.Now;
            currentInfo.Rejectreason = txtRejectreason.Text;
            AssetscrappedService.UpdateAssetscrappedByAssetscrappedid(currentInfo);
            UIHelper.AlertMessageGoToURL(this, "审核拒绝!", ResolveUrl("~/Admin/Asset_Scrapped.aspx"));
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Admin/Asset_Scrapped.aspx"));
        }
        #endregion
    }
}