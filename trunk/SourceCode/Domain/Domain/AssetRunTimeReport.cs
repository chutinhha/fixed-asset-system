using System;
using System.Collections.Generic;

namespace FixedAsset.Domain
{
    public class AssetRunTimeSearch
    {
        #region 分公司或项目体
        ///<summary>
        ///ColumnName:区分字段：分公司或项目体;Size:40;
        ///</summary>
        public string Storagetitle { get; set; }
        ///<summary>
        ///ColumnName:项目体ID或分公司ID;Size:40;
        ///</summary>
        public string Storageid { get; set; }
        private List<string> projectIds=new List<string>();
        public List<string> ProjectIds { get { return projectIds; } }
        #endregion

        #region 实际完成日期
        public DateTime? StartActualDate
        {
            get;
            set;
        }
        public DateTime? EndActualDate
        {
            get;
            set;
        }
        #endregion

        #region 设备类别
        ///<summary>
        ///ColumnName:设备类别;Size:40;
        ///</summary>
        public string Assetcategoryid { get; set; }
        #endregion
    }
    public class AssetRunTimeReport
    {
        #region 分公司或项目体
        ///<summary>
        ///ColumnName:区分字段：分公司或项目体;Size:40;
        ///</summary>
        public string Storagetitle { get; set; }
        ///<summary>
        ///ColumnName:项目体ID或分公司ID;Size:40;
        ///</summary>
        public string Storageid { get; set; }
        #endregion

        #region 设备类别
        ///<summary>
        ///ColumnName:设备类别;Size:40;
        ///</summary>
        public string Assetcategoryid { get; set; }
        #endregion

        public int Currentcount { get; set; }
    }

    public class AssetReportDetailInfo
    {
        #region 设备编号
        ///<summary>
        ///ColumnName:设备编号;Size:20;NOT NULL
        ///</summary>
        public string Assetno { get; set; }
        #endregion

        #region 业务单号
        ///<summary>
        ///业务单号
        ///</summary>
        public string Billid { get; set; }
        #endregion
    }
}
