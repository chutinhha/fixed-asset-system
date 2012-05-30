using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FixedAsset.Domain
{
    public class Vstorageaddress
    {
        public const string Project = "Project";
        public const string Subcompany = @"Subcompany"; //分公司
        public const string Supplier = @"Supplier";  //供应商

        #region 存放地点分类
        ///<summary>
        /// 供应商、分公司、项目体
        ///</summary>
        public string Storagetitle { get; set; }
        #endregion 

        #region 存放地点编号
        ///<summary>
        ///供应商：供应商编号
        ///分公司：分公司编号
        ///项目体：项目体编号
        ///</summary>
        public string Storageid { get; set; }
        #endregion

        #region 存放地点名
        ///<summary>
        /// 存放地点名
        ///</summary>
        public string Storagename { get; set; }
        #endregion

        #region 分公司编号
        ///<summary>
        ///供应商：供应商编号
        ///分公司：分公司编号
        ///项目体：分公司编号
        ///</summary>
        public string Subcompanyid { get; set; }
        #endregion

        #region 分公司名称
        ///<summary>
        ///ColumnName:分公司名称;Size:100;
        ///</summary>
        public string Subcompanyname { get; set; }
        #endregion
    }
}
