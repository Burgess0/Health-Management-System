using System;

// Http 异常
namespace app.Util
{
    public class HttpException : Exception
    {
        public HttpException(string data) : base(data)
        {
            
        }
    }
}