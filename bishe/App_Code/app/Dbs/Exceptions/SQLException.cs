using System;

namespace app.Dbs.Exceptions
{
    /// <summary>
    /// 执行sql 语句异常时这个语句执行
    /// </summary>
    class SQLException : Exception
    {

        protected string sql;
        protected int code;
        /// <summary>
        /// 构造异常
        /// </summary>
        /// <param name="sql">数据库语句</param>
        /// <param name="message">异常文字描述</param>
        /// <param name="code">异常代码</param>
        public SQLException(string sql,string message, int code) : base(message)
        {
            this.sql = sql;
            this.code = code;
        }
        /// <summary>
        /// 获取异常sql 语句
        /// </summary>
        public string Sql
        {
            get
            {
                return sql;
            }
        }
        /// <summary>
        /// 获取异常代码
        /// </summary>
        public int Code
        {
            get { return code; }
        }
        /// <summary>
        /// 获取sql 语句
        /// </summary>
        /// <returns></returns>
        public string getSql()
        {
            return sql;
        }

        /// <summary>
        /// 获取异常代码
        /// </summary>
        /// <returns></returns>
        public int getCode()
        {
            return code;
        }
        /// <summary>
        /// 获取异常消息
        /// </summary>
        /// <returns></returns>
        public string getError()
        {
            return Message;
        }
        
    }
}