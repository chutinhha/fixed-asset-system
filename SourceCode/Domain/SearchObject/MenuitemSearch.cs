/********************************************************************
* File Name:Menuitem
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
    ///MENUITEM
    /// </summary>
    [Serializable]
    public partial class MenuitemSearch
    {
        #region ���
        public string Menuid
        {
            get;set; 
        }
        #endregion

        #region �˵���
        public string Menuname
        {
            get;set; 
        }
        #endregion

        #region ���˵����
        public string Parentmenuid
        {
            get;set; 
        }
        #endregion

        #region ���ӵ�ַ
        public string Menuaddress
        {
            get;set; 
        }
        #endregion

        #region ����Id
        public string Functionid
        {
            get;set; 
        }
        #endregion

    }
}
