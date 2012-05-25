/********************************************************************
* File Name:Menuitem
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
    ///MENUITEM
    /// <summary>
    [Serializable]
    public partial class Menuitem
    {
        #region ���
        ///<summary>
        ///ColumnName:���;Size:40;NOT NULL
        ///</summary>
        public string Menuid{  get;set;}
        #endregion

        #region �˵���
        ///<summary>
        ///ColumnName:�˵���;Size:100;
        ///</summary>
        public string Menuname{  get;set;}
        #endregion

        #region ���˵����
        ///<summary>
        ///ColumnName:���˵����;Size:40;
        ///</summary>
        public string Parentmenuid{  get;set;}
        #endregion

        #region ���ӵ�ַ
        ///<summary>
        ///ColumnName:���ӵ�ַ;Size:100;
        ///</summary>
        public string Menuaddress{  get;set;}
        #endregion

        #region ����
        ///<summary>
        ///ColumnName:����;
        ///</summary>
        public decimal Orderby{  get;set;}
        #endregion

        #region ����Id
        ///<summary>
        ///ColumnName:����Id;Size:50;
        ///</summary>
        public string Functionid{  get;set;}
        #endregion

    }


}
