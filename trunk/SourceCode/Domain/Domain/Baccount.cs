/********************************************************************
* File Name:Baccount
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
    /// <summary>
    ///BACCOUNT
    /// </summary>
    [Serializable]
    public partial class Baccount:Asset
    {
        //#region �豸���
        /////<summary>
        /////ColumnName:�豸���;Size:20;NOT NULL
        /////</summary>
        //public string Assetno{  get;set;}
        //#endregion

        //#region �豸���ƣ������ֶΣ�
        /////<summary>
        /////ColumnName:�豸���ƣ������ֶΣ�;Size:200;
        /////</summary>
        //public string Assetname{  get;set;}
        //#endregion

        #region ��������
        ///<summary>
        ///ColumnName:��������;
        ///</summary>
        public DateTime? Accounteddate{  get;set;}
        #endregion

        #region ������
        ///<summary>
        ///ColumnName:������;Size:40;
        ///</summary>
        public string Accounteduser{  get;set;}
        #endregion

        #region ����ʱ��
        ///<summary>
        ///ColumnName:����ʱ��;
        ///</summary>
        public DateTime? Createddate{  get;set;}
        #endregion

        #region ������
        ///<summary>
        ///ColumnName:������;Size:40;
        ///</summary>
        public string Createduser{  get;set;}
        #endregion 
    }
}
