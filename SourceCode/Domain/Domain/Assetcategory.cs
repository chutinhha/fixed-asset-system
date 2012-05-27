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
        #region ASSETCATEGORYID
        ///<summary>
        ///ColumnName:ASSETCATEGORYID;Size:40;NOT NULL
        ///</summary>
        public string Assetcategoryid{  get;set;}
        #endregion

        #region ASSETPARENTCATEGORYID
        ///<summary>
        ///ColumnName:ASSETPARENTCATEGORYID;Size:40;
        ///</summary>
        public string Assetparentcategoryid{  get;set;}
        #endregion

        #region ASSETCATEGORYNAME
        ///<summary>
        ///ColumnName:ASSETCATEGORYNAME;Size:200;
        ///</summary>
        public string Assetcategoryname{  get;set;}
        #endregion

        #region REMARK
        ///<summary>
        ///ColumnName:REMARK;Size:200;
        ///</summary>
        public string Remark{  get;set;}
        #endregion

        #region CREATEDATE
        ///<summary>
        ///ColumnName:CREATEDATE;
        ///</summary>
        public DateTime? Createdate{  get;set;}
        #endregion

        #region CREATOR
        ///<summary>
        ///ColumnName:CREATOR;Size:50;
        ///</summary>
        public string Creator{  get;set;}
        #endregion

        public string CategoryAllPathName { get; set; }
    }
}
