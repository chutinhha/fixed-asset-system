/********************************************************************
* File Name:Assetcategory
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-25
* Modify Explain:
* Description:DataBase Entity Class
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;

namespace FixedAsset.Domain
{
    /// <summary>
    ///ASSETCATEGORY
    /// </summary>
    [Serializable]
    public partial class AssetcategorySearch
    {
        #region ASSETCATEGORYID
        public string Assetcategoryid
        {
            get;set; 
        }
        #endregion

        #region ASSETPARENTCATEGORYID
        public string Assetparentcategoryid
        {
            get;set; 
        }
        #endregion

        #region ASSETCATEGORYNAME
        public string Assetcategoryname
        {
            get;set; 
        }
        #endregion

        #region REMARK
        public string Remark
        {
            get;set; 
        }
        #endregion

        #region CREATOR
        public string Creator
        {
            get;set; 
        }
        #endregion

    }
}
