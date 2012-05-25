/********************************************************************
* File Name:BaccountManagement
* Copyright (C) 2012 Bruce.huang 
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
    public partial class BaccountManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 6;
        public BaccountManagement()
        { }
        public BaccountManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateBaccount
        public Baccount CreateBaccount(Baccount info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""BACCOUNT"" (""ASSETNO"",""ASSETNAME"",""ACCOUNTEDDATE"",""ACCOUNTEDUSER"",""CREATEDDATE"",""CREATEDUSER"") VALUES (:Assetno,:Assetname,:Accounteddate,:Accounteduser,:Createddate,:Createduser)";
                this.Database.AddInParameter(":Assetno", info.Assetno);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetname", info.Assetname);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Accounteddate", info.Accounteddate);//DBType:DATE
                this.Database.AddInParameter(":Accounteduser", info.Accounteduser);//DBType:VARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.AddInParameter(":Createduser", info.Createduser);//DBType:VARCHAR2
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateBaccountByAssetno
        public Baccount UpdateBaccountByAssetno(Baccount info)
        {
            try
            {
                this.Database.AddInParameter(":Assetno", info.Assetno);//DBType:VARCHAR2
                this.Database.AddInParameter(":Assetname", info.Assetname);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Accounteddate", info.Accounteddate);//DBType:DATE
                this.Database.AddInParameter(":Accounteduser", info.Accounteduser);//DBType:VARCHAR2
                this.Database.AddInParameter(":Createddate", info.Createddate);//DBType:DATE
                this.Database.AddInParameter(":Createduser", info.Createduser);//DBType:VARCHAR2
                string sqlCommand = @"UPDATE ""BACCOUNT"" SET  ""ASSETNAME""=:Assetname , ""ACCOUNTEDDATE""=:Accounteddate , ""ACCOUNTEDUSER""=:Accounteduser , ""CREATEDDATE""=:Createddate , ""CREATEDUSER""=:Createduser WHERE  ""ASSETNO""=:Assetno";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteBaccountByAssetno
        public void DeleteBaccountByAssetno(string Assetno)
        {
            try
            {
                this.Database.AddInParameter(":Assetno", Assetno);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""BACCOUNT"" WHERE  ""ASSETNO""=:Assetno";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteBaccountByAssetno
        public void DeleteBaccountByAssetno(List<string> Assetnos)
        {
            try
            {
                if(Assetnos.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""BACCOUNT"" WHERE 1=1");
                if(Assetnos.Count==1)
                {
                    this.Database.AddInParameter(":Assetno"+0.ToString(),Assetnos[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETNO""=:Assetno0");
                }
                else if(Assetnos.Count>1&&Assetnos.Count<=2000)
                {
                    this.Database.AddInParameter(":Assetno"+0.ToString(),Assetnos[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETNO""=:Assetno0");
                    for (int i = 1; i < Assetnos.Count; i++)
                    {
                    this.Database.AddInParameter(":Assetno"+i.ToString(),Assetnos[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""ASSETNO""=:Assetno"+i.ToString());
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
