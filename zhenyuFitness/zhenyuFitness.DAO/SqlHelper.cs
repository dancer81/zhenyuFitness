using System;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.IO;
using System.Collections;

namespace zhenyuFitness.DAO
{
    abstract public class SqlHelper
    {
        public abstract IDbConnection DBConn { get; }  //事务的时候用到

        public abstract IDbConnection GetDBConn();
        public abstract Boolean TestConn();

        public abstract int ExecSQL(string SqlStr);
        public abstract int ExecSQL(string SqlStr, params object[] ParaValues);

        public abstract DataSet DoSelect(string SqlStr);
        public abstract DataSet DoSelect(string SqlStr, params object[] ParaValues);

        public abstract DataTable DoSelectToTable(string SqlStr, string tablename);
        public abstract DataTable DoSelectToTable(string SqlStr, string tablename, params object[] ParaValues);

        public abstract IDataReader ExecReader(string SqlStr);
        public abstract IDataReader ExecReader(string SqlStr, params object[] ParaValues);

        public abstract object GetSingle(string SQLString);
        public abstract object GetSingle(string SQLString, params object[] ParaValues);

        public abstract int ExecuteSqlTran(List<String> SQLStringList);

        public abstract bool ColumnExists(string tableName, string columnName);
        public abstract bool TabExists(string TableName);

        #region 公共操作类

        #region 取得最大id+1
        public int GetMaxID(string FieldName, string TableName)
        {
            string strsql = "select max(" + FieldName + ")+1 from " + TableName;
            object obj = GetSingle(strsql);
            if (obj == null)
            {
                return 1;
            }
            else
            {
                return int.Parse(obj.ToString());
            }
        }
        #endregion

        #region 是否存在记录(不带参数)
        public bool HasRecord(string strSql)
        {
            object obj = GetSingle(strSql);

            if ((Object.Equals(obj, null)) || (Object.Equals(obj, System.DBNull.Value)))
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        #endregion

        #region 是否存在记录(带参数)
        public bool HasRecord(string strSql, params object[] ParaValues)
        {
            object obj = GetSingle(strSql, ParaValues);

            if ((Object.Equals(obj, null)) || (Object.Equals(obj, System.DBNull.Value)))
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        #endregion

        #endregion

    }


}
