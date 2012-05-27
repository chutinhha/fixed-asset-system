/********************************************************************
* File Name:Subcompanyinfo
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-05-27
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
    ///SUBCOMPANYINFO
    /// <summary>
    [Serializable]
    public partial class Subcompanyinfo
    {
        #region 分公司编号
        ///<summary>
        ///ColumnName:分公司编号;NOT NULL
        ///</summary>
        public decimal Subcompanyid{  get;set;}
        #endregion

        #region 分公司名称
        ///<summary>
        ///ColumnName:分公司名称;Size:100;
        ///</summary>
        public string Subcompanyname{  get;set;}
        #endregion

        #region 分公司排序ID
        ///<summary>
        ///ColumnName:分公司排序ID;Size:100;
        ///</summary>
        public string Fgssortid{  get;set;}
        #endregion

        #region 分公司编码(700,701,702)
        ///<summary>
        ///ColumnName:分公司编码(700,701,702);Size:3;
        ///</summary>
        public string Subcompanycode{  get;set;}
        #endregion

    }


}
