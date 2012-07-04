/********************************************************************
* File Name:HcontractManagement
* Copyright (C) 2012 Bruce.Huang 
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
        #region RetrieveHcontractByInstanceid
        public Hcontract RetrieveHcontractByInstanceid(long Instanceid)
        {
            try
            {
                this.Database.AddInParameter(":Instanceid", Instanceid);//DBType:NUMBER
                string sqlCommand = @"SELECT * FROM ""H_CONTRACT"" WHERE  ""INSTANCEID""=:Instanceid ";
                return this.Database.ExecuteToSingle<Hcontract>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveHcontractByInstanceid
        public List<Hcontract> RetrieveHcontractByInstanceid(List<long> Instanceids)
        {
            try
            {
                if(Instanceids.Count==0){ return new List<Hcontract>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""H_CONTRACT"" WHERE 1=1");
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

                sqlCommand.AppendLine(@" ORDER BY ""INSTANCEID"" DESC");
                return this.Database.ExecuteToList<Hcontract>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveHcontractsPaging
        public List<Hcontract> RetrieveHcontractsPaging(HcontractSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""H_CONTRACT"".""INSTANCEID"",""H_CONTRACT"".""SZDW"",""H_CONTRACT"".""HTBH"",""H_CONTRACT"".""XMMC"",""H_CONTRACT"".""FJDW"",
                     ""H_CONTRACT"".""GCXZ"",""H_CONTRACT"".""HTZT"",""H_CONTRACT"".""SZND"",""H_CONTRACT"".""HTGQ"",""H_CONTRACT"".""CBF"",
                     ""H_CONTRACT"".""CBFW"",""H_CONTRACT"".""CBFS"",""H_CONTRACT"".""ZLBZ"",""H_CONTRACT"".""HTJK"",""H_CONTRACT"".""QFBZ"",
                     ""H_CONTRACT"".""ZFFS"",""H_CONTRACT"".""JFTL"",""H_CONTRACT"".""GCBXQ"",""H_CONTRACT"".""GCBXJ"",""H_CONTRACT"".""GZTK"",
                     ""H_CONTRACT"".""QTYD"",""H_CONTRACT"".""CBDB"",""H_CONTRACT"".""JGLFW"",""H_CONTRACT"".""DEPARTID"",""H_CONTRACT"".""FAINSTANCEID"",
                     ""H_CONTRACT"".""FLOWID"",""H_CONTRACT"".""DBSL"",""H_CONTRACT"".""HTLB"",""H_CONTRACT"".""ZBHT"",""H_CONTRACT"".""FIRSTNO"",
                     ""H_CONTRACT"".""SECONDNO"",""H_CONTRACT"".""BDSL"",""H_CONTRACT"".""BCSM"",""H_CONTRACT"".""CBS"",""H_CONTRACT"".""JSZJ"",
                     ""H_CONTRACT"".""LYDB"",""H_CONTRACT"".""FBS_INSTANCEID"",""H_CONTRACT"".""FINISHED_MONEY"",""H_CONTRACT"".""QCSJ"",""H_CONTRACT"".""QDSJ"",
                     ""H_CONTRACT"".""HTFL"",""H_CONTRACT"".""JCXYRQ"",""H_CONTRACT"".""FBJCRQ"",""H_CONTRACT"".""JCXYBH"",""H_CONTRACT"".""BEIZHU"",
                     ""H_CONTRACT"".""HTWCRQ"",""H_CONTRACT"".""JSSJRQ"",""H_CONTRACT"".""DZWCRQ"",""H_CONTRACT"".""DZJ"",""H_CONTRACT"".""JSWCRQ"",
                     ""H_CONTRACT"".""JSJ"",""H_CONTRACT"".""DYSJSR"",""H_CONTRACT"".""QTYDTMP"",""H_CONTRACT"".""ISSAVED"",""H_CONTRACT"".""ZHTID"",
                     ""H_CONTRACT"".""ISIMPORT""
                     FROM ""H_CONTRACT"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Szdw))
                {
                    this.Database.AddInParameter(":Szdw",DbType.AnsiString,"%"+info.Szdw+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""SZDW"" LIKE :Szdw");
                }
                if (!string.IsNullOrEmpty(info.Htbh))
                {
                    this.Database.AddInParameter(":Htbh",DbType.AnsiString,"%"+info.Htbh+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""HTBH"" LIKE :Htbh");
                }
                if (!string.IsNullOrEmpty(info.Xmmc))
                {
                    this.Database.AddInParameter(":Xmmc",DbType.AnsiString,"%"+info.Xmmc+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""XMMC"" LIKE :Xmmc");
                }
                if (!string.IsNullOrEmpty(info.Fjdw))
                {
                    this.Database.AddInParameter(":Fjdw",DbType.AnsiString,"%"+info.Fjdw+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""FJDW"" LIKE :Fjdw");
                }
                if (!string.IsNullOrEmpty(info.Gcxz))
                {
                    this.Database.AddInParameter(":Gcxz",DbType.AnsiString,"%"+info.Gcxz+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""GCXZ"" LIKE :Gcxz");
                }
                if (!string.IsNullOrEmpty(info.Htzt))
                {
                    this.Database.AddInParameter(":Htzt",DbType.AnsiString,"%"+info.Htzt+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""HTZT"" LIKE :Htzt");
                }
                if (!string.IsNullOrEmpty(info.Sznd))
                {
                    this.Database.AddInParameter(":Sznd",DbType.AnsiString,"%"+info.Sznd+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""SZND"" LIKE :Sznd");
                }
                if (!string.IsNullOrEmpty(info.Htgq))
                {
                    this.Database.AddInParameter(":Htgq",DbType.AnsiString,"%"+info.Htgq+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""HTGQ"" LIKE :Htgq");
                }
                #region 供应商，直接存的名称
                if (!string.IsNullOrEmpty(info.Cbf))
                {
                    this.Database.AddInParameter(":Cbf",DbType.AnsiString,"%"+info.Cbf+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""CBF"" LIKE :Cbf");
                }
                #endregion

                if (!string.IsNullOrEmpty(info.Cbfw))
                {
                    this.Database.AddInParameter(":Cbfw",DbType.AnsiString,"%"+info.Cbfw+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""CBFW"" LIKE :Cbfw");
                }
                if (!string.IsNullOrEmpty(info.Cbfs))
                {
                    this.Database.AddInParameter(":Cbfs",DbType.AnsiString,"%"+info.Cbfs+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""CBFS"" LIKE :Cbfs");
                }
                if (!string.IsNullOrEmpty(info.Zlbz))
                {
                    this.Database.AddInParameter(":Zlbz",DbType.AnsiString,"%"+info.Zlbz+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""ZLBZ"" LIKE :Zlbz");
                }
                if (!string.IsNullOrEmpty(info.Htjk))
                {
                    this.Database.AddInParameter(":Htjk",DbType.AnsiString,"%"+info.Htjk+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""HTJK"" LIKE :Htjk");
                }
                if (!string.IsNullOrEmpty(info.Qfbz))
                {
                    this.Database.AddInParameter(":Qfbz",DbType.AnsiString,"%"+info.Qfbz+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""QFBZ"" LIKE :Qfbz");
                }
                if (!string.IsNullOrEmpty(info.Zffs))
                {
                    this.Database.AddInParameter(":Zffs",DbType.AnsiString,"%"+info.Zffs+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""ZFFS"" LIKE :Zffs");
                }
                if (!string.IsNullOrEmpty(info.Jftl))
                {
                    this.Database.AddInParameter(":Jftl",DbType.AnsiString,"%"+info.Jftl+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""JFTL"" LIKE :Jftl");
                }
                if (!string.IsNullOrEmpty(info.Gcbxq))
                {
                    this.Database.AddInParameter(":Gcbxq",DbType.AnsiString,"%"+info.Gcbxq+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""GCBXQ"" LIKE :Gcbxq");
                }
                if (!string.IsNullOrEmpty(info.Gcbxj))
                {
                    this.Database.AddInParameter(":Gcbxj",DbType.AnsiString,"%"+info.Gcbxj+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""GCBXJ"" LIKE :Gcbxj");
                }
                if (!string.IsNullOrEmpty(info.Gztk))
                {
                    this.Database.AddInParameter(":Gztk",DbType.AnsiString,"%"+info.Gztk+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""GZTK"" LIKE :Gztk");
                }
                if (!string.IsNullOrEmpty(info.Qtyd))
                {
                    this.Database.AddInParameter(":Qtyd",DbType.AnsiString,"%"+info.Qtyd+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""QTYD"" LIKE :Qtyd");
                }
                if (!string.IsNullOrEmpty(info.Cbdb))
                {
                    this.Database.AddInParameter(":Cbdb",DbType.AnsiString,"%"+info.Cbdb+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""CBDB"" LIKE :Cbdb");
                }
                if (!string.IsNullOrEmpty(info.Jglfw))
                {
                    this.Database.AddInParameter(":Jglfw",DbType.AnsiString,"%"+info.Jglfw+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""JGLFW"" LIKE :Jglfw");
                }
                if (!string.IsNullOrEmpty(info.Dbsl))
                {
                    this.Database.AddInParameter(":Dbsl",DbType.AnsiString,"%"+info.Dbsl+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""DBSL"" LIKE :Dbsl");
                }
                if (!string.IsNullOrEmpty(info.Zbht))
                {
                    this.Database.AddInParameter(":Zbht",DbType.AnsiString,"%"+info.Zbht+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""ZBHT"" LIKE :Zbht");
                }
                if (!string.IsNullOrEmpty(info.Bdsl))
                {
                    this.Database.AddInParameter(":Bdsl",DbType.AnsiString,"%"+info.Bdsl+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""BDSL"" LIKE :Bdsl");
                }
                if (!string.IsNullOrEmpty(info.Bcsm))
                {
                    this.Database.AddInParameter(":Bcsm",DbType.AnsiString,"%"+info.Bcsm+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""BCSM"" LIKE :Bcsm");
                }
                if (!string.IsNullOrEmpty(info.Cbs))
                {
                    this.Database.AddInParameter(":Cbs",DbType.AnsiString,"%"+info.Cbs+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""CBS"" LIKE :Cbs");
                }
                if (!string.IsNullOrEmpty(info.Jszj))
                {
                    this.Database.AddInParameter(":Jszj",DbType.AnsiString,"%"+info.Jszj+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""JSZJ"" LIKE :Jszj");
                }
                if (!string.IsNullOrEmpty(info.Lydb))
                {
                    this.Database.AddInParameter(":Lydb",DbType.AnsiString,"%"+info.Lydb+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""LYDB"" LIKE :Lydb");
                }
                if (!string.IsNullOrEmpty(info.Fbsinstanceid))
                {
                    this.Database.AddInParameter(":Fbsinstanceid",DbType.AnsiString,"%"+info.Fbsinstanceid+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""FBS_INSTANCEID"" LIKE :Fbsinstanceid");
                }
                if (info.StartQcsj.HasValue)
                {
                    this.Database.AddInParameter(":StartQcsj",info.StartQcsj.Value.Date);
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""QCSJ"" >= :StartQcsj");
                }
                if (info.EndQcsj.HasValue)
                {
                    this.Database.AddInParameter(":EndQcsj",info.EndQcsj.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""QCSJ"" <= :EndQcsj");
                }
                if (!string.IsNullOrEmpty(info.Qdsj))
                {
                    this.Database.AddInParameter(":Qdsj",DbType.AnsiString,"%"+info.Qdsj+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""QDSJ"" LIKE :Qdsj");
                }
                if (!string.IsNullOrEmpty(info.Htfl))
                {
                    this.Database.AddInParameter(":Htfl",DbType.AnsiString,"%"+info.Htfl+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""HTFL"" LIKE :Htfl");
                }
                if (info.StartJcxyrq.HasValue)
                {
                    this.Database.AddInParameter(":StartJcxyrq",info.StartJcxyrq.Value.Date);
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""JCXYRQ"" >= :StartJcxyrq");
                }
                if (info.EndJcxyrq.HasValue)
                {
                    this.Database.AddInParameter(":EndJcxyrq",info.EndJcxyrq.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""JCXYRQ"" <= :EndJcxyrq");
                }
                if (info.StartFbjcrq.HasValue)
                {
                    this.Database.AddInParameter(":StartFbjcrq",info.StartFbjcrq.Value.Date);
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""FBJCRQ"" >= :StartFbjcrq");
                }
                if (info.EndFbjcrq.HasValue)
                {
                    this.Database.AddInParameter(":EndFbjcrq",info.EndFbjcrq.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""FBJCRQ"" <= :EndFbjcrq");
                }
                if (!string.IsNullOrEmpty(info.Jcxybh))
                {
                    this.Database.AddInParameter(":Jcxybh",DbType.AnsiString,"%"+info.Jcxybh+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""JCXYBH"" LIKE :Jcxybh");
                }
                if (!string.IsNullOrEmpty(info.Beizhu))
                {
                    this.Database.AddInParameter(":Beizhu",DbType.AnsiString,"%"+info.Beizhu+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""BEIZHU"" LIKE :Beizhu");
                }
                #region 现在的合同完成日期
                if (info.StartHtwcrq.HasValue)
                {
                    this.Database.AddInParameter(":StartHtwcrq",info.StartHtwcrq.Value.Date);
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""HTWCRQ"" >= :StartHtwcrq");
                }
                if (info.EndHtwcrq.HasValue)
                {
                    this.Database.AddInParameter(":EndHtwcrq",info.EndHtwcrq.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""HTWCRQ"" <= :EndHtwcrq");
                }
                #endregion

                if (info.StartJssjrq.HasValue)
                {
                    this.Database.AddInParameter(":StartJssjrq",info.StartJssjrq.Value.Date);
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""JSSJRQ"" >= :StartJssjrq");
                }
                if (info.EndJssjrq.HasValue)
                {
                    this.Database.AddInParameter(":EndJssjrq",info.EndJssjrq.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""JSSJRQ"" <= :EndJssjrq");
                }
                if (info.StartDzwcrq.HasValue)
                {
                    this.Database.AddInParameter(":StartDzwcrq",info.StartDzwcrq.Value.Date);
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""DZWCRQ"" >= :StartDzwcrq");
                }
                if (info.EndDzwcrq.HasValue)
                {
                    this.Database.AddInParameter(":EndDzwcrq",info.EndDzwcrq.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""DZWCRQ"" <= :EndDzwcrq");
                }
                if (!string.IsNullOrEmpty(info.Dzj))
                {
                    this.Database.AddInParameter(":Dzj",DbType.AnsiString,"%"+info.Dzj+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""DZJ"" LIKE :Dzj");
                }
                if (info.StartJswcrq.HasValue)
                {
                    this.Database.AddInParameter(":StartJswcrq",info.StartJswcrq.Value.Date);
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""JSWCRQ"" >= :StartJswcrq");
                }
                if (info.EndJswcrq.HasValue)
                {
                    this.Database.AddInParameter(":EndJswcrq",info.EndJswcrq.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""JSWCRQ"" <= :EndJswcrq");
                }
                if (!string.IsNullOrEmpty(info.Jsj))
                {
                    this.Database.AddInParameter(":Jsj",DbType.AnsiString,"%"+info.Jsj+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""JSJ"" LIKE :Jsj");
                }
                if (!string.IsNullOrEmpty(info.Dysjsr))
                {
                    this.Database.AddInParameter(":Dysjsr",DbType.AnsiString,"%"+info.Dysjsr+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""DYSJSR"" LIKE :Dysjsr");
                }
                if (!string.IsNullOrEmpty(info.Qtydtmp))
                {
                    this.Database.AddInParameter(":Qtydtmp",DbType.AnsiString,"%"+info.Qtydtmp+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""QTYDTMP"" LIKE :Qtydtmp");
                }
                if (!string.IsNullOrEmpty(info.Issaved))
                {
                    this.Database.AddInParameter(":Issaved",DbType.AnsiString,"%"+info.Issaved+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT"".""ISSAVED"" LIKE :Issaved");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""H_CONTRACT"".""INSTANCEID"" DESC");
                return this.ExecuteReaderPaging<Hcontract>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
