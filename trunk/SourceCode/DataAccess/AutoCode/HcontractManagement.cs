/********************************************************************
* File Name:HcontractManagement
* Copyright (C) 2012 Bruce.huang 
* Creater & Date:Bruce.huang - 2012-07-04
* Create Explain:
* Description:DataBase Access Class
* Modify Explain:
* Version:1.0.0
* ********************************************************************/
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using FixedAsset.Domain;

namespace FixedAsset.DataAccess
{
    public partial class HcontractManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 56;
        public HcontractManagement()
        { }
        public HcontractManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateHcontract
        public Hcontract CreateHcontract(Hcontract info)
        {
            try
            {

                this.Database.AddInParameter(":Instanceid", info.Instanceid);//DBType:NUMBER
                this.Database.AddInParameter(":Szdw", info.Szdw);//DBType:VARCHAR2
                this.Database.AddInParameter(":Htbh", info.Htbh);//DBType:VARCHAR2
                this.Database.AddInParameter(":Xmmc", info.Xmmc);//DBType:VARCHAR2
                this.Database.AddInParameter(":Fjdw", info.Fjdw);//DBType:VARCHAR2
                this.Database.AddInParameter(":Gcxz", info.Gcxz);//DBType:VARCHAR2
                this.Database.AddInParameter(":Htzt", info.Htzt);//DBType:VARCHAR2
                this.Database.AddInParameter(":Sznd", info.Sznd);//DBType:VARCHAR2
                this.Database.AddInParameter(":Htgq", info.Htgq);//DBType:VARCHAR2
                this.Database.AddInParameter(":Cbf", info.Cbf);//DBType:VARCHAR2
                this.Database.AddInParameter(":Cbfw", info.Cbfw);//DBType:VARCHAR2
                this.Database.AddInParameter(":Cbfs", info.Cbfs);//DBType:VARCHAR2
                this.Database.AddInParameter(":Zlbz", info.Zlbz);//DBType:VARCHAR2
                this.Database.AddInParameter(":Htjk", info.Htjk);//DBType:VARCHAR2
                this.Database.AddInParameter(":Qfbz", info.Qfbz);//DBType:VARCHAR2
                this.Database.AddInParameter(":Zffs", info.Zffs);//DBType:VARCHAR2
                this.Database.AddInParameter(":Jftl", info.Jftl);//DBType:VARCHAR2
                this.Database.AddInParameter(":Gcbxq", info.Gcbxq);//DBType:VARCHAR2
                this.Database.AddInParameter(":Gcbxj", info.Gcbxj);//DBType:VARCHAR2
                this.Database.AddInParameter(":Gztk", info.Gztk);//DBType:VARCHAR2
                this.Database.AddInParameter(":Qtyd", info.Qtyd);//DBType:VARCHAR2
                this.Database.AddInParameter(":Cbdb", info.Cbdb);//DBType:VARCHAR2
                this.Database.AddInParameter(":Jglfw", info.Jglfw);//DBType:VARCHAR2
                this.Database.AddInParameter(":Departid", info.Departid);//DBType:NUMBER
                this.Database.AddInParameter(":Fainstanceid", info.Fainstanceid);//DBType:NUMBER
                this.Database.AddInParameter(":Flowid", info.Flowid);//DBType:NUMBER
                this.Database.AddInParameter(":Dbsl", info.Dbsl);//DBType:VARCHAR2
                this.Database.AddInParameter(":Htlb", info.Htlb);//DBType:NUMBER
                this.Database.AddInParameter(":Zbht", info.Zbht);//DBType:VARCHAR2
                this.Database.AddInParameter(":Firstno", info.Firstno);//DBType:NUMBER
                this.Database.AddInParameter(":Secondno", info.Secondno);//DBType:NUMBER
                this.Database.AddInParameter(":Bdsl", info.Bdsl);//DBType:VARCHAR2
                this.Database.AddInParameter(":Bcsm", info.Bcsm);//DBType:VARCHAR2
                this.Database.AddInParameter(":Cbs", info.Cbs);//DBType:VARCHAR2
                this.Database.AddInParameter(":Jszj", info.Jszj);//DBType:VARCHAR2
                this.Database.AddInParameter(":Lydb", info.Lydb);//DBType:VARCHAR2
                this.Database.AddInParameter(":Fbsinstanceid", info.Fbsinstanceid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Finishedmoney", info.Finishedmoney);//DBType:NUMBER
                this.Database.AddInParameter(":Qcsj", info.Qcsj);//DBType:DATE
                this.Database.AddInParameter(":Qdsj", info.Qdsj);//DBType:VARCHAR2
                this.Database.AddInParameter(":Htfl", info.Htfl);//DBType:VARCHAR2
                this.Database.AddInParameter(":Jcxyrq", info.Jcxyrq);//DBType:DATE
                this.Database.AddInParameter(":Fbjcrq", info.Fbjcrq);//DBType:DATE
                this.Database.AddInParameter(":Jcxybh", info.Jcxybh);//DBType:VARCHAR2
                this.Database.AddInParameter(":Beizhu", info.Beizhu);//DBType:VARCHAR2
                this.Database.AddInParameter(":Htwcrq", info.Htwcrq);//DBType:DATE
                this.Database.AddInParameter(":Jssjrq", info.Jssjrq);//DBType:DATE
                this.Database.AddInParameter(":Dzwcrq", info.Dzwcrq);//DBType:DATE
                this.Database.AddInParameter(":Dzj", info.Dzj);//DBType:VARCHAR2
                this.Database.AddInParameter(":Jswcrq", info.Jswcrq);//DBType:DATE
                this.Database.AddInParameter(":Jsj", info.Jsj);//DBType:VARCHAR2
                this.Database.AddInParameter(":Dysjsr", info.Dysjsr);//DBType:VARCHAR2
                this.Database.AddInParameter(":Qtydtmp", info.Qtydtmp);//DBType:VARCHAR2
                this.Database.AddInParameter(":Issaved", info.Issaved);//DBType:VARCHAR2
                this.Database.AddInParameter(":Zhtid", info.Zhtid);//DBType:NUMBER
                this.Database.AddInParameter(":Isimport", info.Isimport);//DBType:NUMBER
                string sqlCommand = @"INSERT INTO ""H_CONTRACT"" (""INSTANCEID"",""SZDW"",""HTBH"",""XMMC"",""FJDW"",""GCXZ"",""HTZT"",""SZND"",""HTGQ"",""CBF"",""CBFW"",""CBFS"",""ZLBZ"",""HTJK"",""QFBZ"",""ZFFS"",""JFTL"",""GCBXQ"",""GCBXJ"",""GZTK"",""QTYD"",""CBDB"",""JGLFW"",""DEPARTID"",""FAINSTANCEID"",""FLOWID"",""DBSL"",""HTLB"",""ZBHT"",""FIRSTNO"",""SECONDNO"",""BDSL"",""BCSM"",""CBS"",""JSZJ"",""LYDB"",""FBS_INSTANCEID"",""FINISHED_MONEY"",""QCSJ"",""QDSJ"",""HTFL"",""JCXYRQ"",""FBJCRQ"",""JCXYBH"",""BEIZHU"",""HTWCRQ"",""JSSJRQ"",""DZWCRQ"",""DZJ"",""JSWCRQ"",""JSJ"",""DYSJSR"",""QTYDTMP"",""ISSAVED"",""ZHTID"",""ISIMPORT"") VALUES (:Instanceid,:Szdw,:Htbh,:Xmmc,:Fjdw,:Gcxz,:Htzt,:Sznd,:Htgq,:Cbf,:Cbfw,:Cbfs,:Zlbz,:Htjk,:Qfbz,:Zffs,:Jftl,:Gcbxq,:Gcbxj,:Gztk,:Qtyd,:Cbdb,:Jglfw,:Departid,:Fainstanceid,:Flowid,:Dbsl,:Htlb,:Zbht,:Firstno,:Secondno,:Bdsl,:Bcsm,:Cbs,:Jszj,:Lydb,:Fbsinstanceid,:Finishedmoney,:Qcsj,:Qdsj,:Htfl,:Jcxyrq,:Fbjcrq,:Jcxybh,:Beizhu,:Htwcrq,:Jssjrq,:Dzwcrq,:Dzj,:Jswcrq,:Jsj,:Dysjsr,:Qtydtmp,:Issaved,:Zhtid,:Isimport)";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateHcontractByInstanceid
        public Hcontract UpdateHcontractByInstanceid(Hcontract info)
        {
            try
            {
                this.Database.AddInParameter(":Instanceid", info.Instanceid);//DBType:NUMBER
                this.Database.AddInParameter(":Szdw", info.Szdw);//DBType:VARCHAR2
                this.Database.AddInParameter(":Htbh", info.Htbh);//DBType:VARCHAR2
                this.Database.AddInParameter(":Xmmc", info.Xmmc);//DBType:VARCHAR2
                this.Database.AddInParameter(":Fjdw", info.Fjdw);//DBType:VARCHAR2
                this.Database.AddInParameter(":Gcxz", info.Gcxz);//DBType:VARCHAR2
                this.Database.AddInParameter(":Htzt", info.Htzt);//DBType:VARCHAR2
                this.Database.AddInParameter(":Sznd", info.Sznd);//DBType:VARCHAR2
                this.Database.AddInParameter(":Htgq", info.Htgq);//DBType:VARCHAR2
                this.Database.AddInParameter(":Cbf", info.Cbf);//DBType:VARCHAR2
                this.Database.AddInParameter(":Cbfw", info.Cbfw);//DBType:VARCHAR2
                this.Database.AddInParameter(":Cbfs", info.Cbfs);//DBType:VARCHAR2
                this.Database.AddInParameter(":Zlbz", info.Zlbz);//DBType:VARCHAR2
                this.Database.AddInParameter(":Htjk", info.Htjk);//DBType:VARCHAR2
                this.Database.AddInParameter(":Qfbz", info.Qfbz);//DBType:VARCHAR2
                this.Database.AddInParameter(":Zffs", info.Zffs);//DBType:VARCHAR2
                this.Database.AddInParameter(":Jftl", info.Jftl);//DBType:VARCHAR2
                this.Database.AddInParameter(":Gcbxq", info.Gcbxq);//DBType:VARCHAR2
                this.Database.AddInParameter(":Gcbxj", info.Gcbxj);//DBType:VARCHAR2
                this.Database.AddInParameter(":Gztk", info.Gztk);//DBType:VARCHAR2
                this.Database.AddInParameter(":Qtyd", info.Qtyd);//DBType:VARCHAR2
                this.Database.AddInParameter(":Cbdb", info.Cbdb);//DBType:VARCHAR2
                this.Database.AddInParameter(":Jglfw", info.Jglfw);//DBType:VARCHAR2
                this.Database.AddInParameter(":Departid", info.Departid);//DBType:NUMBER
                this.Database.AddInParameter(":Fainstanceid", info.Fainstanceid);//DBType:NUMBER
                this.Database.AddInParameter(":Flowid", info.Flowid);//DBType:NUMBER
                this.Database.AddInParameter(":Dbsl", info.Dbsl);//DBType:VARCHAR2
                this.Database.AddInParameter(":Htlb", info.Htlb);//DBType:NUMBER
                this.Database.AddInParameter(":Zbht", info.Zbht);//DBType:VARCHAR2
                this.Database.AddInParameter(":Firstno", info.Firstno);//DBType:NUMBER
                this.Database.AddInParameter(":Secondno", info.Secondno);//DBType:NUMBER
                this.Database.AddInParameter(":Bdsl", info.Bdsl);//DBType:VARCHAR2
                this.Database.AddInParameter(":Bcsm", info.Bcsm);//DBType:VARCHAR2
                this.Database.AddInParameter(":Cbs", info.Cbs);//DBType:VARCHAR2
                this.Database.AddInParameter(":Jszj", info.Jszj);//DBType:VARCHAR2
                this.Database.AddInParameter(":Lydb", info.Lydb);//DBType:VARCHAR2
                this.Database.AddInParameter(":Fbsinstanceid", info.Fbsinstanceid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Finishedmoney", info.Finishedmoney);//DBType:NUMBER
                this.Database.AddInParameter(":Qcsj", info.Qcsj);//DBType:DATE
                this.Database.AddInParameter(":Qdsj", info.Qdsj);//DBType:VARCHAR2
                this.Database.AddInParameter(":Htfl", info.Htfl);//DBType:VARCHAR2
                this.Database.AddInParameter(":Jcxyrq", info.Jcxyrq);//DBType:DATE
                this.Database.AddInParameter(":Fbjcrq", info.Fbjcrq);//DBType:DATE
                this.Database.AddInParameter(":Jcxybh", info.Jcxybh);//DBType:VARCHAR2
                this.Database.AddInParameter(":Beizhu", info.Beizhu);//DBType:VARCHAR2
                this.Database.AddInParameter(":Htwcrq", info.Htwcrq);//DBType:DATE
                this.Database.AddInParameter(":Jssjrq", info.Jssjrq);//DBType:DATE
                this.Database.AddInParameter(":Dzwcrq", info.Dzwcrq);//DBType:DATE
                this.Database.AddInParameter(":Dzj", info.Dzj);//DBType:VARCHAR2
                this.Database.AddInParameter(":Jswcrq", info.Jswcrq);//DBType:DATE
                this.Database.AddInParameter(":Jsj", info.Jsj);//DBType:VARCHAR2
                this.Database.AddInParameter(":Dysjsr", info.Dysjsr);//DBType:VARCHAR2
                this.Database.AddInParameter(":Qtydtmp", info.Qtydtmp);//DBType:VARCHAR2
                this.Database.AddInParameter(":Issaved", info.Issaved);//DBType:VARCHAR2
                this.Database.AddInParameter(":Zhtid", info.Zhtid);//DBType:NUMBER
                this.Database.AddInParameter(":Isimport", info.Isimport);//DBType:NUMBER
                string sqlCommand = @"UPDATE ""H_CONTRACT"" SET  ""SZDW""=:Szdw , ""HTBH""=:Htbh , ""XMMC""=:Xmmc , ""FJDW""=:Fjdw , ""GCXZ""=:Gcxz , ""HTZT""=:Htzt , ""SZND""=:Sznd , ""HTGQ""=:Htgq , ""CBF""=:Cbf , ""CBFW""=:Cbfw , ""CBFS""=:Cbfs , ""ZLBZ""=:Zlbz , ""HTJK""=:Htjk , ""QFBZ""=:Qfbz , ""ZFFS""=:Zffs , ""JFTL""=:Jftl , ""GCBXQ""=:Gcbxq , ""GCBXJ""=:Gcbxj , ""GZTK""=:Gztk , ""QTYD""=:Qtyd , ""CBDB""=:Cbdb , ""JGLFW""=:Jglfw , ""DEPARTID""=:Departid , ""FAINSTANCEID""=:Fainstanceid , ""FLOWID""=:Flowid , ""DBSL""=:Dbsl , ""HTLB""=:Htlb , ""ZBHT""=:Zbht , ""FIRSTNO""=:Firstno , ""SECONDNO""=:Secondno , ""BDSL""=:Bdsl , ""BCSM""=:Bcsm , ""CBS""=:Cbs , ""JSZJ""=:Jszj , ""LYDB""=:Lydb , ""FBS_INSTANCEID""=:Fbsinstanceid , ""FINISHED_MONEY""=:Finishedmoney , ""QCSJ""=:Qcsj , ""QDSJ""=:Qdsj , ""HTFL""=:Htfl , ""JCXYRQ""=:Jcxyrq , ""FBJCRQ""=:Fbjcrq , ""JCXYBH""=:Jcxybh , ""BEIZHU""=:Beizhu , ""HTWCRQ""=:Htwcrq , ""JSSJRQ""=:Jssjrq , ""DZWCRQ""=:Dzwcrq , ""DZJ""=:Dzj , ""JSWCRQ""=:Jswcrq , ""JSJ""=:Jsj , ""DYSJSR""=:Dysjsr , ""QTYDTMP""=:Qtydtmp , ""ISSAVED""=:Issaved , ""ZHTID""=:Zhtid , ""ISIMPORT""=:Isimport WHERE  ""INSTANCEID""=:Instanceid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteHcontractByInstanceid
        public void DeleteHcontractByInstanceid(long Instanceid)
        {
            try
            {
                this.Database.AddInParameter(":Instanceid", Instanceid);//DBType:NUMBER
                string sqlCommand = @"DELETE FROM  ""H_CONTRACT"" WHERE  ""INSTANCEID""=:Instanceid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteHcontractByInstanceid
        public void DeleteHcontractByInstanceid(List<long> Instanceids)
        {
            try
            {
                if(Instanceids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""H_CONTRACT"" WHERE 1=1");
                if(Instanceids.Count==1)
                {
                    this.Database.AddInParameter(":Instanceid"+0.ToString(),Instanceids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND ""INSTANCEID""=:Instanceid0");
                }
                else if(Instanceids.Count>1&&Instanceids.Count<=2000)
                {
                    this.Database.AddInParameter(":Instanceid"+0.ToString(),Instanceids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND (""INSTANCEID""=:Instanceid0");
                    for (int i = 1; i < Instanceids.Count; i++)
                    {
                    this.Database.AddInParameter(":Instanceid"+i.ToString(),Instanceids[i]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" OR ""INSTANCEID""=:Instanceid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                this.Database.ExecuteNonQuery(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
