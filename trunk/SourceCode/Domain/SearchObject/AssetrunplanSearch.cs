/********************************************************************
* File Name:Assetrunplan
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-07-28
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
    ///用工计划表
    ///</summary>
    [Serializable]
    public partial class AssetrunplanSearch
    {
        #region 设备父类别
        public string Assetparentcategoryid
        {
            get;
            set;
        }
        #endregion

        #region 设备子类别
        public string Assetcategoryid
        {
            get;
            set;
        }
        #endregion

        #region 分公司、项目体标识ID
        private List<string> projectIds = new List<string>();
        public List<string> ProjectIds { get { return projectIds; } }
        #endregion

        #region 分公司、项目体标识
        public string Storageflag
        {
            get;
            set;
        }
        #endregion

        #region 分公司、项目体ID
        public string Storage
        {
            get;
            set;
        }
        #endregion

        #region 时间段（如：周计划，20120723-20120729）
        public string Plandatecycle
        {
            get;
            set;
        }
        #endregion

    }
}
