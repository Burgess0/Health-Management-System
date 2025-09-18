<%@ WebHandler Language="C#" Class="Image" %>

using System;
using System.Web;
using app.Util;
using System.Web.SessionState;

public class Image : IHttpHandler, IRequiresSessionState
{
    // 生成验证码的代码、
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "image/gif";

        Captch captch = new Captch();  // 创建生成验证码的类
        string code = captch.GetRandomCode(4);  // 获取4位随机数
        context.Session["random"] = code;  // 写入当前会话的session 中

        byte[] bytes = captch.GetVCode(code);  // 生成图片内存数据

        context.Response.BinaryWrite(bytes);  // 将数据输出到浏览器形成图片的形式查看
        context.Response.End(); // 结束
        
    }
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}