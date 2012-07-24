/********************************************************************
* File Name:AssetsetupinfoManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-05-25
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
    public interface IAssetsetupinfoService
    {
        List<Assetsetupinfo> RetrieveAssetsetupinfosPaging(AssetsetupinfoSearch info,int pageIndex, int pageSize,out int count);
        Assetsetupinfo CreateAssetsetupinfo(Assetsetupinfo info);
        Assetsetupinfo UpdateAssetsetupinfoBySetupid(Assetsetupinfo info);
        Assetsetupinfo RetrieveAssetsetupinfoBySetupid(string setupid);
        void DeleteAssetsetupinfoBySetupid(string setupid);

        /// <summary>
        /// 安装台账
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        List<AssetRunTimeReport> RetrieveAssetRunTimeReport(AssetRunTimeSearch info);
        /// <summary>
        /// 弹出页面
        /// </summary>
        /// <param name="info"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        List<AssetReportDetailInfo> RetrieveAssetReportDetailInfoPaging(AssetRunTimeSearch info, int pageIndex,
                                                                        int pageSize, out int count);
    }
}
