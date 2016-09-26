using System;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.IO;
using System.Collections;

namespace zhenyuFitness.DAO
{
    public static class Global
    {
        #region 全局变量
        public static string connectionString = "Data Source = 127.0.0.1;Initial Catalog = zhenyuFitness;User Id = sa;Password = 47lou207`;";
        //public static string DbLogPath = Directory.GetCurrentDirectory();
        //public static string dbLogPath = Server.MapPath("~/DbLog");
        #endregion




        #region 通用方法
        /// <summary>
        /// 写数据库出错日志
        /// </summary>
        /// <param name="input">日志内容</param>
        /// <param name="logPath">日志目录</param>
        public static void WriteDbLogFile(string input, string DbLogPath)
        {
            ///指定日志文件的目录
            string fname =  DbLogPath + "\\" + DateTime.Now.Date.ToString("yyyy-MM-dd") + ".dberror";//.ToShortDateString().ToString();
                                                                                  ///定义文件信息对象
            FileInfo finfo = new FileInfo(fname);

            if (!finfo.Exists)
            {
                FileStream fs;
                fs = File.Create(fname);
                fs.Close();
                finfo = new FileInfo(fname);
            }

            ///创建只写文件流
            using (FileStream fs = finfo.OpenWrite())
            {
                /**/
                ///根据上面创建的文件流创建写数据流
                StreamWriter w = new StreamWriter(fs);

                /**/
                ///设置写数据流的起始位置为文件流的末尾
                w.BaseStream.Seek(0, SeekOrigin.End);

                /**/
                ///写入“Log Entry : ”
                w.Write("Log Entry : ");

                /**/
                ///写入当前系统时间并换行
                w.Write(" \r\n {0} {1} \r\n ", DateTime.Now.ToLongTimeString(),
                    DateTime.Now.ToLongDateString());

                /**/
                ///写入日志内容并换行
                w.Write(input + " \r\n ***************************************************************************************************************** \r\n ");
                /**/
                ///清空缓冲区内容，并把缓冲区内容写入基础流
                w.Flush();
                /**/
                ///关闭写数据流
                w.Close();
            }

        }

        #region 字符串类
        /// <summary>
        /// 判断字符串长度
        /// </summary>
        /// <param name="str"></param>
        /// <param name="minLength"></param>
        /// <param name="maxLength"></param>
        /// <returns></returns>
        public static bool CheckStringLength(string str, int minLength, int maxLength)
        {
            if (str.Length > maxLength || str.Length < minLength) return false;
            return true;
        }
        #endregion
        #endregion

    }
}
