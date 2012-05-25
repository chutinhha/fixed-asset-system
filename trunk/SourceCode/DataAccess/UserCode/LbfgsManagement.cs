/********************************************************************
* File Name:LbfgsManagement
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
    public partial class LbfgsManagement:BaseManagement
    {
        #region RetrieveLbfgsByFgsid
        public Lbfgs RetrieveLbfgsByFgsid(decimal fgsid)
        {
            try
            {
                this.Database.AddInParameter(":FGSID", fgsid);
                string sqlCommand = @"SELECT * FROM LB_FGS WHERE  FGSID=:FGSID";
                return this.Database.ExecuteToSingle<Lbfgs>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveLbfgsByFgsid
        public List<Lbfgs> RetrieveLbfgsByFgsid(List<decimal> Fgsids)
        {
            try
            {
                if(Fgsids.Count==0){ return new List<Lbfgs>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""LB_FGS"" WHERE 1=1");
                if(Fgsids.Count==1)
                {
                    this.Database.AddInParameter(":Fgsid"+0.ToString(),Fgsids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND ""FGSID""=:Fgsid0");
                }
                else if(Fgsids.Count>1&&Fgsids.Count<=2000)
                {
                    this.Database.AddInParameter(":Fgsid"+0.ToString(),Fgsids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND (""FGSID""=:Fgsid0");
                    for (int i = 1; i < Fgsids.Count; i++)
                    {
                    this.Database.AddInParameter(":Fgsid"+i.ToString(),Fgsids[i]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" OR ""FGSID""=:Fgsid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""FGSID"" DESC");
                return this.Database.ExecuteToList<Lbfgs>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveLbfgssPaging
        public List<Lbfgs> RetrieveLbfgssPaging(LbfgsSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""LB_FGS"".""FGSID"",""LB_FGS"".""FGS"",""LB_FGS"".""FGSSORTID"",""LB_FGS"".""FGLD"",""LB_FGS"".""FGLDLXDH"",
                     ""LB_FGS"".""WLLZGY"",""LB_FGS"".""WLLZGYLXDH""
                     FROM ""LB_FGS"" 
                     WHERE 1=1");
                if (!string.IsNullOrEmpty(info.Fgs))
                {
                    this.Database.AddInParameter(":Fgs",DbType.AnsiString,"%"+info.Fgs+"%");
                    sqlCommand.AppendLine(@" AND ""LB_FGS"".""FGS"" LIKE :Fgs");
                }
                if (!string.IsNullOrEmpty(info.Fgssortid))
                {
                    this.Database.AddInParameter(":Fgssortid",DbType.AnsiString,"%"+info.Fgssortid+"%");
                    sqlCommand.AppendLine(@" AND ""LB_FGS"".""FGSSORTID"" LIKE :Fgssortid");
                }
                if (!string.IsNullOrEmpty(info.Fgld))
                {
                    this.Database.AddInParameter(":Fgld",DbType.AnsiString,"%"+info.Fgld+"%");
                    sqlCommand.AppendLine(@" AND ""LB_FGS"".""FGLD"" LIKE :Fgld");
                }
                if (!string.IsNullOrEmpty(info.Fgldlxdh))
                {
                    this.Database.AddInParameter(":Fgldlxdh",DbType.AnsiString,"%"+info.Fgldlxdh+"%");
                    sqlCommand.AppendLine(@" AND ""LB_FGS"".""FGLDLXDH"" LIKE :Fgldlxdh");
                }
                if (!string.IsNullOrEmpty(info.Wllzgy))
                {
                    this.Database.AddInParameter(":Wllzgy",DbType.AnsiString,"%"+info.Wllzgy+"%");
                    sqlCommand.AppendLine(@" AND ""LB_FGS"".""WLLZGY"" LIKE :Wllzgy");
                }
                if (!string.IsNullOrEmpty(info.Wllzgylxdh))
                {
                    this.Database.AddInParameter(":Wllzgylxdh",DbType.AnsiString,"%"+info.Wllzgylxdh+"%");
                    sqlCommand.AppendLine(@" AND ""LB_FGS"".""WLLZGYLXDH"" LIKE :Wllzgylxdh");
                }

                sqlCommand.AppendLine(@"  ORDER BY ""LB_FGS"".""FGSID"" DESC");
                return this.ExecuteReaderPaging<Lbfgs>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
