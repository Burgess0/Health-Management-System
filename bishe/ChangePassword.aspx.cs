using app.Dbs;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : AdminContent
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // 点击确定按钮的时候执行这个方法 修改密码
    protected void Button1_Click(object sender, EventArgs e)
    {
        string username = Session["username"].ToString();
        string cx = Session["login"].ToString();
        string oldPassword = Request["ymm"];
        string newPwd = Request["xmm1"];
        string newPwd2 = Request["xmm2"];

        if ( !newPwd.Equals(newPwd2) ) {
            showError("两次密码不一致");
        }

        else if (cx.Equals("管理员"))
        {
                        Hashtable row = Db.name("admins").@where("username" , username).@where("pwd" , oldPassword).find();
            if ( row.Count == 0 )
            {
                showError("原密码错误");
            }
                        Hashtable rs = new Hashtable();
            rs["id"] = row["id"];
            rs["pwd"] = newPwd;
            Db.name("admins").update(rs);
        }
        else if (cx.Equals("用户"))
        {
                        Hashtable row = Db.name("yonghu").@where("yonghuming" , username).@where("mima" , oldPassword).find();
            if ( row.Count == 0 )
            {
                showError("原密码错误");
            }
                        Hashtable rs = new Hashtable();
            rs["id"] = row["id"];
            rs["mima"] = newPwd;
            Db.name("yonghu").update(rs);
        }

        showSuccess("修改密码成功", "./ChangePassword.aspx");
    }
}


