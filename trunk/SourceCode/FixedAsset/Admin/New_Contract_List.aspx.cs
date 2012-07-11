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
    public partial class New_Contract_List : BasePage
    {
        #region Properties
        protected IHcontractService HcontractService
        {
            get { return new HcontractService(); }
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
            }
        }
        protected void rptContactsList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var instanceId = long.Parse(e.CommandArgument.ToString());
            if (e.CommandName.Equals("EditDetail"))
            {
                Response.Redirect(ResolveUrl(string.Format("~/Admin/New_ImportAssetFromContract.aspx?Instanceid={0}", instanceId)));
            }
        }
        #endregion

        #region  Methods
        protected void LoadData(int pageIndex)
        {
            var search = new HcontractSearch();
            //search.Szdw = txtSrchSzdw.Text;
            //search.Htbh = txtSrchHtbh.Text;
            search.Xmmc = txtSrchXmmc.Text;
            //search.Fjdw = txtSrchFjdw.Text;
            //search.Gcxz = txtSrchGcxz.Text;
            //search.Htzt = txtSrchHtzt.Text;
            //search.Sznd = txtSrchSznd.Text;
            //search.Htgq = txtSrchHtgq.Text;
            search.Cbf = txtSrchCbf.Text;//供应商，直接存的名称
            //search.Cbfw = txtSrchCbfw.Text;
            //search.Cbfs = txtSrchCbfs.Text;
            //search.Zlbz = txtSrchZlbz.Text;
            //search.Htjk = txtSrchHtjk.Text;
            //search.Qfbz = txtSrchQfbz.Text;
            //search.Zffs = txtSrchZffs.Text;
            //search.Jftl = txtSrchJftl.Text;
            //search.Gcbxq = txtSrchGcbxq.Text;
            //search.Gcbxj = txtSrchGcbxj.Text;
            //search.Gztk = txtSrchGztk.Text;
            //search.Qtyd = txtSrchQtyd.Text;
            //search.Cbdb = txtSrchCbdb.Text;
            //search.Jglfw = txtSrchJglfw.Text;
            //search.Dbsl = txtSrchDbsl.Text;
            //search.Zbht = txtSrchZbht.Text;
            //search.Bdsl = txtSrchBdsl.Text;
            //search.Bcsm = txtSrchBcsm.Text;
            //search.Cbs = txtSrchCbs.Text;
            //search.Jszj = txtSrchJszj.Text;
            //search.Lydb = txtSrchLydb.Text;
            //search.Fbsinstanceid = txtSrchFbsinstanceid.Text;
            //if (ucSrchStartQcsj.DateValue.HasValue)
            //{
            //    search.StartQcsj = ucSrchStartQcsj.DateValue.Value;
            //}
            //if (ucSrchEndQcsj.DateValue.HasValue)
            //{
            //    search.EndQcsj = ucSrchEndQcsj.DateValue.Value;
            //}
            //search.Qdsj = txtSrchQdsj.Text;
            //search.Htfl = txtSrchHtfl.Text;
            //if (ucSrchStartJcxyrq.DateValue.HasValue)
            //{
            //    search.StartJcxyrq = ucSrchStartJcxyrq.DateValue.Value;
            //}
            //if (ucSrchEndJcxyrq.DateValue.HasValue)
            //{
            //    search.EndJcxyrq = ucSrchEndJcxyrq.DateValue.Value;
            //}
            //if (ucSrchStartFbjcrq.DateValue.HasValue)
            //{
            //    search.StartFbjcrq = ucSrchStartFbjcrq.DateValue.Value;
            //}
            //if (ucSrchEndFbjcrq.DateValue.HasValue)
            //{
            //    search.EndFbjcrq = ucSrchEndFbjcrq.DateValue.Value;
            //}
            //search.Jcxybh = txtSrchJcxybh.Text;
            //search.Beizhu = txtSrchBeizhu.Text;
            //if (ucSrchStartHtwcrq.DateValue.HasValue)
            //{
            //    search.StartHtwcrq = ucSrchStartHtwcrq.DateValue.Value;//现在的合同完成日期
            //}
            //if (ucSrchEndHtwcrq.DateValue.HasValue)
            //{
            //    search.EndHtwcrq = ucSrchEndHtwcrq.DateValue.Value;//现在的合同完成日期
            //}
            //if (ucSrchStartJssjrq.DateValue.HasValue)
            //{
            //    search.StartJssjrq = ucSrchStartJssjrq.DateValue.Value;
            //}
            //if (ucSrchEndJssjrq.DateValue.HasValue)
            //{
            //    search.EndJssjrq = ucSrchEndJssjrq.DateValue.Value;
            //}
            //if (ucSrchStartDzwcrq.DateValue.HasValue)
            //{
            //    search.StartDzwcrq = ucSrchStartDzwcrq.DateValue.Value;
            //}
            //if (ucSrchEndDzwcrq.DateValue.HasValue)
            //{
            //    search.EndDzwcrq = ucSrchEndDzwcrq.DateValue.Value;
            //}
            //search.Dzj = txtSrchDzj.Text;
            //if (ucSrchStartJswcrq.DateValue.HasValue)
            //{
            //    search.StartJswcrq = ucSrchStartJswcrq.DateValue.Value;
            //}
            //if (ucSrchEndJswcrq.DateValue.HasValue)
            //{
            //    search.EndJswcrq = ucSrchEndJswcrq.DateValue.Value;
            //}
            //search.Jsj = txtSrchJsj.Text;
            //search.Dysjsr = txtSrchDysjsr.Text;
            //search.Qtydtmp = txtSrchQtydtmp.Text;
            //search.Issaved = txtSrchIssaved.Text;

            int recordCount = 0;
            var list = HcontractService.RetrieveHcontractsPaging(search, pageIndex, pcData.PageSize, out recordCount);
            rptContactsList.DataSource = list;
            rptContactsList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}