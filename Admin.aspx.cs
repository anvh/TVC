using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class AdminManegement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void OnAuthenticate(object sender, AuthenticateEventArgs e)
    {
        e.Authenticated = false;
        if (String.Compare(((Login)sender).UserName, "admin", true) == 0 &&
            String.Compare(((Login)sender).Password, "thienvietcompany", false) == 0)
        {
            e.Authenticated = true;
        }
    }

    protected void OnLoggedIn(object sender, EventArgs e)
    {
        Response.Redirect("Admin.aspx");
    }

    public void insert_value(object sender, EventArgs e)
    {
        using (SqlConnection scon = new SqlConnection
        (System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString()))
        {
            scon.Open();
            try
            {
                using (SqlCommand scom = new SqlCommand
                ("insert into Admin values(@unit,@value)", scon))
                {
                    String unit = ((TextBox)LoginView1.FindControl("unit_to_ins")).Text;
                    if(!unit.Contains("T-"))
                        unit = "T-" + unit;

                    scom.Parameters.Add(new SqlParameter("@unit",unit));
                    scom.Parameters.Add(new SqlParameter("@value", ((TextBox)LoginView1.FindControl("value_to_ins")).Text));

                    scom.ExecuteNonQuery();
                }

                ((DropDownList)LoginView1.FindControl("to")).DataBind();
                ((Label)LoginView1.FindControl("show_info")).Text = " --> Thành công!";
            }
            catch (Exception ex)
            {
                ((Label)LoginView1.FindControl("show_info")).Text = " --> Lỗi: " + ex.Message;
            }

        }
        Session["State"] = "1";
    }

    public void Save_data(object sender, EventArgs e) 
    {
        GridView g  =  ((GridView)LoginView1.FindControl("GridView2"));
        SqlDataSource s = ((SqlDataSource)LoginView1.FindControl("EditMarkSource"));


        foreach (GridViewRow row in g.Rows)
        {
            string target = ((Label)row.FindControl("target")).Text;
            string value_kg = ((TextBox)row.FindControl("value_kg")).Text.Replace(".", "").Replace(",", "");
            string value_m3 = ((TextBox)row.FindControl("value_m3")).Text.Replace(".", "").Replace(",", "");

            s.UpdateParameters["target"].DefaultValue = target;
            s.UpdateParameters["kg"].DefaultValue = value_kg;
            s.UpdateParameters["m3"].DefaultValue = value_m3;
            s.Update();
        }

        g.DataBind();

        Session["State"] = "3";

    }


    public void Insert_data(object sender, EventArgs e) 
    {
        GridView g  =  ((GridView)LoginView1.FindControl("GridView2"));
        SqlDataSource s = ((SqlDataSource)LoginView1.FindControl("EditMarkSource"));


        string target = ((TextBox)g.FooterRow.FindControl("target_footer")).Text;
        string value_m3 = ((TextBox)g.FooterRow.FindControl("value_footer_m3")).Text.Replace(".", "").Replace(",", "");

        string value_kg = ((TextBox)g.FooterRow.FindControl("value_footer_kg")).Text.Replace(".", "").Replace(",", "");

        s.InsertParameters["target"].DefaultValue = target;
        s.InsertParameters["kg"].DefaultValue = value_kg;
        s.InsertParameters["m3"].DefaultValue = value_m3;
        s.Insert();

        g.DataBind();

        Session["State"] = "3";

    }

    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlDataSource s = ((SqlDataSource)LoginView1.FindControl("EditMarkSource"));

        GridView g = ((GridView)LoginView1.FindControl("GridView2"));
        string target = ((Label)g.Rows[e.RowIndex].FindControl("target")).Text.Trim();

        s.DeleteParameters["target"].DefaultValue = target;
        s.Delete();

        g.DataBind();

        Session["State"] = "3";

    }
}