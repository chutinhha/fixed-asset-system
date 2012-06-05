/********************************************************************
* File Name:Menuitem
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-06-05
* Modify Explain:
* Description:Entity Class(DTO)
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;

namespace FixedAsset.Domain
{
    ///<summary>
    ///菜单表
    ///</summary>
    [Serializable]
    public partial class Menuitem
    {
        public const string DefaultParentCode = @"000";

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

        #region 功能编号
        ///<summary>
        ///ColumnName:功能编号;Size:50;
        ///</summary>
        public string Functionid{  get;set;}
        #endregion

        #region 按钮编号（以逗号分割）
        ///<summary>
        ///ColumnName:按钮编号（以逗号分割）;Size:200;
        ///</summary>
        public string Buttonid{  get;set;}
        #endregion

        #region 权限编码(以逗号的方式分割)
        public string Roleid { get; set; }
        ///<summary>
        ///ColumnName:权限编码(以逗号的方式分割);Size:400;
        ///</summary>
        public string Rightcode { get; set; }
        #endregion
    }
}
