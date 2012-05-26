using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin.UserControl
{
    public partial class ucSelectSubCompany : System.Web.UI.UserControl
    {
        public string SubcompanyId
        {
            get
            {
                if (ViewState["SubcompanyId"] == null)
                {
                    ViewState["SubcompanyId"] = string.Empty;
                }
                return ViewState["SubcompanyId"].ToString();
            }
            set { ViewState["SubcompanyId"] = value; }
        }
        
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if(!string.IsNullOrEmpty(SubcompanyId))
            {
                LoadData();
            }
        }
        protected void BtnRetrieveSubcompany_Click(object sender,EventArgs e)
        {
            if(!string.IsNullOrEmpty(hfSubcompanyId.Value))
            {
                SubcompanyId = hfSubcompanyId.Value;
                LoadData();
            }
        }
        protected void LoadData()
        {
            var lbfgsservice = new LbfgsService();
            var info = lbfgsservice.RetrieveLbfgsByFgsid(decimal.Parse(SubcompanyId));
            if (info != null)
            {
                litSubCompanyName.Text = info.Fgs;
            }
        }
    }
}