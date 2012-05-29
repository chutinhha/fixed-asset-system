/********************************************************************
* File Name:Assetmaintain
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
    ///ASSETMAINTAIN
    /// <summary>
    [Serializable]
    public partial class Assetmaintain
    {
        #region �豸ά��ID
        ///<summary>
        ///ColumnName:�豸ά��ID;Size:40;NOT NULL
        ///</summary>
        public string Assetmaintainid{  get;set;}
        #endregion

        #region ������Դ��(��Ŀ�塢�Լ졢�¼�)
        ///<summary>
        ///ColumnName:������Դ��(��Ŀ�塢�Լ졢�¼�);NOT NULL
        ///</summary>
        public decimal Maintaintype{  get;set;}
        #endregion

        #region ����ά������
        ///<summary>
        ///ColumnName:����ά������;
        ///</summary>
        public DateTime? Applydate{  get;set;}
        #endregion

        #region ������
        ///<summary>
        ///ColumnName:������;Size:40;
        ///</summary>
        public string Applyuserid{  get;set;}
        #endregion

        #region ��������
        ///<summary>
        ///ColumnName:��������;Size:4000;
        ///</summary>
        public string Applycontent{  get;set;}
        #endregion

        #region �ֹ�˾
        ///<summary>
        ///ColumnName:�ֹ�˾;Size:100;
        ///</summary>
        public string Subcompany{  get;set;}
        #endregion

        #region �ֹ�˾��ϵ��
        ///<summary>
        ///ColumnName:�ֹ�˾��ϵ��;Size:40;
        ///</summary>
        public string Subcompanycontactorid{  get;set;}
        #endregion

        #region ������
        ///<summary>
        ///ColumnName:������;Size:40;
        ///</summary>
        public string Creator{  get;set;}
        #endregion

        #region ��������
        ///<summary>
        ///ColumnName:��������;
        ///</summary>
        public DateTime? Createddate{  get;set;}
        #endregion

        #region ��Ŀ����ϵ��
        ///<summary>
        ///ColumnName:��Ŀ����ϵ��;Size:40;
        ///</summary>
        public string Projectcontactorid{  get;set;}
        #endregion

        #region ��Ŀ����ϵ�绰
        ///<summary>
        ///ColumnName:��Ŀ����ϵ�绰;Size:40;
        ///</summary>
        public string Projectcontactorphone{  get;set;}
        #endregion

        #region �ƻ�ά������
        ///<summary>
        ///ColumnName:�ƻ�ά������;
        ///</summary>
        public DateTime? Planmaintaindate{  get;set;}
        #endregion

        #region ʵ��ά������
        ///<summary>
        ///ColumnName:ʵ��ά������;
        ///</summary>
        public DateTime? Actualmaintaindate{  get;set;}
        #endregion

        #region �ܾ�����
        ///<summary>
        ///ColumnName:�ܾ�����;Size:1000;
        ///</summary>
        public string Rejectreason{  get;set;}
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

        #region ��˽��(ͬ��,�ܾ�)
        ///<summary>
        ///ColumnName:��˽��(ͬ��,�ܾ�);
        ///</summary>
        public decimal Approveresult{  get;set;}
        #endregion

        #region (ϵͳ)�豸����
        ///<summary>
        ///ColumnName:(ϵͳ)�豸����;Size:40;
        ///</summary>
        public string Assetcategoryid{  get;set;}
        #endregion

        #region ��ά����ϸ
        ///<summary>
        ///ColumnName:��ά����ϸ;Size:1000;
        ///</summary>
        public string Maintaincontent{  get;set;}
        #endregion

        #region ȷ������
        ///<summary>
        ///ColumnName:ȷ������;
        ///</summary>
        public DateTime? Confirmdate{  get;set;}
        #endregion

        #region ȷ����
        ///<summary>
        ///ColumnName:ȷ����;Size:40;
        ///</summary>
        public string Confirmuser{  get;set;}
        #endregion

    }


}