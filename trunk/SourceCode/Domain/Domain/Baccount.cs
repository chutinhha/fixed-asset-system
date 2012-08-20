/********************************************************************
* File Name:Baccount
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
    ///BACCOUNT
    /// </summary>
    [Serializable]
    public partial class Baccount:Asset
    {
        //#region 设备编号
        /////<summary>
        /////ColumnName:设备编号;Size:20;NOT NULL
        /////</summary>
        //public string Assetno{  get;set;}
        //#endregion

        //#region 设备名称（冗余字段）
        /////<summary>
        /////ColumnName:设备名称（冗余字段）;Size:200;
        /////</summary>
        //public string Assetname{  get;set;}
        //#endregion

        #region 入账日期
        ///<summary>
        ///ColumnName:入账日期;
        ///</summary>
        public DateTime? Accounteddate{  get;set;}
        #endregion

        #region 入账人
        ///<summary>
        ///ColumnName:入账人;Size:40;
        ///</summary>
        public string Accounteduser{  get;set;}
        #endregion

        #region 操作时间
        ///<summary>
        ///ColumnName:操作时间;
        ///</summary>
        public DateTime? Createddate{  get;set;}
        #endregion

        #region 操作人
        ///<summary>
        ///ColumnName:操作人;Size:40;
        ///</summary>
        public string Createduser{  get;set;}
        #endregion 
    }
}
