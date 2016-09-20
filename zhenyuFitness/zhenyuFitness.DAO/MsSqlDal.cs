using System;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.IO;
using System.Collections;


namespace zhenyuFitness.DAO
{
    public class MssqlDal : SqlHelper
    {
        private SqlConnection F_Conn;
        private string connStr;
        private string DbLogPath;//数据库日志路径

        public MssqlDal(string DBConnStr, string dblogpath)
        {
            this.DbLogPath = dblogpath;
            connStr = DBConnStr;
            F_Conn = GetDBConn() as SqlConnection;
        }

        public override IDbConnection DBConn
        {
            get { return F_Conn; }
        }

        #region   连接数据库
        /// <summary>
        /// 连接数据库
        /// </summary>
        /// <returns>IDbConnection</returns>
        public override IDbConnection GetDBConn()
        {
            F_Conn = new SqlConnection(connStr);
            try
            {
                if (ConnectionState.Closed == F_Conn.State)
                {
                    F_Conn.Open();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                Global.WriteDbLogFile("数据库连接失败：" + ex.Message, DbLogPath);
            }
            return F_Conn;
        }
        #endregion

        #region   测试连接数据库
        /// <summary>
        /// 测试连接数据库
        /// </summary>
        /// <returns>Boolean</returns>
        public override Boolean TestConn()
        {
            using (SqlConnection Conn = new SqlConnection(connStr))
            {
                try
                {
                    Conn.Open();
                    return true;
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    Global.WriteDbLogFile("数据库连接失败：" + ex.Message, DbLogPath);
                    return false;
                }
            }
        }
        #endregion

        #region   执行SQL语句
        /// <summary>
        /// 执行不带参数的SQL语句
        /// </summary>
        /// <param name="SqlStr">要执行的SQL语句</param>
        /// <returns>返回影响行数</returns>
        public override int ExecSQL(string SqlStr)
        {
            using (SqlCommand cmd = new SqlCommand(SqlStr, F_Conn))
            {
                try
                {
                    int val = cmd.ExecuteNonQuery();
                    return val;
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    Global.WriteDbLogFile("执行SQL语句失败：" + ex.Message + "\n" + SqlStr, DbLogPath);
                    return 0;
                }
            }
        }

        /// <summary>
        /// 执行带参数的SQL语句
        /// </summary>
        /// <param name="SqlStr">要执行的SQL语句</param>
        /// <param name="ParaValues">传入的参数值</param>
        /// <returns>返回影响行数</returns>
        public override int ExecSQL(string SqlStr, params object[] ParaValues)
        {

            using (SqlCommand cmd = CreateSqlCommand(SqlStr, ParaValues))
            {
                try
                {
                    int val = cmd.ExecuteNonQuery();
                    return val;
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    Global.WriteDbLogFile("执行SQL语句失败：" + ex.Message + "\n" + SqlStr, DbLogPath);
                    return 0;
                }
            }
        }
        #endregion

        #region    返回数据集
        /// <summary>
        /// 返回数据集(不带参数)
        /// </summary>
        /// <param name="SqlStr">需要查询的SQL语句</param>
        /// <returns>DataSet</returns>
        public override DataSet DoSelect(string SqlStr)
        {
            try
            {
                SqlDataAdapter F_DataApt = new SqlDataAdapter(SqlStr, F_Conn);
                DataSet F_DataSet = new DataSet();
                F_DataApt.Fill(F_DataSet);
                return F_DataSet;
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                Global.WriteDbLogFile("查询SQL语句失败：" + ex.Message + "\n" + SqlStr, DbLogPath);
                return null;
            }
        }

        /// <summary>
        /// 返回数据集(带参数)
        /// </summary>
        /// <param name="SqlStr">需要查询的SQL语句</param>
        /// <param name="ParaValues">传入的参数值</param>
        /// <returns>DataSet</returns>
        public override DataSet DoSelect(string SqlStr, params object[] ParaValues)
        {
            using (SqlCommand cmd = CreateSqlCommand(SqlStr, ParaValues))
            {
                try
                {
                    SqlDataAdapter F_DataApt = new SqlDataAdapter();
                    F_DataApt.SelectCommand = cmd;
                    DataSet F_DataSet = new DataSet();
                    F_DataApt.Fill(F_DataSet);
                    return F_DataSet;
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    Global.WriteDbLogFile("查询SQL语句失败：" + ex.Message + "\n" + SqlStr, DbLogPath);
                    return null;
                }
            }
        }
        #endregion

        #region    返回DataTable
        /// <summary>
        /// 返回DataTable (不带参数)
        /// </summary>
        /// <param name="SqlStr">sql语句</param>
        /// <param name="tablename">自定义的表名</param>
        /// <returns>DataTable</returns>
        public override DataTable DoSelectToTable(string SqlStr, string tablename)
        {
            DataTable P_tbl;   //声明一个DataTable对象
            try
            {
                SqlDataAdapter F_DataApt = new SqlDataAdapter(SqlStr, F_Conn);
                P_tbl = new DataTable(tablename);
                F_DataApt.Fill(P_tbl);   //将表中对象放入P_tbl中
                return P_tbl;
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                Global.WriteDbLogFile("查询SQL语句失败：" + ex.Message + "\n" + SqlStr, DbLogPath);
                return null;
            }
        }

        /// <summary>
        /// 返回DataTable (带参数)
        /// </summary>
        /// <param name="SqlStr">sql语句</param>
        /// <param name="ParaValues">参数数组</param>
        /// <param name="tablename">自定义的表名</param>
        /// <returns>DataTable</returns>
        public override DataTable DoSelectToTable(string SqlStr, string tablename, params object[] ParaValues)
        {
            using (SqlCommand cmd = CreateSqlCommand(SqlStr, ParaValues))
            {
                DataTable P_tbl;   //声明一个DataTable对象
                try
                {
                    SqlDataAdapter F_DataApt = new SqlDataAdapter();
                    F_DataApt.SelectCommand = cmd;
                    P_tbl = new DataTable(tablename);
                    F_DataApt.Fill(P_tbl);   //将表中对象放入P_tbl中
                    return P_tbl;
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    Global.WriteDbLogFile("查询SQL语句失败：" + ex.Message + "\n" + SqlStr, DbLogPath);
                    return null;
                }
            }
        }

        #endregion

        #region   返回SqlDataReader类型数据

        /// <summary>
        /// 返回SqlDataReader类型数据(不带参数)
        /// </summary>
        /// <param name="SqlStr">要执行的SQL语句</param>
        /// <returns>SqlDataReader</returns>
        public override IDataReader ExecReader(string SqlStr)
        {
            using (SqlCommand cmd = new SqlCommand(SqlStr, F_Conn))
            {
                SqlDataReader P_Dr;
                try
                {
                    P_Dr = cmd.ExecuteReader();
                    return P_Dr;
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    Global.WriteDbLogFile("查询SQL语句失败：" + ex.Message + "\n" + SqlStr, DbLogPath);
                    return null;
                }
            }
        }

        /// <summary>
        /// 返回SqlDataReader类型数据(带参数)
        /// </summary>
        /// <param name="ParaValues">参数数组</param>
        /// <param name="SqlStr">要执行的SQL语句</param>
        /// <returns>SqlDataReader</returns>
        public override IDataReader ExecReader(string SqlStr, params object[] ParaValues)
        {
            using (SqlCommand cmd = CreateSqlCommand(SqlStr, ParaValues))
            {
                SqlDataReader P_Dr;
                try
                {
                    P_Dr = cmd.ExecuteReader();
                    return P_Dr;
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    Global.WriteDbLogFile("查询SQL语句失败：" + ex.Message + "\n" + SqlStr, DbLogPath);
                    return null;
                }
            }
        }
        #endregion

        #region 执行一条计算查询结果语句，返回查询结果（object）。
        /// <summary>
        /// 执行一条计算查询结果语句，返回查询结果（object）。
        /// </summary>
        /// <param name="SQLString">计算查询结果语句</param>
        /// <returns>查询结果（object）</returns>
        public override object GetSingle(string SQLString)
        {
            using (SqlCommand cmd = new SqlCommand(SQLString, F_Conn))
            {
                try
                {
                    object obj = cmd.ExecuteScalar();
                    if ((Object.Equals(obj, null)) || (Object.Equals(obj, System.DBNull.Value)))
                    {
                        return null;
                    }
                    else
                    {
                        return obj;
                    }
                }
                catch (System.Data.SqlClient.SqlException e)
                {
                    throw e;
                }
            }
        }

        /// <summary>
        /// 执行一条计算查询结果语句，返回查询结果（object）。
        /// </summary>
        /// <param name="SQLString">计算查询结果语句</param>
        /// <returns>查询结果（object）</returns>
        public override object GetSingle(string SQLString, params object[] ParaValues)
        {
            using (SqlCommand cmd = CreateSqlCommand(SQLString, ParaValues))
            {
                try
                {
                    object obj = cmd.ExecuteScalar();
                    if ((Object.Equals(obj, null)) || (Object.Equals(obj, System.DBNull.Value)))
                    {
                        return null;
                    }
                    else
                    {
                        return obj;
                    }
                }
                catch (System.Data.SqlClient.SqlException e)
                {
                    throw e;
                }
            }
        }
        #endregion

        #region   执行多条Sql语句(带事务)
        /// <summary>
        /// 执行多条SQL语句，实现数据库事务。
        /// </summary>
        /// <param name="SQLStringList">多条SQL语句</param>        
        public override int ExecuteSqlTran(List<String> SQLStringList)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = F_Conn;
                SqlTransaction tx = F_Conn.BeginTransaction();
                cmd.Transaction = tx;
                try
                {
                    int count = 0;
                    for (int n = 0; n < SQLStringList.Count; n++)
                    {
                        string strsql = SQLStringList[n];
                        if (strsql.Trim().Length > 1)
                        {
                            cmd.CommandText = strsql;
                            count += cmd.ExecuteNonQuery();
                        }
                    }
                    tx.Commit();
                    return count;
                }
                catch
                {
                    tx.Rollback();
                    return 0;
                }
            }
        }
        #endregion

        #region   准备sql语句
        /// <summary>
        /// 返回SqlDataReader类型数据(不带参数)
        /// </summary>
        /// <param name="SqlStr">要执行的SQL语句</param>
        /// <param name="values">参数数组</param>
        /// <returns>SqlCommand实例</returns>
        private SqlCommand CreateSqlCommand(string SqlStr, object[] values)
        {
            SqlCommand cmd = new SqlCommand(SqlStr, F_Conn);  //声明SqlCommand对象
            //从Sql语句中循环取得参数，并放到arrlist中
            ArrayList arrlist = new ArrayList();
            int j = 0;
            Boolean Find = false;
            for (int i = 0; i < SqlStr.Length; i++)
            {
                if (SqlStr[i] == '@')
                {
                    j = i;
                    Find = true;
                }
                if ((SqlStr[i] == ' ' || SqlStr[i] == ')' || SqlStr[i] == ',' || i == SqlStr.Length - 1) && Find == true) //参数结尾标志
                {
                    if (i == SqlStr.Length - 1 && SqlStr[i] != ')') arrlist.Add(SqlStr.Substring(j, i - j + 1));
                    else arrlist.Add(SqlStr.Substring(j, i - j));
                    Find = false;
                }
            }
            //赋值给参数
            if (arrlist.Count == values.Length)
            {
                for (int k = 0; k < arrlist.Count; k++)
                {
                    //cmd.Parameters.Add(arrlist[k], null);
                    //cmd.Parameters[k].Value = values[k];
                    //上面两名等同这句 
                    cmd.Parameters.AddWithValue(arrlist[k].ToString().Trim(), values[k]);
                }
            }
            else throw new Exception("参数的个数和传入值的个数不匹配！");
            return cmd;
        }

        #endregion

        #region 表是否存在
        /// <summary>
        /// 表是否存在
        /// </summary>
        /// <param name="TableName"></param>
        /// <returns></returns>
        public override bool TabExists(string TableName)
        {
            string strsql = "select count(*) from sysobjects where id = object_id(N'[" + TableName + "]') and OBJECTPROPERTY(id, N'IsUserTable') = 1";
            //string strsql = "SELECT count(*) FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[" + TableName + "]') AND type in (N'U')";
            object obj = GetSingle(strsql);
            int cmdresult;
            if ((Object.Equals(obj, null)) || (Object.Equals(obj, System.DBNull.Value)))
            {
                cmdresult = 0;
            }
            else
            {
                cmdresult = int.Parse(obj.ToString());
            }
            if (cmdresult == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        #endregion

        #region 字段是否存在
        /// <summary>
        /// 判断是否存在某表的某个字段
        /// </summary>
        /// <param name="tableName">表名称</param>
        /// <param name="columnName">列名称</param>
        /// <returns>是否存在</returns>
        public override bool ColumnExists(string tableName, string columnName)
        {
            string sql = "select count(1) from syscolumns where [id]=object_id('" + tableName + "') and [name]='" + columnName + "'";
            object res = GetSingle(sql);
            if (res == null)
            {
                return false;
            }
            return Convert.ToInt32(res) > 0;
        }
        #endregion

        #region 存储过程相关
        /// <summary>
        /// 构建SqlCommand,没有输出参数
        /// </summary>
        /// <param name="storedProcName"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        private SqlCommand BuildQueryCommand(string storedProcName, IDataParameter[] parameters)
        {
            SqlCommand command = new SqlCommand(storedProcName, F_Conn);
            command.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter parameter in parameters)
            {
                if (parameter != null)
                {
                    // 检查未分配值的输入参数,将其分配以DBNull.Value.
                    if ((parameter.Direction == ParameterDirection.InputOutput || parameter.Direction == ParameterDirection.Input) &&
                        (parameter.Value == null))
                    {
                        parameter.Value = DBNull.Value;
                    }
                    command.Parameters.Add(parameter);
                }
            }

            return command;
        }

        /// <summary>
        /// 执行存储过程，返回一个object
        /// </summary>
        /// <param name="storedProcName"></param>
        /// <param name="paramenters"></param>
        /// <returns></returns>
        public object RunProcedure(string storedProcName, IDataParameter[] paramenters)
        {
            SqlCommand command = BuildQueryCommand(storedProcName, paramenters);
            command.Parameters.AddWithValue("@RETURN_VALUE", "").Direction = ParameterDirection.ReturnValue;
            command.ExecuteScalar();
            return command.Parameters["@RETURN_VALUE"].Value;
        }
        #endregion

    }
}
