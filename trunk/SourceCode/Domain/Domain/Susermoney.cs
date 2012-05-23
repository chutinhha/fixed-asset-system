/********************************************************************
* File Name:Susermoney
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-05-23
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
    ///S_USER_MONEY
    /// <summary>
    [Serializable]
    public partial class Susermoney
    {
        #region 编号
        ///<summary>
        ///ColumnName:编号;Size:50;NOT NULL
        ///</summary>
        public string Id{  get;set;}
        #endregion

        #region 用户ID
        ///<summary>
        ///ColumnName:用户ID;Size:50;
        ///</summary>
        public string Userid{  get;set;}
        #endregion

        #region 金额
        ///<summary>
        ///ColumnName:金额;
        ///</summary>
        public decimal Money{  get;set;}
        #endregion

        #region 创建者Id
        ///<summary>
        ///ColumnName:创建者Id;Size:50;
        ///</summary>
        public string Createuser{  get;set;}
        #endregion

        #region 创建者名字
        ///<summary>
        ///ColumnName:创建者名字;Size:50;
        ///</summary>
        public string Createusername{  get;set;}
        #endregion

        #region CREATE_DATE
        ///<summary>
        ///ColumnName:CREATE_DATE;
        ///</summary>
        public DateTime? Createdate{  get;set;}
        #endregion

        #region MODIFY_USER
        ///<summary>
        ///ColumnName:MODIFY_USER;Size:50;
        ///</summary>
        public string Modifyuser{  get;set;}
        #endregion

        #region MODIFY_DATE
        ///<summary>
        ///ColumnName:MODIFY_DATE;
        ///</summary>
        public DateTime? Modifydate{  get;set;}
        #endregion

        #region S_MONEY_ID
        ///<summary>
        ///ColumnName:S_MONEY_ID;
        ///</summary>
        public TimeSpan Smoneyid{  get;set;}
        #endregion

        #region S_USER_MONEY_INT
        ///<summary>
        ///ColumnName:S_USER_MONEY_INT;
        ///</summary>
        public int Susermoneyint{  get;set;}
        #endregion

    }


}
