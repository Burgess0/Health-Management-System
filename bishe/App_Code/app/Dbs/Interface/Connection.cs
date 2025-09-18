using System;
using System.Collections;

namespace app.Dbs.Interface
{
    public interface Connection : IDisposable
    {
        /**
         * 查询语句,失败返回null
         */
        ResultSet query(string sql);
        
        /**
         * 执行语句
         */
        bool execute(string sql);
        
        /**
         * 执行语句
         */
        long execute(string sql,bool insertId);
        /**
         * 获取最后插入行
         */
        long lastInsertID();
        
        /**
         * 获取更新的行数
         */
        long affected_rows();


    }
}