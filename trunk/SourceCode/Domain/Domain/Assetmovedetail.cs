/********************************************************************
* File Name:Assetmovedetail
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
    ///ASSETMOVEDETAIL
    /// <summary>
    [Serializable]
    public partial class Assetmovedetail
    {
        #region 明细Id
        ///<summary>
        ///ColumnName:明细Id;Size:40;NOT NULL
        ///</summary>
        public string Detailid{  get;set;}
        #endregion

        #region 移机单号
        ///<summary>
        ///ColumnName:移机单号;Size:40;NOT NULL
        ///</summary>
        public string Assetmoveid{  get;set;}
        #endregion

        #region 设备编号
        ///<summary>
        ///ColumnName:设备编号;Size:20;NOT NULL
        ///</summary>
        public string Assetno{  get;set;}
        #endregion

        #region 计划移机日期
        ///<summary>
        ///ColumnName:计划移机日期;
        ///</summary>
        public DateTime? Planmovedate{  get;set;}
        #endregion

        #region 实际移机日期
        ///<summary>
        ///ColumnName:实际移机日期;
        ///</summary>
        public DateTime? Actualmovedate{  get;set;}
        #endregion

        #region 移机说明
        ///<summary>
        ///ColumnName:移机说明;Size:1000;
        ///</summary>
        public string Movedcontent{  get;set;}
        #endregion

    }


}
