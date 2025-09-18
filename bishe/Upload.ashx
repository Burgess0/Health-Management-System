<%@ WebHandler Language="C#" Class="Upload" %>

using System;
using System.Web;
using System.IO;
using System.Collections.Generic;
using app.Util;
public class Upload : ActionBase {

    // 处理上传的图片
    public object upload()
    {
        // 获取上下文的 server
        var Server = _context.Server;
        // 定义保存文件的路径
        string savePath = ("upload/" + Info.date("yyyyMM") + "/");
        // 判断文件夹是否存在，不存在则创建
        if (!Directory.Exists(Server.MapPath(savePath)))
        {
            Directory.CreateDirectory(Server.MapPath(savePath));
        }

        List<string> list = new List<string>();
        // 获取上传的文件
        foreach (string file in Request.Files.Keys)
        {
            HttpPostedFile ff = Request.Files.Get(file); // 获取上传文件对象
            if (ff != null && ff.ContentLength != 0)
            {
                string filename = ff.FileName; // 获取文件
                string extension = System.IO.Path.GetExtension(filename); // 获取上传文件的扩展名
                TimeSpan ts = DateTime.Now - new DateTime(1970, 1, 1, 0, 0, 0, 0); // 获取时间
                string newFile = Convert.ToInt64(ts.TotalMilliseconds).ToString() + Info.randomNumber(5).ToString() + extension; // 根据时间信息生成文件名

                ff.SaveAs(Server.MapPath(savePath + newFile)); // 将上传的文件保存在本地
                list.Add(savePath + newFile);
            }
        }

        if (list.Count == 0) // 如果保存的列表为空则提示 没有找到上传文件
        {
            showError("没有找到上传文件");
        }
        Session["uploadFile"] = fastJSON.JSON.ToJSON(list); // 设置当前上传的文件集合
        
        StringWriter write = new StringWriter(); // 写入文件
        Server.Execute("UploadRe.aspx", write , true); // 执行UploadRe.aspx 文件
        return write.ToString();
    }

    // 富文本上传文件处理地址,和上面的上传处理一致的
    public object umeditor()
    {
        var Server = _context.Server;
        string savePath = ("upload/" + Info.date("yyyyMM") + "/");
        if (!Directory.Exists(Server.MapPath(savePath)))
        {
            Directory.CreateDirectory(Server.MapPath(savePath));
        }
        
        HttpPostedFile ff = Request.Files.Get("upfile");
        if (ff != null && ff.ContentLength != 0)
        {
            string filename = ff.FileName;
            string extension = System.IO.Path.GetExtension(filename);
            TimeSpan ts = DateTime.Now - new DateTime(1970, 1, 1, 0, 0, 0, 0);
            string newFile = Convert.ToInt64(ts.TotalMilliseconds).ToString() + Info.randomNumber(5).ToString() + extension;

            ff.SaveAs(Server.MapPath(savePath + newFile));
            //list.Add(savePath + newFile);
            Dictionary<string, object> msg = new Dictionary<string, object>();
            
            msg.Add("name" , ff.FileName);
            msg.Add("originalName" , ff.FileName);
            msg.Add("size" , ff.ContentLength);
            msg.Add("state" , "success");
            msg.Add("type" , ff.ContentType);
            msg.Add("url", savePath + newFile);
            return msg;
        }
        
        showError("没有找到上传文件");
        return "";
    }
    
}