/********************************************************************
* File Name:Assetscrapped
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-31
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
    ///ASSET_SCRAPPED
    ///</summary>
    [Serializable]
    public partial class AssetscrappedSearch
    {
        #region ���
        public string Assetscrappedid
        {
            get;set; 
        }
        #endregion

        #region ��������
        public DateTime? StartScrappeddate
        {
            get;set; 
        }
        public DateTime? EndScrappeddate
        {
            get;set; 
        }
        #endregion

        #region ������
        public string Scrappeduser
        {
            get;set; 
        }
        #endregion

        #region �豸���
        public string Assetno
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

        #region ������
        public string Creator
        {
            get;set; 
        }
        #endregion

        #region ���״̬
        private List<decimal> _Approvedstates = new List<decimal>();
        public List<decimal> Approvedstates
        {
            get
            {
                return _Approvedstates;
            }
        }
        #endregion
    }
}
