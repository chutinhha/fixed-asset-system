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

        #region 允许编辑
        ///<summary>
        ///ColumnName:允许编辑;
        ///</summary>
        public bool Allowedit { get; set; }
        #endregion

        #region 创建时间
        ///<summary>
        ///ColumnName:创建时间;
        ///</summary>
        public DateTime? Createddate { get; set; }
        #endregion

        #region 创建者
        ///<summary>
        ///ColumnName:创建者;Size:40;
        ///</summary>
        public string Creator { get; set; }
        #endregion

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
    }
}
