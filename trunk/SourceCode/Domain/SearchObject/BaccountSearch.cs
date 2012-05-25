/********************************************************************
* File Name:Baccount
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-25
* Modify Explain:
* Description:DataBase Entity Class
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;

namespace FixedAsset.Domain
{
    /// <summary>
    ///BACCOUNT
    /// </summary>
    [Serializable]
    public partial class BaccountSearch
    {
        #region 设备编号
        public string Assetno
        {
            get;set; 
        }
        #endregion

        #region 设备名称（冗余字段）
        public string Assetname
        {
            get;set; 
        }
        #endregion

        #region 入账日期
        public DateTime? StartAccounteddate
        {
            get;set; 
        }
        public DateTime? EndAccounteddate
        {
            get;set; 
        }
        #endregion

        #region 入账人
        public string Accounteduser
        {
            get;set; 
        }
        #endregion

        #region 操作人
        public string Createduser
        {
            get;set; 
        }
        #endregion

    }
}
