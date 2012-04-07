using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string get_description(string s)
    {
        if (s.Length > 480)
            return s.Substring(0, 480);
        return s;
    }
}