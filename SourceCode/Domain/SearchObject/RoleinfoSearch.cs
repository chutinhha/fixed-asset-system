/********************************************************************
* File Name:Roleinfo
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-06-03
* Modify Explain:
* Description:DataBase Entity Class
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;
using SeallNet.Utility;

namespace FixedAsset.Domain
{
    [EnumCatetory(EnumName = "角色状态")]
    public enum RoleState : int
    {
        [EnumDescript(Descript = "有效")]
        Normal = 0,
        [EnumDescript(Descript = "无效")]
        Deleted = 1,
    }

    ///<summary>
    ///ROLEINFO
    ///</summary>
    [Serializable]
    public partial class RoleinfoSearch
    {
        #region 角色ID
        public string Roleid
        {
            get;
            set;
        }
        #endregion

        #region 角色名
        public string Rolename
        {
            get;
            set;
        }
        #endregion

        #region 角色状态
        private List<RoleState> _Rolestates = new List<RoleState>();
        public List<RoleState> Rolestates
        {
            get
            {
                return _Rolestates;
            }
        }
        #endregion

        #region 角色描述
        public string Description
        {
            get;
            set;
        }
        #endregion 
    }
}
