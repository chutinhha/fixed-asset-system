/********************************************************************
* File Name:Assetsupplier
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
    ///ASSETSUPPLIER
    /// <summary>
    [Serializable]
    public partial class Assetsupplier
    {
        #region ��Ӧ�̱��
        ///<summary>
        ///ColumnName:��Ӧ�̱��;Size:80;NOT NULL
        ///</summary>
        public string Supplierid{  get;set;}
        #endregion

        #region ��Ӧ��
        ///<summary>
        ///ColumnName:��Ӧ��;Size:80;
        ///</summary>
        public string Suppliername{  get;set;}
        #endregion

        #region ��ע
        ///<summary>
        ///ColumnName:��ע;Size:2000;
        ///</summary>
        public string Remark{  get;set;}
        #endregion 

        #region ��Ӧϵͳ
        ///<summary>
        ///ColumnName:��Ӧϵͳ;Size:80;
        ///</summary>
        public string System { get; set; }
        #endregion

        #region ��Ӧ���ʲ�����ID
        ///<summary>
        ///ColumnName:��Ӧ���ʲ�����ID;Size:80;
        ///</summary>
        public string Assetcategoryid { get; set; }
        #endregion
    }
}
