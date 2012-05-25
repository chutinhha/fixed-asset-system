/********************************************************************
* File Name:Usermaproleinfo
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
    ///USERMAPROLEINFO
    /// <summary>
    [Serializable]
    public partial class Usermaproleinfo
    {
        #region 用户ID
        ///<summary>
        ///ColumnName:用户ID;Size:40;NOT NULL
        ///</summary>
        public string Userid{  get;set;}
        #endregion

        #region 角色ID
        ///<summary>
        ///ColumnName:角色ID;Size:40;NOT NULL
        ///</summary>
        public string Roleid{  get;set;}
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

    }


}
