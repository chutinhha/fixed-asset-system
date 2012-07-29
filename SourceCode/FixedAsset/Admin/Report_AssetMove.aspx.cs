using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FixedAsset.Domain;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Web.AppCode;

namespace FixedAsset.Web.Admin
{

    public partial class Report_AssetMove : BasePage
    {
        #region Properties
        protected IAssetmoveService AssetmoveService
        {
            get
            {
                return new AssetmoveService();
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
                AssetCategories.Clear();
                LoadAssetCategory();
            }
        }
        protected void ucSelectStorageAddress_SelectedStorageNodeChange(object sender, EventArgs e)
        {
            LoadCurrentData();
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            LoadCurrentData();
        }
        #endregion

        #region Methods
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
            var search = new AssetRunTimeSearch();
            search.Storagetitle = ucSelectStorageAddress.Storagetitle;
            search.Storageid = ucSelectStorageAddress.StorageId;
            if (search.Storagetitle == Vstorageaddress.Subcompany)
            {
                var currentProjects = VStorageAddress.Where(p => p.Subcompanyid == ucSelectStorageAddress.StorageId && p.Storagetitle == Vstorageaddress.Project).ToList();
                search.ProjectIds.AddRange(currentProjects.Select(p => p.Storageid));
            }
            if (ucStartDate.DateValue.HasValue)
            {
                search.StartActualDate = ucStartDate.DateValue.Value;
            }
            if (ucEndDate.DateValue.HasValue)
            {
                search.EndActualDate = ucEndDate.DateValue.Value;
            }
            var currentReportData = AssetmoveService.RetrieveAssetRunTimeReport(search);

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
            if (search.Storagetitle == Vstorageaddress.RootCompany)
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
                                                                    && p.Storagetitle == Vstorageaddress.Subcompany
                                                                    && p.Storageid == currentSubCompany.Storageid).FirstOrDefault();
                            if (currentInfo == null)
                            {
                                content.AppendFormat("<td>{0}</td>", 0);
                            }
                            else
                            {
                                content.AppendFormat(@"<td><a href=""javascript:ShowTopDialogFrame('明细', 'Report_AssetMove_Detail.aspx?Assetcategoryid={0}&Storagetitle={1}&Storageid={2}&StartActualDate={3}&EndActualDate={4}','',900,450);"">{5}</a></td>",
                                    currentInfo.Assetcategoryid,
                                    Server.UrlEncode(currentInfo.Storagetitle),
                                    Server.UrlEncode(currentInfo.Storageid),
                                    search.StartActualDate.HasValue ? Server.UrlEncode(search.StartActualDate.Value.ToString(UiConst.DateFormat)) : string.Empty,
                                    search.EndActualDate.HasValue ? Server.UrlEncode(search.EndActualDate.Value.ToString(UiConst.DateFormat)) : string.Empty,
                                    currentInfo.Currentcount).AppendLine();
                            }
                        }
                    }
                    content.AppendLine("</tr>");
                }
            }
            else if (search.Storagetitle == Vstorageaddress.Subcompany)
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
                                                                && p.Storagetitle == Vstorageaddress.Subcompany
                                                                && p.Storageid == search.Storageid).FirstOrDefault();
                        if (currentInfo == null)
                        {
                            content.AppendFormat("<td>{0}</td>", 0);
                        }
                        else
                        {
                            content.AppendFormat(@"<td><a href=""javascript:ShowTopDialogFrame('明细', 'Report_AssetMove_Detail.aspx?Assetcategoryid={0}&Storagetitle={1}&Storageid={2}&StartActualDate={3}&EndActualDate={4}','',900,450);"">{5}</a></td>",
                                currentInfo.Assetcategoryid,
                                Server.UrlEncode(currentInfo.Storagetitle),
                                Server.UrlEncode(currentInfo.Storageid),
                                search.StartActualDate.HasValue ? Server.UrlEncode(search.StartActualDate.Value.ToString(UiConst.DateFormat)) : string.Empty,
                                search.EndActualDate.HasValue ? Server.UrlEncode(search.EndActualDate.Value.ToString(UiConst.DateFormat)) : string.Empty,
                                currentInfo.Currentcount).AppendLine();
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
                                                                    && p.Storagetitle == Vstorageaddress.Project
                                                                    && p.Storageid == currentProject.Storageid).FirstOrDefault();
                            if (currentInfo == null)
                            {
                                content.AppendFormat("<td>{0}</td>", 0);
                            }
                            else
                            {
                                content.AppendFormat(@"<td><a href=""javascript:ShowTopDialogFrame('明细', 'Report_AssetMove_Detail.aspx?Assetcategoryid={0}&Storagetitle={1}&Storageid={2}&StartActualDate={3}&EndActualDate={4}','',900,450);"">{5}</a></td>",
                                    currentInfo.Assetcategoryid,
                                    Server.UrlEncode(currentInfo.Storagetitle),
                                    Server.UrlEncode(currentInfo.Storageid),
                                    search.StartActualDate.HasValue ? Server.UrlEncode(search.StartActualDate.Value.ToString(UiConst.DateFormat)) : string.Empty,
                                    search.EndActualDate.HasValue ? Server.UrlEncode(search.EndActualDate.Value.ToString(UiConst.DateFormat)) : string.Empty,
                                    currentInfo.Currentcount).AppendLine();
                            }
                        }
                    }
                    content.AppendLine("</tr>");
                }
            }
            else if (search.Storagetitle == Vstorageaddress.Project)
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
                            content.AppendFormat(@"<td><a href=""javascript:ShowTopDialogFrame('明细', 'Report_AssetMove_Detail.aspx?Assetcategoryid={0}&Storagetitle={1}&Storageid={2}&StartActualDate={3}&EndActualDate={4}','',900,450);"">{5}</a></td>",
                                currentInfo.Assetcategoryid,
                                Server.UrlEncode(currentInfo.Storagetitle),
                                Server.UrlEncode(currentInfo.Storageid),
                                search.StartActualDate.HasValue ? Server.UrlEncode(search.StartActualDate.Value.ToString(UiConst.DateFormat)) : string.Empty,
                                search.EndActualDate.HasValue ? Server.UrlEncode(search.EndActualDate.Value.ToString(UiConst.DateFormat)) : string.Empty,
                                currentInfo.Currentcount).AppendLine();
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
                    var currentCategorycount = currentReportData.Where(p => p.Assetcategoryid == subCategory.Assetcategoryid).Sum(p => p.Currentcount);
                    content.AppendFormat("<td>{0}</td>", currentCategorycount);
                }
            }
            content.AppendLine("</tr>");
            #endregion

            content.AppendLine(" </table>");
            litContent.Text = content.ToString();
        }
        #endregion
    }
}