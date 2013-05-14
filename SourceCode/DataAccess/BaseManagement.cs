using System;
using System.Configuration;
using System.Data.Common;
using System.Collections.Generic;
using System.Data;
using System.Text;
using SeallNet.Data;

namespace FixedAsset.DataAccess
{
    abstract public class BaseManagement
    {
        protected BaseManagement()
        {
        }
        protected BaseManagement(BaseManagement management)
        {
            this.m_DataBase = management.Database;
        }

        #region Database
        private Database m_DataBase;
        protected Database Database
        {
            get
            {
                if (this.m_DataBase == null)
                {
                    if (ConfigurationManager.ConnectionStrings["FixedAsset"] == null) { throw new ConfigurationErrorsException(string.Format(@"请配置项目：ConnectionStrings/FixedAsset。")); }
                    var connectionString = ConfigurationManager.ConnectionStrings["FixedAsset"].ConnectionString;
                    this.m_DataBase = new Database(DataBaseCategory.Oracle,connectionString);
                }

                return this.m_DataBase;
            }
        }

        #endregion

        #region BeginTransaction

        public void BeginTransaction()
        {
            this.Database.BeginTransaction();
        }

        #endregion

        #region Commit

        public void Commit()
        {
            this.Database.Commit();
        }

        #endregion

        #region Rollback

        public void Rollback()
        {
            this.Database.Rollback();
        }

        #endregion

        #region Paging Retrieve DbDataReader
        public virtual List<T> ExecuteReaderPaging<T>(string sqlCommand,int pageIndex,int pageSize,out int count)
        {
            string getCountStatement, getTableStatement;
            this.ParsePagingQuerystring(sqlCommand, pageIndex, pageSize, out getCountStatement, out getTableStatement);
            count = Convert.ToInt32(this.Database.ExecuteScalar(getCountStatement));
            var dataReader = this.Database.ExecuteReader(getTableStatement);
            return this.Database.DataReaderMap<T>(dataReader);
        }

        /// <summary>
        /// 分页查询DbDataReader
        /// </summary>
        /// <param name="statement">要执行的SQL查询语句，必须包括SELECT、FROM、ORDER BY等，WHERE可选</param>
        /// <param name="pageIndex">页码</param>
        /// <param name="pageSize">每页的大小</param>
        /// <param name="count">返回总记录数</param>
        /// <returns>符合条件的数据集</returns>
        /// <example>
        /// ExecuteDataTablePaging("SELECT [FID],[ParentFID],[SubForumCount],[Name] FROM NCPT_Forums ORDER BY FID", 0, 10, out count);
        /// </example>
        public virtual DbDataReader ExecuteReaderPaging(string statement, int pageIndex, int pageSize, out int count)
        {
            string getCountStatement, getTableStatement;
            this.ParsePagingQuerystring(statement, pageIndex, pageSize, out getCountStatement, out getTableStatement);

            count = Convert.ToInt32(this.Database.ExecuteScalar(getCountStatement));
            if(count>1000)
            {
                count = 1000;
            }
            var dataReader = this.Database.ExecuteReader(getTableStatement);
            return dataReader;
        }

        #region ParsePagingQuerystring

        /// <summary>
        /// Oracle 分页参考文档:http://blog.sina.com.cn/s/blog_8604ca230100vro9.html
        /// </summary>
        /// <param name="statement"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="getCountStatement"></param>
        /// <param name="getTableStatement"></param>
        private void ParsePagingQuerystring(string statement, int pageIndex, int pageSize, out string getCountStatement, out string getTableStatement)
        {
            string sqlStatement = statement.ToUpper();
            var indexOfSelect = sqlStatement.IndexOf("SELECT ");
            var indexOfFrom = sqlStatement.IndexOf(" FROM ");
            var indexOfWhere = sqlStatement.IndexOf(" WHERE ");
            var indexOfOrderBy = sqlStatement.IndexOf("ORDER BY");
            if (indexOfSelect == -1)
            {
                throw new ArgumentException(@"Statement must include ""SELECT "".", statement);
            }
            if (indexOfFrom == -1)
            {
                throw new ArgumentException(@"Statement must include "" FROM "".", statement);
            }
            //if (indexOfOrderBy == -1)
            //{
            //    throw new ArgumentException(@"Statement must include ""ORDER BY"".", statement);
            //}
            var fields = statement.Substring(indexOfSelect + "SELECT ".Length, indexOfFrom - (indexOfSelect + "SELECT ".Length)).Trim();

            var tables = string.Empty;
            if (indexOfWhere == -1)
            {
                tables = statement.Substring(indexOfFrom + " FROM ".Length, indexOfOrderBy - (indexOfFrom + " FROM ".Length));
            }
            else
            {
                tables = statement.Substring(indexOfFrom + " FROM ".Length, indexOfWhere - (indexOfFrom + " FROM ".Length));
            }
            string condition = string.Empty; 
            if (indexOfWhere != -1)
            {
                condition = statement.Substring(indexOfWhere + " WHERE ".Length, indexOfOrderBy - (indexOfWhere + " WHERE ".Length));
            }
            getCountStatement = "SELECT COUNT(*) FROM " + tables;
            if (!string.IsNullOrEmpty(condition))
            {
                getCountStatement += " WHERE " + condition;
                getCountStatement += " AND ROWNUM<10000 ";
            }
            else
            {
                getCountStatement += " WHERE ROWNUM<10000 ";
            }
            var order = string.Empty;
            if (indexOfOrderBy != -1)
            {
                order = statement.Substring(indexOfOrderBy + "ORDER BY".Length, statement.Length - (indexOfOrderBy + "ORDER BY".Length));
            }
            var columns = this.GetColumns(fields); 
            var stringBuilder = new StringBuilder(); 
            stringBuilder.Append("SELECT ");
            stringBuilder.Append(columns[0]);
            for (int i = 1; i < columns.Length; ++i)
            {
                stringBuilder.Append("," + columns[i]);
            } 
            stringBuilder.AppendFormat(" FROM (SELECT {0}, ROWNUM AS RowNumber FROM {1}", fields, tables);
            if (!string.IsNullOrEmpty(condition))
            {
                stringBuilder.AppendFormat(" WHERE {0}", condition);
                stringBuilder.Append("  AND ROWNUM<10000");
            }
            else
            {
                stringBuilder.Append(" WHERE ROWNUM<10000");
            }
            stringBuilder.Append(" ORDER BY ").Append(order).Append(" ");

            stringBuilder.AppendFormat(") TempTable WHERE RowNumber BETWEEN {0} AND {1}", pageIndex * pageSize + 1, (pageIndex + 1) * pageSize);

//            stringBuilder.AppendFormat(@"SELECT * FROM (
//                                        SELECT A.*,ROWNUM SearchRowNum FROM ({0}) A WHERE  ROWNUM<={2}) WHERE SearchRowNum>={1}", sqlStatement, pageIndex * pageSize + 1, (pageIndex + 1) * pageSize);

            getTableStatement = stringBuilder.ToString();
        }

        #endregion

        #region GetColumns

        private string[] GetColumns(string fields)
        {
            var columns = fields.Split(',');

            for (int i = 0; i < columns.Length; ++i)
            {
                var column = columns[i];
                int indexOfAs = column.IndexOf(" AS ");
                int indexOfEqule = column.IndexOf("=");

                if (indexOfAs != -1)
                {
                    column = column.Substring(indexOfAs + " AS ".Length).Trim();
                }
                else if (indexOfEqule != -1)
                {
                    column = column.Substring(0, indexOfEqule);
                }

                int indexOfPoint = column.LastIndexOf(".");

                if (indexOfPoint != -1)
                {
                    column = column.Substring(indexOfPoint + ".".Length);
                }

                columns[i] = column.Trim();
            }

            return columns;
        }

        #endregion

        #endregion
    }
}
