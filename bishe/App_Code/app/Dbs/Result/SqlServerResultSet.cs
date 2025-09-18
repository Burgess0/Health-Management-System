using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using app.Dbs.Interface;

namespace app.Dbs.Result
{
    public class SqlServerResultSet : ResultSet
    {
        protected SqlDataReader reader;
        private bool disposed = false;
        public SqlServerResultSet(SqlDataReader reader)
        {
            this.reader = reader;
        }
        
        ~SqlServerResultSet()
        {
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
                System.Diagnostics.Debug.WriteLine("dispose");
                disposed = true;
                if (reader != null)
                {
                    reader.Close();
                    reader.Dispose();
                }
            }
        }

        public bool hasNext()
        {
            return reader!=null && reader.Read();
        }
        
        public Hashtable fetch()
        {
            Hashtable table = new Hashtable();
            int length = columnCount();
            for (int i = 0; i < length; i++)
            {
                string columnName = this.columnName(i);
                string columnValue = getSting(i);
                if (columnValue == null || columnValue.ToLower().Equals("null"))
                {
                    columnValue = "";
                }
                table[columnName] = columnValue;
            }
            return table;
        }
        
        public object this[string name]
        {
            get
            {
                return reader[name];
            }
        }
        
        public object this[int name]
        {
            get
            {
                return reader[name];
            }
        }
        
        protected List<string> columnList = null;
        protected List<string> getColmnList()
        {
            if (columnList != null)
            {
                return columnList;
            }
            int length = columnCount();
            columnList = new List<string>(length);
            for (int i = 0; i < length; i++)
            {
                columnList.Add(columnName(i));
            }
            return columnList;
        }

        public string columnType(int i)
        {
            return reader.GetDataTypeName(i);
        }

        public int columnCount()
        {
            return reader.FieldCount;
        }
        public string columnName(int i)
        {
            return reader.GetName(i);
        }
        public string getSting(int i)
        {
            return Convert.ToString(reader[i]);
        }
        public int getInt(int i)
        {
            return reader.GetInt32(i);
        }
        public float getFloat(int i)
        {
            return reader.GetFloat(i);
        }
        public double getDouble(int i)
        {
            return reader.GetDouble(i);
        }
        
        public long getLong(int i)
        {
            return reader.GetInt64(i);
        }
    }
}