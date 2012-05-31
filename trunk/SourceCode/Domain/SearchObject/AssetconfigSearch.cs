/********************************************************************
* File Name:Assetconfig
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-31
* Modify Explain:
* Description:DataBase Entity Class
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
    public partial class AssetconfigSearch
    {
        #region 主键Id
        public string Configid
        {
            get;set; 
        }
        #endregion

        #region 配置项分类编号
        public string Categoryid
        {
            get;set; 
        }
        #endregion

        #region 配置项分类名称
        public string Categoryname
        {
            get;set; 
        }
        #endregion

        #region 配置项名
        public string Configname
        {
            get;set; 
        }
        #endregion

        #region 配置项值
        public string Configvalue
        {
            get;set; 
        }
        #endregion

        #region 创建人
        public string Creator
        {
            get;set; 
        }
        #endregion

    }
}
