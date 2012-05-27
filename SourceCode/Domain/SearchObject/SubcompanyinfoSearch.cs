/********************************************************************
* File Name:Subcompanyinfo
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-27
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
    ///SUBCOMPANYINFO
    /// </summary>
    [Serializable]
    public partial class SubcompanyinfoSearch
    {
        #region 分公司名称
        public string Subcompanyname
        {
            get;set; 
        }
        #endregion

        #region 分公司排序ID
        public string Fgssortid
        {
            get;set; 
        }
        #endregion

        #region 分公司编码(700,701,702)
        public string Subcompanycode
        {
            get;set; 
        }
        #endregion

    }
}
