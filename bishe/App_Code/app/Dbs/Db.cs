using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using app.Dbs.Builder;
using app.Dbs.Collects;
using app.Dbs.Interface;
using app.Util;

// sql 语句参数设置
namespace app.Dbs
{
    public class Db
    {
        protected string mName = "";
        protected Hashtable mOption;
        protected Hashtable mData;
        protected Builders builder;
        protected string pk = "id";
        //protected SqlConnection conn = null;
        // 创建实例
        public Db()
        {
            mOption = new Hashtable();
            mData = new Hashtable();
            builder = Builders.make(this);
        }
        // 创建实例、并设置表名称
        public Db(string table) : this()
        {
            setName(table);
            //this.mName = table;
        }

        ~Db()
        {
            //conn.Close();
        }
        // 静态类设置表
        public static Db name(string table)
        {
            return new Db(table);
        }

        // 设置条件
        public Db where(string name)
        {
            Hashtable list = new Hashtable();
            list.Add("where", name);
            getOptionArrayList("where").Add(list);
            return this;
        }
        // 设置条件如： and name='value'
        public Db where(string name, object value)
        {
            return where(name, null, value, null);
        }
        // 设置条件如： and  {name}{eq}{value}
        public Db where(string name, string eq, object value)
        {
            return where(name, eq, value, null);
        }
        // 设置条件如： {connect}  {name}{eq}{value}
        public Db where(string name, string eq, object value, string connect)
        {
            Hashtable list = new Hashtable();
            list["name"] = name;
            list.Add("exp", eq == null ? "=" : eq);
            list.Add("value", value == null ? "" : value);
            list.Add("connect", connect == null ? "and" : connect);

            getOptionArrayList("where").Add(list);
            return this;
        }
        // 设置条件如： and  {field} in({inArray})
        public Db whereIn(string field , string inArray)
        {
            string[] arr = inArray.Split(',');
            return where(field , "in" , arr);
        }
        // 设置条件如： and  {field} in({inArray})
        public Db whereIn(string field , string[] inArray)
        {
            return where(field , "in" , inArray);
        }
        // 设置条件如： and  {field} in({inArray})
        public Db whereIn(string field , int[] inArray)
        {
            return where(field , "in" , inArray);
        }
        // 设置条件如： and  {field} in({inArray})
        public Db whereInNot(string field , string inArray)
        {
            string[] arr = inArray.Split(',');
            return where(field , "not in" , arr);
        }
        // 设置条件如： and  {field} between ({inArray})
        public Db whereBetween(string field , string inArray)
        {
            string[] arr = inArray.Split(',');
            return where(field , "between" , arr);
        }
        // 设置条件如： and  {field} between '{start}' and '{end}'
        public Db whereBetween(string field , string start , string end)
        {
            return where(field , "between" , "'"+start+"' AND '"+end+"'");
        }
        // 设置条件如： and  {field} not between ({inArray})
        public Db whereBetweenNot(string field , string inArray)
        {
            string[] arr = inArray.Split(',');
            return where(field , "not between" , arr);
        }

        // 设置条件如： and  {field} not between '{start}' and '{end}'
        public Db whereBetweenNot(string field , string start , string end)
        {
            return where(field , "not between" , "'"+start+"' AND '"+end+"'");
        }

        // 设置更新字段 累加 step 如：set {field}={field}+{step}
        public Db inc(string field, double step = 1)
        {
            if (step < 1) step = 1;
            ArrayList list = new ArrayList();
            list.Add("inc");
            list.Add(step);
            mData.Add(field, list);
            return this;
        }
        // 设置更新字段 减 step 如：set {field}={field}-{step}
        public Db dec(string field, double step = 1)
        {
            if (step < 1) step = 1;
            ArrayList list = new ArrayList();
            list.Add("dec");
            list.Add(step);
            mData.Add(field, list);
            return this;
        }
        // 直接更新 累加 step 如：set {field}={field}+{step}
        public bool setInc(string field, object step)
        {
            return inc(field, double.Parse(step.ToString())).update();
        }
        // 直接更新 累加 step 如：set {field}={field}-{step}
        public bool setDec(string field, object step)
        {
            return dec(field, double.Parse(step.ToString())).update();
        }
        // 直接某字段的值 如：set {field}={step}
        public bool setField(string field, object step)
        {
            mData[field] = step;
            return update();
        }

        // 数据表的值
        public Db data(Hashtable data)
        {
            foreach (var item in data.Keys)
            {
                mData[item] = data[item];
            }

            return this;
        }
        /// 设置数据表的值
        public Db data(String name, object value)
        {
            mData.Add(name, value);
            return this;
        }
        // 执行更新
        public bool update()
        {
            return update(null);
        }
        // 执行更新
        public bool update(Hashtable updateData)
        {
            if (updateData != null)
            {
                data(updateData);
                //HashtableUtil.extend(true, mData, updateData);
            }
            ArrayList where = getOptionArrayList("where");
            if (where.Count == 0)
            {
                string pk = getPk();
                if (!mData.ContainsKey(pk))
                {
                    return false;
                }
                this.where(pk,mData[pk]);
            }
            string sql = builder.buildUpdate();
            return executeUpdate(sql);
        }

        // 分页并返回数据行
        public Collect<Hashtable> page(int pagesize )
        {
            Db c = new Db(getName());
            HashtableUtil.extend(true , c.mOption , mOption);

            // 总长度
            long count = c.count();
            Collect<Hashtable> result = new Collect<Hashtable>( count , pagesize);
            this.limit(result.firstRow , result.listRows);
            builder.setPage(true);
            selectCollect(result);
            builder.setPage(false);
            return result;
        }
        // 获取数据行
        protected void selectCollect(Collect<Hashtable> collect)
        {
            if (collect == null)
            {
                throw new NullReferenceException("collect 列不能为Null");
            }
            string sql = builder.buildSelect();

            PDO pdo = new PDO();
            ResultSet resultSet = pdo.query(sql);
            while (resultSet.hasNext())
            {
                collect.Add(resultSet.fetch());
            }
            resultSet.Dispose();
            pdo.Dispose();
        }
        // 执行更新语句
        public bool executeUpdate(string sql)
        {
            bool res = false;
            PDO pdo = new PDO();
            try
            {
                res = pdo.execute(sql);
            }
            catch (Exception e)
            {
                string message = e.Message;
                Console.WriteLine("SQL execute Error");
                Console.WriteLine("Message:" + message);
                //e.printStackTrace();
            }
            finally
            {
                pdo.Dispose();
            }

            return res;
        }
        // 执行插入
        public long insert(Hashtable insertData)
        {
            return insert(insertData, false);
        }

        // 执行插入语句
        public long executeInsert(string sql)
        {
            PDO pdo = new PDO();
            long lastID = -1;
            try
            {
                System.Diagnostics.Debug.WriteLine(sql);
                lastID = pdo.execute(sql, true);
            }
            catch (Exception e)
            {
                string message = e.Message;
                Console.WriteLine("SQL execute Error");
                Console.WriteLine("Message:" + message);
            }
            finally
            {
                pdo.Dispose();
            }
            return lastID;
        }
        // 执行插入
        public long insert(Hashtable insertData, bool replace)
        {
            if (insertData != null)
            {
                data(insertData);
            }

            string sql = builder.buildInsert(replace);
            return executeInsert(sql);
        }
        // 设置表名
        public Db setName(string name)
        {
            mName = name;
            return this;
        }
        // 获取表名
        public String getName()
        {
            return mName;
        }
        // 设置属性
        public Db setAttribute(String name, Object value)
        {
            getOptionHashtables("data").Add(name, value);
            return this;
        }
        //  获取对象属性
        public Object getAttribute(String name)
        {
            return getOptionHashtables("data")[name];
        }
        // 设置所有字段
        public Db field()
        {
            return field("*");
        }
        // 设置字段属性
        public Db field(string field)
        {
            getOptionArrayList("field").Add(field);
            return this;
        }
        // 设置其他表
        public Db table(string nTable)
        {
            getOptionArrayList("table").Add(nTable);
            return this;
        }
        // 设置表
        public Db table(string nTable, string alias)
        {
            getOptionArrayList("table").Add(nTable + " " + alias);
            return this;
        }
        // 获取行数
        public Db limit(int nLimit)
        {
            //getOptionHashMap("limit").put("limit" , String.valueOf(nLimit));
            return limit((nLimit).ToString());
        }
        // 设置起始位置、和获取行数
        public Db limit(int offset, int nLimit)
        {
            return limit((offset).ToString(), (nLimit).ToString());
        }
        // 设置是否需要锁
        public Db locks(bool lo )
        {
            return this.locks (lo ? " FOR UPDATE " : "");
        }
        // 设置锁
        public Db locks(string lo)
        {
            getOption().Add("lock",  lo);
            return this;
        }
        // 获取行数
        public Db limit(string nLimit)
        {
            if (nLimit.IndexOf(",") != -1)
            {
                String[] list = nLimit.Split(',');
                return limit(list[0], list[1]);
            }
            getOptionHashtables("limit").Add("limit", nLimit);
            return this;
        }
        // 设置起始位置、和获取行数
        public Db limit(string offset, string nLimit)
        {
            Hashtable map = getOptionHashtables("limit");
            map.Add("limit", nLimit);
            map.Add("offset", offset);
            return this;
        }
        // 获取一行数据
        public Hashtable find(object id)
        {
            where(pk, id);
            return find();
        }
        // 获取一行数据
        public Hashtable find()
        {
            //limit(1);
            string sql = builder.buildSelect();
            PDO pdo = new PDO();
            ResultSet resultSet = pdo.query(sql);
            Hashtable hashtable = null;
            if (resultSet.hasNext())
            {
                hashtable = resultSet.fetch();
            }
            else
            {
                hashtable = new Hashtable();
            }
            resultSet.Dispose();
            pdo.Dispose();
            return  hashtable;
        }
        //  获取统计信息
        protected double total(string f, string func)
        {
            string ifnull = builder.parseIfNull(func + "(" + f + ")", "0");
            string field = ifnull + " count";
            if (mOption.ContainsKey("field"))
            {
                getOptionArrayList("field").Clear();
            }

            getOptionArrayList("field").Add(field);
            Hashtable data = find();
            if (data.ContainsKey("count"))
            {
                string count = data["count"].ToString();
                return double.Parse(count);
            }
            return 0;
        }
        // 获取某列求和统计
        public double sum(string field)
        {
            return total(field, "SUM");
        }
        // 获取某列平均值
        public double avg(string field)
        {
            return total(field, "AVG");
        }
        // 获取某列最大值
        public double max(string field)
        {
            return total(field, "MAX");
        }
        // 获取某列最小值
        public double min(string field)
        {
            return total(field, "MIN");
        }
        // 获取行数
        public long count()
        {
            return count(null);
        }
        // 获取某字段行数
        public long count(string field)
        {
            if (field == null)
            {
                if (mOption.ContainsKey("alias"))
                {
                    field = "count(" + mOption["alias"] + ".id) count";
                }
                else
                {
                    field = "count(*) count";
                }
            }
            else
            {
                field = "count(" + field + ") count";
            }
            if (mOption.ContainsKey("field"))
            {
                mOption["field"] = new ArrayList();
                //mOption.Add("field", new ArrayList());
                //getOptionArrayList("field").clear();
            }
            if (mOption.ContainsKey("order"))
            {
                mOption.Remove("order");
            }
            getOptionArrayList("field").Add(field);
            Hashtable data = find();
            if (data.ContainsKey("count"))
            {
                return long.Parse((string) data["count"]);
            }
            return 0;
        }
        // 删除数据
        public bool delete(ArrayList ids)
        {
            where(getPk(), "in", ids);
            return delete();
        }
        // 删除数据
        public bool delete(int id)
        {
            where(getPk(), id);
            return delete();
        }
        // 删除数据
        public bool delete(string id)
        {
            if (id.IndexOf(",") != -1)
            {
                where(getPk(), "in", id);
            }
            else
            {
                where(getPk(), id);
            }

            return delete();
        }
        // 删除数据
        public bool delete()
        {
            if (!mOption.ContainsKey("where"))
            {
                return false;
            }
            string sql = this.builder.buildDelete();
            return executeUpdate(sql);
        }
        // 获取某列的所有数据
        public List<string> column(string field)
        {
            List<string> result = new List<string>();

            string sql = builder.buildSelect();

            PDO pdo = new PDO();
            ResultSet resultSet = pdo.query(sql);
            while (resultSet.hasNext())
            {
                Hashtable hashtable = resultSet.fetch();
                result.Add(hashtable[field].ToString());
            }
            resultSet.Dispose();
            pdo.Dispose();
            return result;
        }
        // 获取两列的所有数据，并形成键对值
        public Hashtable column(string field , string key)
        {
            Hashtable result = new Hashtable();

            string sql = builder.buildSelect();

            PDO pdo = new PDO();
            ResultSet resultSet = pdo.query(sql);
            while (resultSet.hasNext())
            {
                Hashtable hashtable = resultSet.fetch();
                var k = hashtable[key];
                var v = hashtable[field];
                result[k] = v;
            }
            resultSet.Dispose();
            pdo.Dispose();
            return result;
        }
        // 查询数据行
        public List<Hashtable> select()
        {
            List<Hashtable> result = new List<Hashtable>();
            string sql = builder.buildSelect();

            PDO pdo = new PDO();
            ResultSet resultSet = pdo.query(sql);
            while (resultSet.hasNext())
            {
                result.Add(resultSet.fetch());
            }
            resultSet.Dispose();
            pdo.Dispose();
            return result;
        }

        // 获取第一行 第一列的数据
        public string value(string name)
        {
            if(!mOption.ContainsKey("field")){
                field(name);
            }
            Hashtable data = find();
            if(data.Count == 0){
                return "";
            }
            return (string)data[name];
        }

        // 设置sql 分组 如：group by {nGroup}
        public Db group(string nGroup)
        {
            getOptionArrayList("group").Add(nGroup);
            return this;
        }

        // 设置sql 排序 如：order by {nOrder}
        public Db order(string nOrder)
        {
            getOptionArrayList("order").Add(nOrder);
            return this;
        }
        // 设置sql 排序 如：order by {nOrder} {sort}
        public Db order(string nOrder , string sort)
        {
            getOptionArrayList("order").Add(nOrder+" "+sort);
            return this;
        }

        // 设置sql 排序 如：order by {nOrder} desc
        public Db orderDesc(string field)
        {
            return order(field+" DESC");
        }
        // 设置sql 排序 如：order by {nOrder} asc
        public Db orderASC(string field)
        {
            return order(field+" ASC");
        }

        // 设置sql 全链接 如：INNER JOIN {table} ON {cond}
        public Db joinInner(string table , string cond)
        {
            return join(table , cond , "INNER");
        }
        // 设置sql 右链接 如：right JOIN {table} ON {cond}
        public Db joinRight(string table , string cond)
        {
            return join(table , cond , "RIGHT");
        }
        // 设置sql 左链接 如：LEFT JOIN {table} ON {cond}
        public Db joinLeft(string table , string cond)
        {
            return join(table , cond , "LEFT");
        }

        // 设置sql 链接 如：JOIN {table} ON {cond}
        public Db join(string table , string cond , string type)
        {
            string buffer=(" ")+(type) + (" JOIN ") + (table) + (" ON ") + (cond);
            getOptionArrayList("join").Add(buffer);
            return this;
        }
        // 设置sql 表别名 如：FROM {table} AS {name}
        public Db alias(String name)
        {
            mOption.Add("alias" , name);
            return this;
        }

        protected ArrayList resultSetList = new ArrayList();

        // 获取表的主键
        virtual public string getPk()
        {
            return "id";
        }
        // 设置表的主键
        public void setPk(string pk)
        {
            this.pk = pk;
        }

        // 获取option 的值，没右则创建Hashtable对象
        private Hashtable getOptionHashtables(string name)
        {
            if (!mOption.ContainsKey(name))
            {
                mOption.Add(name, new Hashtable());
            }

            return (Hashtable) mOption[name];
        }
        // 获取option 的值，没右则创建ArrayList对象
        private ArrayList getOptionArrayList(string name)
        {
            if (!mOption.ContainsKey(name))
            {
                mOption.Add(name, new ArrayList());
            }
            return (ArrayList) mOption[name];
        }

        // 获取数据集
        public Hashtable getData()
        {
            return mData;
        }

        // 获取设置的option对象
        public Hashtable getOption()
        {
            return mOption;
        }
    }
}
