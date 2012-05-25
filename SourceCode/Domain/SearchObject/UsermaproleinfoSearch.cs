/********************************************************************
* File Name:Usermaproleinfo
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
    ///USERMAPROLEINFO
    /// </summary>
    [Serializable]
    public partial class UsermaproleinfoSearch
    {
        #region �û�ID
        public string Userid
        {
            get;set; 
        }
        #endregion

        #region ��ɫID
        public string Roleid
        {
            get;set; 
        }
        #endregion

        #region ����޸�ʱ��
        public DateTime? StartLastmodifieddate
        {
            get;set; 
        }
        public DateTime? EndLastmodifieddate
        {
            get;set; 
        }
        #endregion

        #region ����޸���
        public string Lastmodifiedby
        {
            get;set; 
        }
        #endregion

    }
}
