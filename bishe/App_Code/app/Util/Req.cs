using System;
using System.Web;

namespace app.Util
{
    public class Req
    {
        // 获取当前上下文的 容器 Request
        public static HttpRequest Request
        {
            get
            {
                return HttpContext.Current.Request;
            }
        }
        // 获取当前上下文的 容器 response
        public static HttpResponse Response
        {
            get { return HttpContext.Current.Response; }
        }
        // 获取当前上下文的 容器 Server
        public static HttpServerUtility Server
        {
            get { return HttpContext.Current.Server; }
        }

        // 获取网址上的参数
        public static string get(string name, string def = "")
        {
            string value = Request[name];
            return value == null ? def : value;
        }
        // 获取网址上的参数 整数类型
        public static int getInt(string name, int def = 0)
        {
            string value = Request[name];
            return string.IsNullOrEmpty(value) ? def : int.Parse( value );
        }
        // 获取网址上的参数 浮点数类型
        public static double getDouble(string name, double def = 0.0f)
        {
            string value = Request[name];
            return string.IsNullOrEmpty(value) ? def : int.Parse( value );
        }
    }
}