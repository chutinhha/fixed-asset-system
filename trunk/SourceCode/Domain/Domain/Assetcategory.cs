/********************************************************************
* File Name:Assetcategory
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-05-25
* Modify Explain:
* Description:Entity Class(DTO)
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;

namespace FixedAsset.Domain
{
    ///<summary>
    ///�ʲ�����
    ///</summary>
    [Serializable]
    public partial class Assetcategory
    {
        public const string FixedAssetCategory = "22";
        #region ������(�����+�Ա��)
        ///<summary>
        ///������(�����+�Ա��)
        ///</summary>
        public string Assetcategoryid { get; set; }
        #endregion

        #region �����
        ///<summary>
        ///�����
        ///</summary>
        public string Assetparentcategoryid { get; set; }
        #endregion

        #region ������
        ///<summary>
        ///������
        ///</summary>
        public string Assetcategoryname { get; set; }
        #endregion

        #region ����ֵ�����������豸��ţ�
        ///<summary>
        ///����ֵ(�����ֵ+С����ֵ)
        ///</summary>
        public string Categoryvalue { get; set; }
        #endregion

        #region ������Ӧ��ϵͳ
        ///<summary>
        ///������Ӧ��ϵͳ
        ///</summary>
        public string System { get; set; }
        #endregion

        public string CategoryAllPathName { get; set; }
    }
}
