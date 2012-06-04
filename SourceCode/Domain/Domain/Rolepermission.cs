/********************************************************************
* File Name:Rolepermission
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
    ///角色权限表
    ///</summary>
    [Serializable]
    public partial class Rolepermission
    {
        #region 角色编号
        ///<summary>
        ///ColumnName:角色编号;Size:40;NOT NULL
        ///</summary>
        public string Roleid{  get;set;}
        #endregion

        #region 菜单编号
        ///<summary>
        ///ColumnName:菜单编号;Size:40;NOT NULL
        ///</summary>
        public string Menuid{  get;set;}
        #endregion

        #region 备注
        ///<summary>
        ///ColumnName:备注;Size:800;
        ///</summary>
        public string Remark{  get;set;}
        #endregion

        #region 最近修改时间
        ///<summary>
        ///ColumnName:最近修改时间;
        ///</summary>
        public DateTime? Lastmodifieddate{  get;set;}
        #endregion

        #region 最近修改者
        ///<summary>
        ///ColumnName:最近修改者;Size:40;
        ///</summary>
        public string Lastmodifiedby{  get;set;}
        #endregion

        #region 权限编码(以逗号的方式分割)
        ///<summary>
        ///ColumnName:权限编码(以逗号的方式分割);Size:400;
        ///</summary>
        public string Rightcode{  get;set;}
        #endregion

    } 
}
