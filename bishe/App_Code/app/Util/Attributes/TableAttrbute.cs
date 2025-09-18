using System;

namespace app.Common.Attributes
{
    public class TableAttrbute : System.Attribute
    {
        private string m_remark;
        public TableAttrbute(string name)
        {
            m_remark = name;
        }
        public string Remark
        {
            get { return m_remark; }
            set { m_remark = value; }
        }

        public static string GetTableName(Type type)
        {
            object[] attrs=type.GetCustomAttributes(typeof(TableAttrbute) , false);
            string name = "";
            foreach (TableAttrbute attr in attrs)
            {
                name = attr.Remark;
            }

            return name;
        }
        
    }
}