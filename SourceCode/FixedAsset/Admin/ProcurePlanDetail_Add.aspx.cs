using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;

namespace FixedAsset.Web.Admin
{
    public partial class ProcurePlanDetail_Add :BasePage
    {
        #region Properties
        protected string Detailid
        {
            get
            {
                if (ViewState["Detailid"] == null)
                {
                    ViewState["Detailid"] = string.Empty;
                }
                return ViewState["Detailid"].ToString();
            }
            set { ViewState["Detailid"] = value; }
        }
        public IProcurementscheduledetailService ProcurementscheduledetailService
        {
            get { return new ProcurementscheduledetailService(); }
        }
        protected List<Procurementscheduledetail> ProcureScheduleDetails
        {
            get
            {
                if (Session["ProcurePlan_Add_Procurementscheduledetail"] == null)
                {
                    Session["ProcurePlan_Add_Procurementscheduledetail"] = new List<Procurementscheduledetail>();
                }
                return Session["ProcurePlan_Add_Procurementscheduledetail"] as List<Procurementscheduledetail>;
            }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if(!IsPostBack)
            {
                Detailid = PageUtility.GetQueryStringValue("Detailid");
                if(!string.IsNullOrEmpty(Detailid))
                {
                    var detailInfo = ProcureScheduleDetails.Where(p => p.Detailid == Detailid).FirstOrDefault();
                    if(detailInfo!=null)
                    {
                        ReadEntityToControl(detailInfo);
                    }
                }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var detailInfo = ProcureScheduleDetails.Where(p => p.Detailid == Detailid).FirstOrDefault(); 
            if(detailInfo==null){detailInfo=new Procurementscheduledetail();ProcureScheduleDetails.Add(detailInfo);}
            WriteControlValueToEntity(detailInfo);
            ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString("N"), "setCookie('dialogReturn_key','1',1);CloseTopDialogFrame();",true);
        }
        #endregion

        #region Methods
        protected void ReadEntityToControl(Procurementscheduledetail detailInfo)
        {
            txtAssetcategoryid.Text = detailInfo.Assetcategoryid;
            txtAssetname.Text = detailInfo.Assetname;
            txtAssetspecification.Text = detailInfo.Assetspecification;
            txtUnitprice.Text = detailInfo.Unitprice.ToString();
            txtPlannumber.Text = detailInfo.Plannumber.ToString();
        }
        protected void WriteControlValueToEntity(Procurementscheduledetail detailInfo)
        {
            detailInfo.Assetcategoryid = txtAssetcategoryid.Text;
            detailInfo.Assetname = txtAssetname.Text;
            detailInfo.Assetspecification = txtAssetspecification.Text;
            decimal unitprice = 0;
            if (decimal.TryParse(txtUnitprice.Text, out unitprice))
            {
                detailInfo.Unitprice = unitprice;
            }
            decimal plannumber = 0;
            if (decimal.TryParse(txtPlannumber.Text, out plannumber))
            {
                detailInfo.Plannumber = plannumber;
            }
        }
        #endregion
    }
}