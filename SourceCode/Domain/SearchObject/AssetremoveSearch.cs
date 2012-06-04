/********************************************************************
* File Name:Assetremove
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-06-04
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
    ///�����Ϣ
    ///</summary>
    [Serializable]
    public partial class AssetremoveSearch
    {
        #region �������
        public string Assetremoveid
        {
            get;set; 
        }
        #endregion

        #region (ϵͳ)�豸����
        public string Assetcategoryid
        {
            get;set; 
        }
        #endregion

        #region ����������
        public DateTime? StartApplydate
        {
            get;set; 
        }
        public DateTime? EndApplydate
        {
            get;set; 
        }
        #endregion

        #region ������
        public string Applyuserid
        {
            get;set; 
        }
        #endregion

        #region ��������
        public string Applycontent
        {
            get;set; 
        }
        #endregion

        #region �����
        public string Approveuser
        {
            get;set; 
        }
        #endregion

        #region �������
        public DateTime? StartApprovedate
        {
            get;set; 
        }
        public DateTime? EndApprovedate
        {
            get;set; 
        }
        #endregion

        #region �ƻ��������
        public DateTime? StartPlanremovedate
        {
            get;set; 
        }
        public DateTime? EndPlanremovedate
        {
            get;set; 
        }
        #endregion

        #region ʵ�ʲ������
        public DateTime? StartActualremovedate
        {
            get;set; 
        }
        public DateTime? EndActualremovedate
        {
            get;set; 
        }
        #endregion

        #region �ܾ�����
        public string Rejectreason
        {
            get;set; 
        }
        #endregion

        #region ȷ������
        public DateTime? StartConfirmdate
        {
            get;set; 
        }
        public DateTime? EndConfirmdate
        {
            get;set; 
        }
        #endregion

        #region ȷ����
        public string Confirmuser
        {
            get;set; 
        }
        #endregion

        #region ��ά����ϸ
        public string Removedcontent
        {
            get;set; 
        }
        #endregion

        #region �����ֶΣ��ֹ�˾����Ŀ��
        public string Storagetitle
        {
            get;set; 
        }
        #endregion

        #region ��Ŀ��ID��ֹ�˾ID
        public string Storageid
        {
            get;set; 
        }
        #endregion

        #region �ֹ�˾
        public string Subcompany
        {
            get;set; 
        }
        #endregion

        #region �ֹ�˾��ϵ��
        public string Subcompanycontactorid
        {
            get;set; 
        }
        #endregion

        #region ��ϵ�绰
        public string Contactphone
        {
            get;set; 
        }
        #endregion

        #region ��Ŀ����ϵ��
        public string Projectcontactorid
        {
            get;set; 
        }
        #endregion

        #region ��Ŀ����ϵ�绰
        public string Projectcontactorphone
        {
            get;set; 
        }
        #endregion

        #region ������
        public string Creator
        {
            get;set; 
        }
        #endregion

    }
}
