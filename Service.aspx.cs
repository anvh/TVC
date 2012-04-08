using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Service_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection scon = new SqlConnection
      (System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString()))
        {
            scon.Open();
            try
            {
                using (SqlCommand scom = new SqlCommand("Select description from News where id = -2", scon))
                {
                    //SqlDataReader sreader = scom.ExecuteReader();
                    sreader.Read();
                    content.Text = sreader.GetValue(0).ToString();
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}