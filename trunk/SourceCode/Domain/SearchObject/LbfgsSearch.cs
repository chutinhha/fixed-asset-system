/********************************************************************
* File Name:Lbfgs
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
    ///LB_FGS
    /// </summary>
    [Serializable]
    public partial class LbfgsSearch
    {
        #region 分公司名称
        public string Fgs
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

        #region FGLD
        public string Fgld
        {
            get;set; 
        }
        #endregion

        #region FGLDLXDH
        public string Fgldlxdh
        {
            get;set; 
        }
        #endregion

        #region WLLZGY
        public string Wllzgy
        {
            get;set; 
        }
        #endregion

        #region WLLZGYLXDH
        public string Wllzgylxdh
        {
            get;set; 
        }
        #endregion

    }
}
