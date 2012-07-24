using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FixedAsset.IServices;
using FixedAsset.Services;
using FixedAsset.Domain;
using System.Text;

namespace FixedAsset.Web.Admin
{
    public partial class Report_AssetRegister : BasePage
    {
        protected IAssetService AssetService
        {
            get
            {
                return new AssetService();
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
            var search = new AssetRegisterSearch();
            search.Storagetitle = ucSelectStorageAddress.Storagetitle;
            search.Storageid = ucSelectStorageAddress.StorageId;
            if (search.Storagetitle == Vstorageaddress.Subcompany)
            {
                var currentProjects = VStorageAddress.Where(p => p.Subcompanyid == ucSelectStorageAddress.StorageId).ToList();
                search.ProjectIds.AddRange(currentProjects.Select(p => p.Storageid));
            }
            //if (ucStartDate.DateValue.HasValue)
            //{
            //    search.StartRegisterDate = ucStartDate.DateValue.Value;
            //}
            //if (ucEndDate.DateValue.HasValue)
            //{
            //    search.EndRegisterDate = ucEndDate.DateValue.Value;
            //}
            var currentReportData = AssetService.RetrieveAssetRegisterReport(search);

            var content = new StringBuilder();
            content.AppendLine(@"<table style=""width: 100%; padding-top: 0px;"" cellspacing=""0px"" cellpadding=""0px""");
            content.AppendLine(@"                        align=""center"" class=""gridtable"">");

            #region RowHead1 表头

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
                content.AppendFormat(@"<th colspan=""{0}""  style=""border-left:1px solid #AFD2E8; border-right:1px solid #AFD2E8;"">", AssetCategories.Where(p => p.Assetparentcategoryid == assetcategory.Assetcategoryid).Count());
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
                    content.AppendFormat("<th style='border-left:1px solid #AFD2E8; border-right:1px solid #AFD2E8;'>{0}</th>", subCategory.Assetcategoryname).AppendLine();
                }
            }
            content.AppendLine("</tr>");
            #endregion RowHead2

            #region RowBody
            bool isEven = true;
            if (search.Storagetitle == Vstorageaddress.Subcompany)
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
                            content.AppendFormat(@"<td><a href=""javascript:ShowTopDialogFrame('明细', 'Report_ShowCurrentAssets.aspx?Assetcategoryid={0}&Storagetitle={1}&Storageid={2}&StartActualDate={3}&EndActualDate={4}','',900,350);"">{5}</a></td>",
                                        currentInfo.Assetcategoryid,
                                        Server.UrlEncode(currentInfo.Storagetitle),
                                        Server.UrlEncode(currentInfo.Storageid),
                                        string.Empty,
                                        string.Empty,
                                        currentInfo.Currentcount).AppendLine();
                        }
                    }
                }
                content.AppendLine("</tr>");
                #endregion

                var currentProjects = VStorageAddress.Where(p => p.Subcompanyid == ucSelectStorageAddress.StorageId).ToList();
                for (int i = 0; i < currentProjects.Count; i++)
                {
                    var currentProject = currentProjects[i];
                    if (!currentProject.Storagename.ToLower().Equals(ucSelectStorageAddress.Storagename.ToLower()))
                    {
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
                                    content.AppendFormat(@"<td><a href=""javascript:ShowTopDialogFrame('明细', 'Report_ShowCurrentAssets.aspx?Assetcategoryid={0}&Storagetitle={1}&Storageid={2}&StartActualDate={3}&EndActualDate={4}','',900,350);"">{5}</a></td>",
                                        currentInfo.Assetcategoryid,
                                        Server.UrlEncode(currentInfo.Storagetitle),
                                        Server.UrlEncode(currentInfo.Storageid),
                                        string.Empty,
                                        string.Empty,
                                        currentInfo.Currentcount).AppendLine();
                                }
                            }
                        }
                        content.AppendLine("</tr>");
                    }
                }
            }
            else if (search.Storagetitle == Vstorageaddress.Project)
            {
                content.AppendLine(@"<tr class=""even"" style=""padding: 0 0 0 0"">");
                content.Append("<td>1</td>");//序号
                content.AppendFormat("<td>{0}</td>", ucSelectStorageAddress.Storagename);//分公司/项目体
                foreach (var assetcategory in categories)
                {
                    var subCategories = AssetCategories.Where(p => p.Assetparentcategoryid == assetcategory.Assetcategoryid).ToList();
                    foreach (var subCategory in subCategories)
                    {
                        var currentInfo = currentReportData.Where(p => p.Assetcategoryid == subCategory.Assetcategoryid).
                                FirstOrDefault();
                        content.AppendFormat("<td>{0}</td>", currentInfo == null ? 0 : currentInfo.Currentcount).AppendLine();
                    }
                }
                content.AppendLine("</tr>");
            }

            else if (search.Storagetitle == Vstorageaddress.Supplier)
            {
                content.AppendLine(@"<tr class=""even"" style=""padding: 0 0 0 0"">");
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
                            content.AppendFormat(@"<td><a href=""javascript:ShowTopDialogFrame('明细', 'Report_ShowCurrentAssets.aspx?Assetcategoryid={0}&Storagetitle={1}&Storageid={2}&StartActualDate={3}&EndActualDate={4}','',900,350);"">{5}</a></td>",
                                currentInfo.Assetcategoryid,
                                Server.UrlEncode(currentInfo.Storagetitle),
                                Server.UrlEncode(currentInfo.Storageid),
                                string.Empty,
                                string.Empty,
                                currentInfo.Currentcount).AppendLine();
                        }
                    }
                }
                content.AppendLine("</tr>");
            }

            #endregion
            content.AppendLine(" </table>");
          
            literAssetRegister.Text = content.ToString();
        }
        #endregion

        protected void LoadData(int pageIndex)
        { 
            #region MyRegion
            //System.Data.DataTable dt = new System.Data.DataTable();
            //dt.Columns.Add("AssetStorageCategory");
            //dt.Columns.Add("AssetSubStorageCategory");
            //dt.Columns.Add("AssetCount");

            //foreach (Assetsupplier supplier in assetSuppliers)
            //{
            //    System.Data.DataRow dr = dt.NewRow();
            //    dr["AssetStorageCategory"] = supplier.Suppliername;
            //    dr["AssetSubStorageCategory"] = "";
            //    //dr["AssetCount"] = list.Where(p => p.Storageflag.ToLower().Equals("supplier") && p.Supplierid.ToLower().Equals(supplier.Supplierid.ToLower())).Count();
            //    dr["AssetCount"] = list.Where(p => p.Storageflag == Vstorageaddress.Supplier && p.Storage == supplier.Supplierid).Count();
            //    dt.Rows.Add(dr);
            //}
            //foreach (Subcompanyinfo subcom in subcompanyinfos)
            //{
            //    System.Data.DataRow dr = dt.NewRow();
            //    dr["AssetStorageCategory"] = subcom.Subcompanyname;
            //    dr["AssetSubStorageCategory"] = "";
            //    dr["AssetCount"] = list.Where(p => p.Storageflag == Vstorageaddress.Subcompany && p.Storage == subcom.Subcompanyid.ToString()).Count();
            //    //list.Where(o =>o.Storageflag.ToLower().Equals("subcompany") &&o.Subcompany.ToLower().Equals(subcom.Subcompanyid.ToString().ToLower())).Count();
            //    dt.Rows.Add(dr);
            //    var currentProjects = Project.Where(p => p.Fgsid == subcom.Subcompanyid).ToList();
            //    foreach (var currentProject in currentProjects)
            //    {
            //        System.Data.DataRow drproject = dt.NewRow();
            //        drproject["AssetStorageCategory"] = subcom.Subcompanyname;
            //        drproject["AssetSubStorageCategory"] = currentProject.Xmt;
            //        drproject["AssetCount"] = list.Where(p => p.Storageflag == Vstorageaddress.Project && p.Storage == currentProject.Xmtid.ToString()).Count();
            //        //drproject["AssetCount"] = list.Where(p => p.Storageflag.ToLower().Equals("project") && p.Storage.ToLower().Equals(lbfgsxmt.Xmtid.ToString().ToLower())).Count();
            //        dt.Rows.Add(drproject);
            //    }
            //}
            //rptAssetsStorageCategoryList.DataSource = dt;
            //rptAssetsStorageCategoryList.DataBind(); 
            #endregion
        } 
    }
}