/********************************************************************
* File Name:LbfgsManagement
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
    public partial class LbfgsManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 7;
        public LbfgsManagement()
        { }
        public LbfgsManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateLbfgs
        public Lbfgs CreateLbfgs(Lbfgs info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""LB_FGS"" (""FGSID"",""FGS"",""FGSSORTID"",""FGLD"",""FGLDLXDH"",""WLLZGY"",""WLLZGYLXDH"") VALUES (:Fgsid,:Fgs,:Fgssortid,:Fgld,:Fgldlxdh,:Wllzgy,:Wllzgylxdh)";
                this.Database.AddInParameter(":Fgsid", info.Fgsid);//DBType:NUMBER
                this.Database.AddInParameter(":Fgs", info.Fgs);//DBType:VARCHAR2
                this.Database.AddInParameter(":Fgssortid", info.Fgssortid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Fgld", info.Fgld);//DBType:VARCHAR2
                this.Database.AddInParameter(":Fgldlxdh", info.Fgldlxdh);//DBType:VARCHAR2
                this.Database.AddInParameter(":Wllzgy", info.Wllzgy);//DBType:VARCHAR2
                this.Database.AddInParameter(":Wllzgylxdh", info.Wllzgylxdh);//DBType:VARCHAR2
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateLbfgsByFgsid
        public Lbfgs UpdateLbfgsByFgsid(Lbfgs info)
        {
            try
            {
                this.Database.AddInParameter(":Fgsid", info.Fgsid);//DBType:NUMBER
                this.Database.AddInParameter(":Fgs", info.Fgs);//DBType:VARCHAR2
                this.Database.AddInParameter(":Fgssortid", info.Fgssortid);//DBType:VARCHAR2
                this.Database.AddInParameter(":Fgld", info.Fgld);//DBType:VARCHAR2
                this.Database.AddInParameter(":Fgldlxdh", info.Fgldlxdh);//DBType:VARCHAR2
                this.Database.AddInParameter(":Wllzgy", info.Wllzgy);//DBType:VARCHAR2
                this.Database.AddInParameter(":Wllzgylxdh", info.Wllzgylxdh);//DBType:VARCHAR2
                string sqlCommand = @"UPDATE ""LB_FGS"" SET  ""FGS""=:Fgs , ""FGSSORTID""=:Fgssortid , ""FGLD""=:Fgld , ""FGLDLXDH""=:Fgldlxdh , ""WLLZGY""=:Wllzgy , ""WLLZGYLXDH""=:Wllzgylxdh WHERE  ""FGSID""=:Fgsid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteLbfgsByFgsid
        public void DeleteLbfgsByFgsid(decimal Fgsid)
        {
            try
            {
                this.Database.AddInParameter(":Fgsid", Fgsid);//DBType:NUMBER
                string sqlCommand = @"DELETE FROM  ""LB_FGS"" WHERE  ""FGSID""=:Fgsid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteLbfgsByFgsid
        public void DeleteLbfgsByFgsid(List<decimal> Fgsids)
        {
            try
            {
                if(Fgsids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""LB_FGS"" WHERE 1=1");
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
