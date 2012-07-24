using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FixedAsset.Domain
{
   public class AssetRegisterSearch
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

        #region 购入日期
        public DateTime? StartRegisterDate
        {
            get;
            set;
        }
        public DateTime? EndRegisterDate
        {
            get;
            set;
        }
        #endregion
    }


   public class AssetRegisterReport
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
}
