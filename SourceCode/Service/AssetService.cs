/********************************************************************
* File Name:AssetManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-25
* Create Explain:
* Description:Service Layer Class
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using FixedAsset.Domain;
using FixedAsset.DataAccess;
using FixedAsset.IServices;
namespace FixedAsset.Services
{
    public partial class AssetService : BaseService, IAssetService
    {
        #region Management

        private AssetManagement m_Management;

        protected AssetManagement Management
        {
            get
            {
                if (this.m_Management == null)
                {
                    this.m_Management = new AssetManagement();
                }

                return m_Management;
            }
        }

        #endregion

        #region RetrieveAssetsPaging
        public List<Asset> RetrieveAssetsPagingForZongheSearch(AssetSearch info, int pageIndex, int pageSize, out int count)
        {
            return Management.RetrieveAssetsPagingForZongheSearch(info, pageIndex, pageSize, out count);
        }
        public List<Asset> RetrieveAssetsPaging(AssetSearch info, int pageIndex, int pageSize, out int count)
        {
            return Management.RetrieveAssetsPaging(info, pageIndex, pageSize, out count);
        }
        public List<AssetRegisterReport> RetrieveAssetRegisterReport(AssetRegisterSearch info)
        {
            return Management.RetrieveAssetRegisterReport(info);
        }
        public List<Asset> RetrieveAssetRegisterReportDetailInfoPaging(AssetRunTimeSearch info, int pageIndex, int pageSize, out int count)
        {
            return Management.RetrieveAssetRegisterReportDetailInfoPaging(info, pageIndex, pageSize, out count);
        }
        #endregion

        #region RetrieveAssetsUsed
        public List<Asset> RetrieveAssetsUsed(AssetSearch info, int pageIndex, int pageSize, out int count)
        {
            return Management.RetrieveAssetsUsed(info, pageIndex, pageSize, out count);
        }
        #endregion

        #region RetrieveAssetscrappedsRecord
        public List<Assetscrapped> RetrieveAssetscrappedsRecord(AssetSearch info, int pageIndex, int pageSize, out int count)
        {
            return Management.RetrieveAssetscrappedsRecord(info, pageIndex, pageSize, out count);
        }
        #endregion

        #region RetrieveAssetByAssetno
        public Asset RetrieveAssetByAssetno(string assetno)
        {
            return Management.RetrieveAssetByAssetno(assetno);
        }
        #endregion

        #region RetrieveAssetByAssetno
        public List<Asset> RetrieveAssetByAssetno(List<string> assetnos)
        {
            return Management.RetrieveAssetByAssetno(assetnos);
        }
        #endregion

        #region CreateAsset
        public Asset CreateAsset(Asset info)
        {
            try
            {
                Management.BeginTransaction();
                Management.CreateAsset(info);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
            return info;
        }
        #endregion

        #region UpdateAssetByAssetno
        public Asset UpdateAssetByAssetno(Asset info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateAssetByAssetno(info);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
            return info;
        }
        #endregion

        #region UpdateFinancecategoryByAssetno
        public Asset UpdateFinancecategoryByAssetno(Asset info)
        {
            try
            {
                Management.BeginTransaction();
                Management.UpdateFinancecategoryByAssetno(info);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
            return info;
        }
        #endregion

        #region DeleteAssetByAssetno
        public void DeleteAssetByAssetno(string assetno)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetByAssetno(assetno);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        #region DeleteAssetByAssetno
        public void DeleteAssetByAssetno(List<string> assetnos)
        {
            try
            {
                Management.BeginTransaction();
                Management.DeleteAssetByAssetno(assetnos);
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }
        #endregion

        public void SaveAssetInfo(Asset info)
        {
            bool isEdited = !string.IsNullOrEmpty(info.Assetno);
            if (string.IsNullOrEmpty(info.Assetno))
            {
                //固定字符（2位）+分公司/公司（3位）+设备大类（2位）+设备小类（2位）+序号（4位）
                var codePrefix = new StringBuilder();
                codePrefix.Append(Asset.RuleCode);
                //codePrefix.Append(info.Subcompany)
                //var codePrefix = new StringBuilder(Asset.RuleCode);
                ////codePrefix.Append(info.Subcompany);
                var subCompanyInfo = new SubcompanyinfoManagement().RetrieveSubcompanyinfoBySubcompanyid(decimal.Parse(info.Subcompany));
                if (subCompanyInfo != null)
                {
                    codePrefix.Append(string.IsNullOrEmpty(subCompanyInfo.Subcompanycode) ? "900" : subCompanyInfo.Subcompanycode);
                }
                else
                {
                    codePrefix.Append(900);
                }
                codePrefix.Append(info.Categoryvalue); //设备分类
                var priorInfo = Management.RetrieveTopAssetByAssetnoPrefix(codePrefix.ToString());
                if (priorInfo == null)
                {
                    info.Assetno = codePrefix.Append("0001").ToString();
                }
                else
                {
                    var currentNo = int.Parse(priorInfo.Assetno.Substring(codePrefix.Length));
                    var content = new StringBuilder();
                    content.Append(codePrefix.ToString());
                    if(currentNo==9999){throw new Exception("不能再插入该类别的资产!");}
                    currentNo = currentNo + 1;
                    for (int ii = 0; ii < 4 - currentNo.ToString().Length; ii++)
                    {
                        content.Append("0");
                    }
                    content.Append(currentNo);
                    info.Assetno = content.ToString();
                }
            }
            try
            {
                Management.BeginTransaction();
                if (isEdited)
                {
                    Management.UpdateAssetByAssetno(info);
                }
                else
                {
                    Management.CreateAsset(info);
                }
                Management.Commit();
            }
            catch
            {
                Management.Rollback();
                throw;
            }
        }

        public List<Vstorageaddress> RetrieveAllVstorageaddress()
        {
            var addressManagement = new VstorageaddressManagement(Management);
            return addressManagement.RetrieveAllVstorageaddress();
        }
        public Vstorageaddress RetrieveVstorageaddressByStorageId(string Storagetitle, string StorageId)
        {
            var addressManagement = new VstorageaddressManagement(Management);
            return addressManagement.RetrieveVstorageaddressByStorageId(Storagetitle, StorageId);
        }
        public List<Asset> RetrieveAllAsset()
        {
            return Management.RetrieveAllAsset();
        }
    }
}
