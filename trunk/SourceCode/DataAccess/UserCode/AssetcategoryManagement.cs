/********************************************************************
* File Name:AssetcategoryManagement
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
    public partial class AssetcategoryManagement:BaseManagement
    {
        #region RetrieveAssetcategoryByAssetcategoryid
        public Assetcategory RetrieveAssetcategoryByAssetcategoryid(string assetcategoryid)
        {
            try
            {
                this.Database.AddInParameter(":ASSETCATEGORYID", assetcategoryid);
                string sqlCommand = @"SELECT * FROM ASSETCATEGORY WHERE  ASSETCATEGORYID=:ASSETCATEGORYID";
                return this.Database.ExecuteToSingle<Assetcategory>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        public List<Assetcategory>   RetrieveAllAssetcategory()
        {
            string sqlCommand = @"SELECT * FROM ASSETCATEGORY ";
            return this.Database.ExecuteToList<Assetcategory>(sqlCommand);
        }
        #endregion
        #region RetrieveAssetcategoryByAssetcategoryid
        public List<Assetcategory> RetrieveAssetcategoryByParentAssetcategoryid(List<string> parentAssetcategoryids)
        {
            try
            {
                if (parentAssetcategoryids.Count == 0) { return new List<Assetcategory>(); }
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETCATEGORY"" WHERE 1=1");
                if (parentAssetcategoryids.Count == 1)
                {
                    this.Database.AddInParameter(":ASSETPARENTCATEGORYID" + 0.ToString(), parentAssetcategoryids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETPARENTCATEGORYID""=:ASSETPARENTCATEGORYID0");
                }
                else if (parentAssetcategoryids.Count > 1 && parentAssetcategoryids.Count <= 2000)
                {
                    this.Database.AddInParameter(":ASSETPARENTCATEGORYID" + 0.ToString(), parentAssetcategoryids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETPARENTCATEGORYID""=:ASSETPARENTCATEGORYID0");
                    for (int i = 1; i < parentAssetcategoryids.Count; i++)
                    {
                        this.Database.AddInParameter(":ASSETPARENTCATEGORYID" + i.ToString(), parentAssetcategoryids[i]);//DBType:VARCHAR2
                        sqlCommand.AppendLine(@" OR ""ASSETPARENTCATEGORYID""=:ASSETPARENTCATEGORYID" + i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""ASSETCATEGORYID"" DESC");
                return this.Database.ExecuteToList<Assetcategory>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetcategoryByAssetcategoryid
        public List<Assetcategory> RetrieveAssetcategoryByAssetcategoryid(List<string> Assetcategoryids)
        {
            try
            {
                if(Assetcategoryids.Count==0){ return new List<Assetcategory>();}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"SELECT *  FROM  ""ASSETCATEGORY"" WHERE 1=1");
                if(Assetcategoryids.Count==1)
                {
                    this.Database.AddInParameter(":Assetcategoryid"+0.ToString(),Assetcategoryids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND ""ASSETCATEGORYID""=:Assetcategoryid0");
                }
                else if(Assetcategoryids.Count>1&&Assetcategoryids.Count<=2000)
                {
                    this.Database.AddInParameter(":Assetcategoryid"+0.ToString(),Assetcategoryids[0]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" AND (""ASSETCATEGORYID""=:Assetcategoryid0");
                    for (int i = 1; i < Assetcategoryids.Count; i++)
                    {
                    this.Database.AddInParameter(":Assetcategoryid"+i.ToString(),Assetcategoryids[i]);//DBType:VARCHAR2
                    sqlCommand.AppendLine(@" OR ""ASSETCATEGORYID""=:Assetcategoryid"+i.ToString());
                    }
                    sqlCommand.AppendLine(" )");
                }

                sqlCommand.AppendLine(@" ORDER BY ""ASSETCATEGORYID"" DESC");
                return this.Database.ExecuteToList<Assetcategory>(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region RetrieveAssetcategorysPaging
//        public List<Assetcategory> RetrieveAssetcategorysPaging(AssetcategorySearch info,int pageIndex, int pageSize,out int count)
//        {
//            try
//            {
//                StringBuilder sqlCommand = new StringBuilder(@" SELECT ""ASSETCATEGORY"".""ASSETCATEGORYID"",""ASSETCATEGORY"".""ASSETPARENTCATEGORYID"",""ASSETCATEGORY"".""ASSETCATEGORYNAME"",""ASSETCATEGORY"".""REMARK"",""ASSETCATEGORY"".""CREATEDATE"",
//                     ""ASSETCATEGORY"".""CREATOR""
//                     FROM ""ASSETCATEGORY"" 
//                     WHERE 1=1");
//                if (!string.IsNullOrEmpty(info.Assetcategoryid))
//                {
//                    this.Database.AddInParameter(":Assetcategoryid",DbType.AnsiString,"%"+info.Assetcategoryid+"%");
//                    sqlCommand.AppendLine(@" AND ""ASSETCATEGORY"".""ASSETCATEGORYID"" LIKE :Assetcategoryid");
//                }
//                if (!string.IsNullOrEmpty(info.Assetparentcategoryid))
//                {
//                    this.Database.AddInParameter(":Assetparentcategoryid",DbType.AnsiString,"%"+info.Assetparentcategoryid+"%");
//                    sqlCommand.AppendLine(@" AND ""ASSETCATEGORY"".""ASSETPARENTCATEGORYID"" LIKE :Assetparentcategoryid");
//                }
//                if (!string.IsNullOrEmpty(info.Assetcategoryname))
//                {
//                    this.Database.AddInParameter(":Assetcategoryname", "%"+info.Assetcategoryname+"%");
//                    sqlCommand.AppendLine(@" AND ""ASSETCATEGORY"".""ASSETCATEGORYNAME"" LIKE :Assetcategoryname");
//                }
//                if (!string.IsNullOrEmpty(info.Remark))
//                {
//                    this.Database.AddInParameter(":Remark", "%"+info.Remark+"%");
//                    sqlCommand.AppendLine(@" AND ""ASSETCATEGORY"".""REMARK"" LIKE :Remark");
//                }
//                if (!string.IsNullOrEmpty(info.Creator))
//                {
//                    this.Database.AddInParameter(":Creator",DbType.AnsiString,"%"+info.Creator+"%");
//                    sqlCommand.AppendLine(@" AND ""ASSETCATEGORY"".""CREATOR"" LIKE :Creator");
//                }

//                sqlCommand.AppendLine(@"  ORDER BY ""ASSETCATEGORY"".""ASSETCATEGORYID"" DESC");
//                return this.ExecuteReaderPaging<Assetcategory>(sqlCommand.ToString(), pageIndex, pageSize, out count);
//            }
//            finally
//            {
//                this.Database.ClearParameter();
//            }
//        }
        #endregion
    }
}
