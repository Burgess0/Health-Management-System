using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.SessionState;

/// <summary>
/// ActionBase 这个是处理前端无页面的代码基类、继承他就相当于拥有了这个类的所有方法、功能Request、Response
/// </summary>
abstract public class ActionBase : AjaxAction ,IHttpHandler, IRequiresSessionState
{
    // 当前上下文的内容容器
    protected HttpContext _context = null;

    // 加载内容容器
    private void initContext(HttpContext context)
    {
        _context = context;
    }
    // 这个是系统要求的必须get 返回为true
    public bool IsReusable {
        get {
            return true;
        }
    }

    // 获取当前Request请求的对象
    public override HttpRequest Request
    {
        get
        {
            if (_context != null)
            {
                return _context.Request;
            }
            throw new Exception("Context null init");
            //return null;
        }
    }
    // 获取当前请求的Response 结果对象
    public override HttpResponse Response
    {
        get
        {
            if (_context != null)
            {
                return _context.Response;
            }
            throw new Exception("Context null init");
            //return null;
        }
    }

    // 获取当前会话的session 对象
    public override HttpSessionState Session
    {
        get
        {
            if (_context != null)
            {
                return _context.Session;
            }
            throw new Exception("Context null init");
            //return null;
        }
    }

    // 系统优先执行该方法、这个方法
    virtual public void ProcessRequest(HttpContext context)
    {
        initContext(context);  // 记录当前上下文的容器
        try
        {
            processInit(context);  // 告诉子类我要执行了，你可以先执行这个方法
            string action = Request["a"];  // 获取网址上的 a 参数有则 执行该方法
            if (action != null)
            {
                Type obj = this.GetType();  // 获取当前类的Type 映射对象
                MethodInfo method = obj.GetMethod(action);  // 获取映射方法的信息
                if (method != null)   // 该方法存在
                {
                    object result = null;  // 该方法执行返回的参数
                    try
                    {
                        result = method.Invoke(this, null);  // 执行该方法
                    }
                    catch (TargetInvocationException ex)  // 抛出的异常
                    {
                        throw ex.GetBaseException();  // 获取该方法执行遇到的错误
                    }

                    if (result != null)  // 返回参数不为null 的时候
                    {
                        if (result is Hashtable || result is Dictionary<string, object>) // 将这个参数抛出
                        {
                            throw new ResponseResult(Response, result, ResultType.JSON);  // 将这个返回结果抛出
                        }
                        else
                        {
                            throw new ResponseResult(Response, result, ResultType.BODY);  // 将这个返回结果抛出
                        }
                    }
                }
                
            }
            
            
        }
        catch (ResponseResult res)  // 接收抛出的结果
        {
            string content = res.output();
            
            Response.Write(content);  // 将数据写出前台
            Response.End();  // 会话结束
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);  // 写控制器内容
        }
    }

    virtual public void processInit(HttpContext context) {}


    // 这个是跳转方法
    protected void Redirect(string uri)
    {
        Response.Redirect(uri);
    }


    // 弹出提示框
    public void showMessage(string message, string uri = "history.go(-1)")
    {
        StringBuilder str = new StringBuilder();

        str.Append("<script>");
        str.Append("alert('" + message + "');");
        if (uri.Equals("history.go(-1)"))
        {
            str.Append(uri);
        }
        else
        {
            str.Append("location.href='" + uri + "'");
        }
        str.Append("</script>");
        Response.Write(str.ToString());
        Response.End();
        //throw new ResponseResult(Response,str.ToString() ,ResultType.BODY );
    }

    //  弹出提示框，并跳转到指定页面
    public void showSuccess(string message, string uri = "")
    {
        if (uri == null || uri.Equals(""))
        {
            uri = Request.Headers["referer"];
        }
        showMessage(message, uri);
    }
    //  弹出提示框，并跳转到上一页
    public void showError(string message)
    {
        showMessage(message);
    }
    // 判断是否有登录
    public bool checkLogin()
    {
        return Session["username"] != null && !Session["username"].Equals("");
    }

}