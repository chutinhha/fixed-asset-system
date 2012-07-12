/********************************************************************
* File Name:Hcontractdetail
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.Huang - 2012-07-04
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
    ///��ͬ��ϸ
    ///</summary>
    [Serializable]
    public partial class Hcontractdetail
    {
        #region ����
        ///<summary>
        ///����,INSTANCEID;NOT NULL
        ///</summary>
        public long Instanceid{  get;set;}
        #endregion

        #region ��ͬ����ID
        ///<summary>
        ///��ͬ����ID,FAINSTANCEID;
        ///</summary>
        public long? Fainstanceid{  get;set;}
        #endregion

        #region �豸����
        ///<summary>
        ///�豸����,DETAILNAME;Size:100;
        ///</summary>
        public string Detailname{  get;set;}
        #endregion

        #region �豸�ͺ�
        ///<summary>
        ///�豸�ͺ�,MODAL;Size:100;
        ///</summary>
        public string Modal{  get;set;}
        #endregion

        #region �豸��𣬶�Ӧideal_oa.h_listitem���ItemID
        ///<summary>
        ///�豸��𣬶�Ӧideal_oa.h_listitem���ItemID,TYPE;
        ///</summary>
        public long Type{  get;set;}
        #endregion

        #region ����
        ///<summary>
        ///����,SL;
        ///</summary>
        public decimal Sl{  get;set;}
        #endregion

        #region ����
        ///<summary>
        ///����,DJ;
        ///</summary>
        public decimal Dj{  get;set;}
        #endregion

        #region �豸Ʒ��
        ///<summary>
        ///�豸Ʒ��,PP;Size:100;
        ///</summary>
        public string Pp{  get;set;}
        #endregion 
    }
}
