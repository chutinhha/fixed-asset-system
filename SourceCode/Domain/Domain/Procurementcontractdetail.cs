/********************************************************************
* File Name:Procurementcontractdetail
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
    ///<summary>
    ///采购合同明细
    ///</summary>
    [Serializable]
    public partial class Procurementcontractdetail
    {
        #region 明细Id
        ///<summary>
        ///ColumnName:明细Id;Size:50;NOT NULL
        ///</summary>
        public string Contractdetailid{  get;set;}
        #endregion

        #region 合同编号
        ///<summary>
        ///ColumnName:合同编号;Size:50;
        ///</summary>
        public string Contractid{  get;set;}
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

        #region 采购数量
        ///<summary>
        ///ColumnName:采购数量;
        ///</summary>
        public decimal Procurenumber{  get;set;}
        #endregion 

        #region 已验收登记数量
        ///<summary>
        ///ColumnName:已验收登记数量;
        ///</summary>
        public decimal Inputnumber { get; set; }
        #endregion

        public string CategoryAllPathName { get; set; }

    }

    [Serializable]
    public partial class ProcurementcontractdetailEx:Procurementcontractdetail
    {
    }
}
