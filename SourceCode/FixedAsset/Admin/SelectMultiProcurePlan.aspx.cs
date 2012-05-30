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
    public partial class SelectMultiProcurePlan : System.Web.UI.Page
    {
        #region Properties
        protected IProcurementscheduleheadService ProcurementscheduleheadService
        {
            get { return new ProcurementscheduleheadService(); }
        }
        public List<string> PsIds
        {
            get
            {
                if (ViewState["PsIds"] == null)
                {
                    ViewState["PsIds"] = new List<string>();
                }
                return ViewState["PsIds"] as List<string>;
            }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                this.ClearBrowserCache();
                LoadData(0);
            }
        }
        /// <summary>
        /// 数据查询事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadData(0);
        }
        /// <summary>
        /// 分页事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void pcData_PageIndexClick(object sender, KFSQ.Web.Controls.PageIndexClickEventArgs e)
        {
            CheckSelectedProcurePlan();
            LoadData(e.PageIndex);
        }
        protected void rptProcureList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (PsIds.Count > 0)
                {
                    var ckbPsId = e.Item.FindControl("ckbPsId") as CheckBox;
                    if (PsIds.Contains(ckbPsId.Text.Trim()))
                    {
                        ckbPsId.Checked = true;
                    }
                }
            }
        }
        protected void btnOk_Click(object sender, EventArgs e)
        {
            CheckSelectedProcurePlan();
            if (PsIds.Count == 0)
            {
                UIHelper.AlertMessage(this,"请选择！");
                return;
            }
            var returnValue = PageUtility.ListToString(PsIds);
            ClientScript.RegisterStartupScript(this.GetType(), "", "<script>setCookie('dialogReturn_key','" + returnValue + "',1);CloseTopDialogFrame();</script>");
        }
        #endregion

        #region Methods
        protected void CheckSelectedProcurePlan()
        {
            if (rptProcureList.Items.Count > 0)
            {
                for (int i = 0; i < rptProcureList.Items.Count; i++)
                {
                    var ckbPsId = rptProcureList.Items[i].FindControl("ckbPsId") as CheckBox;
                    if (ckbPsId != null)
                    {
                        if (ckbPsId.Checked)
                        {
                            //选中，加到viewstate中来
                            if (!PsIds.Contains(ckbPsId.Text.Trim()))
                            {
                                PsIds.Add(ckbPsId.Text.Trim());
                            }
                        }
                        else
                        {
                            //取消选择，需要从viewstate里删除
                            if (PsIds.Contains(ckbPsId.Text.Trim()))
                            {
                                PsIds.Remove(ckbPsId.Text.Trim());
                            }
                        }
                    }
                }
            }
            else
            {
                PsIds.Clear();
            }
        }
        protected void ClearBrowserCache()
        {
            Response.Buffer = true;
            Response.Expires = 0;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
        }
        protected void LoadData(int pageIndex)
        {
            var search = new ProcurementscheduleheadSearch();
            search.Psid = txtSrchPsid.Text;
            int recordCount = 0;
            var list = ProcurementscheduleheadService.RetrieveProcurementscheduleheadsPaging(search, pageIndex, pcData.PageSize, out recordCount);
            rptProcureList.DataSource = list;
            rptProcureList.DataBind();
            pcData.RecordCount = recordCount;
            pcData.CurrentIndex = pageIndex;
        }
        #endregion
    }
}