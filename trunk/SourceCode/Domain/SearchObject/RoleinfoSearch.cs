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
    [EnumCatetory(EnumName = "��ɫ״̬")]
    public enum RoleState : int
    {
        [EnumDescript(Descript = "��Ч")]
        Normal = 0,
        [EnumDescript(Descript = "��Ч")]
        Deleted = 1,
    }

    ///<summary>
    ///ROLEINFO
    ///</summary>
    [Serializable]
    public partial class RoleinfoSearch
    {
        #region ��ɫID
        public string Roleid
        {
            get;
            set;
        }
        #endregion

        #region ��ɫ��
        public string Rolename
        {
            get;
            set;
        }
        #endregion

        #region ��ɫ״̬
        private List<RoleState> _Rolestates = new List<RoleState>();
        public List<RoleState> Rolestates
        {
            get
            {
                return _Rolestates;
            }
        }
        #endregion

        #region ��ɫ����
        public string Description
        {
            get;
            set;
        }
        #endregion 
    }
}
