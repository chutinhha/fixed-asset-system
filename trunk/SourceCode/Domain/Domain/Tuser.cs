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
        #region 用户ID
        ///<summary>
        ///ColumnName:用户ID;Size:50;NOT NULL
        ///</summary>
        public string Id{  get;set;}
        #endregion

        #region USERCODE
        ///<summary>
        ///ColumnName:USERCODE;Size:50;
        ///</summary>
        public string Usercode{  get;set;}
        #endregion

        #region 用户姓名
        ///<summary>
        ///ColumnName:用户姓名;Size:100;
        ///</summary>
        public string Username{  get;set;}
        #endregion

        #region 登录账号
        ///<summary>
        ///ColumnName:登录账号;Size:100;
        ///</summary>
        public string Loginid{  get;set;}
        #endregion

        #region 登录密码
        ///<summary>
        ///ColumnName:登录密码;Size:100;
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

        #region 角色名
        ///<summary>
        ///ColumnName:角色名;Size:40;
        ///</summary>
        public string Rolename { get; set; }

        #region 最近修改时间
        ///<summary>
        ///ColumnName:最近修改时间;
        ///</summary>
        public DateTime? Lastmodifieddate { get; set; }
        #endregion

        #region 最近修改者
        ///<summary>
        ///ColumnName:最近修改者;Size:40;
        ///</summary>
        public string Lastmodifiedby { get; set; }
        #endregion 

        #endregion
    } 
}
