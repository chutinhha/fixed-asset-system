using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Web.AppCode;

namespace FixedAsset.Web.Admin
{
    public partial class AssetUsedPlan : BasePage
    {
        #region Properties
        protected DateTime WeekFirstDate
        {
            get
            {
                if (ViewState["WeekFirstDate"] == null)
                {
                    ViewState["WeekFirstDate"] = DateTime.MinValue;
                }
                return DateTime.Parse(ViewState["WeekFirstDate"].ToString());
            }
            set { ViewState["WeekFirstDate"] = value; }
        }
        protected DateTime WeekLastDate
        {
            get
            {
                if (ViewState["WeekLastDate"] == null)
                {
                    ViewState["WeekLastDate"] = DateTime.MinValue;
                }
                return DateTime.Parse(ViewState["WeekLastDate"].ToString());
            }
            set { ViewState["WeekLastDate"] = value; }
        }
        protected string WeeklyPlandatecycle
        {
            get
            {
                if (ViewState["WeeklyPlandatecycle"] == null)
                {
                    ViewState["WeeklyPlandatecycle"] = string.Empty;
                }
                return ViewState["WeeklyPlandatecycle"].ToString();
            }
            set { ViewState["WeeklyPlandatecycle"] = value; }
        }
        protected DateTime MonthFirstDate
        {
            get
            {
                if (ViewState["MonthFirstDate"] == null)
                {
                    ViewState["MonthFirstDate"] = DateTime.MinValue;
                }
                return DateTime.Parse(ViewState["MonthFirstDate"].ToString());
            }
            set { ViewState["MonthFirstDate"] = value; }
        }
        protected DateTime MonthLastDate
        {
            get
            {
                if (ViewState["MonthLastDate"] == null)
                {
                    ViewState["MonthLastDate"] = DateTime.MinValue;
                }
                return DateTime.Parse(ViewState["MonthLastDate"].ToString());
            }
            set { ViewState["MonthLastDate"] = value; }
        }
        protected string MonthlyPlandatecycle
        {
            get
            {
                if (ViewState["MonthlyPlandatecycle"] == null)
                {
                    ViewState["MonthlyPlandatecycle"] = string.Empty;
                }
                return ViewState["MonthlyPlandatecycle"].ToString();
            }
            set { ViewState["MonthlyPlandatecycle"] = value; }
        }
        protected IAssetrunplanService AssetrunplanService
        {
            get
            {
                return new AssetrunplanService();
            }
        }
        protected IAssetcategoryService AssetcategoryService
        {
            get { return new AssetcategoryService(); }
        }
        protected IAssetService AssetService
        {
            get
            {
                return new AssetService();
            }
        }
        protected List<Assetcategory> AssetCategories
        {
            get
            {
                if (Session["Report_AssetIntallAssetCategories"] == null)
                {
                    Session["Report_AssetIntallAssetCategories"] = new List<Assetcategory>();
                }
                return Session["Report_AssetIntallAssetCategories"] as List<Assetcategory>;
            }
        }
        protected List<Vstorageaddress> VStorageAddress
        {
            get
            {
                if (Session["VStorageAddress"] == null)
                {
                    Session["VStorageAddress"] = new List<Vstorageaddress>();
                }
                return Session["VStorageAddress"] as List<Vstorageaddress>;
            }
        }
        #endregion

        #region Events

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                InitData();
                AssetCategories.Clear();
                LoadAssetCategory();
                BtnSave.Visible = false;
            }
        }
        protected void ucSelectStorageAddress_SelectedStorageNodeChange(object sender, EventArgs e)
        {
            litWeeklyContent.Text = string.Format(@"{0}{1}~{2}设备使用计划", string.IsNullOrEmpty(ucSelectStorageAddress.Subcompanyname) ? ucSelectStorageAddress.Storagename : ucSelectStorageAddress.Subcompanyname + "->" + ucSelectStorageAddress.Storagename
                , WeekFirstDate.ToString(UiConst.DateFormatCh), WeekLastDate.ToString(UiConst.DateFormatCh));
            litMonthlyContent.Text = string.Format(@"{0}{1}~{2}设备使用计划", string.IsNullOrEmpty(ucSelectStorageAddress.Subcompanyname) ? ucSelectStorageAddress.Storagename : ucSelectStorageAddress.Subcompanyname + "->" + ucSelectStorageAddress.Storagename
                , MonthFirstDate.ToString(UiConst.DateFormatCh), MonthLastDate.ToString(UiConst.DateFormatCh));
            LoadCurrentData();
            ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString("N"), "tabChange('weeklyPlan','weeklyPlanContent','monthPlanContent');", true);
            //ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString("N"), " document.getElementById('weeklyPlanContent').style.display = 'none';", true);
            BtnSave.Visible = true;
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            var list = new List<Assetrunplan>();
            for (int i = 0; i < rptWeeklyData.Items.Count; i++)
            {
                var rowItem = rptWeeklyData.Items[i];
                var hfAssetcategoryid = rowItem.FindControl("hfAssetcategoryid") as HiddenField;
                var currentCategoryId = hfAssetcategoryid.Value;
                var currentCategory =AssetCategories.Where(p => p.Assetcategoryid == currentCategoryId).FirstOrDefault();
                if(currentCategory!=null)
                {
                    var info = new Assetrunplan();
                    int planId = 0;
                    var hfPlanid = rowItem.FindControl("hfPlanid") as HiddenField;
                    if (int.TryParse(hfPlanid.Value, out planId))
                    {
                        info.Planid = planId;//计划编号（时间段+分公司或项目体+分类ID等字符串的哈希值 
                    }
                    info.Assetparentcategoryid = currentCategory.Assetparentcategoryid;//设备父类别
                    info.Assetcategoryid = currentCategory.Assetcategoryid;//设备子类别
                    info.Storageflag = ucSelectStorageAddress.Storagetitle;//分公司、项目体标识
                    info.Storage = ucSelectStorageAddress.StorageId;//分公司、项目体ID
                    info.Plandatecycle = WeeklyPlandatecycle;//时间段（如：周计划，20120723-20120729）
                    info.Createddate = DateTime.Now;//创建时间
                    info.Startdate = WeekFirstDate;//开始日期
                    info.Enddate = WeekLastDate;//结束日期
                    info.Plancategory = Assetrunplan.Weekly;//计划类别
                    info.Assetcount = 0;//计划设备数量
                    var txtPlanCount = rowItem.FindControl("txtPlanCount") as TextBox;
                    int count = 0;
                    if(int.TryParse(txtPlanCount.Text,out count))
                    {
                        info.Assetcount = count;//计划设备数量
                    }
                    list.Add(info);
                }
            }
            AssetrunplanService.SaveAssetRunPlan(list);
            list.Clear();
            for (int i = 0; i < rptMonthlyData.Items.Count; i++)
            {
                var rowItem = rptMonthlyData.Items[i];
                var hfAssetcategoryid = rowItem.FindControl("hfAssetcategoryid") as HiddenField;
                var currentCategoryId = hfAssetcategoryid.Value;
                var currentCategory = AssetCategories.Where(p => p.Assetcategoryid == currentCategoryId).FirstOrDefault();
                if (currentCategory != null)
                {
                    var info = new Assetrunplan();
                    int planId = 0;
                    var hfPlanid = rowItem.FindControl("hfPlanid") as HiddenField;
                    if(int.TryParse(hfPlanid.Value,out planId))
                    {
                        info.Planid = planId;//计划编号（时间段+分公司或项目体+分类ID等字符串的哈希值 
                    }
                    info.Assetparentcategoryid = currentCategory.Assetparentcategoryid;//设备父类别
                    info.Assetcategoryid = currentCategory.Assetcategoryid;//设备子类别
                    info.Storageflag = ucSelectStorageAddress.Storagetitle;//分公司、项目体标识
                    info.Storage = ucSelectStorageAddress.StorageId;//分公司、项目体ID
                    info.Plandatecycle = MonthlyPlandatecycle;//时间段（如：周计划，20120723-20120729）
                    info.Createddate = DateTime.Now;//创建时间
                    info.Startdate = MonthFirstDate;//开始日期
                    info.Enddate = MonthLastDate;//结束日期
                    info.Plancategory = Assetrunplan.Monthly;//计划类别
                    info.Assetcount = 0;//计划设备数量
                    var txtPlanCount = rowItem.FindControl("txtPlanCount") as TextBox;
                    int count = 0;
                    if (int.TryParse(txtPlanCount.Text, out count))
                    {
                        info.Assetcount = count;//计划设备数量
                    }
                    list.Add(info);
                }
            }
            AssetrunplanService.SaveAssetRunPlan(list);
            UIHelper.Alert(this, "保存成功！");
            //ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString("N"), " document.getElementById('weeklyPlanContent').style.display = 'none';", true);
            ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString("N"), "tabChange('weeklyPlan','weeklyPlanContent','monthPlanContent');", true);
        }                                      
        #endregion

        #region Methods
        protected void InitData()
        {
            //周计划
            int dayOfWeek = Convert.ToInt32(DateTime.Today.DayOfWeek);
            int daydiff = (-1) * dayOfWeek + 1;
            int dayadd = 7 - dayOfWeek;
            WeekFirstDate = DateTime.Today.AddDays(daydiff).AddDays(7);
            WeekLastDate = DateTime.Today.AddDays(dayadd).AddDays(7);
            WeeklyPlandatecycle = WeekFirstDate.ToString(UiConst.DateFormat2) + WeekLastDate.ToString(UiConst.DateFormat2);

            //月计划
            MonthFirstDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1).AddMonths(1);
            MonthLastDate = MonthFirstDate.AddMonths(1).AddDays(-1);
            this.MonthlyPlandatecycle = MonthFirstDate.ToString(UiConst.DateFormat2) + MonthLastDate.ToString(UiConst.DateFormat2);
        }
        protected void LoadAssetCategory()
        {
            if (!IsPostBack)
            {
                if (AssetCategories.Count == 0)
                {
                    var list = AssetcategoryService.RetrieveAllAssetcategory();
                    AssetCategories.AddRange(list);
                }
            }
        }
        protected void LoadCurrentData()
        {
            #region Weekly
            var categories = AssetCategories.Where(p => string.IsNullOrEmpty(p.Assetparentcategoryid) || p.Assetparentcategoryid == Assetcategory.FixedAssetCategory).ToList();
            var weekData = AssetrunplanService.RetrieveAssetrunplanByCondition(WeeklyPlandatecycle,
                                                                               ucSelectStorageAddress.Storagetitle,
                                                                               ucSelectStorageAddress.StorageId);
            if (weekData.Count == 0)
            {
                foreach (var assetcategory in categories)
                {
                    var subCategories = AssetCategories.Where(p => p.Assetparentcategoryid == assetcategory.Assetcategoryid).ToList();
                    for (int i = 0; i < subCategories.Count; i++)
                    {
                        var currentSubCategory = subCategories[i];
                        var info = new Assetrunplan();
                        info.Planid = i;//计划编号（时间段+分公司或项目体+分类ID等字符串的哈希值
                        info.Assetparentcategoryid = assetcategory.Assetcategoryid;//设备父类别
                        info.Assetparentcategoryname = assetcategory.Assetcategoryname;
                        info.Assetcategoryid = currentSubCategory.Assetcategoryid;//设备子类别
                        info.Assetsubcategoryname = currentSubCategory.Assetcategoryname;
                        info.Storageflag = ucSelectStorageAddress.Storagetitle;//分公司、项目体标识
                        info.Storage = ucSelectStorageAddress.StorageId;//分公司、项目体ID
                        info.Plandatecycle = WeeklyPlandatecycle;//时间段（如：周计划，20120723-20120729）
                        info.Createddate = DateTime.Now;//创建时间
                        info.Startdate = WeekFirstDate;//开始日期
                        info.Enddate = WeekLastDate;//结束日期
                        info.Plancategory = Assetrunplan.Weekly;//计划类别
                        info.Assetcount = 0;//计划设备数量
                        weekData.Add(info);
                    }
                }
            }
            rptWeeklyData.DataSource = weekData;
            rptWeeklyData.DataBind();
            // 合并单元格
            for (int i = rptWeeklyData.Items.Count - 1; i > 0; i--)
            {
                var previousCell = rptWeeklyData.Items[i - 1].FindControl("tdAssetparentcategoryname") as HtmlTableCell;
                var currentCell = rptWeeklyData.Items[i].FindControl("tdAssetparentcategoryname") as HtmlTableCell;
                currentCell.RowSpan = (currentCell.RowSpan == -1) ? 1 : currentCell.RowSpan;
                previousCell.RowSpan = (previousCell.RowSpan == -1) ? 1 : previousCell.RowSpan;
                if (currentCell.InnerText == previousCell.InnerText)
                {
                    currentCell.Visible = false;
                    previousCell.RowSpan += currentCell.RowSpan;
                }
            }
            #endregion

            #region Monthly
            var monthlyData = AssetrunplanService.RetrieveAssetrunplanByCondition(MonthlyPlandatecycle,
                                                                               ucSelectStorageAddress.Storagetitle,
                                                                               ucSelectStorageAddress.StorageId);
            if (monthlyData.Count == 0)
            {
                foreach (var assetcategory in categories)
                {
                    var subCategories = AssetCategories.Where(p => p.Assetparentcategoryid == assetcategory.Assetcategoryid).ToList();
                    for (int i = 0; i < subCategories.Count; i++)
                    {
                        var currentSubCategory = subCategories[i];
                        var info = new Assetrunplan();
                        info.Planid = i;//计划编号（时间段+分公司或项目体+分类ID等字符串的哈希值）
                        info.Assetparentcategoryid = assetcategory.Assetcategoryid;//设备父类别
                        info.Assetparentcategoryname = assetcategory.Assetcategoryname;
                        info.Assetcategoryid = currentSubCategory.Assetcategoryid;//设备子类别
                        info.Assetsubcategoryname = currentSubCategory.Assetcategoryname;
                        info.Storageflag = ucSelectStorageAddress.Storagetitle;//分公司、项目体标识
                        info.Storage = ucSelectStorageAddress.StorageId;//分公司、项目体ID
                        info.Plandatecycle = MonthlyPlandatecycle;//时间段（如：周计划，20120723-20120729）
                        info.Createddate = DateTime.Now;//创建时间
                        info.Startdate = MonthFirstDate;//开始日期
                        info.Enddate = MonthLastDate;//结束日期
                        info.Plancategory = Assetrunplan.Monthly;//计划类别
                        info.Assetcount = 0;//计划设备数量
                        monthlyData.Add(info);
                    }
                }
            }
            rptMonthlyData.DataSource = monthlyData;
            rptMonthlyData.DataBind();
            // 合并单元格
            for (int i = rptMonthlyData.Items.Count - 1; i > 0; i--)
            {
                var previousCell = rptMonthlyData.Items[i - 1].FindControl("tdAssetparentcategoryname") as HtmlTableCell;
                var currentCell = rptMonthlyData.Items[i].FindControl("tdAssetparentcategoryname") as HtmlTableCell;
                currentCell.RowSpan = (currentCell.RowSpan == -1) ? 1 : currentCell.RowSpan;
                previousCell.RowSpan = (previousCell.RowSpan == -1) ? 1 : previousCell.RowSpan;
                if (currentCell.InnerText == previousCell.InnerText)
                {
                    currentCell.Visible = false;
                    previousCell.RowSpan += currentCell.RowSpan;
                }
            }
            #endregion

          //  ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString("N"), "tabChange('weeklyPlan','weeklyPlanContent','monthPlanContent');", true);
            //ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString("N"), " document.getElementById('weeklyPlanContent').style.display = 'none';", true);
        }
        #endregion
    }
}