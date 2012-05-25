/********************************************************************
* File Name:Lbfgsxmt
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
    ///LB_FGS_XMT
    /// </summary>
    [Serializable]
    public partial class LbfgsxmtSearch
    {
        #region 项目体名称
        public string Xmt
        {
            get;set; 
        }
        #endregion

        #region 分公司名称
        public string Fgs
        {
            get;set; 
        }
        #endregion

        #region XMTLX
        public string Xmtlx
        {
            get;set; 
        }
        #endregion

        #region WLLGLY
        public string Wllgly
        {
            get;set; 
        }
        #endregion

        #region WLLGLYLXDH
        public string Wllglylxdh
        {
            get;set; 
        }
        #endregion

        #region KGRQ
        public DateTime? StartKgrq
        {
            get;set; 
        }
        public DateTime? EndKgrq
        {
            get;set; 
        }
        #endregion

        #region JGRQ
        public DateTime? StartJgrq
        {
            get;set; 
        }
        public DateTime? EndJgrq
        {
            get;set; 
        }
        #endregion

        #region DIYU
        public string Diyu
        {
            get;set; 
        }
        #endregion

        #region XMLX
        public string Xmlx
        {
            get;set; 
        }
        #endregion

    }
}
