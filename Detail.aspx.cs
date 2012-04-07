using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    string id = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSource.SelectParameters["id"].DefaultValue = Request.Params["id"];
        id = Request.Params["id"];
    }

    public string get_list_item()
    {
       string content = "";
       using (SqlConnection scon = new SqlConnection
       (System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString()))
        {
            scon.Open();
            try
            {
                using (SqlCommand scom = new SqlCommand
                ("select top 5 title,id from News where id <> @id order by id desc", scon))
                {
                    scom.Parameters.Add(new SqlParameter("@id", id));
                    SqlDataReader sreader =  scom.ExecuteReader();
                    while(sreader.HasRows)
                    {
                        sreader.Read();
                        string title = sreader.GetValue(0).ToString();
                        if (title.Length > 60)
                        {
                            int last_space = title.Substring(0,60).LastIndexOf(" ");
                            title = title.Substring(0, last_space) + " ...";
                        }
                        content += "<tr> <td width='20px'><div class='bullet_icon'></div> </td><td cospan='2' align='left' style='font-size:16px;'><div><i>" + "<a target='_blank' href='News.aspx?" +  sreader.GetValue(1) +"-" + sreader.GetValue(0).ToString().Replace(" ","-") +"' style='color:Black;'>" + title + " </a></i></div></td></tr>";
                    }
                }
            }
            catch (Exception ex) { }
        }

       return content;
    }
}