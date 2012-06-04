/********************************************************************
* File Name:Menuitem
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-06-05
* Modify Explain:
* Description:DataBase Entity Class
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
    public partial class MenuitemSearch
    {
        #region 编号
        public string Menuid
        {
            get;set; 
        }
        #endregion

        #region 菜单名
        public string Menuname
        {
            get;set; 
        }
        #endregion

        #region 父菜单编号
        public string Parentmenuid
        {
            get;set; 
        }
        #endregion

        #region 链接地址
        public string Menuaddress
        {
            get;set; 
        }
        #endregion

        #region 功能编号
        public string Functionid
        {
            get;set; 
        }
        #endregion

        #region 按钮编号（以逗号分割）
        public string Buttonid
        {
            get;set; 
        }
        #endregion

    }
}
