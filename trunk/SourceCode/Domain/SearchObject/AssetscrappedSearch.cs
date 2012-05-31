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
        #region 编号
        public string Assetscrappedid
        {
            get;set; 
        }
        #endregion

        #region 报废日期
        public DateTime? StartScrappeddate
        {
            get;set; 
        }
        public DateTime? EndScrappeddate
        {
            get;set; 
        }
        #endregion

        #region 报废人
        public string Scrappeduser
        {
            get;set; 
        }
        #endregion

        #region 设备编号
        public string Assetno
        {
            get;set; 
        }
        #endregion

        #region 审核人
        public string Approveuser
        {
            get;set; 
        }
        #endregion

        #region 审核日期
        public DateTime? StartApprovedate
        {
            get;set; 
        }
        public DateTime? EndApprovedate
        {
            get;set; 
        }
        #endregion

        #region 拒绝理由
        public string Rejectreason
        {
            get;set; 
        }
        #endregion

        #region 创建人
        public string Creator
        {
            get;set; 
        }
        #endregion

        #region 审核状态
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
