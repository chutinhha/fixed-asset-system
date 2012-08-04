using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Web.AppCode;

namespace FixedAsset.Web.Admin
{

    public partial class Report_Remove_Plan : BasePage
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
        protected IAssetremoveplanService AssetremoveplanService
        {
            get
            {
                return new AssetremoveplanService();
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
                ucSrchDate.DateValue = DateTime.Today;
                AssetCategories.Clear();
                LoadAssetCategory();
            }
        }
        protected void ucSelectStorageAddress_SelectedStorageNodeChange(object sender, EventArgs e)
        {
            if (!ucSrchDate.DateValue.HasValue)
            {
                UIHelper.Alert(this, "请选择时间！");
                return;
            }
            InitData();
            litWeeklyContent.Text = string.Format(@"{0}{1}~{2}设备使用计划汇总", string.IsNullOrEmpty(ucSelectStorageAddress.Subcompanyname) ? ucSelectStorageAddress.Storagename : ucSelectStorageAddress.Subcompanyname + "->" + ucSelectStorageAddress.Storagename
                , WeekFirstDate.ToString(UiConst.DateFormatCh), WeekLastDate.ToString(UiConst.DateFormatCh));
            litMonthlyContent.Text = string.Format(@"{0}{1}~{2}设备使用计划汇总", string.IsNullOrEmpty(ucSelectStorageAddress.Subcompanyname) ? ucSelectStorageAddress.Storagename : ucSelectStorageAddress.Subcompanyname + "->" + ucSelectStorageAddress.Storagename
                , MonthFirstDate.ToString(UiConst.DateFormatCh), MonthLastDate.ToString(UiConst.DateFormatCh));
            litMonthlyBody.Text = LoadCurrentData(MonthlyPlandatecycle);
            litWeeklyBody.Text = LoadCurrentData(WeeklyPlandatecycle);
            ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString("N"), "tabChange('weeklyPlan','weeklyPlanContent','monthPlanContent');", true);
        }
        #endregion

        #region Methods
        protected void InitData()
        {
            if (!ucSrchDate.DateValue.HasValue) { return; }
            DateTime currentDate = ucSrchDate.DateValue.Value;
            //周计划
            int dayOfWeek = Convert.ToInt32(currentDate.DayOfWeek);
            int daydiff = (-1) * dayOfWeek + 1;
            int dayadd = 7 - dayOfWeek;
            WeekFirstDate = currentDate.AddDays(daydiff);
            WeekLastDate = currentDate.AddDays(dayadd);
            WeeklyPlandatecycle = WeekFirstDate.ToString(UiConst.DateFormat2) + WeekLastDate.ToString(UiConst.DateFormat2);

            //月计划
            MonthFirstDate = new DateTime(currentDate.Year, currentDate.Month, 1);
            MonthLastDate = MonthFirstDate.AddMonths(1).AddDays(-1);
            MonthlyPlandatecycle = MonthFirstDate.ToString(UiConst.DateFormat2) + MonthLastDate.ToString(UiConst.DateFormat2);
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

        protected string LoadCurrentData(string plandatecycle)
        {
            var search = new AssetremoveplanSearch();
            search.Storageflag = ucSelectStorageAddress.Storagetitle;
            search.Storage = ucSelectStorageAddress.StorageId;
            search.Plandatecycle = plandatecycle;
            if (search.Storageflag == Vstorageaddress.Subcompany)
            {
                var currentProjects = VStorageAddress.Where(p => p.Subcompanyid == ucSelectStorageAddress.StorageId && p.Storagetitle == Vstorageaddress.Project).ToList();
                search.ProjectIds.AddRange(currentProjects.Select(p => p.Storageid));
            }

            var currentReportData = AssetremoveplanService.RetrieveAssetremoveplanByCondition(search);
            var content = new StringBuilder();
            content.AppendLine(@"<table style=""width: 100%; padding-top: 0px;"" cellspacing=""0px"" cellpadding=""0px""");
            content.AppendLine(@"                        align=""center"" class=""gridtable"">");

            #region RowHead1
            content.AppendLine(@"<tr class=""thbg"" style=""padding: 0 0 0 0"">");
            content.AppendLine(@"<th rowspan=""2""  class=""thbg2""  style=""border-left:1px solid #AFD2E8; border-right:1px solid #AFD2E8;height:52px; background:url(images/thbg2.jpg) 0 0  repeat-x; backgroud-color:#BADFF9; color:#2370B0; font-weight:bold; text-align:center;  padding:0 0 0 0;"">");
            content.AppendLine(" 序号");
            content.AppendLine("</th>");
            content.AppendLine(@"<th rowspan=""2""  class=""thbg2""   style=""border-left:1px solid #AFD2E8; width:200px; border-right:1px solid #AFD2E8;background:url(images/thbg2.jpg) 0 0  repeat-x;"">");
            content.AppendLine("分公司/项目体");
            content.AppendLine("</th>");
            var categories = AssetCategories.Where(p => string.IsNullOrEmpty(p.Assetparentcategoryid) || p.Assetparentcategoryid == Assetcategory.FixedAssetCategory).ToList();
            foreach (var assetcategory in categories)
            {
                content.AppendFormat(@"<th colspan=""{0}"" style=""border-left:1px solid #AFD2E8; border-right:1px solid #AFD2E8;"">", AssetCategories.Where(p => p.Assetparentcategoryid == assetcategory.Assetcategoryid).Count());
                content.Append(assetcategory.Assetcategoryname);
                content.AppendLine(" </th>");
            }
            content.AppendLine("                        </tr>");
            #endregion RowHead1

            #region RowHead2
            content.AppendLine(@"<tr class=""thbg"" style=""padding: 0 0 0 0"">");
            foreach (var assetcategory in categories)
            {
                var subCategories = AssetCategories.Where(p => p.Assetparentcategoryid == assetcategory.Assetcategoryid).ToList();
                foreach (var subCategory in subCategories)
                {
                    content.AppendFormat("<th>{0}</th>", subCategory.Assetcategoryname).AppendLine();
                }
            }
            content.AppendLine("</tr>");
            #endregion RowHead2

            #region RowBody
            bool isEven = true;
            if (search.Storageflag == Vstorageaddress.RootCompany)
            {
                var currentSubCompanies = VStorageAddress.Where(p => p.Storagetitle == Vstorageaddress.Subcompany).ToList();
                for (int i = 0; i < currentSubCompanies.Count; i++)
                {
                    var currentSubCompany = currentSubCompanies[i];
                    if (currentSubCompany.Storagename.Contains("总"))
                    {
                        continue;
                    }
                    content.AppendFormat(@"<tr {0} style=""padding: 0 0 0 0"">", isEven ? @"class=""even""" : string.Empty).AppendLine();
                    isEven = !isEven;
                    content.AppendFormat("<td>{0}</td>", i + 2);//序号
                    content.AppendFormat("<td>{0}</td>", currentSubCompany.Storagename);//分公司
                    foreach (var assetcategory in categories)
                    {
                        var subCategories = AssetCategories.Where(p => p.Assetparentcategoryid == assetcategory.Assetcategoryid).ToList();
                        foreach (var subCategory in subCategories)
                        {
                            var currentInfo = currentReportData.Where(p => p.Assetcategoryid == subCategory.Assetcategoryid
                                                                    && p.Storageflag == Vstorageaddress.Subcompany
                                                                    && p.Storage == currentSubCompany.Storageid).FirstOrDefault();
                            if (currentInfo == null)
                            {
                                content.AppendFormat("<td>{0}</td>", 0);
                            }
                            else
                            {
                                content.AppendFormat(@"<td>{0}</td>",

                                    currentInfo.Assetcount).AppendLine();
                            }
                        }
                    }
                    content.AppendLine("</tr>");
                }
            }
            else if (search.Storageflag == Vstorageaddress.Subcompany)
            {
                #region 分公司
                content.AppendFormat(@"<tr {0} style=""padding: 0 0 0 0"">", isEven ? @"class=""even""" : string.Empty).AppendLine();
                isEven = !isEven;
                content.Append("<td>1</td>");//序号
                content.AppendFormat("<td>{0}</td>", ucSelectStorageAddress.Storagename);//分公司
                foreach (var assetcategory in categories)
                {
                    var subCategories = AssetCategories.Where(p => p.Assetparentcategoryid == assetcategory.Assetcategoryid).ToList();
                    foreach (var subCategory in subCategories)
                    {
                        var currentInfo = currentReportData.Where(p => p.Assetcategoryid == subCategory.Assetcategoryid
                                                                && p.Storageflag == Vstorageaddress.Subcompany
                                                                && p.Storage == search.Storage).FirstOrDefault();
                        if (currentInfo == null)
                        {
                            content.AppendFormat("<td>{0}</td>", 0);
                        }
                        else
                        {
                            content.AppendFormat(@"<td>{0}</td>",

                                    currentInfo.Assetcount).AppendLine();
                        }
                    }
                }
                content.AppendLine("</tr>");
                #endregion

                var currentProjects = VStorageAddress.Where(p => p.Subcompanyid == ucSelectStorageAddress.StorageId && p.Storagetitle == Vstorageaddress.Project).ToList();
                for (int i = 0; i < currentProjects.Count; i++)
                {
                    var currentProject = currentProjects[i];
                    content.AppendFormat(@"<tr {0} style=""padding: 0 0 0 0"">", isEven ? @"class=""even""" : string.Empty).AppendLine();
                    isEven = !isEven;
                    content.AppendFormat("<td>{0}</td>", i + 2);//序号
                    content.AppendFormat("<td>{0}</td>", currentProject.Storagename);//项目体
                    foreach (var assetcategory in categories)
                    {
                        var subCategories = AssetCategories.Where(p => p.Assetparentcategoryid == assetcategory.Assetcategoryid).ToList();
                        foreach (var subCategory in subCategories)
                        {
                            var currentInfo = currentReportData.Where(p => p.Assetcategoryid == subCategory.Assetcategoryid
                                                                    && p.Storageflag == Vstorageaddress.Project
                                                                    && p.Storage == currentProject.Storageid).FirstOrDefault();
                            if (currentInfo == null)
                            {
                                content.AppendFormat("<td>{0}</td>", 0);
                            }
                            else
                            {
                                content.AppendFormat(@"<td>{0}</td>",

                                    currentInfo.Assetcount).AppendLine();
                            }
                        }
                    }
                    content.AppendLine("</tr>");
                }
            }
            else if (search.Storageflag == Vstorageaddress.Project)
            {
                content.AppendFormat(@"<tr {0} style=""padding: 0 0 0 0"">", isEven ? @"class=""even""" : string.Empty).AppendLine();
                isEven = !isEven;
                content.Append("<td>1</td>");//序号
                content.AppendFormat("<td>{0}</td>", ucSelectStorageAddress.Storagename);//分公司/项目体
                foreach (var assetcategory in categories)
                {
                    var subCategories = AssetCategories.Where(p => p.Assetparentcategoryid == assetcategory.Assetcategoryid).ToList();
                    foreach (var subCategory in subCategories)
                    {
                        var currentInfo = currentReportData.Where(p => p.Assetcategoryid == subCategory.Assetcategoryid).
                                FirstOrDefault();
                        if (currentInfo == null)
                        {
                            content.AppendFormat("<td>{0}</td>", 0);
                        }
                        else
                        {
                            content.AppendFormat(@"<td>{0}</td>",

                                     currentInfo.Assetcount).AppendLine();
                        }
                    }
                }
                content.AppendLine("</tr>");
            }
            #endregion

            #region 合计信息
            content.AppendFormat(@"<tr {0} style=""padding: 0 0 0 0"">", isEven ? @"class=""even""" : string.Empty).AppendLine();
            content.Append(@"<td colspan=""2"">合计</td>");//序号
            foreach (var assetcategory in categories)
            {
                var subCategories = AssetCategories.Where(p => p.Assetparentcategoryid == assetcategory.Assetcategoryid).ToList();
                foreach (var subCategory in subCategories)
                {
                    var currentCategorycount = currentReportData.Where(p => p.Assetcategoryid == subCategory.Assetcategoryid).Sum(p => p.Assetcount);
                    content.AppendFormat("<td>{0}</td>", currentCategorycount);
                }
            }
            content.AppendLine("</tr>");
            #endregion

            content.AppendLine(" </table>");
            return content.ToString();
        }
        #endregion
    }
}