/********************************************************************
* File Name:Procurementschedulehead
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-23
* Modify Explain:
* Description:DataBase Entity Class
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;

namespace FixedAsset.Domain
{
    /// <summary>
    ///PROCUREMENTSCHEDULEHEAD
    /// </summary>
    [Serializable]
    public partial class ProcurementscheduleheadSearch
    {
        #region ����
        public string Psid
        {
            get;set; 
        }
        #endregion

        #region �ƻ��ɹ�����
        public DateTime? StartProcurementscheduledate
        {
            get;set; 
        }
        public DateTime? EndProcurementscheduledate
        {
            get;set; 
        }
        #endregion

        #region ����
        public string Reason
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

        #region ������
        public string Applyuser
        {
            get;set; 
        }
        #endregion

        #region ��������
        public DateTime? StartApplydate
        {
            get;set; 
        }
        public DateTime? EndApplydate
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

        #region ��˽��
        private readonly List<ApproveResult> _approveResults = new List<ApproveResult>();
        public List<ApproveResult> ApproveResults
        {
            get
            {
                return _approveResults;
            }
        }
        #endregion
    }
}
