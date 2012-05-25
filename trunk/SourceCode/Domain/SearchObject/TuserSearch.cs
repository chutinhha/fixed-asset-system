/********************************************************************
* File Name:Tuser
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
    ///T_USER
    /// </summary>
    [Serializable]
    public partial class TuserSearch
    {
        #region ÓÃ»§ID
        public string Id
        {
            get;set; 
        }
        #endregion

        #region USERCODE
        public string Usercode
        {
            get;set; 
        }
        #endregion

        #region ÓÃ»§ÐÕÃû
        public string Username
        {
            get;set; 
        }
        #endregion

        #region µÇÂ¼ÕËºÅ
        public string Loginid
        {
            get;set; 
        }
        #endregion

        #region µÇÂ¼ÃÜÂë
        public string Userpassword
        {
            get;set; 
        }
        #endregion

        #region ISLOCK
        public string Islock
        {
            get;set; 
        }
        #endregion

        #region ADMINFLAG
        public string Adminflag
        {
            get;set; 
        }
        #endregion

        #region NOTE
        public string Note
        {
            get;set; 
        }
        #endregion

        #region EMAIL
        public string Email
        {
            get;set; 
        }
        #endregion

        #region EXT1
        public string Ext1
        {
            get;set; 
        }
        #endregion

    }
}
