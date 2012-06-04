/********************************************************************
* File Name:Rolepermission
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
    ///角色权限表
    ///</summary>
    [Serializable]
    public partial class RolepermissionSearch
    {
        #region 角色编号
        public string Roleid
        {
            get;set; 
        }
        #endregion

        #region 菜单编号
        public string Menuid
        {
            get;set; 
        }
        #endregion

        #region 备注
        public string Remark
        {
            get;set; 
        }
        #endregion

        #region 最近修改时间
        public DateTime? StartLastmodifieddate
        {
            get;set; 
        }
        public DateTime? EndLastmodifieddate
        {
            get;set; 
        }
        #endregion

        #region 最近修改者
        public string Lastmodifiedby
        {
            get;set; 
        }
        #endregion

        #region 权限编码(以逗号的方式分割)
        public string Rightcode
        {
            get;set; 
        }
        #endregion

    }
}
