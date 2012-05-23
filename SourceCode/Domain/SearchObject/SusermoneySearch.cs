/********************************************************************
* File Name:Susermoney
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-23
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
    ///S_USER_MONEY
    /// </summary>
    [Serializable]
    public partial class SusermoneySearch
    {
        #region 编号
        public string Id
        {
            get;set; 
        }
        #endregion

        #region 用户ID
        public string Userid
        {
            get;set; 
        }
        #endregion

        #region 创建者Id
        public string Createuser
        {
            get;set; 
        }
        #endregion

        #region 创建者名字
        public string Createusername
        {
            get;set; 
        }
        #endregion

        #region MODIFY_USER
        public string Modifyuser
        {
            get;set; 
        }
        #endregion

    }
}
