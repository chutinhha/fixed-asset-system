/********************************************************************
* File Name:Hcontractdetail
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-07-04
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
    ///合同明细
    ///</summary>
    [Serializable]
    public partial class Hcontractdetail
    {
        #region 主键
        ///<summary>
        ///主键,INSTANCEID;NOT NULL
        ///</summary>
        public long Instanceid{  get;set;}
        #endregion

        #region 合同主表ID
        ///<summary>
        ///合同主表ID,FAINSTANCEID;
        ///</summary>
        public long? Fainstanceid{  get;set;}
        #endregion

        #region 设备名称
        ///<summary>
        ///设备名称,DETAILNAME;Size:100;
        ///</summary>
        public string Detailname{  get;set;}
        #endregion

        #region 设备型号
        ///<summary>
        ///设备型号,MODAL;Size:100;
        ///</summary>
        public string Modal{  get;set;}
        #endregion

        #region 设备类别，对应ideal_oa.h_listitem表的ItemID
        ///<summary>
        ///设备类别，对应ideal_oa.h_listitem表的ItemID,TYPE;
        ///</summary>
        public long Type{  get;set;}
        #endregion

        #region 数量
        ///<summary>
        ///数量,SL;
        ///</summary>
        public decimal Sl{  get;set;}
        #endregion

        #region 单价
        ///<summary>
        ///单价,DJ;
        ///</summary>
        public decimal Dj{  get;set;}
        #endregion

        #region 设备品牌
        ///<summary>
        ///设备品牌,PP;Size:100;
        ///</summary>
        public string Pp{  get;set;}
        #endregion 
    }
}
