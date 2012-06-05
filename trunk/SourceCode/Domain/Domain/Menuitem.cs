/********************************************************************
* File Name:Menuitem
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-06-05
* Modify Explain:
* Description:Entity Class(DTO)
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
    public partial class Menuitem
    {
        public const string DefaultParentCode = @"000";

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

        #region ���ܱ��
        ///<summary>
        ///ColumnName:���ܱ��;Size:50;
        ///</summary>
        public string Functionid{  get;set;}
        #endregion

        #region ��ť��ţ��Զ��ŷָ
        ///<summary>
        ///ColumnName:��ť��ţ��Զ��ŷָ;Size:200;
        ///</summary>
        public string Buttonid{  get;set;}
        #endregion

        #region Ȩ�ޱ���(�Զ��ŵķ�ʽ�ָ�)
        public string Roleid { get; set; }
        ///<summary>
        ///ColumnName:Ȩ�ޱ���(�Զ��ŵķ�ʽ�ָ�);Size:400;
        ///</summary>
        public string Rightcode { get; set; }
        #endregion
    }
}
