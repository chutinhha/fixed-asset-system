using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.IServices;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin
{
    public partial class ScrappedApproved : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected IAssetscrappedService AssetscrappedService
        {
            get { return new AssetscrappedService(); }
        }

        protected void BtnAccept_Click(object sender, EventArgs e)
        {
            Domain.Assetscrapped assetscrapped = new Domain.Assetscrapped();
            assetscrapped.Approvedstate = Domain.APPROVEDSTATE.Approved;
            AssetscrappedService.UpdateAssetscrappedByAssetscrappedid(assetscrapped);
            UIHelper.AlertMessageGoToURL(this, "审核通过!", ResolveUrl("~/Admin/Asset_Scrapped.aspx"));
        }

        protected void btnDecline_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtReason.Text))
            {
                UIHelper.Alert(this, "请输入拒绝理由！");
                return;
            }
            Domain.Assetscrapped assetscrapped = new Domain.Assetscrapped();
            assetscrapped.Approvedstate = Domain.APPROVEDSTATE.Rejected;
            AssetscrappedService.UpdateAssetscrappedByAssetscrappedid(assetscrapped);
            UIHelper.AlertMessageGoToURL(this, "审核拒绝!", ResolveUrl("~/Admin/Asset_Scrapped.aspx"));
        }
    }
}