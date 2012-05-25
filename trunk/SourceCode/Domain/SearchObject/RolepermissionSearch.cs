/********************************************************************
* File Name:Rolepermission
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
    ///ROLEPERMISSION
    /// </summary>
    [Serializable]
    public partial class RolepermissionSearch
    {
        #region ��ɫ���
        public string Roleid
        {
            get;set; 
        }
        #endregion

        #region �˵����
        public string Menuid
        {
            get;set; 
        }
        #endregion

        #region ��ע
        public string Remark
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
