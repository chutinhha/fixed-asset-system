using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Domain;

namespace FixedAsset.Web.Admin
{
    public partial class ContactDetail_View : BasePage
    {
        #region Properties
        protected string Contractid
        {
            get
            {
                if (ViewState["Contractid"] == null)
                {
                    ViewState["Contractid"] = string.Empty;
                }
                return ViewState["Contractid"].ToString();
            }
            set { ViewState["Contractid"] = value; }
        }
        protected IProcurementcontractService ProcurementcontractService
        {
            get { return new ProcurementcontractService(); }
        }
        protected IProcurementcontractdetailService ProcurementcontractdetailService
        {
            get { return new ProcurementcontractdetailService(); }
        }
        protected List<Procurementcontractdetail> ProcurementContractDetail
        {
            get
            {
                if (Session["NewContacts_Procurementcontractdetail"] == null)
                {
                    Session["NewContacts_Procurementcontractdetail"] = new List<Procurementcontractdetail>();
                }
                return Session["NewContacts_Procurementcontractdetail"] as List<Procurementcontractdetail>;
            }
        }
        protected IAssetsupplierService AssetsupplierService
        {
            get { return new AssetsupplierService(); }
        }

        protected IAssetcategoryService AssetcategoryService
        {
            get { return new AssetcategoryService(); }
        }
        protected IProcurementscheduledetailService ProcurementscheduledetailService
        {
            get { return new ProcurementscheduledetailService(); }
        }

        protected List<Assetcategory> AssetCategories
        {
            get
            {
                if (Session["AssetCategories"] == null)
                {
                    Session["AssetCategories"] = new List<Assetcategory>();
                }
                return Session["AssetCategories"] as List<Assetcategory>;
            }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
              
                Contractid = PageUtility.GetQueryStringValue("Contractid");
                if (!string.IsNullOrEmpty(Contractid))
                {
                    var headInfo = ProcurementcontractService.RetrieveProcurementcontractByContractid(Contractid);
                    if (headInfo != null)
                    {
                        ReadEntityToControl(headInfo);
                        var list = ProcurementcontractdetailService.RetrieveProcurementcontractdetailListByContractid(Contractid);
                        ProcurementContractDetail.Clear();
                        ProcurementContractDetail.AddRange(list);
                        
                    }
                }
                LoadDetailList();
            }
        }

        protected void rptContactDetailList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
           
        }
        protected void rptContactDetailList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
           
        }

        
       

        #region 明细

        protected void rptProcureDetailList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
               
            }
        }
        protected void rptProcureDetailList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
           
        }
        #endregion

        #endregion

        #region Methods

        protected void ReadEntityToControl(Procurementcontract headInfo)
        {
            litPsid.Text = headInfo.Contractid;
            if (headInfo.Contractdate.HasValue)
            {
                litContactscheduledate.Text = Convert.ToDateTime(headInfo.Contractdate.Value).ToString("yyyy-MM-dd"); ;
            }
            var info = this.AssetsupplierService.RetrieveAssetsupplierBySupplierid(headInfo.Supplier);
            if (info != null)
            {
                lblSelectSupplier.Text = info.Suppliername;
            }
            var subcompanyinfoService = new SubcompanyinfoService();
            decimal decSubcompanyId = 0;
            if (decimal.TryParse(headInfo.Subcompany, out decSubcompanyId))
            {
                var infosubcompany = subcompanyinfoService.RetrieveSubcompanyinfoBySubcompanyid(decSubcompanyId);
                if (infosubcompany != null)
                {
                    lblSubCompany.Text = infosubcompany.Subcompanyname;
                }
            }
            if (headInfo.Createddate.HasValue)
            {
                lblApplydate.Text = Convert.ToDateTime(headInfo.Createddate).ToString("yyyy-MM-dd"); 
            }
        }

       
        protected void LoadDetailList()
        {
            foreach (var detail in ProcurementContractDetail)
            {
                var subCategory =
                    AssetCategories.Where(p => p.Assetcategoryid == detail.Assetcategoryid).FirstOrDefault();
                if (subCategory == null)
                {
                    detail.CategoryAllPathName = detail.Assetcategoryid;
                }
                else
                {
                    var category =
                        AssetCategories.Where(p => p.Assetcategoryid == subCategory.Assetparentcategoryid).
                            FirstOrDefault();
                    detail.CategoryAllPathName = string.Format(@"{0}-{1}", category.Assetcategoryname, subCategory.Assetcategoryname);
                }
            }

            rptContactDetailList.DataSource = ProcurementContractDetail;
            rptContactDetailList.DataBind();
        }
        #endregion
    }
}