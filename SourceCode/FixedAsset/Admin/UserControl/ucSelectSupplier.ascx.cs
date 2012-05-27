using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.IServices;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin.UserControl
{
    public partial class ucSelectSupplier : System.Web.UI.UserControl
    {
        #region Properties
        public bool IsShowSupplierName
        {
            get
            {
                if (ViewState["IsShowSupplierName"] == null)
                {
                    ViewState["IsShowSupplierName"] = false;
                }
                return bool.Parse(ViewState["IsShowSupplierName"].ToString());
            }
            set { ViewState["IsShowSupplierName"] = value; }
        }
        public string Supplierid
        {
            get
            {
                if (ViewState["Supplierid"] == null)
                {
                    ViewState["Supplierid"] = string.Empty;
                }
                return ViewState["Supplierid"].ToString();
            }
            set { ViewState["Supplierid"] = value; }
        }
        protected IAssetsupplierService AssetsupplierService
        {
            get { return new AssetsupplierService(); }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                btnSelectSingleSupplier.Attributes.Add("onclick", string.Format("javascript:ShowTopDialogFrame('供应商选择', '{0}','SelectSingleSupplier()',790,500);return false;", ResolveUrl("~/Admin/SelectSingleSupplier.aspx")));
                btnSelectSingleSupplier.Visible = !IsShowSupplierName;
                if (!string.IsNullOrEmpty(Supplierid))
                {
                    LoadData();
                }
            }
        }
        protected void BtnRetrieveSupplieres_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(hfSupplierid.Value))
            {
                Supplierid = hfSupplierid.Value;
                LoadData();
            }
        }
        #endregion

        protected void LoadData()
        {
            if(!string.IsNullOrEmpty(Supplierid))
            {
                var info = this.AssetsupplierService.RetrieveAssetsupplierBySupplierid(Supplierid);
                if(info!=null)
                {
                    litSupplier.Text = info.Suppliername;
                }
            }
        }
    }
}