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
namespace FixedAsset.Web.Admin
{
    public partial class ContractList : BasePage
    {
        #region Properties
        protected IProcurementcontractService ProcurementcontractService
        {
            get { return new ProcurementcontractService(); }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            { LoadData(0); }
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            LoadData(0);
        }
        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            LoadData(e.PageIndex);
        }

        protected void rptContactsList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var BtnEdit = e.Item.FindControl("BtnEdit") as ImageButton;
                var BtnDeleted = e.Item.FindControl("BtnDeleted") as ImageButton;
              
               
            }
        }
        protected void rptContactsList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var Contactid = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            {
                if (!string.IsNullOrEmpty(Contactid))
                {
                    ProcurementcontractService.DeleteProcurementcontractByContractid(Contactid);
                    UIHelper.Alert(this, "删除成功");
                    LoadData(pcData.CurrentIndex);
                }
            }
            if (e.CommandName.Equals("EditDetail"))
            {
                //var headInfo = ProcurementcontractService.RetrieveProcurementcontractByContractid(Contactid);
                //if (headInfo == null) { return; }
                Response.Redirect(ResolveUrl(string.Format("~/Admin/NewContacts.aspx?Contractid={0}", Contactid)));
            }
            if (e.CommandName.Equals("ViewDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/NewContacts.aspx?Contractid={0}", Contactid))); 
            }
        }
        #endregion

        #region  Methods
        protected void LoadData(int pageIndex)
        {
            var search = new ProcurementcontractSearch();
            search.Contractid = txtSrchPsid.Text;
          
            int recordCount = 0;
            var list = ProcurementcontractService.RetrieveProcurementcontractsPaging(search, pageIndex, pcData.PageSize, out recordCount);

            rptContactsList.DataSource = list;
            rptContactsList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}