using System.Collections.Specialized;
using System.Text;
using System.Web.Services.Description;

namespace app.Util
{
    public class UrlBuild
    {
        // URL 路径构建
        static public string build(string path , string param)
        {
            StringBuilder stringBuilder = new StringBuilder();
            string[] paths = path.Split('/');
            paths[1] = paths[1].Substring(0, 1).ToUpper() + paths[1].Substring(1);
            stringBuilder.Append(paths[1]);
            if (paths[0].Equals("admin"))
            {
                stringBuilder.Append("_");
            }
            stringBuilder.Append(paths[2]);
            stringBuilder.Append(".aspx");
            if (param != null && !param.Equals(""))
            {
                stringBuilder.Append("?").Append(param);
            }

            return stringBuilder.ToString();
        }
        static public string build(string path , NameValueCollection param)
        {
            StringBuilder stringBuilder = new StringBuilder();
            var i = 0;
            foreach (string key in param.AllKeys)
            {
                if (i > 0)
                {
                    stringBuilder.Append("&");
                }
                var value = param[key];
                stringBuilder.Append(key).Append("=").Append(System.Web.HttpUtility.UrlEncode(value));
                i++;
            }
            return build(path, stringBuilder.ToString());
        }
        
    }
    
}