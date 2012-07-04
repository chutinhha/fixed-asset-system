/********************************************************************
* File Name:HcontractdetailManagement
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
    public partial class HcontractdetailManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 8;
        public HcontractdetailManagement()
        { }
        public HcontractdetailManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateHcontractdetail
        public Hcontractdetail CreateHcontractdetail(Hcontractdetail info)
        {
            try
            {

                this.Database.AddInParameter(":Instanceid", info.Instanceid);//DBType:NUMBER
                this.Database.AddInParameter(":Fainstanceid", info.Fainstanceid);//DBType:NUMBER
                this.Database.AddInParameter(":Detailname", info.Detailname);//DBType:VARCHAR2
                this.Database.AddInParameter(":Modal", info.Modal);//DBType:VARCHAR2
                this.Database.AddInParameter(":Type", info.Type);//DBType:NUMBER
                this.Database.AddInParameter(":Sl", info.Sl);//DBType:NUMBER
                this.Database.AddInParameter(":Dj", info.Dj);//DBType:NUMBER
                this.Database.AddInParameter(":Pp", info.Pp);//DBType:VARCHAR2
                string sqlCommand = @"INSERT INTO ""H_CONTRACT_DETAIL"" (""INSTANCEID"",""FAINSTANCEID"",""DETAILNAME"",""MODAL"",""TYPE"",""SL"",""DJ"",""PP"") VALUES (:Instanceid,:Fainstanceid,:Detailname,:Modal,:Type,:Sl,:Dj,:Pp)";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateHcontractdetailByInstanceid
        public Hcontractdetail UpdateHcontractdetailByInstanceid(Hcontractdetail info)
        {
            try
            {
                this.Database.AddInParameter(":Instanceid", info.Instanceid);//DBType:NUMBER
                this.Database.AddInParameter(":Fainstanceid", info.Fainstanceid);//DBType:NUMBER
                this.Database.AddInParameter(":Detailname", info.Detailname);//DBType:VARCHAR2
                this.Database.AddInParameter(":Modal", info.Modal);//DBType:VARCHAR2
                this.Database.AddInParameter(":Type", info.Type);//DBType:NUMBER
                this.Database.AddInParameter(":Sl", info.Sl);//DBType:NUMBER
                this.Database.AddInParameter(":Dj", info.Dj);//DBType:NUMBER
                this.Database.AddInParameter(":Pp", info.Pp);//DBType:VARCHAR2
                string sqlCommand = @"UPDATE ""H_CONTRACT_DETAIL"" SET  ""FAINSTANCEID""=:Fainstanceid , ""DETAILNAME""=:Detailname , ""MODAL""=:Modal , ""TYPE""=:Type , ""SL""=:Sl , ""DJ""=:Dj , ""PP""=:Pp WHERE  ""INSTANCEID""=:Instanceid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteHcontractdetailByInstanceid
        public void DeleteHcontractdetailByInstanceid(long Instanceid)
        {
            try
            {
                this.Database.AddInParameter(":Instanceid", Instanceid);//DBType:NUMBER
                string sqlCommand = @"DELETE FROM  ""H_CONTRACT_DETAIL"" WHERE  ""INSTANCEID""=:Instanceid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteHcontractdetailByInstanceid
        public void DeleteHcontractdetailByInstanceid(List<long> Instanceids)
        {
            try
            {
                if(Instanceids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""H_CONTRACT_DETAIL"" WHERE 1=1");
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

        #region DeleteHcontractdetailsByFainstanceid
        public void DeleteHcontractdetailsByFainstanceid(List<long> Fainstanceids)
        {
            try
            {
                if(Fainstanceids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""H_CONTRACT_DETAIL"" WHERE 1=1");
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
