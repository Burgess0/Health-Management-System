using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using fastJSON;

/// <summary>
/// AjaxAction Ajax 内容返回
/// </summary>
/// 
abstract public class AjaxAction
{
    abstract public HttpRequest Request
    {
        get;
    }
    abstract public HttpResponse Response
    {
        get;
    }

    abstract public HttpSessionState Session
    {
        get;
    }

    protected void jsonResult(object data, string message, int code)
    { 
        Dictionary<string , object> msg = new Dictionary<string,object>();
        msg.Add("code" , code);
        msg.Add("msg" , message);
        msg.Add("data" , data);
        throw new ResponseResult(Response,msg , ResultType.JSON);
    }


    protected void jsonResult(object data)
    {
        jsonResult(data , "" , 0);
    }

    protected void jsonResult(string message , int code = 1)
    {
        jsonResult(null , message , code);
    }
}