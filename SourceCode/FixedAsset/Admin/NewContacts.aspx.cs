﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Web.AppCode;

namespace FixedAsset.Web.Admin
{
    public partial class NewContacts : BasePage
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
        protected IAssetcategoryService AssetcategoryService
        {
            get { return new AssetcategoryService(); }
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
            if (!IsPostBack) {
                InitData();
                Contractid = PageUtility.GetQueryStringValue("Contractid");
                if (!string.IsNullOrEmpty(Contractid))
                {
                    var headInfo = ProcurementcontractService.RetrieveProcurementcontractByContractid(Contractid);
                    if (headInfo != null)
                    {
                        ReadEntityToControl(headInfo);
                        var list = ProcurementcontractdetailService.RetrieveProcurementcontractdetailListByContractid(Contractid);
                        ProcurementContractDetail.AddRange(list);
                        BtmImortAssets.Visible = true;
                    }
                }
                LoadDetailList();
            }
        }

        protected void rptContactDetailList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var BtnEdit = e.Item.FindControl("BtnEdit") as ImageButton;
                var BtnDeleted = e.Item.FindControl("BtnDeleted") as ImageButton;
                var detailInfo = e.Item.DataItem as Procurementcontractdetail;
                if (string.IsNullOrEmpty(detailInfo.Contractdetailid))
                {
                    BtnEdit.Visible = false;
                    BtnDeleted.Visible = false;
                }
                else
                {
                    BtnEdit.Attributes.Add("onclick", string.Format("ShowTopDialogFrame('修改明细', 'ContactDetail_Add.aspx?Contractdetailid={0}','RefreshDetail()',790,500);return false;", detailInfo.Contractdetailid));
                }
            }
        }
        protected void rptContactDetailList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var detailId = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            {
                if (!string.IsNullOrEmpty(detailId))
                {
                    if (!string.IsNullOrEmpty(Contractid)) { ProcurementcontractdetailService.DeleteProcurementcontractdetailByContractdetailid(detailId); }
                    var detailInfo = ProcurementContractDetail.Where(p => p.Contractdetailid == detailId).FirstOrDefault();
                    ProcurementContractDetail.Remove(detailInfo);
                    LoadDetailList();
                }
            }
            if (e.CommandName.Equals("EditDetail"))
            {

            }
        }

        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            DateTime dateTime = DateTime.MinValue;
            if (!ucContactscheduledate.DateValue.HasValue)
            {
                UIHelper.Alert(this.UpdatePanel1, "请选择合同签订日期!");
                return;
            }
            if (!ucApplydate.DateValue.HasValue)
            {
                UIHelper.Alert(this.UpdatePanel1, "请选择创建日期!");
                return;
            }

            Procurementcontract headInfo = null;
            if (string.IsNullOrEmpty(Contractid))
            {
                //add
                headInfo = new Procurementcontract();
                WriteControlValueToEntity(headInfo);
                this.ProcurementcontractService.CreateProcurementcontract(headInfo, ProcurementContractDetail);
            }
            else
            {
                //edit
                headInfo = ProcurementcontractService.RetrieveProcurementcontractByContractid(Contractid);
                if (headInfo == null) { UIHelper.Alert(this.UpdatePanel1, "对不起，合同已被删除,请重新录入！"); return; }
                WriteControlValueToEntity(headInfo);
                ProcurementcontractService.UpdateProcurementcontractByContractid(headInfo, ProcurementContractDetail);
            }
            UIHelper.AlertMessageGoToURL(this.UpdatePanel1, "保存成功!", ResolveUrl("~/Admin/ContractList.aspx"));
        }

        /// <summary>
        /// 确定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DateTime dateTime = DateTime.MinValue;
            if (!ucContactscheduledate.DateValue.HasValue)
            {
                UIHelper.Alert(this.UpdatePanel1, "请选择合同签订日期!");
                return;
            }
            if (!ucApplydate.DateValue.HasValue)
            {
                UIHelper.Alert(this.UpdatePanel1, "请选择创建日期!");
                return;
            }
            if (ProcurementContractDetail.Count == 0)
            {
                UIHelper.Alert(this.UpdatePanel1, "请录入合同明细！"); return;
            }
            Procurementcontract headInfo = null;
            if (string.IsNullOrEmpty(Contractid))
            {
                //add
                headInfo = new Procurementcontract();
                WriteControlValueToEntity(headInfo);
                this.ProcurementcontractService.CreateProcurementcontract(headInfo, ProcurementContractDetail);
            }
            else
            {
                //edit
                headInfo = ProcurementcontractService.RetrieveProcurementcontractByContractid(Contractid);
                if (headInfo == null) { UIHelper.Alert(this.UpdatePanel1, "对不起，合同已被删除,请重新录入！"); return; }
                WriteControlValueToEntity(headInfo);
                ProcurementcontractService.UpdateProcurementcontractByContractid(headInfo, ProcurementContractDetail);
            }
            UIHelper.AlertMessageGoToURL(this.UpdatePanel1, "提交成功!", ResolveUrl("~/Admin/ContractList.aspx"));
        }
         protected void BtmImortAssets_Click(object sender,EventArgs e)
         {
             Response.Redirect("~/Admin/ImportAssetFromContract.aspx");
         }

        #region 明细
        protected void BtnRefreshDetail_Click(object sender, EventArgs e)
        {
            LoadDetailList();
        }
        protected void rptProcureDetailList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var BtnEdit = e.Item.FindControl("BtnEdit") as ImageButton;
                var BtnDeleted = e.Item.FindControl("BtnDeleted") as ImageButton;
                var detailInfo = e.Item.DataItem as Procurementcontractdetail;
                if (string.IsNullOrEmpty(detailInfo.Contractdetailid))
                {
                    BtnEdit.Visible = false;
                    BtnDeleted.Visible = false;
                }
                else
                {
                    BtnEdit.Attributes.Add("onclick", string.Format("ShowTopDialogFrame('修改明细', 'ContactDetail_Add.aspx?Detailid={0}','RefreshDetail()',790,500);return false;", detailInfo.Contractdetailid));
                }
            }
        }
        protected void rptProcureDetailList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            var detailId = e.CommandArgument.ToString();
            if (e.CommandName.Equals("DeleteDetail"))
            {
                if (!string.IsNullOrEmpty(detailId))
                {
                    if (!string.IsNullOrEmpty(Contractid)) { ProcurementcontractService.DeleteProcurementcontractByContractid(detailId); }
                    var detailInfo = ProcurementContractDetail.Where(p => p.Contractdetailid == detailId).FirstOrDefault();
                    ProcurementContractDetail.Remove(detailInfo);
                    LoadDetailList();
                }
            }
            if (e.CommandName.Equals("EditDetail"))
            {

            }
        }
        #endregion

        #endregion

        #region Methods
        protected void InitData()
        {
            AssetCategories.Clear();
            ProcurementContractDetail.Clear();
            if (AssetCategories.Count == 0)
            {
                var list = AssetcategoryService.RetrieveAllAssetcategory();
                AssetCategories.AddRange(list);
            }
        }
        protected void ReadEntityToControl(Procurementcontract headInfo)
        {
            litPsid.Text = headInfo.Contractid;
            if (headInfo.Contractdate.HasValue)
            {
                ucContactscheduledate.DateValue = headInfo.Contractdate;
            }
            ucSelectSupplier.Supplierid = headInfo.Supplier;
            ucSubCompany.SubcompanyId = headInfo.Subcompany;
            if (headInfo.Createddate.HasValue)
            {
                ucApplydate.DateValue = headInfo.Createddate;
            }
        }
        protected void WriteControlValueToEntity(Procurementcontract headInfo)
        {
            headInfo.Contractid = litPsid.Text;
            headInfo.Contractdate = ucContactscheduledate.DateValue;
            headInfo.Psid=PageUtility.GetQueryStringValue("Psid");
            headInfo.Supplier = ucSelectSupplier.Supplierid;
            headInfo.Subcompany = ucSubCompany.SubcompanyId;
            headInfo.Createddate = ucApplydate.DateValue;
            if (!headInfo.Createddate.HasValue)
            {
                headInfo.Createddate = DateTime.Now;
            }
            if(WebContext.Current.CurrentUser!=null)
            {
                headInfo.Creator = WebContext.Current.CurrentUser.Username;
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