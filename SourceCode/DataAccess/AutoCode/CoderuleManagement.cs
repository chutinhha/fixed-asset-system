/********************************************************************
* File Name:CoderuleManagement
* Copyright (C) 2012 Bruce.huang 
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
        #region Construct
        private const int ColumnCount = 9;
        public CoderuleManagement()
        { }
        public CoderuleManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateCoderule
        public Coderule CreateCoderule(Coderule info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""CODERULE"" (""CODEPREFIX"",""RULENAME"",""ISNEEDCODEPREFIX"",""ISDEFAULT"",""STARTNUMBER"",""NUMBERWIDTH"",""YEARWIDTH"",""CURRENTNO"",""CURRENTSERIALNUMBER"") VALUES (:Codeprefix,:Rulename,:Isneedcodeprefix,:Isdefault,:Startnumber,:Numberwidth,:Yearwidth,:Currentno,:Currentserialnumber)";
                this.Database.AddInParameter(":Codeprefix", info.Codeprefix);//DBType:VARCHAR2
                this.Database.AddInParameter(":Rulename", info.Rulename);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Isneedcodeprefix", info.Isneedcodeprefix);//DBType:NUMBER
                this.Database.AddInParameter(":Isdefault", info.Isdefault);//DBType:NUMBER
                this.Database.AddInParameter(":Startnumber", info.Startnumber);//DBType:NUMBER
                this.Database.AddInParameter(":Numberwidth", info.Numberwidth);//DBType:NUMBER
                this.Database.AddInParameter(":Yearwidth", info.Yearwidth);//DBType:NUMBER
                this.Database.AddInParameter(":Currentno", info.Currentno);//DBType:NUMBER
                this.Database.AddInParameter(":Currentserialnumber", info.Currentserialnumber);//DBType:VARCHAR2
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateCoderuleByCodeprefix
        public Coderule UpdateCoderuleByCodeprefix(Coderule info)
        {
            try
            {
                this.Database.AddInParameter(":Codeprefix", info.Codeprefix);//DBType:VARCHAR2
                this.Database.AddInParameter(":Rulename", info.Rulename);//DBType:NVARCHAR2
                this.Database.AddInParameter(":Isneedcodeprefix", info.Isneedcodeprefix);//DBType:NUMBER
                this.Database.AddInParameter(":Isdefault", info.Isdefault);//DBType:NUMBER
                this.Database.AddInParameter(":Startnumber", info.Startnumber);//DBType:NUMBER
                this.Database.AddInParameter(":Numberwidth", info.Numberwidth);//DBType:NUMBER
                this.Database.AddInParameter(":Yearwidth", info.Yearwidth);//DBType:NUMBER
                this.Database.AddInParameter(":Currentno", info.Currentno);//DBType:NUMBER
                this.Database.AddInParameter(":Currentserialnumber", info.Currentserialnumber);//DBType:VARCHAR2
                string sqlCommand = @"UPDATE ""CODERULE"" SET  ""RULENAME""=:Rulename , ""ISNEEDCODEPREFIX""=:Isneedcodeprefix , ""ISDEFAULT""=:Isdefault , ""STARTNUMBER""=:Startnumber , ""NUMBERWIDTH""=:Numberwidth , ""YEARWIDTH""=:Yearwidth , ""CURRENTNO""=:Currentno , ""CURRENTSERIALNUMBER""=:Currentserialnumber WHERE  ""CODEPREFIX""=:Codeprefix";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteCoderuleByCodeprefix
        public void DeleteCoderuleByCodeprefix(string Codeprefix)
        {
            try
            {
                this.Database.AddInParameter(":Codeprefix", Codeprefix);//DBType:VARCHAR2
                string sqlCommand = @"DELETE FROM  ""CODERULE"" WHERE  ""CODEPREFIX""=:Codeprefix";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteCoderuleByCodeprefix
        public void DeleteCoderuleByCodeprefix(List<string> Codeprefixs)
        {
            try
            {
                if(Codeprefixs.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""CODERULE"" WHERE 1=1");
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
