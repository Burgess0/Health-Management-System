using System;
using System.Collections;

namespace app.Dbs.Interface
{
    public interface ResultSet : IDisposable
    {
        /**
         * 查询一行
         */
        Hashtable fetch();
        
        object this[string name] { get; }
        object this[int name] { get; }
         
        bool hasNext();
        
        /**
         * 获取某列类型
         */
        string columnType(int i);
        
        /**
         * 获取列数
         */
        int columnCount();
        
        /**
         * 获取某列名称
         */
        string columnName(int i);
        
        /**
         * 获取列值为字符串
         */
        string getSting(int i);

        /**
         * 获取列值为整数
         */
        int getInt(int i);
        
        /**
         * 获取列值为float 浮点型
         */
        float getFloat(int i);
        
        /**
         * 获取列值为双精度浮点型
         */
        double getDouble(int i);
        
        /**
         * 获取列值为长整数
         */
        long getLong(int i);
    }
}