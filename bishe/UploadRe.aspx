<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UploadRe.aspx.cs" Inherits="UploadRe" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title>Index</title>
</head>
<body>
<div>
    上传成功
    <script type="text/javascript">
        function Get(name){
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)","i");
            var r = window.location.search.substr(1).match(reg);
            if (r!=null) return unescape(r[2]);
            return null;
        }

        var str=location.toString();

        var file = <%=Session["uploadFile"]%>;
        <% Session.Remove("uploadFile"); %>
        var Result = Get("Result");
        var callback = Get("callback");
        if(Result!= null){
            window.parent.document.getElementById(Result).value=file[0];
        }else{
            for(var i in file){
                window.parent.window[callback](file[i]);
            }
        }
    </script>
    
    </div>
</body>
</html>
