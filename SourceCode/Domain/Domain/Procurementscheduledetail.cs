/********************************************************************
* File Name:Procurementscheduledetail
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
    ///PROCUREMENTSCHEDULEDETAIL
    /// <summary>
    [Serializable]
    public partial class Procurementscheduledetail
    {
        #region 明细Id
        ///<summary>
        ///ColumnName:明细Id;Size:50;NOT NULL
        ///</summary>
        public string Detailid{  get;set;}
        #endregion

        #region 设备类别
        ///<summary>
        ///ColumnName:设备类别;Size:50;
        ///</summary>
        public string Assetcategoryid{  get;set;}
        #endregion

        #region 设备名称
        ///<summary>
        ///ColumnName:设备名称;Size:200;
        ///</summary>
        public string Assetname{  get;set;}
        #endregion

        #region 设备规格
        ///<summary>
        ///ColumnName:设备规格;Size:200;
        ///</summary>
        public string Assetspecification{  get;set;}
        #endregion

        #region 单价
        ///<summary>
        ///ColumnName:单价;
        ///</summary>
        public decimal Unitprice{  get;set;}
        #endregion

        #region 计划采购数量
        ///<summary>
        ///ColumnName:计划采购数量;
        ///</summary>
        public decimal Plannumber{  get;set;}
        #endregion

        #region 计划采购单Id
        ///<summary>
        ///ColumnName:计划采购单Id;Size:50;
        ///</summary>
        public string Psid{  get;set;}
        #endregion

        public string CategoryAllPathName { get; set; }
    }

    [Serializable]
    public partial class ProcurementscheduledetailEx:Procurementscheduledetail
    {
    }

}
