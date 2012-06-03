/********************************************************************
* File Name:Roleinfo
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
    ///<summary>
    ///ROLEINFO
    ///</summary>
    [Serializable]
    public partial class Roleinfo
    {
        #region 角色ID
        ///<summary>
        ///ColumnName:角色ID;Size:40;NOT NULL
        ///</summary>
        public string Roleid{  get;set;}
        #endregion

        #region 角色名
        ///<summary>
        ///ColumnName:角色名;Size:40;
        ///</summary>
        public string Rolename{  get;set;}
        #endregion

        #region 角色状态
        ///<summary>
        ///ColumnName:角色状态;
        ///</summary>
        public RoleState Rolestate { get; set; }
        #endregion

        #region 角色描述
        ///<summary>
        ///ColumnName:角色描述;Size:400;
        ///</summary>
        public string Description { get; set; }
        #endregion
    }
}
