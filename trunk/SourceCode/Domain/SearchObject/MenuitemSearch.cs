/********************************************************************
* File Name:Menuitem
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
    ///�˵���
    ///</summary>
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

        #region ���ܱ��
        public string Functionid
        {
            get;set; 
        }
        #endregion

        #region ��ť��ţ��Զ��ŷָ
        public string Buttonid
        {
            get;set; 
        }
        #endregion

    }
}
