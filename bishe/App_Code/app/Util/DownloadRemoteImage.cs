using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Drawing.Imaging;
using System.IO;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text.RegularExpressions;


namespace app.Util
{
    // 下载HTML 内容中的img元素图片中的远程地址
    public class DownloadRemoteImage
    {
        private string content;
        public DownloadRemoteImage(string html)
        {
            content = html;
        }
        // 开始下载远程图片
        public static string download(object html)
        {
            System.Net.ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(CheckValidationResult);
            DownloadRemoteImage d = new DownloadRemoteImage( Convert.ToString( html));
            return d.reader();
        }
        // 检测数据内容是否合理
        private static bool CheckValidationResult(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors)
        {
            return true; //总是接受
        }
        // 获取内容
        public string reader()
        {
            string htmlContent = content;
            string[] imagesUrl = GetHtmlImageUrlList(htmlContent);
            if (imagesUrl.Length == 0) return htmlContent;

            NameValueCollection v = new NameValueCollection(imagesUrl.Length);
            for (int i = 0; i < imagesUrl.Length; i++)
            {
                var image = imagesUrl[i];
                if (v.Get(image) == null || v.Get(image) == "")
                {
                    v[image] = DownloadImage(image);
                    htmlContent = htmlContent.Replace(image , v[image]);
                }
            }

            return htmlContent;
        }
        // 下载一个图片并保存到本地
        private string DownloadImage( string url )
        {
            string savePath = ("upload/"+Info.date("yyyyMM")+"/");
            string path = Req.Server.MapPath(savePath);
            if (!Directory.Exists( path ))
            {
                Directory.CreateDirectory(path);
            }

            HttpWebRequest res = (HttpWebRequest)WebRequest.Create(url);
            //res.Headers.Add(HttpRequestHeader.Referer , url);
            res.Referer = url;
            res.UserAgent =
                "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36";

            WebResponse response = res.GetResponse();
            Stream s = response.GetResponseStream();

            TimeSpan ts = DateTime.Now - new DateTime(1970, 1, 1, 0, 0, 0, 0);
            string newFile = ts.TotalMilliseconds.ToString()+Info.randomNumber(5).ToString() + ".png";
            var fs = new FileStream(path + newFile , FileMode.Create);
            BinaryWriter bw = new BinaryWriter(fs);

            byte[] buff = new byte[4096];
            int readLen = 0;
            while ((readLen = s.Read(buff , 0,4096)) >0)
            {
                bw.Write(buff ,0, readLen);
            }
            bw.Close();
            fs.Close();
            //img.Save(path + newFile, ImageFormat.Png);
            //MemoryStream ms = new MemoryStream();
            //img.Save(ms, ImageFormat.Png);
            //img.Dispose();
            return savePath + newFile;
        }



        // 获取HTML 内容中的img 图片地址列表
        private string[] GetHtmlImageUrlList(string sHtmlText)
        {
            // 定义正则表达式用来匹配 img 标签
            Regex regImg = new Regex(@"<img\b[^<>]*?\bsrc[\s\t\r\n]*=[\s\t\r\n]*[""']?[\s\t\r\n]*(?<imgUrl>[^\s\t\r\n""'<>]*)[^<>]*?/?[\s\t\r\n]*>", RegexOptions.IgnoreCase);

            // 搜索匹配的字符串
            MatchCollection matches = regImg.Matches(sHtmlText);
            int i = 0;
            List<string> sUrl = new List<string>(matches.Count);
            //string[] sUrlList = new string[matches.Count];

            // 取得匹配项列表
            foreach (Match match in matches)
            {
                string src = match.Groups["imgUrl"].Value;
                if (src.IndexOf("http") == 0)
                {
                    sUrl.Add(src);
                    //sUrlList[i++] = src;
                }
            }
            return sUrl.ToArray();
        }

    }
}
