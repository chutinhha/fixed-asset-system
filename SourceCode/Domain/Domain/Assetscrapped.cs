/********************************************************************
* File Name:Assetscrapped
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
    ///������Ϣ��
    ///</summary>
    [Serializable]
    public partial class Assetscrapped
    {
        #region ���
        ///<summary>
        ///ColumnName:���;Size:40;NOT NULL
        ///</summary>
        public string Assetscrappedid{  get;set;}
        #endregion

        #region ��������
        ///<summary>
        ///ColumnName:��������;
        ///</summary>
        public DateTime? Scrappeddate{  get;set;}
        #endregion

        #region ������
        ///<summary>
        ///ColumnName:������;Size:80;
        ///</summary>
        public string Scrappeduser{  get;set;}
        #endregion

        #region �豸���
        ///<summary>
        ///ColumnName:�豸���;Size:20;NOT NULL
        ///</summary>
        public string Assetno{  get;set;}
        #endregion

        #region �����
        ///<summary>
        ///ColumnName:�����;Size:100;
        ///</summary>
        public string Approveuser{  get;set;}
        #endregion

        #region �������
        ///<summary>
        ///ColumnName:�������;
        ///</summary>
        public DateTime? Approvedate{  get;set;}
        #endregion

        #region �ܾ�����
        ///<summary>
        ///ColumnName:�ܾ�����;Size:1000;
        ///</summary>
        public string Rejectreason{  get;set;}
        #endregion

        #region ��������
        ///<summary>
        ///ColumnName:��������;
        ///</summary>
        public DateTime? Createddate{  get;set;}
        #endregion

        #region ������
        ///<summary>
        ///ColumnName:������;Size:100;
        ///</summary>
        public string Creator{  get;set;}
        #endregion

        #region ���״̬
        ///<summary>
        ///ColumnName:���״̬;
        ///</summary>
        public APPROVEDSTATE Approvedstate { get; set; }
        #endregion
    }
}
