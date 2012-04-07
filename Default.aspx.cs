using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mail;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection scon = new SqlConnection
       (System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString()))
        {
            scon.Open();
            try
            {
                using (SqlCommand scom = new SqlCommand("Select description from News where id = -1", scon))
                {
                    SqlDataReader sreader = scom.ExecuteReader();
                    sreader.Read();
                    content.Text = sreader.GetValue(0).ToString();
                }
            }
            catch (Exception ex)
            {
            }
        }
    }


    public string get_description(string s) 
    {
        if (s.Length > 480)
            return s.Substring(0, 480);
        return s;
    }
}
