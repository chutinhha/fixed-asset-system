/********************************************************************
* File Name:HcontractdetailManagement
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
    public partial class HcontractdetailManagement:BaseManagement
    {
        #region RetrieveHcontractdetailByInstanceid
        public Hcontractdetail RetrieveHcontractdetailByInstanceid(long Instanceid)
        {
            try
            {
                this.Database.AddInParameter(":Instanceid", Instanceid);//DBType:NUMBER
                string sqlCommand = @"SELECT * FROM ""H_CONTRACT_DETAIL"" WHERE  ""INSTANCEID""=:Instanceid ";
                return this.Database.ExecuteToSingle<Hcontractdetail>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveHcontractdetailByInstanceid
        public List<Hcontractdetail> RetrieveHcontractdetailByInstanceid(List<long> Instanceids)
        {
            try
            {
                if(Instanceids.Count==0){ return new List<Hcontractdetail>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""H_CONTRACT_DETAIL"" WHERE 1=1");
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
                return this.Database.ExecuteToList<Hcontractdetail>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveListInfoByForeignKeys RetrieveHcontractdetailListByFainstanceid
        public List<Hcontractdetail> RetrieveHcontractdetailListByFainstanceid(long Fainstanceid)
        {
            try
            {
                this.Database.AddInParameter(":Fainstanceid", Fainstanceid);//DBType:NUMBER
                string sqlCommand = @"SELECT * FROM ""H_CONTRACT_DETAIL"" WHERE  ""FAINSTANCEID""=:Fainstanceid";
                sqlCommand += @" ORDER BY ""INSTANCEID"" DESC";
                return this.Database.ExecuteToList<Hcontractdetail>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveHcontractdetailListByFainstanceid
        public List<Hcontractdetail> RetrieveHcontractdetailListByFainstanceid(List<long> Fainstanceids)
        {
            try
            {
                if(Fainstanceids.Count==0){ return new List<Hcontractdetail>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""H_CONTRACT_DETAIL"" WHERE 1=1");
                if(Fainstanceids.Count==1)
                {
                    this.Database.AddInParameter(":Fainstanceid"+0.ToString(),Fainstanceids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND ""FAINSTANCEID""=:Fainstanceid0");
                }
                else if(Fainstanceids.Count>1&&Fainstanceids.Count<=2000)
                {
                    this.Database.AddInParameter(":Fainstanceid"+0.ToString(),Fainstanceids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND (""FAINSTANCEID""=:Fainstanceid0");
                    for (int i = 1; i < Fainstanceids.Count; i++)
                    {
                    this.Database.AddInParameter(":Fainstanceid"+i.ToString(),Fainstanceids[i]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" OR ""FAINSTANCEID""=:Fainstanceid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""INSTANCEID"" DESC");
                return this.Database.ExecuteToList<Hcontractdetail>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveCountOfHcontractdetailByFainstanceid
        public int RetrieveCountOfHcontractdetailByFainstanceid(List<long> Fainstanceids)
        {
            try
            {
                if(Fainstanceids.Count==0){ return 0;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT COUNT(*)  FROM  ""H_CONTRACT_DETAIL"" WHERE 1=1");
                if(Fainstanceids.Count==1)
                {
                    this.Database.AddInParameter(":Fainstanceid"+0.ToString(),Fainstanceids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND ""FAINSTANCEID""=:Fainstanceid0");
                }
                else if(Fainstanceids.Count>1&&Fainstanceids.Count<=2000)
                {
                    this.Database.AddInParameter(":Fainstanceid"+0.ToString(),Fainstanceids[0]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" AND (""FAINSTANCEID""=:Fainstanceid0");
                    for (int i = 1; i < Fainstanceids.Count; i++)
                    {
                    this.Database.AddInParameter(":Fainstanceid"+i.ToString(),Fainstanceids[i]);//DBType:NUMBER
                    sqlCommand.AppendLine(@" OR ""FAINSTANCEID""=:Fainstanceid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                return int.Parse(this.Database.ExecuteScalar(sqlCommand.ToString()).ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveHcontractdetailsPaging
        public List<Hcontractdetail> RetrieveHcontractdetailsPaging(HcontractdetailSearch info,int pageIndex, int pageSize,out int count)
        {
            try
            {
                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""H_CONTRACT_DETAIL"".""INSTANCEID"",""H_CONTRACT_DETAIL"".""FAINSTANCEID"",""H_CONTRACT_DETAIL"".""DETAILNAME"",""H_CONTRACT_DETAIL"".""MODAL"",""H_CONTRACT_DETAIL"".""TYPE"",
                     ""H_CONTRACT_DETAIL"".""SL"",""H_CONTRACT_DETAIL"".""DJ"",""H_CONTRACT_DETAIL"".""PP""

                     FROM ""H_CONTRACT_DETAIL"" 
                     INNER JOIN ""H_CONTRACT"" ON ""H_CONTRACT_DETAIL"".""FAINSTANCEID""=""H_CONTRACT"".""INSTANCEID"" 
                     WHERE 1=1");
                #region 设备名称
                if (!string.IsNullOrEmpty(info.Detailname))
                {
                    this.Database.AddInParameter(":Detailname",DbType.AnsiString,"%"+info.Detailname+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT_DETAIL"".""DETAILNAME"" LIKE :Detailname");
                }
                #endregion

                #region 设备型号
                if (!string.IsNullOrEmpty(info.Modal))
                {
                    this.Database.AddInParameter(":Modal",DbType.AnsiString,"%"+info.Modal+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT_DETAIL"".""MODAL"" LIKE :Modal");
                }
                #endregion

                #region 设备品牌
                if (!string.IsNullOrEmpty(info.Pp))
                {
                    this.Database.AddInParameter(":Pp",DbType.AnsiString,"%"+info.Pp+"%");
                    sqlCommand.AppendLine(@" AND ""H_CONTRACT_DETAIL"".""PP"" LIKE :Pp");
                }
                #endregion


                sqlCommand.AppendLine(@"  ORDER BY ""H_CONTRACT_DETAIL"".""INSTANCEID"" DESC");
                return this.ExecuteReaderPaging<Hcontractdetail>(sqlCommand.ToString(), pageIndex, pageSize, out count);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion 
    }
}
