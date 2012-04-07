using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string getImageList()
    {
        string result = "";
        DirectoryInfo di = new DirectoryInfo(Server.MapPath("~\\images\\slide_show\\"));
        foreach (FileInfo f in di.GetFiles())
        {
            result += "Images/" + di.Name + "/" + f.Name + ",";
        }
        return result;
    }
}
