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
        public bool IsShowSubCompanyName
        {
            get
            {
                if (ViewState["IsShowSubCompanyName"] == null)
                {
                    ViewState["IsShowSubCompanyName"] =false;
                }
                return bool.Parse(ViewState["IsShowSubCompanyName"].ToString());
            }
            set { ViewState["IsShowSubCompanyName"] = value; }
        }
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
            if(!IsPostBack)
            {
                btnSelectSingleSubCompany.Attributes.Add("onclick", string.Format("javascript:ShowTopDialogFrame('分公司选择', '{0}','SelectSingleSubCompany()',560,330);return false;", ResolveUrl("~/Admin/SelectSingleSubCompany.aspx")));
                btnSelectSingleSubCompany.Visible = !IsShowSubCompanyName;
                if (!string.IsNullOrEmpty(SubcompanyId))
                {
                    LoadData();
                }
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
            var subcompanyinfoService = new SubcompanyinfoService();
            decimal decSubcompanyId = 0;
            if(decimal.TryParse(SubcompanyId,out decSubcompanyId))
            {
                var info = subcompanyinfoService.RetrieveSubcompanyinfoBySubcompanyid(decSubcompanyId);
                if (info != null)
                {
                    litSubCompanyName.Text = info.Subcompanyname;
                }  
            }
        }
    }
}