/********************************************************************
* File Name:AssetremoveManagement
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
    public interface IAssetremoveService
    {
        List<Assetremove> RetrieveAssetremovesPaging(AssetremoveSearch info,int pageIndex, int pageSize,out int count);
        Assetremove CreateAssetremove(Assetremove info);
        Assetremove UpdateAssetremoveByAssetremoveid(Assetremove info);
        Assetremove RetrieveAssetremoveByAssetremoveid(string assetremoveid);
        List<Assetremove> RetrieveAssetremoveByAssetremoveid(List<string> assetremoveid);
        void DeleteAssetremoveByAssetremoveid(string assetremoveid);

        /// <summary>
        /// Î¬ÐÞÌ¨ÕË
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        List<AssetRunTimeReport> RetrieveAssetRemoveReport(AssetRunTimeSearch info);
        /// <summary>
        /// µ¯³öÒ³Ãæ
        /// </summary>
        /// <param name="info"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        List<AssetReportDetailInfo> RetrieveAssetReportDetailInfoPaging(AssetRunTimeSearch info, int pageIndex, int pageSize, out int count);
    }
}
