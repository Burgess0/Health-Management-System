using System;
using System.Configuration;
using app.Util;
using app.Dbs.Interface;
using app.Dbs.Exceptions;

namespace app.Dbs
{
    /**
     * 统一数据库管理器,其他数据库只需要实现，相应接口就能实现连接，以后会加入进去，分别实现，mysql、Order、sqllite
     */
    public class PDO : Interface.Connection
    {
        protected Interface.Connection _connection;
        private static string defConnStr = "DefaultConnection";

        private bool disposed = false;
        public PDO() : this(defConnStr)
        {

        }

        ~PDO()
        {
            //Req.Response.Output.WriteLine("close pdo");
            Dispose(false);
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected void Dispose(bool disposing)
        {
            if (!disposed)
            {
                disposed = true;
                _connection.Dispose();
            }
        }
        // 实体类、创建对应的配置信息中的链接字符串、在 web.config 中
        public PDO(string name)
        {
            var data = ConfigurationManager.ConnectionStrings[name];
            var providerName = data.ProviderName;
            var connectionString = data.ConnectionString;

            if (providerName.Equals("System.Data.SqlClient"))
            {
                // sql server
                _connection = new Connection.SqlServer(connectionString);
            }
                    }

        // 获取pdo 的类型
        public static string getPdoType()
        {
            var data = ConfigurationManager.ConnectionStrings[defConnStr];
            var providerName = data.ProviderName;
            var connectionString = data.ConnectionString;

            if (providerName.Equals("System.Data.SqlClient"))
            {
                // sql server
                return "sqlserver";
            }
            else if (providerName.Equals("MySql.Data.MySqlClient"))
            {
                return "mysql";
            }
            return "";
        }
        // 设置默认链接字符串
        public static void setConnection(string connName)
        {
            defConnStr = connName;
        }

        // 获取数据库链接
        public Interface.Connection Connection
        {
            get { return _connection; }
            set { _connection = value; }
        }

        // 执行查询sql语句
        public ResultSet query(string sql)
        {
            try
            {
                ResultSet res = Connection.query(sql);
                Console.WriteLine(sql);
                System.Diagnostics.Debug.WriteLine(sql);
                return res;
            }
            catch (SQLException ex)  // 抛出了sql 执行异常
            {
                var orginColor = Console.ForegroundColor;  //输出调试信息
                Console.ForegroundColor = ConsoleColor.Red;
                Console.Error.WriteLine("SQL:"+ex.Sql+"\nError:"+ex.Message);
                Console.ForegroundColor = orginColor;
                System.Diagnostics.Debug.WriteLine("SQL:"+ex.Sql+"\nError:"+ex.Message);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                System.Diagnostics.Debug.WriteLine(e.Message);
            }
            return new Result.SqlServerResultSet(null);
        }

        // 执行sql 语句
        public bool execute(string sql)
        {
            try
            {
                bool res = Connection.execute(sql);
                Console.WriteLine(sql);
                System.Diagnostics.Debug.WriteLine(sql);
                return res;
            }
            catch (SQLException ex)
            {
                var orginColor = Console.ForegroundColor;
                Console.ForegroundColor = ConsoleColor.Red;
                Console.Error.WriteLine("SQL:"+ex.Sql+"\nError:"+ex.Message);
                Console.ForegroundColor = orginColor;
                System.Diagnostics.Debug.WriteLine("SQL:"+ex.Sql+"\nError:"+ex.Message);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                System.Diagnostics.Debug.WriteLine(e.Message);
            }
            return false;
        }
        // 执行sql 语句并获取插入的id
        public long execute(string sql, bool insertId)
        {
            try
            {
                long res = Connection.execute(sql,insertId);
                Console.WriteLine(sql);
                System.Diagnostics.Debug.WriteLine(sql);
                return res;
            }
            catch (SQLException ex)
            {
                var orginColor = Console.ForegroundColor;
                Console.ForegroundColor = ConsoleColor.Red;
                Console.Error.WriteLine("SQL:"+ex.Sql+"\nError:"+ex.Message);
                Console.ForegroundColor = orginColor;
                System.Diagnostics.Debug.WriteLine("SQL:"+ex.Sql+"\nError:"+ex.Message);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                System.Diagnostics.Debug.WriteLine(e.Message);
            }
            return -1;
        }
        // 获取最后插入的id自增值
        public long lastInsertID()
        {
            return Connection.lastInsertID();
        }
        // 获取更新操作的行数
        public long affected_rows()
        {
            return Connection.affected_rows();
        }
    }
}
