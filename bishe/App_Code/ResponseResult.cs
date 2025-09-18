using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Web;

public class ResultType
{
    public const int BODY = 1;
    public const int JSON = 2;
    public const int REDIRECT = 3;    
}


/// <summary>
/// ResponseResult 结果集异常类
/// </summary>

public class ResponseResult : Exception
{
    public object content = null;
    private int type;
    public HttpResponse response;
    public ResponseResult()
    {
    }

    public ResponseResult(HttpResponse response, object data, int types)
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
        this.response = response;
        this.content = data;
        this.type = types;
	}

    public override string Message 
    {
        get
        {
            return output();
        }
    }

    virtual public string output()
    {
        switch (this.type)
        {
            case 1:
                return this.content.ToString();
            case 2:
                return fastJSON.JSON.ToJSON(this.content);
        }
        return "";
    }

    public NameValueCollection Headers 
    {
        get 
        {
            return response.Headers;
        }
    }

    public virtual void send()
    {
        response.HeaderEncoding = Encoding.UTF8;
        if (ResultType.REDIRECT == type)
        {
            response.Redirect(content.ToString());
        }
        else
        {
            response.Write(output());
        }
        response.End();
    }

}