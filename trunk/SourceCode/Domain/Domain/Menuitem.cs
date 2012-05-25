/********************************************************************
* File Name:Menuitem
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
    ///MENUITEM
    /// <summary>
    [Serializable]
    public partial class Menuitem
    {
        #region 编号
        ///<summary>
        ///ColumnName:编号;Size:40;NOT NULL
        ///</summary>
        public string Menuid{  get;set;}
        #endregion

        #region 菜单名
        ///<summary>
        ///ColumnName:菜单名;Size:100;
        ///</summary>
        public string Menuname{  get;set;}
        #endregion

        #region 父菜单编号
        ///<summary>
        ///ColumnName:父菜单编号;Size:40;
        ///</summary>
        public string Parentmenuid{  get;set;}
        #endregion

        #region 链接地址
        ///<summary>
        ///ColumnName:链接地址;Size:100;
        ///</summary>
        public string Menuaddress{  get;set;}
        #endregion

        #region 排序
        ///<summary>
        ///ColumnName:排序;
        ///</summary>
        public decimal Orderby{  get;set;}
        #endregion

        #region 功能Id
        ///<summary>
        ///ColumnName:功能Id;Size:50;
        ///</summary>
        public string Functionid{  get;set;}
        #endregion

    }


}
