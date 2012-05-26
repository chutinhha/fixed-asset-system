/********************************************************************
* File Name:CoderuleManagement
* Copyright (C) 2012 Bruce.Huang 
* Creater & Date:Bruce.huang - 2012-05-26
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
    public partial class CoderuleManagement:BaseManagement
    {
        #region RetrieveCoderuleByCodeprefix
        public Coderule RetrieveCoderuleByCodeprefix(string codeprefix)
        {
            try
            {
                this.Database.AddInParameter(":CODEPREFIX", codeprefix);
                string sqlCommand = @"SELECT * FROM CODERULE WHERE  CODEPREFIX=:CODEPREFIX";
                return this.Database.ExecuteToSingle<Coderule>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveCoderuleByCodeprefix
        public List<Coderule> RetrieveCoderuleByCodeprefix(List<string> Codeprefixs)
        {
            try
            {
                if(Codeprefixs.Count==0){ return new List<Coderule>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""CODERULE"" WHERE 1=1");
                if(Codeprefixs.Count==1)
                {
                    this.Database.AddInParameter(":Codeprefix"+0.ToString(),Codeprefixs[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""CODEPREFIX""=:Codeprefix0");
                }
                else if(Codeprefixs.Count>1&&Codeprefixs.Count<=2000)
                {
                    this.Database.AddInParameter(":Codeprefix"+0.ToString(),Codeprefixs[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""CODEPREFIX""=:Codeprefix0");
                    for (int i = 1; i < Codeprefixs.Count; i++)
                    {
                    this.Database.AddInParameter(":Codeprefix"+i.ToString(),Codeprefixs[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""CODEPREFIX""=:Codeprefix"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""CODEPREFIX"" DESC");
                return this.Database.ExecuteToList<Coderule>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
