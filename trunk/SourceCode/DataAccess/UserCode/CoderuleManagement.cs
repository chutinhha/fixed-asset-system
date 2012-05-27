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
                this.Database.AddInParameter(":Codeprefix", codeprefix);
                string sqlCommand = @"SELECT * FROM CODERULE WHERE  ""CODEPREFIX""=:Codeprefix";
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

        #region Private Methods
        private string ToLengthString(int currentNum, int width)
        {
            var content = new StringBuilder();
            for (int ii = 0; ii < width - currentNum.ToString().Length; ii++)
            {
                content.Append("0");
            }
            content.Append(currentNum.ToString());
            return content.ToString();
        }
        #endregion

        /// <summary>
        /// //编码格式：前缀+年+月+流水号（3位）,例如：201106001
        /// </summary>
        /// <param name="codePreFix"></param>
        /// <returns></returns>
        public string GenerateCodeRule(string  codePreFix,bool isDefaultYYYYMMDD)
        {
            if (string.IsNullOrEmpty(codePreFix))
            {
                return string.Empty;
            }
            var codeRules = this.RetrieveCoderuleByCodeprefix(codePreFix);
            if (codeRules == null)
            {
                codeRules = new Coderule();
                codeRules.Codeprefix = codePreFix;
                codeRules.Currentno = 0;
                //codeRules.Isneedcodeprefix = 1;
                codeRules.Isneedcodeprefix = true;
                codeRules.Isdefault = isDefaultYYYYMMDD;
                codeRules.Startnumber = 1;
                codeRules.Numberwidth = 4;
                try
                {
                    this.BeginTransaction();
                    this.CreateCoderule(codeRules);
                    this.Commit();
                }
                catch{this.Rollback();}
            }
            var content = new StringBuilder();
            //if (codeRules.Isneedcodeprefix==1)
            if (codeRules.Isneedcodeprefix)
            {
                content.Append(codeRules.Codeprefix);
            }
            //switch (codeRules.CodeMode)
            //{
            //    case CodeMode.Day:
            //        if (codeRules.YearWidth == 4)
            //        {
            if(codeRules.Isdefault)
            {content.Append(DateTime.Today.ToString("yyyyMMdd"));}
            //        }
            //        else
            //        {
            //            content.Append(DateTime.Today.ToString("yyMMdd"));
            //        }
            //        break;
            //    case CodeMode.Month:
            //        if (codeRules.YearWidth == 4)
            //        {
            //            content.Append(DateTime.Today.ToString("yyyyMM"));
            //        }
            //        else
            //        {
            //            content.Append(DateTime.Today.ToString("yyMM"));
            //        }
            //        break;
            //    case CodeMode.Year:
            //        if (codeRules.YearWidth == 4)
            //        {
            //            content.Append(DateTime.Today.ToString("yyyy"));
            //        }
            //        else
            //        {
            //            content.Append(DateTime.Today.ToString("yy"));
            //        }
            //        break;
            //    default:
            //        break;
            //}
            if (codeRules.Currentno == 0)
            {
                codeRules.Currentno = codeRules.Startnumber;
            }
            else
            {
                codeRules.Currentno += 1;
            }
            content.Append(ToLengthString((int)codeRules.Currentno, (int)codeRules.Numberwidth));
            codeRules.Currentserialnumber = content.ToString();
            this.UpdateCoderuleByCodeprefix(codeRules);
            return codeRules.Currentserialnumber;
        }
    }
}
