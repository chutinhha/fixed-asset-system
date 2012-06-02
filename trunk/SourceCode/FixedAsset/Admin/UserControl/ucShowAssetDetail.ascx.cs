using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FixedAsset.Web.Admin.UserControl
{
    public partial class ucShowAssetDetail : System.Web.UI.UserControl
    {
        #region Properties
        public string Assetno
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
        #endregion

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                litAssetNo.Text = string.Format(@"<a href=""javascript:ShowTopDialogFrame('设备明细', 'ShowAssetDetail.aspx?Assetno={0}','',900,700);"">{0}</a> ", Assetno);
            }
        }
    }
}