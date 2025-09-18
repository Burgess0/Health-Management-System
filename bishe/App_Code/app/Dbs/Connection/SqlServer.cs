using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

using app.Dbs.Interface;
using app.Dbs.Result;
using System.Diagnostics;
using app.Dbs.Exceptions;

namespace app.Dbs.Connection
{
    /// <summary>
    /// 链接sql server 数据库
    /// </summary>
    public class SqlServer : Dbs.Interface.Connection
    {
        private string connStr;
        private bool disposed = false;
        protected static SqlConnection _connection = null;

        /// <summary>
        /// 构造类
        /// </summary>
        /// <param name="connStr">链接数据库语句</param>
        public SqlServer( string connStr )
        {
            this.connStr = connStr;
            if (_connection == null && !string.IsNullOrEmpty(connStr))
            {
                _connection = new SqlConnection(connStr);
            }

        }

        ~SqlServer()
        {
            Dispose(false);
        }
        /// <summary>
        /// 释放资源
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            //GC.SuppressFinalize(this);
        }
        /// <summary>
        /// 释放资源
        /// </summary>
        /// <param name="disposing"></param>
        protected void Dispose(bool disposing)
        {
            if (disposed == false)
            {
                disposed = true;
                System.Diagnostics.Debug.WriteLine("close Connect");
                if (_connection.State == ConnectionState.Open)
                {
                    _connection.Close();
                    //_connection.Dispose();
                }
            }
        }
        /// <summary>
        /// 获取数据库链接类，如果没链接、已关闭数据库则链接数据库
        /// </summary>
        /// <returns></returns>
        /// <exception cref="SQLException"></exception>
        public SqlConnection GetConnection()
        {
            try
            {
                if (_connection.State == ConnectionState.Closed)
                {
                    _connection.Open();
                }
            }
            catch (SqlException ex)
            {
                throw new SQLException(connStr , "数据库连接错误："+ex.Message , ex.ErrorCode);

            }catch (Exception ex)
            {
                throw new SQLException(connStr, "数据库连接错误："+ex.Message, 0);
            }
            return _connection;
        }
        /// <summary>
        /// 最后插入得id
        /// </summary>
        /// <returns></returns>
        public long insert_id()
        {
            SqlConnection connection = GetConnection();
            SqlCommand cmd = new SqlCommand("SELECT @@IDENTITY as ID" , connection);
            object reader = cmd.ExecuteScalar();
            long last_id = Convert.ToInt64(reader);
            return last_id;
        }
        /// <summary>
        /// 查询数据库
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        /// <exception cref="SQLException"></exception>
        public ResultSet query(string sql)
        {
            try
            {
                Trace.WriteLine(sql);
                SqlConnection connection = GetConnection();
                SqlCommand cmd = new SqlCommand(sql, connection);
                SqlDataReader reader = cmd.ExecuteReader();
                SqlServerResultSet resultSet = new SqlServerResultSet(reader);
                return resultSet;
            }catch(SqlException ex){
                 throw new SQLException(sql , ex.Message , ex.ErrorCode);
             }catch (Exception ex)
             {
                 throw new SQLException(sql, ex.Message, 0);
             }
            return new SqlServerResultSet(null);
        }

        protected long _affected_rows = 0;

        /// <summary>
        /// 执行sql 语句
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        /// <exception cref="SQLException"></exception>
        public bool execute(string sql)
        {
            try
            {
                Trace.WriteLine(sql);
                SqlConnection connection = GetConnection();
                SqlCommand cmd = new SqlCommand(sql , connection);
                _affected_rows = cmd.ExecuteNonQuery();
                return _affected_rows > 0;
            }catch(SqlException ex){
              throw new SQLException(sql , ex.Message , ex.ErrorCode);
          }catch (Exception ex)
          {
              throw new SQLException(sql, ex.Message, 0);
          }

            return false;

        }
        /// <summary>
        /// 执行sql 语句，
        /// </summary>
        /// <param name="sql">语句</param>
        /// <param name="insertId">是否获取插入id</param>
        /// <returns></returns>
        /// <exception cref="SQLException"></exception>
        public long execute(string sql, bool insertId)
        {
            try
            {
                Trace.WriteLine(sql);
                SqlConnection connection = GetConnection();
                string cmdSql = sql + ";\r\n SELECT @@IDENTITY as ID";
                SqlCommand cmd = new SqlCommand(cmdSql, connection);
                return Convert.ToInt64(cmd.ExecuteScalar().ToString());
            }
            catch(SqlException ex){
                 throw new SQLException(sql , ex.Message , ex.ErrorCode);
             }catch (Exception ex)
             {
                 throw new SQLException(sql, ex.Message, 0);
             }
            return -1;
        }
        /// <summary>
        /// 获取插入后得id
        /// </summary>
        /// <returns></returns>
        public long lastInsertID()
        {
            return insert_id();
        }
        /// <summary>
        /// 获取影响行数
        /// </summary>
        /// <returns></returns>
        public long affected_rows()
        {
            return _affected_rows;
        }
    }
}