/********************************************************************
* File Name:Assetsetupinfo
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-29
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
    ///ASSETSETUPINFO
    ///</summary>
    [Serializable]
    public partial class AssetsetupinfoSearch
    {
        #region ���뵥��
        public string Setupid
        {
            get;
            set;
        }
        #endregion

        #region ��������
        public DateTime? StartApplydate
        {
            get;
            set;
        }
        public DateTime? EndApplydate
        {
            get;
            set;
        }
        #endregion

        #region ������
        public string Applyuserid
        {
            get;
            set;
        }
        #endregion

        #region �ֹ�˾
        public string Subcompany
        {
            get;
            set;
        }
        #endregion

        #region �����
        public string Approveuser
        {
            get;
            set;
        }
        #endregion

        #region �������
        public DateTime? StartApprovedate
        {
            get;
            set;
        }
        public DateTime? EndApprovedate
        {
            get;
            set;
        }
        #endregion

        #region �ֹ�˾��ϵ��
        public string Subcompanycontactorid
        {
            get;
            set;
        }
        #endregion

        #region ������
        public string Creator
        {
            get;
            set;
        }
        #endregion

        #region (ϵͳ)�豸����
        public string Assetcategoryid
        {
            get;
            set;
        }
        #endregion

        #region �Ѱ�װ��ϸ
        public string Setupcontent
        {
            get;
            set;
        }
        #endregion

        #region ȷ������
        public DateTime? StartConfirmdate
        {
            get;
            set;
        }
        public DateTime? EndConfirmdate
        {
            get;
            set;
        }
        #endregion

        #region ȷ����
        public string Confirmuser
        {
            get;
            set;
        }
        #endregion

        #region �����ֶΣ��ֹ�˾����Ŀ��
        public string Storagetitle
        {
            get;
            set;
        }
        #endregion

        #region ��Ŀ��ID��ֹ�˾ID
        public string Storageid
        {
            get;
            set;
        }
        #endregion 

        #region ��װ״̬
        private readonly List<SetupState> _setupStates = new List<SetupState>();
        public List<SetupState> SetupStates
        {
            get
            {
                return _setupStates;
            }
        }
        #endregion
    }
}
