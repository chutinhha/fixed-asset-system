/********************************************************************
* File Name:Coderule
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-05-26
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
    ///CODERULE
    /// <summary>
    [Serializable]
    public partial class Coderule
    {
        #region ����ǰ׺
        ///<summary>
        ///ColumnName:����ǰ׺;Size:20;NOT NULL
        ///</summary>
        public string Codeprefix{  get;set;}
        #endregion

        #region ��������
        ///<summary>
        ///ColumnName:��������;Size:40;
        ///</summary>
        public string Rulename{  get;set;}
        #endregion

        #region �Ƿ���Ҫ����ǰ׺
        ///<summary>
        ///ColumnName:�Ƿ���Ҫ����ǰ׺;
        ///</summary>
        public bool Isneedcodeprefix{  get;set;}
        #endregion

        #region �Ƿ�Ĭ�Ϲ���
        ///<summary>
        ///ColumnName:�Ƿ�Ĭ�Ϲ���;
        ///</summary>
        public bool Isdefault { get; set; }
        #endregion

        #region ��ʼ���
        ///<summary>
        ///ColumnName:��ʼ���;
        ///</summary>
        public decimal Startnumber{  get;set;}
        #endregion

        #region ���λ��
        ///<summary>
        ///ColumnName:���λ��;
        ///</summary>
        public decimal Numberwidth{  get;set;}
        #endregion

        #region YEARWIDTH
        ///<summary>
        ///ColumnName:YEARWIDTH;
        ///</summary>
        public decimal Yearwidth{  get;set;}
        #endregion

        #region CURRENTNO
        ///<summary>
        ///ColumnName:CURRENTNO;
        ///</summary>
        public decimal Currentno{  get;set;}
        #endregion

        #region CURRENTSERIALNUMBER
        ///<summary>
        ///ColumnName:CURRENTSERIALNUMBER;Size:50;
        ///</summary>
        public string Currentserialnumber{  get;set;}
        #endregion 
    }
}
