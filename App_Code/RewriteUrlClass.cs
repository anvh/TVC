using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for RewriteUrlClass
/// </summary>
public class RewriteUrlClass : IHttpModule
{
 
    public void Dispose()
    {
    }
 
    public void Init(HttpApplication context)
    {
        context.BeginRequest += Context_BeginRequest;
    }

    private static void Context_BeginRequest(object sender, EventArgs e)
    {
        HttpApplication httpApplication = (HttpApplication)sender;
        string url = httpApplication.Request.RawUrl.ToLower();

        // Nếu là Url ảo như sau"
        if (url.Contains("/news"))
        {

            string[] temp = url.Split('-');
            temp = url.Split('/');
            temp = temp[temp.Length-1].Split('-');
            string id = temp[0].Split('?')[1];

            httpApplication.Context.RewritePath("Detail.aspx?id=" + id);
        }


        // Nếu là Url ảo như sau"
        if (url.Contains("/login.aspvn"))
        {
            // Thì Url thực mà Server cần xử lý là:
            httpApplication.Context.RewritePath("Login.aspx");
        }

        // Tùy thuộc vào quy tắt Rewrite mà chúng ta xử lý.
        // Một trong những cách hiệu quả nhất là dùng Regex Expression.
    }
  
}