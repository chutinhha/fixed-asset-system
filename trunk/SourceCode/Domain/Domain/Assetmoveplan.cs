/********************************************************************
* File Name:Assetmoveplan
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-08-03
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
    ///�ƻ��ƻ���
    ///</summary>
    [Serializable]
    public partial class Assetmoveplan
    {
        #region �ƻ����
        ///<summary>
        ///�ƻ����,PLANID;NOT NULL
        ///</summary>
        public int Planid{  get;set;}
        #endregion

        #region �豸�����
        ///<summary>
        ///�豸�����,ASSETPARENTCATEGORYID;Size:40;
        ///</summary>
        public string Assetparentcategoryid{  get;set;}
        #endregion

        #region �豸�����
        ///<summary>
        ///�豸�����,ASSETCATEGORYID;Size:40;
        ///</summary>
        public string Assetcategoryid{  get;set;}
        #endregion

        #region �ֹ�˾����Ŀ���ʶ
        ///<summary>
        ///�ֹ�˾����Ŀ���ʶ,STORAGEFLAG;Size:80;
        ///</summary>
        public string Storageflag{  get;set;}
        #endregion

        #region �ֹ�˾����Ŀ��ID
        ///<summary>
        ///�ֹ�˾����Ŀ��ID,STORAGE;Size:80;
        ///</summary>
        public string Storage{  get;set;}
        #endregion

        #region ʱ��Σ��磺�ܼƻ���20120723-20120729��
        ///<summary>
        ///ʱ��Σ��磺�ܼƻ���20120723-20120729��,PLANDATECYCLE;Size:40;
        ///</summary>
        public string Plandatecycle{  get;set;}
        #endregion

        #region ����ʱ��
        ///<summary>
        ///����ʱ��,CREATEDDATE;
        ///</summary>
        public DateTime? Createddate{  get;set;}
        #endregion

        #region ��ʼ����
        ///<summary>
        ///��ʼ����,STARTDATE;
        ///</summary>
        public DateTime? Startdate{  get;set;}
        #endregion

        #region ��������
        ///<summary>
        ///��������,ENDDATE;
        ///</summary>
        public DateTime? Enddate{  get;set;}
        #endregion

        #region �ƻ����
        ///<summary>
        ///�ƻ����,PLANCATEGORY;
        ///</summary>
        public int Plancategory{  get;set;}
        #endregion

        #region �ƻ��豸����
        ///<summary>
        ///�ƻ��豸����,ASSETCOUNT;
        ///</summary>
        public int Assetcount{  get;set;}
        #endregion

    }
}
