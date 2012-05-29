/********************************************************************
* File Name:Assetsupplier
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
    ///ASSETSUPPLIER
    /// <summary>
    [Serializable]
    public partial class Assetsupplier
    {
        #region 供应商编号
        ///<summary>
        ///ColumnName:供应商编号;Size:80;NOT NULL
        ///</summary>
        public string Supplierid{  get;set;}
        #endregion

        #region 供应商
        ///<summary>
        ///ColumnName:供应商;Size:80;
        ///</summary>
        public string Suppliername{  get;set;}
        #endregion

        #region 备注
        ///<summary>
        ///ColumnName:备注;Size:2000;
        ///</summary>
        public string Remark{  get;set;}
        #endregion 

        #region 对应系统
        ///<summary>
        ///ColumnName:对应系统;Size:80;
        ///</summary>
        public string System { get; set; }
        #endregion

        #region 对应的资产大类ID
        ///<summary>
        ///ColumnName:对应的资产大类ID;Size:80;
        ///</summary>
        public string Assetcategoryid { get; set; }
        #endregion
    }
}
