using System;
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
    public partial class New_ImportAssetFromContract : BasePage
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
        protected List<ImportAssetContractdetail> ImportAssetContractdetailContractDetail
        {
            get
            {
                if (Session["ImportAssetFromContract_Procurementcontractdetail"] == null)
                {
                    Session["ImportAssetFromContract_Procurementcontractdetail"] = new List<ImportAssetContractdetail>();
                }
                return Session["ImportAssetFromContract_Procurementcontractdetail"] as List<ImportAssetContractdetail>;
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
        protected IAssetService AssetService
        {
            get { return new AssetService(); }
        }
        protected IProcurementcontractdetailService ContractDetailService
        {
            get { return new ProcurementcontractdetailService(); }
        }
        #endregion

        #region Events
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                InitData();
                Contractid = PageUtility.GetQueryStringValue("Contractid");
                if (!string.IsNullOrEmpty(Contractid))
                {
                    var headInfo = ProcurementcontractService.RetrieveProcurementcontractByContractid(Contractid);
                    if (headInfo != null)
                    {
                        ReadEntityToControl(headInfo);
                        var list = ProcurementcontractdetailService.RetrieveProcurementcontractdetailListByContractid(Contractid);
                        foreach (var contractDetail in list)
                        {
                            if (contractDetail.Procurenumber > contractDetail.Inputnumber)
                            {
                                var data = new ImportAssetContractdetail();
                                data.Contractdetailid = contractDetail.Contractdetailid;
                                data.Contractid = contractDetail.Contractid;
                                data.Assetcategoryid = contractDetail.Assetcategoryid;
                                data.Assetname = contractDetail.Assetname;
                                data.Assetspecification = contractDetail.Assetspecification;
                                data.Unitprice = contractDetail.Unitprice;
                                data.Procurenumber = contractDetail.Procurenumber;
                                data.ImportNumber = contractDetail.Procurenumber - contractDetail.Inputnumber;//剩下多少可以继续导入设备表
                                data.Inputnumber = contractDetail.Inputnumber;
                                data.Purchasedate = headInfo.Contractdate;//默认合同签订日
                                ImportAssetContractdetailContractDetail.Add(data);
                            }
                        }
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
                var detailInfo = e.Item.DataItem as ImportAssetContractdetail;
                if (string.IsNullOrEmpty(detailInfo.Contractdetailid))
                {
                    BtnEdit.Visible = false;
                    BtnDeleted.Visible = false;
                }
                else
                {
                    BtnEdit.Attributes.Add("onclick", string.Format("ShowTopDialogFrame('修改导入明细', 'ImportContractDetail_Edit.aspx?Contractdetailid={0}','RefreshDetail()',950,500);return false;", detailInfo.Contractdetailid));
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
                    var detailInfo = ImportAssetContractdetailContractDetail.Where(p => p.Contractdetailid == detailId).FirstOrDefault();
                    ImportAssetContractdetailContractDetail.Remove(detailInfo);
                    LoadDetailList();
                }
            }
        }

        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (ImportAssetContractdetailContractDetail.Count == 0)
            {
                UIHelper.AlertMessageGoToURL(this.UpdatePanel1, "对不起，该合同已没设备可再导入了!", ResolveUrl("~/Admin/EquipmentList.aspx"));
                return;
            }
            foreach (var importAssetContractdetail in ImportAssetContractdetailContractDetail)
            {
                if (string.IsNullOrEmpty(importAssetContractdetail.Storage))
                {
                    UIHelper.Alert(this.UpdatePanel1, string.Format(@"请修改列表中设备{0}-{1}的存放地点!", importAssetContractdetail.CategoryAllPathName, importAssetContractdetail.Assetname));
                    return;
                }
            }
            var contractDetails = ContractDetailService.RetrieveProcurementcontractdetailByContractdetailid(
                    ImportAssetContractdetailContractDetail.Select(p => p.Contractdetailid).ToList());
            foreach (var importAssetContractdetail in ImportAssetContractdetailContractDetail)
            {
                var currentDetails =
                    contractDetails.Where(p => p.Contractdetailid == importAssetContractdetail.Contractdetailid).
                        FirstOrDefault();
                if (currentDetails != null)
                {
                    currentDetails.Inputnumber = importAssetContractdetail.ImportNumber;
                }
                for (decimal i = 0; i < importAssetContractdetail.ImportNumber; i++)
                {
                    Asset data = new Asset();
                    //data.Assetno = importAssetContractdetail.Assetno;//设备编号
                    data.Assetcategoryid = importAssetContractdetail.Assetcategoryid;//设备类别
                    data.Assetname = importAssetContractdetail.Assetname;//设备名称
                    data.Storage = importAssetContractdetail.Storage;//存放地点
                    data.State = AssetState.NoUse;//设备状态
                    data.Depreciationyear = importAssetContractdetail.Depreciationyear;//折旧年限
                    data.Unitprice = importAssetContractdetail.Unitprice;//单价
                    data.Brand = importAssetContractdetail.Brand;//品牌
                    data.Managemode = importAssetContractdetail.Managemode;//管理模式，托管:0自管:1
                    data.Financecategory = FinanceCategory.AAccount;//importAssetContractdetail.Financecategory;//财务类别(A帐:0B帐:1)
                    data.Supplierid = ucSelectSupplier.Supplierid;//importAssetContractdetail.Supplierid;//供应商
                    data.Purchasedate = importAssetContractdetail.Purchasedate;//购入日期
                    data.Expireddate = importAssetContractdetail.Expireddate;//折旧到期日期
                    data.Assetspecification = importAssetContractdetail.Assetspecification;//设备规格
                    data.Storageflag = importAssetContractdetail.Storageflag;//存放地点标识来源
                    data.Subcompany = ucSubCompany.SubcompanyId;//分公司
                    data.Contractid = importAssetContractdetail.Contractid;//合同编号
                    data.Contractdetailid = importAssetContractdetail.Contractdetailid;//合同明细编号
                    AssetService.SaveAssetInfo(data);
                }
            }
            foreach (var contractDetail in contractDetails)
            {
                ContractDetailService.UpdateProcurementcontractdetailByContractdetailid(contractDetail);
            }
            UIHelper.AlertMessageGoToURL(this.UpdatePanel1, "保存成功!", ResolveUrl("~/Admin/EquipmentList.aspx"));
        }

        #region 导入设备明细
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
                    BtnEdit.Attributes.Add("onclick", string.Format("ShowTopDialogFrame('修改导入明细', 'ImportContractDetail_Edit.aspx?Detailid={0}','RefreshDetail()',790,500);return false;", detailInfo.Contractdetailid));
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
                    var detailInfo = ImportAssetContractdetailContractDetail.Where(p => p.Contractdetailid == detailId).FirstOrDefault();
                    ImportAssetContractdetailContractDetail.Remove(detailInfo);
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
            ImportAssetContractdetailContractDetail.Clear();
            if (AssetCategories.Count == 0)
            {
                var list = AssetcategoryService.RetrieveAllAssetcategory();
                AssetCategories.AddRange(list);
            }
        }
        protected void ReadEntityToControl(Procurementcontract headInfo)
        {
            litContractid.Text = headInfo.Contractid;//合同编号
            //litContent.Text = headInfo.Content;//主要内容
            if (headInfo.Createddate.HasValue)
            {
                litCreateddate.Text = headInfo.Createddate.Value.ToString(UiConst.DateFormat);//创建日期
            }
            if (headInfo.Contractdate.HasValue)
            {
                litContractdate.Text = headInfo.Contractdate.Value.ToString(UiConst.DateFormat); ;//签订日期
            }
            ucSelectSupplier.Supplierid = headInfo.Supplier;//供应商
            //litOperator.Text = headInfo.Operator;//合同负责人
            ucSubCompany.SubcompanyId = headInfo.Subcompany; //分公司
            litCreator.Text = headInfo.Creator;//创建人
        }
        protected void LoadDetailList()
        {
            foreach (var detail in ImportAssetContractdetailContractDetail)
            {
                var subCategory =
                    AssetCategories.Where(p => p.Assetcategoryid == detail.Assetcategoryid).FirstOrDefault();
                if (subCategory == null)
                {
                    detail.CategoryAllPathName = detail.Assetcategoryid;
                }
                else
                {
                    var category = AssetCategories.Where(p => p.Assetcategoryid == subCategory.Assetparentcategoryid).
                            FirstOrDefault();
                    detail.CategoryAllPathName = string.Format(@"{0}-{1}", category.Assetcategoryname, subCategory.Assetcategoryname);
                }
            }

            rptContactDetailList.DataSource = ImportAssetContractdetailContractDetail;
            rptContactDetailList.DataBind();
        }
        #endregion
    }
}