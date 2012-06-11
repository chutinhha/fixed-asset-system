/********************************************************************
* File Name:Assetcategory
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-05-25
* Modify Explain:
* Description:Entity Class(DTO)
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;

namespace FixedAsset.Domain
{
    /// <summary>
    ///ASSETCATEGORY
    /// <summary>
    [Serializable]
    public partial class Assetcategory
    {
        #region 分类编号(父编号+自编号)
        ///<summary>
        ///分类编号(父编号+自编号),ASSETCATEGORYID;Size:40;NOT NULL
        ///</summary>
        public string Assetcategoryid { get; set; }
        #endregion

        #region 父编号
        ///<summary>
        ///父编号,ASSETPARENTCATEGORYID;Size:40;
        ///</summary>
        public string Assetparentcategoryid { get; set; }
        #endregion

        #region 分类名
        ///<summary>
        ///分类名,ASSETCATEGORYNAME;Size:200;
        ///</summary>
        public string Assetcategoryname { get; set; }
        #endregion

        #region 备注
        ///<summary>
        ///备注,REMARK;Size:200;
        ///</summary>
        public string Remark { get; set; }
        #endregion

        #region 创建时间
        ///<summary>
        ///创建时间,CREATEDATE;
        ///</summary>
        public DateTime? Createdate { get; set; }
        #endregion

        #region 创建人
        ///<summary>
        ///创建人,CREATOR;Size:50;
        ///</summary>
        public string Creator { get; set; }
        #endregion

        #region CATEGORYVALUE
        ///<summary>
        ///,CATEGORYVALUE;Size:50;
        ///</summary>
        public string Categoryvalue { get; set; }
        #endregion

        #region 对应的系统
        ///<summary>
        ///对应的系统,SYSTEM;Size:80;
        ///</summary>
        public string System { get; set; }
        #endregion

        public string CategoryAllPathName { get; set; }
    }
}
