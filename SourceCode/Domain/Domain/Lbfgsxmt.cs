/********************************************************************
* File Name:Lbfgsxmt
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
    ///��Ŀ��
    /// </summary>
    [Serializable]
    public partial class Lbfgsxmt
    {
        #region ��Ŀ��ID
        ///<summary>
        ///ColumnName:��Ŀ��ID;NOT NULL
        ///</summary>
        public decimal Xmtid{  get;set;}
        #endregion

        #region ��Ŀ������
        ///<summary>
        ///ColumnName:��Ŀ������;Size:100;
        ///</summary>
        public string Xmt{  get;set;}
        #endregion

        #region �ֹ�˾ID
        ///<summary>
        ///ColumnName:�ֹ�˾ID;
        ///</summary>
        public decimal Fgsid{  get;set;}
        #endregion

        #region �ֹ�˾����
        ///<summary>
        ///ColumnName:�ֹ�˾����;Size:100;
        ///</summary>
        public string Fgs{  get;set;}
        #endregion

        #region XMTLX
        ///<summary>
        ///ColumnName:XMTLX;Size:50;
        ///</summary>
        public string Xmtlx{  get;set;}
        #endregion

        #region WLLGLY
        ///<summary>
        ///ColumnName:WLLGLY;Size:100;
        ///</summary>
        public string Wllgly{  get;set;}
        #endregion

        #region WLLGLYLXDH
        ///<summary>
        ///ColumnName:WLLGLYLXDH;Size:50;
        ///</summary>
        public string Wllglylxdh{  get;set;}
        #endregion

        #region KGRQ
        ///<summary>
        ///ColumnName:KGRQ;
        ///</summary>
        public DateTime? Kgrq{  get;set;}
        #endregion

        #region JGRQ
        ///<summary>
        ///ColumnName:JGRQ;
        ///</summary>
        public DateTime? Jgrq{  get;set;}
        #endregion

        #region JZMJ
        ///<summary>
        ///ColumnName:JZMJ;
        ///</summary>
        public decimal Jzmj{  get;set;}
        #endregion

        #region ZHAOJIA
        ///<summary>
        ///ColumnName:ZHAOJIA;
        ///</summary>
        public decimal Zhaojia{  get;set;}
        #endregion

        #region MGGRS
        ///<summary>
        ///ColumnName:MGGRS;
        ///</summary>
        public decimal Mggrs{  get;set;}
        #endregion

        #region GJGGRS
        ///<summary>
        ///ColumnName:GJGGRS;
        ///</summary>
        public decimal Gjggrs{  get;set;}
        #endregion

        #region TGGRS
        ///<summary>
        ///ColumnName:TGGRS;
        ///</summary>
        public decimal Tggrs{  get;set;}
        #endregion

        #region NFGGRS
        ///<summary>
        ///ColumnName:NFGGRS;
        ///</summary>
        public decimal Nfggrs{  get;set;}
        #endregion

        #region JZGGRS
        ///<summary>
        ///ColumnName:JZGGRS;
        ///</summary>
        public decimal Jzggrs{  get;set;}
        #endregion

        #region QTGGRS
        ///<summary>
        ///ColumnName:QTGGRS;
        ///</summary>
        public decimal Qtggrs{  get;set;}
        #endregion

        #region INSTANCEID
        ///<summary>
        ///ColumnName:INSTANCEID;
        ///</summary>
        public decimal Instanceid{  get;set;}
        #endregion

        #region FAINSTANCEID
        ///<summary>
        ///ColumnName:FAINSTANCEID;
        ///</summary>
        public decimal Fainstanceid{  get;set;}
        #endregion

        #region STATUS
        ///<summary>
        ///ColumnName:STATUS;
        ///</summary>
        public decimal Status{  get;set;}
        #endregion

        #region CREATETIME
        ///<summary>
        ///ColumnName:CREATETIME;
        ///</summary>
        public DateTime? Createtime{  get;set;}
        #endregion

        #region ISDELETE
        ///<summary>
        ///ColumnName:ISDELETE;
        ///</summary>
        public decimal Isdelete{  get;set;}
        #endregion

        #region FLOWID
        ///<summary>
        ///ColumnName:FLOWID;
        ///</summary>
        public decimal Flowid{  get;set;}
        #endregion

        #region DEPARTID
        ///<summary>
        ///ColumnName:DEPARTID;
        ///</summary>
        public decimal Departid{  get;set;}
        #endregion

        #region ORGANIZEID
        ///<summary>
        ///ColumnName:ORGANIZEID;
        ///</summary>
        public decimal Organizeid{  get;set;}
        #endregion

        #region DIYU
        ///<summary>
        ///ColumnName:DIYU;Size:12;
        ///</summary>
        public string Diyu{  get;set;}
        #endregion

        #region XMLX
        ///<summary>
        ///ColumnName:XMLX;Size:12;
        ///</summary>
        public string Xmlx{  get;set;}
        #endregion

        #region �Ƿ�ʹ��(0:δ��/1:����),ֻ��Ҫ���õ�
        ///<summary>
        ///ColumnName:�Ƿ�ʹ��(0:δ��/1:����),ֻ��Ҫ���õ�;
        ///</summary>
        public decimal Isuse{  get;set;}
        #endregion

    }


}
