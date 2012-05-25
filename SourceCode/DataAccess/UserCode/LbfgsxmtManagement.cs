/********************************************************************
* File Name:LbfgsxmtManagement
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.huang - 2012-05-25
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
    public partial class LbfgsxmtManagement:BaseManagement
    {
        #region RetrieveLbfgsxmtByXmtid
        public Lbfgsxmt RetrieveLbfgsxmtByXmtid(decimal xmtid)
        {
            try
            {
                this.Database.AddInParameter(":XMTID", xmtid);
                string sqlCommand = @"SELECT * FROM LB_FGS_XMT WHERE  XMTID=:XMTID";
                return this.Database.ExecuteToSingle<Lbfgsxmt>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveLbfgsxmtByXmtid
        public List<Lbfgsxmt> RetrieveLbfgsxmtByXmtid(List<decimal> Xmtids)
        {
            try
            {
                if(Xmtids.Count==0){ return new List<Lbfgsxmt>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""LB_FGS_XMT"" WHERE 1=1");
                if(Xmtids.Count==1)
                {
                    this.Database.AddInParameter(":Xmtid"+0.ToString(),Xmtids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND ""XMTID""=:Xmtid0");
                }
                else if(Xmtids.Count>1&&Xmtids.Count<=2000)
                {
                    this.Database.AddInParameter(":Xmtid"+0.ToString(),Xmtids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND (""XMTID""=:Xmtid0");
                    for (int i = 1; i < Xmtids.Count; i++)
                    {
                    this.Database.AddInParameter(":Xmtid"+i.ToString(),Xmtids[i]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" OR ""XMTID""=:Xmtid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""XMTID"" DESC");
                return this.Database.ExecuteToList<Lbfgsxmt>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveLbfgsxmtsPaging
        public List<Lbfgsxmt> RetrieveLbfgsxmtsPaging(LbfgsxmtSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""LB_FGS_XMT"".""XMTID"",""LB_FGS_XMT"".""XMT"",""LB_FGS_XMT"".""FGSID"",""LB_FGS_XMT"".""FGS"",""LB_FGS_XMT"".""XMTLX"",
                     ""LB_FGS_XMT"".""WLLGLY"",""LB_FGS_XMT"".""WLLGLYLXDH"",""LB_FGS_XMT"".""KGRQ"",""LB_FGS_XMT"".""JGRQ"",""LB_FGS_XMT"".""JZMJ"",
                     ""LB_FGS_XMT"".""ZHAOJIA"",""LB_FGS_XMT"".""MGGRS"",""LB_FGS_XMT"".""GJGGRS"",""LB_FGS_XMT"".""TGGRS"",""LB_FGS_XMT"".""NFGGRS"",
                     ""LB_FGS_XMT"".""JZGGRS"",""LB_FGS_XMT"".""QTGGRS"",""LB_FGS_XMT"".""INSTANCEID"",""LB_FGS_XMT"".""FAINSTANCEID"",""LB_FGS_XMT"".""STATUS"",
                     ""LB_FGS_XMT"".""CREATETIME"",""LB_FGS_XMT"".""ISDELETE"",""LB_FGS_XMT"".""FLOWID"",""LB_FGS_XMT"".""DEPARTID"",""LB_FGS_XMT"".""ORGANIZEID"",
                     ""LB_FGS_XMT"".""DIYU"",""LB_FGS_XMT"".""XMLX"",""LB_FGS_XMT"".""ISUSE""
                     FROM ""LB_FGS_XMT"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Xmt))
                {
                    this.Database.AddInParameter(":Xmt",DbType.AnsiString,"%"+info.Xmt+"%");
                    sqlCommand.AppendLine(@" AND ""LB_FGS_XMT"".""XMT"" LIKE :Xmt");
                }
                if (!string.IsNullOrEmpty(info.Fgs))
                {
                    this.Database.AddInParameter(":Fgs",DbType.AnsiString,"%"+info.Fgs+"%");
                    sqlCommand.AppendLine(@" AND ""LB_FGS_XMT"".""FGS"" LIKE :Fgs");
                }
                if (!string.IsNullOrEmpty(info.Xmtlx))
                {
                    this.Database.AddInParameter(":Xmtlx",DbType.AnsiString,"%"+info.Xmtlx+"%");
                    sqlCommand.AppendLine(@" AND ""LB_FGS_XMT"".""XMTLX"" LIKE :Xmtlx");
                }
                if (!string.IsNullOrEmpty(info.Wllgly))
                {
                    this.Database.AddInParameter(":Wllgly",DbType.AnsiString,"%"+info.Wllgly+"%");
                    sqlCommand.AppendLine(@" AND ""LB_FGS_XMT"".""WLLGLY"" LIKE :Wllgly");
                }
                if (!string.IsNullOrEmpty(info.Wllglylxdh))
                {
                    this.Database.AddInParameter(":Wllglylxdh",DbType.AnsiString,"%"+info.Wllglylxdh+"%");
                    sqlCommand.AppendLine(@" AND ""LB_FGS_XMT"".""WLLGLYLXDH"" LIKE :Wllglylxdh");
                }
                if (info.StartKgrq.HasValue)
                {
                    this.Database.AddInParameter(":StartKgrq",info.StartKgrq.Value.Date);
                    sqlCommand.AppendLine(@" AND ""LB_FGS_XMT"".""KGRQ"" >= :StartKgrq");
                }
                if (info.EndKgrq.HasValue)
                {
                    this.Database.AddInParameter(":EndKgrq",info.EndKgrq.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""LB_FGS_XMT"".""KGRQ"" <= :EndKgrq");
                }
                if (info.StartJgrq.HasValue)
                {
                    this.Database.AddInParameter(":StartJgrq",info.StartJgrq.Value.Date);
                    sqlCommand.AppendLine(@" AND ""LB_FGS_XMT"".""JGRQ"" >= :StartJgrq");
                }
                if (info.EndJgrq.HasValue)
                {
                    this.Database.AddInParameter(":EndJgrq",info.EndJgrq.Value.Date.AddDays(1).AddSeconds(-1));
                    sqlCommand.AppendLine(@" AND ""LB_FGS_XMT"".""JGRQ"" <= :EndJgrq");
                }
                if (!string.IsNullOrEmpty(info.Diyu))
                {
                    this.Database.AddInParameter(":Diyu",DbType.AnsiString,"%"+info.Diyu+"%");
                    sqlCommand.AppendLine(@" AND ""LB_FGS_XMT"".""DIYU"" LIKE :Diyu");
                }
                if (!string.IsNullOrEmpty(info.Xmlx))
                {
                    this.Database.AddInParameter(":Xmlx",DbType.AnsiString,"%"+info.Xmlx+"%");
                    sqlCommand.AppendLine(@" AND ""LB_FGS_XMT"".""XMLX"" LIKE :Xmlx");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""LB_FGS_XMT"".""XMTID"" DESC");
                return this.ExecuteReaderPaging<Lbfgsxmt>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
