/********************************************************************
* File Name:Assetconfig
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-05-31
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
    ///ASSET_CONFIG
    ///</summary>
    [Serializable]
    public partial class Assetconfig
    {
        #region ����Id
        ///<summary>
        ///ColumnName:����Id;Size:40;NOT NULL
        ///</summary>
        public string Configid{  get;set;}
        #endregion

        #region �����������
        ///<summary>
        ///ColumnName:�����������;Size:40;
        ///</summary>
        public string Categoryid{  get;set;}
        #endregion

        #region �������������
        ///<summary>
        ///ColumnName:�������������;Size:40;
        ///</summary>
        public string Categoryname{  get;set;}
        #endregion

        #region ��������
        ///<summary>
        ///ColumnName:��������;Size:40;
        ///</summary>
        public string Configname{  get;set;}
        #endregion

        #region ������ֵ
        ///<summary>
        ///ColumnName:������ֵ;Size:40;
        ///</summary>
        public string Configvalue{  get;set;}
        #endregion

        #region ����ʱ��
        ///<summary>
        ///ColumnName:����ʱ��;
        ///</summary>
        public DateTime? Createddate{  get;set;}
        #endregion

        #region ������
        ///<summary>
        ///ColumnName:������;Size:80;
        ///</summary>
        public string Creator{  get;set;}
        #endregion
    } 
}
