using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Services : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string get_store() 
    {
      string result = "";
      using (SqlConnection scon = new SqlConnection
      (System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString()))
        {
            scon.Open();
            try
            {

                using (SqlCommand scom = new SqlCommand
                ("select * from Admin", scon))
                {
                    SqlDataReader sReader = scom.ExecuteReader();
                    while (sReader.HasRows)
                    {
                        sReader.Read();
                        result += sReader.GetValue(0) + "%" + sReader.GetValue(1) + "%" + sReader.GetValue(2) + "#";
                    }
                }
            }
            catch (Exception ex)
            {
            }

        }
      return result;
    }
}