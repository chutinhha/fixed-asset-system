/********************************************************************
* File Name:Roleinfo
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
    ///ROLEINFO
    /// </summary>
    [Serializable]
    public partial class RoleinfoSearch
    {
        #region ½ÇÉ«ID
        public string Roleid
        {
            get;set; 
        }
        #endregion

        #region ½ÇÉ«Ãû
        public string Rolename
        {
            get;set; 
        }
        #endregion

    }
}
