/********************************************************************
* File Name:Assetconfig
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-05-31
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
    ///ASSET_CONFIG
    ///</summary>
    [Serializable]
    public partial class Assetconfig
    {
        #region 主键Id
        ///<summary>
        ///ColumnName:主键Id;Size:40;NOT NULL
        ///</summary>
        public string Configid{  get;set;}
        #endregion

        #region 配置项分类编号
        ///<summary>
        ///ColumnName:配置项分类编号;Size:40;
        ///</summary>
        public string Categoryid{  get;set;}
        #endregion

        #region 配置项分类名称
        ///<summary>
        ///ColumnName:配置项分类名称;Size:40;
        ///</summary>
        public string Categoryname{  get;set;}
        #endregion

        #region 配置项名
        ///<summary>
        ///ColumnName:配置项名;Size:40;
        ///</summary>
        public string Configname{  get;set;}
        #endregion

        #region 配置项值
        ///<summary>
        ///ColumnName:配置项值;Size:40;
        ///</summary>
        public string Configvalue{  get;set;}
        #endregion

        #region 创建时间
        ///<summary>
        ///ColumnName:创建时间;
        ///</summary>
        public DateTime? Createddate{  get;set;}
        #endregion

        #region 创建人
        ///<summary>
        ///ColumnName:创建人;Size:80;
        ///</summary>
        public string Creator{  get;set;}
        #endregion
    } 
}
