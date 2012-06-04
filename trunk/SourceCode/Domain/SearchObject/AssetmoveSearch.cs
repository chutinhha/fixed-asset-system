/********************************************************************
* File Name:Assetmove
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
    ///�ƻ���Ϣ
    ///</summary>
    [Serializable]
    public partial class AssetmoveSearch
    {
        #region �ƻ�����
        public string Assetmoveid
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

        #region �����ƻ�����
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

        #region �ܾ�����
        public string Rejectreason
        {
            get;set; 
        }
        #endregion

        #region �ƻ��ƻ�����
        public DateTime? StartPlanmovedate
        {
            get;set; 
        }
        public DateTime? EndPlanmovedate
        {
            get;set; 
        }
        #endregion

        #region ʵ���ƻ�����
        public DateTime? StartActualmovedate
        {
            get;set; 
        }
        public DateTime? EndActualmovedate
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

        #region ���ƻ���ϸ
        public string Movedcontent
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

        #region ��ϵ�˵绰
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
