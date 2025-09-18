using System.Collections;
using System.Collections.Generic;
using app.Dbs.Interface;

// 快速执行sql 语句类
namespace app.Dbs
{
    public class Dao
    {
        // 根据sql 语句获取一行数据
        static public Hashtable find(string sql)
        {
            PDO pdo = new PDO();
            ResultSet resultSet = pdo.query(sql);
            Hashtable result = resultSet.hasNext() ? resultSet.fetch() : new Hashtable();
            resultSet.Dispose();
            pdo.Dispose();
            return result;
        }
        // 根据sql 语句查询所有数据
        static public List<Hashtable> select(string sql)
        {
            List<Hashtable> list = new List<Hashtable>();
            PDO pdo = new PDO();
            ResultSet resultSet = pdo.query(sql);
            while (resultSet.hasNext())
            {
                list.Add(resultSet.fetch());
            }
            resultSet.Dispose();
            pdo.Dispose();
            return list;
        }
        // 单纯执行sql 语句页就是 update 、 delete insert
        static public bool execute(string sql)
        {
            PDO pdo = new PDO();
            bool res = pdo.execute(sql);
            pdo.Dispose();
            return res;
        }
        
    }
}