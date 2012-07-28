/********************************************************************
* File Name:Assetrunplan
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-07-28
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
    ///用工计划表
    ///</summary>
    [Serializable]
    public partial class Assetrunplan
    {
        #region 计划编号（时间段+分公司或项目体+分类ID等字符串的哈希值）
        ///<summary>
        ///计划编号（时间段+分公司或项目体+分类ID等字符串的哈希值）,PLANID;NOT NULL
        ///</summary>
        public int Planid{  get;set;}
        #endregion

        #region 设备父类别
        ///<summary>
        ///设备父类别,ASSETPARENTCATEGORYID;Size:40;
        ///</summary>
        public string Assetparentcategoryid{  get;set;}
        #endregion

        #region 设备子类别
        ///<summary>
        ///设备子类别,ASSETCATEGORYID;Size:40;
        ///</summary>
        public string Assetcategoryid{  get;set;}
        #endregion

        #region 分公司、项目体标识
        ///<summary>
        ///分公司、项目体标识,STORAGEFLAG;Size:80;
        ///</summary>
        public string Storageflag{  get;set;}
        #endregion

        #region 分公司、项目体ID
        ///<summary>
        ///分公司、项目体ID,STORAGE;Size:80;
        ///</summary>
        public string Storage{  get;set;}
        #endregion

        #region 时间段（如：周计划，20120723-20120729）
        ///<summary>
        ///时间段（如：周计划，20120723-20120729）,PLANDATECYCLE;Size:40;
        ///</summary>
        public string Plandatecycle{  get;set;}
        #endregion

        #region 创建时间
        ///<summary>
        ///创建时间,CREATEDDATE;
        ///</summary>
        public DateTime? Createddate{  get;set;}
        #endregion

    }
}
