/********************************************************************
* File Name:Hcontract
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
    ///合同信息表
    ///</summary>
    [Serializable]
    public partial class Hcontract
    {
        #region 主键
        ///<summary>
        ///主键,INSTANCEID;NOT NULL
        ///</summary>
        public long Instanceid{  get;set;}
        #endregion

        #region SZDW
        ///<summary>
        ///,SZDW;Size:500;
        ///</summary>
        public string Szdw{  get;set;}
        #endregion

        #region HTBH
        ///<summary>
        ///,HTBH;Size:500;
        ///</summary>
        public string Htbh{  get;set;}
        #endregion

        #region XMMC
        ///<summary>
        ///合同名字
        ///</summary>
        public string Xmmc{  get;set;}
        #endregion

        #region FJDW
        ///<summary>
        ///,FJDW;Size:500;
        ///</summary>
        public string Fjdw{  get;set;}
        #endregion

        #region GCXZ
        ///<summary>
        ///,GCXZ;Size:500;
        ///</summary>
        public string Gcxz{  get;set;}
        #endregion

        #region HTZT
        ///<summary>
        ///,HTZT;Size:500;
        ///</summary>
        public string Htzt{  get;set;}
        #endregion

        #region SZND
        ///<summary>
        ///,SZND;Size:50;
        ///</summary>
        public string Sznd{  get;set;}
        #endregion

        #region HTGQ
        ///<summary>
        ///,HTGQ;Size:500;
        ///</summary>
        public string Htgq{  get;set;}
        #endregion

        #region 供应商，直接存的名称
        ///<summary>
        ///供应商，直接存的名称,CBF;Size:500;
        ///</summary>
        public string Cbf{  get;set;}
        #endregion

        #region CBFW
        ///<summary>
        ///,CBFW;Size:500;
        ///</summary>
        public string Cbfw{  get;set;}
        #endregion

        #region CBFS
        ///<summary>
        ///,CBFS;Size:500;
        ///</summary>
        public string Cbfs{  get;set;}
        #endregion

        #region ZLBZ
        ///<summary>
        ///,ZLBZ;Size:500;
        ///</summary>
        public string Zlbz{  get;set;}
        #endregion

        #region HTJK
        ///<summary>
        ///,HTJK;Size:500;
        ///</summary>
        public string Htjk{  get;set;}
        #endregion

        #region QFBZ
        ///<summary>
        ///,QFBZ;Size:500;
        ///</summary>
        public string Qfbz{  get;set;}
        #endregion

        #region ZFFS
        ///<summary>
        ///,ZFFS;Size:500;
        ///</summary>
        public string Zffs{  get;set;}
        #endregion

        #region JFTL
        ///<summary>
        ///,JFTL;Size:500;
        ///</summary>
        public string Jftl{  get;set;}
        #endregion

        #region GCBXQ
        ///<summary>
        ///,GCBXQ;Size:500;
        ///</summary>
        public string Gcbxq{  get;set;}
        #endregion

        #region GCBXJ
        ///<summary>
        ///,GCBXJ;Size:500;
        ///</summary>
        public string Gcbxj{  get;set;}
        #endregion

        #region GZTK
        ///<summary>
        ///,GZTK;Size:500;
        ///</summary>
        public string Gztk{  get;set;}
        #endregion

        #region QTYD
        ///<summary>
        ///,QTYD;Size:500;
        ///</summary>
        public string Qtyd{  get;set;}
        #endregion

        #region CBDB
        ///<summary>
        ///,CBDB;Size:500;
        ///</summary>
        public string Cbdb{  get;set;}
        #endregion

        #region JGLFW
        ///<summary>
        ///,JGLFW;Size:500;
        ///</summary>
        public string Jglfw{  get;set;}
        #endregion

        #region 分公司ID
        ///<summary>
        ///分公司ID,DEPARTID;
        ///</summary>
        public long Departid{  get;set;}
        public string Subcompanyname { get; set; }
        #endregion

        #region FAINSTANCEID
        ///<summary>
        ///,FAINSTANCEID;
        ///</summary>
        public long Fainstanceid{  get;set;}
        #endregion

        #region FLOWID
        ///<summary>
        ///,FLOWID;
        ///</summary>
        public long Flowid{  get;set;}
        #endregion

        #region DBSL
        ///<summary>
        ///,DBSL;Size:500;
        ///</summary>
        public string Dbsl{  get;set;}
        #endregion

        #region HTLB
        ///<summary>
        ///,HTLB;
        ///</summary>
        public long Htlb{  get;set;}
        #endregion

        #region ZBHT
        ///<summary>
        ///,ZBHT;Size:500;
        ///</summary>
        public string Zbht{  get;set;}
        #endregion

        #region FIRSTNO
        ///<summary>
        ///,FIRSTNO;
        ///</summary>
        public long Firstno{  get;set;}
        #endregion

        #region SECONDNO
        ///<summary>
        ///,SECONDNO;
        ///</summary>
        public long Secondno{  get;set;}
        #endregion

        #region BDSL
        ///<summary>
        ///,BDSL;Size:500;
        ///</summary>
        public string Bdsl{  get;set;}
        #endregion

        #region BCSM
        ///<summary>
        ///,BCSM;Size:500;
        ///</summary>
        public string Bcsm{  get;set;}
        #endregion

        #region CBS
        ///<summary>
        ///,CBS;Size:500;
        ///</summary>
        public string Cbs{  get;set;}
        #endregion

        #region JSZJ
        ///<summary>
        ///,JSZJ;Size:500;
        ///</summary>
        public string Jszj{  get;set;}
        #endregion

        #region LYDB
        ///<summary>
        ///,LYDB;Size:500;
        ///</summary>
        public string Lydb{  get;set;}
        #endregion

        #region FBS_INSTANCEID
        ///<summary>
        ///,FBS_INSTANCEID;Size:100;
        ///</summary>
        public string Fbsinstanceid{  get;set;}
        #endregion

        #region FINISHED_MONEY
        ///<summary>
        ///,FINISHED_MONEY;
        ///</summary>
        public int Finishedmoney{  get;set;}
        #endregion

        #region QCSJ
        ///<summary>
        ///,QCSJ;
        ///</summary>
        public DateTime? Qcsj{  get;set;}
        #endregion

        #region QDSJ
        ///<summary>
        ///,QDSJ;Size:100;
        ///</summary>
        public string Qdsj{  get;set;}
        #endregion

        #region HTFL
        ///<summary>
        ///,HTFL;Size:64;
        ///</summary>
        public string Htfl{  get;set;}
        #endregion

        #region JCXYRQ
        ///<summary>
        ///,JCXYRQ;
        ///</summary>
        public DateTime? Jcxyrq{  get;set;}
        #endregion

        #region FBJCRQ
        ///<summary>
        ///,FBJCRQ;
        ///</summary>
        public DateTime? Fbjcrq{  get;set;}
        #endregion

        #region JCXYBH
        ///<summary>
        ///,JCXYBH;Size:500;
        ///</summary>
        public string Jcxybh{  get;set;}
        #endregion

        #region BEIZHU
        ///<summary>
        ///,BEIZHU;Size:500;
        ///</summary>
        public string Beizhu{  get;set;}
        #endregion

        #region 现在的合同完成日期
        ///<summary>
        ///现在的合同完成日期,HTWCRQ;
        ///</summary>
        public DateTime? Htwcrq{  get;set;}
        #endregion

        #region JSSJRQ
        ///<summary>
        ///,JSSJRQ;
        ///</summary>
        public DateTime? Jssjrq{  get;set;}
        #endregion

        #region DZWCRQ
        ///<summary>
        ///,DZWCRQ;
        ///</summary>
        public DateTime? Dzwcrq{  get;set;}
        #endregion

        #region DZJ
        ///<summary>
        ///,DZJ;Size:500;
        ///</summary>
        public string Dzj{  get;set;}
        #endregion

        #region JSWCRQ
        ///<summary>
        ///,JSWCRQ;
        ///</summary>
        public DateTime? Jswcrq{  get;set;}
        #endregion

        #region JSJ
        ///<summary>
        ///,JSJ;Size:500;
        ///</summary>
        public string Jsj{  get;set;}
        #endregion

        #region DYSJSR
        ///<summary>
        ///,DYSJSR;Size:500;
        ///</summary>
        public string Dysjsr{  get;set;}
        #endregion

        #region QTYDTMP
        ///<summary>
        ///,QTYDTMP;Size:500;
        ///</summary>
        public string Qtydtmp{  get;set;}
        #endregion

        #region ISSAVED
        ///<summary>
        ///,ISSAVED;Size:50;
        ///</summary>
        public string Issaved{  get;set;}
        #endregion

        #region ZHTID
        ///<summary>
        ///,ZHTID;
        ///</summary>
        public long Zhtid{  get;set;}
        #endregion

        #region ISIMPORT
        ///<summary>
        ///是否已导入到固定设备表
        ///</summary>
        public bool Isimport{  get;set;}
        #endregion
    }
}
