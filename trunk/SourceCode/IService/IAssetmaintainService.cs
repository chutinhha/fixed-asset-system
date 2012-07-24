/********************************************************************
* File Name:AssetmaintainManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-06-04
* Create Explain:
* Description:Service Layer Class
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;
using FixedAsset.Domain;
namespace FixedAsset.IServices
{
    public interface IAssetmaintainService
    {
        List<Assetmaintain> RetrieveAssetmaintainsPaging(AssetmaintainSearch info,int pageIndex, int pageSize,out int count);
        Assetmaintain CreateAssetmaintain(Assetmaintain info);
        Assetmaintain UpdateAssetmaintainByAssetmaintainid(Assetmaintain info);
        Assetmaintain RetrieveAssetmaintainByAssetmaintainid(string assetmaintainid);
        List<Assetmaintain> RetrieveAssetmaintainByAssetmaintainid(List<string> assetmaintainid);
        void DeleteAssetmaintainByAssetmaintainid(string assetmaintainid);

        /// <summary>
        /// Î¬ÐÞÌ¨ÕË
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        List<AssetRunTimeReport> RetrieveAssetRunTimeReport(AssetRunTimeSearch info);
        /// <summary>
        /// µ¯³öÒ³Ãæ
        /// </summary>
        /// <param name="info"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        List<AssetReportDetailInfo> RetrieveAssetReportDetailInfoPaging(AssetRunTimeSearch info, int pageIndex,int pageSize, out int count);
    }
}
