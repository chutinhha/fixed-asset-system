/********************************************************************
* File Name:LbfgsxmtManagement
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
    public partial class LbfgsxmtManagement:BaseManagement
    {
        #region Construct
        private const int ColumnCount = 28;
        public LbfgsxmtManagement()
        { }
        public LbfgsxmtManagement(BaseManagement baseManagement): base(baseManagement)
        { }
        #endregion

        #region CreateLbfgsxmt
        public Lbfgsxmt CreateLbfgsxmt(Lbfgsxmt info)
        {
            try
            {
                string sqlCommand = @"INSERT INTO ""LB_FGS_XMT"" (""XMTID"",""XMT"",""FGSID"",""FGS"",""XMTLX"",""WLLGLY"",""WLLGLYLXDH"",""KGRQ"",""JGRQ"",""JZMJ"",""ZHAOJIA"",""MGGRS"",""GJGGRS"",""TGGRS"",""NFGGRS"",""JZGGRS"",""QTGGRS"",""INSTANCEID"",""FAINSTANCEID"",""STATUS"",""CREATETIME"",""ISDELETE"",""FLOWID"",""DEPARTID"",""ORGANIZEID"",""DIYU"",""XMLX"",""ISUSE"") VALUES (:Xmtid,:Xmt,:Fgsid,:Fgs,:Xmtlx,:Wllgly,:Wllglylxdh,:Kgrq,:Jgrq,:Jzmj,:Zhaojia,:Mggrs,:Gjggrs,:Tggrs,:Nfggrs,:Jzggrs,:Qtggrs,:Instanceid,:Fainstanceid,:Status,:Createtime,:Isdelete,:Flowid,:Departid,:Organizeid,:Diyu,:Xmlx,:Isuse)";
                this.Database.AddInParameter(":Xmtid", info.Xmtid);//DBType:NUMBER
                this.Database.AddInParameter(":Xmt", info.Xmt);//DBType:VARCHAR2
                this.Database.AddInParameter(":Fgsid", info.Fgsid);//DBType:NUMBER
                this.Database.AddInParameter(":Fgs", info.Fgs);//DBType:VARCHAR2
                this.Database.AddInParameter(":Xmtlx", info.Xmtlx);//DBType:VARCHAR2
                this.Database.AddInParameter(":Wllgly", info.Wllgly);//DBType:VARCHAR2
                this.Database.AddInParameter(":Wllglylxdh", info.Wllglylxdh);//DBType:VARCHAR2
                this.Database.AddInParameter(":Kgrq", info.Kgrq);//DBType:DATE
                this.Database.AddInParameter(":Jgrq", info.Jgrq);//DBType:DATE
                this.Database.AddInParameter(":Jzmj", info.Jzmj);//DBType:NUMBER
                this.Database.AddInParameter(":Zhaojia", info.Zhaojia);//DBType:NUMBER
                this.Database.AddInParameter(":Mggrs", info.Mggrs);//DBType:NUMBER
                this.Database.AddInParameter(":Gjggrs", info.Gjggrs);//DBType:NUMBER
                this.Database.AddInParameter(":Tggrs", info.Tggrs);//DBType:NUMBER
                this.Database.AddInParameter(":Nfggrs", info.Nfggrs);//DBType:NUMBER
                this.Database.AddInParameter(":Jzggrs", info.Jzggrs);//DBType:NUMBER
                this.Database.AddInParameter(":Qtggrs", info.Qtggrs);//DBType:NUMBER
                this.Database.AddInParameter(":Instanceid", info.Instanceid);//DBType:NUMBER
                this.Database.AddInParameter(":Fainstanceid", info.Fainstanceid);//DBType:NUMBER
                this.Database.AddInParameter(":Status", info.Status);//DBType:NUMBER
                this.Database.AddInParameter(":Createtime", info.Createtime);//DBType:DATE
                this.Database.AddInParameter(":Isdelete", info.Isdelete);//DBType:NUMBER
                this.Database.AddInParameter(":Flowid", info.Flowid);//DBType:NUMBER
                this.Database.AddInParameter(":Departid", info.Departid);//DBType:NUMBER
                this.Database.AddInParameter(":Organizeid", info.Organizeid);//DBType:NUMBER
                this.Database.AddInParameter(":Diyu", info.Diyu);//DBType:VARCHAR2
                this.Database.AddInParameter(":Xmlx", info.Xmlx);//DBType:VARCHAR2
                this.Database.AddInParameter(":Isuse", info.Isuse);//DBType:NUMBER
                this.Database.ExecuteNonQuery(sqlCommand);

            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region UpdateLbfgsxmtByXmtid
        public Lbfgsxmt UpdateLbfgsxmtByXmtid(Lbfgsxmt info)
        {
            try
            {
                this.Database.AddInParameter(":Xmtid", info.Xmtid);//DBType:NUMBER
                this.Database.AddInParameter(":Xmt", info.Xmt);//DBType:VARCHAR2
                this.Database.AddInParameter(":Fgsid", info.Fgsid);//DBType:NUMBER
                this.Database.AddInParameter(":Fgs", info.Fgs);//DBType:VARCHAR2
                this.Database.AddInParameter(":Xmtlx", info.Xmtlx);//DBType:VARCHAR2
                this.Database.AddInParameter(":Wllgly", info.Wllgly);//DBType:VARCHAR2
                this.Database.AddInParameter(":Wllglylxdh", info.Wllglylxdh);//DBType:VARCHAR2
                this.Database.AddInParameter(":Kgrq", info.Kgrq);//DBType:DATE
                this.Database.AddInParameter(":Jgrq", info.Jgrq);//DBType:DATE
                this.Database.AddInParameter(":Jzmj", info.Jzmj);//DBType:NUMBER
                this.Database.AddInParameter(":Zhaojia", info.Zhaojia);//DBType:NUMBER
                this.Database.AddInParameter(":Mggrs", info.Mggrs);//DBType:NUMBER
                this.Database.AddInParameter(":Gjggrs", info.Gjggrs);//DBType:NUMBER
                this.Database.AddInParameter(":Tggrs", info.Tggrs);//DBType:NUMBER
                this.Database.AddInParameter(":Nfggrs", info.Nfggrs);//DBType:NUMBER
                this.Database.AddInParameter(":Jzggrs", info.Jzggrs);//DBType:NUMBER
                this.Database.AddInParameter(":Qtggrs", info.Qtggrs);//DBType:NUMBER
                this.Database.AddInParameter(":Instanceid", info.Instanceid);//DBType:NUMBER
                this.Database.AddInParameter(":Fainstanceid", info.Fainstanceid);//DBType:NUMBER
                this.Database.AddInParameter(":Status", info.Status);//DBType:NUMBER
                this.Database.AddInParameter(":Createtime", info.Createtime);//DBType:DATE
                this.Database.AddInParameter(":Isdelete", info.Isdelete);//DBType:NUMBER
                this.Database.AddInParameter(":Flowid", info.Flowid);//DBType:NUMBER
                this.Database.AddInParameter(":Departid", info.Departid);//DBType:NUMBER
                this.Database.AddInParameter(":Organizeid", info.Organizeid);//DBType:NUMBER
                this.Database.AddInParameter(":Diyu", info.Diyu);//DBType:VARCHAR2
                this.Database.AddInParameter(":Xmlx", info.Xmlx);//DBType:VARCHAR2
                this.Database.AddInParameter(":Isuse", info.Isuse);//DBType:NUMBER
                string sqlCommand = @"UPDATE ""LB_FGS_XMT"" SET  ""XMT""=:Xmt , ""FGSID""=:Fgsid , ""FGS""=:Fgs , ""XMTLX""=:Xmtlx , ""WLLGLY""=:Wllgly , ""WLLGLYLXDH""=:Wllglylxdh , ""KGRQ""=:Kgrq , ""JGRQ""=:Jgrq , ""JZMJ""=:Jzmj , ""ZHAOJIA""=:Zhaojia , ""MGGRS""=:Mggrs , ""GJGGRS""=:Gjggrs , ""TGGRS""=:Tggrs , ""NFGGRS""=:Nfggrs , ""JZGGRS""=:Jzggrs , ""QTGGRS""=:Qtggrs , ""INSTANCEID""=:Instanceid , ""FAINSTANCEID""=:Fainstanceid , ""STATUS""=:Status , ""CREATETIME""=:Createtime , ""ISDELETE""=:Isdelete , ""FLOWID""=:Flowid , ""DEPARTID""=:Departid , ""ORGANIZEID""=:Organizeid , ""DIYU""=:Diyu , ""XMLX""=:Xmlx , ""ISUSE""=:Isuse WHERE  ""XMTID""=:Xmtid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
            return info;
        }
        #endregion

        #region DeleteLbfgsxmtByXmtid
        public void DeleteLbfgsxmtByXmtid(decimal Xmtid)
        {
            try
            {
                this.Database.AddInParameter(":Xmtid", Xmtid);//DBType:NUMBER
                string sqlCommand = @"DELETE FROM  ""LB_FGS_XMT"" WHERE  ""XMTID""=:Xmtid";
                this.Database.ExecuteNonQuery(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

        #region DeleteLbfgsxmtByXmtid
        public void DeleteLbfgsxmtByXmtid(List<decimal> Xmtids)
        {
            try
            {
                if(Xmtids.Count==0){ return ;}
                StringBuilder sqlCommand = new StringBuilder();
                sqlCommand.AppendLine(@"DELETE FROM  ""LB_FGS_XMT"" WHERE 1=1");
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

                this.Database.ExecuteNonQuery(sqlCommand.ToString());
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion


        #region RetrieveAllLbfgsxmt
        public List<Lbfgsxmt> RetrieveAllLbfgsxmt()
        {
            try
            {
                string sqlCommand = @"SELECT * FROM lb_fgs_xmt ";
                return this.Database.ExecuteToList<Lbfgsxmt>(sqlCommand);
            }
            finally
            {
                this.Database.ClearParameter();
            }
        }
        #endregion

    }
}
