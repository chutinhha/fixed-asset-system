/********************************************************************
* File Name:Assetcategory
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
    ///资产分类
    ///</summary>
    [Serializable]
    public partial class Assetcategory
    {
        public const string FixedAssetCategory = "22";
        #region 分类编号(父编号+自编号)
        ///<summary>
        ///分类编号(父编号+自编号)
        ///</summary>
        public string Assetcategoryid { get; set; }
        #endregion

        #region 父编号
        ///<summary>
        ///父编号
        ///</summary>
        public string Assetparentcategoryid { get; set; }
        #endregion

        #region 分类名
        ///<summary>
        ///分类名
        ///</summary>
        public string Assetcategoryname { get; set; }
        #endregion

        #region 分类值（用于生成设备编号）
        ///<summary>
        ///分类值(大分类值+小分类值)
        ///</summary>
        public string Categoryvalue { get; set; }
        #endregion

        #region 大分类对应的系统
        ///<summary>
        ///大分类对应的系统
        ///</summary>
        public string System { get; set; }
        #endregion

        public string CategoryAllPathName { get; set; }
    }
}
