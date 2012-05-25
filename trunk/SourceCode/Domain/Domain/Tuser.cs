/********************************************************************
* File Name:Tuser
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
    /// <summary>
    ///T_USER
    /// <summary>
    [Serializable]
    public partial class Tuser
    {
        #region ÓÃ»§ID
        ///<summary>
        ///ColumnName:ÓÃ»§ID;Size:50;NOT NULL
        ///</summary>
        public string Id{  get;set;}
        #endregion

        #region USERCODE
        ///<summary>
        ///ColumnName:USERCODE;Size:50;
        ///</summary>
        public string Usercode{  get;set;}
        #endregion

        #region ÓÃ»§ÐÕÃû
        ///<summary>
        ///ColumnName:ÓÃ»§ÐÕÃû;Size:100;
        ///</summary>
        public string Username{  get;set;}
        #endregion

        #region µÇÂ¼ÕËºÅ
        ///<summary>
        ///ColumnName:µÇÂ¼ÕËºÅ;Size:100;
        ///</summary>
        public string Loginid{  get;set;}
        #endregion

        #region µÇÂ¼ÃÜÂë
        ///<summary>
        ///ColumnName:µÇÂ¼ÃÜÂë;Size:100;
        ///</summary>
        public string Userpassword{  get;set;}
        #endregion

        #region ISLOCK
        ///<summary>
        ///ColumnName:ISLOCK;Size:10;
        ///</summary>
        public string Islock{  get;set;}
        #endregion

        #region ADMINFLAG
        ///<summary>
        ///ColumnName:ADMINFLAG;Size:50;
        ///</summary>
        public string Adminflag{  get;set;}
        #endregion

        #region NOTE
        ///<summary>
        ///ColumnName:NOTE;Size:100;
        ///</summary>
        public string Note{  get;set;}
        #endregion

        #region EMAIL
        ///<summary>
        ///ColumnName:EMAIL;Size:100;
        ///</summary>
        public string Email{  get;set;}
        #endregion

        #region EXT1
        ///<summary>
        ///ColumnName:EXT1;Size:100;
        ///</summary>
        public string Ext1{  get;set;}
        #endregion

        #region OAID
        ///<summary>
        ///ColumnName:OAID;
        ///</summary>
        public decimal Oaid{  get;set;}
        #endregion

    }


}
