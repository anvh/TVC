using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class TextEditor : System.Web.UI.UserControl {
    //***********************************************************
    // Function: Page_Load
    //***********************************************************
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    //***********************************************************
    // Function: post_Click
    //***********************************************************
    protected void post_Click(object sender, EventArgs e)
    {

        Session["State"] = "1";
        if (title.Text.Trim() == "") return;

        string file_url = "";
        if (file.HasFile)
        {
            file.PostedFile.SaveAs(Server.MapPath("~\\Data\\" + file.FileName));
            file_url = file.FileName;
        }

        string info = "alert('Thành công!')";
        using (SqlConnection scon = new SqlConnection
        (System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString()))
        {
            scon.Open();

            if (post.Text != "Save")
            {
                string id = "0";
                using (SqlCommand scom1 = new SqlCommand
                ("select max(id) from News", scon))
                {
                    id = scom1.ExecuteScalar().ToString();
                }
                if (id == "") id = "0";

                using (SqlCommand scom = new SqlCommand
                ("insert into News values(@id,@title,@description,@image,@content)", scon))
                {
                    scom.Parameters.Add(new SqlParameter("@title", title.Text));
                    scom.Parameters.Add(new SqlParameter("@id", int.Parse(id) + 1));
                    scom.Parameters.Add(new SqlParameter("@description", "<div>" + description.Text + "</div>"));
                    scom.Parameters.Add(new SqlParameter("@image", "Data/" + file_url));
                    scom.Parameters.Add(new SqlParameter("@content", summary.Text));

                    scom.ExecuteNonQuery();
                }

                // update info
                title.Text = "";
                description.Text = "";
                summary.Text = "";
                Select_Item.SelectedIndex = 2;

                DropDownList1.DataBind();

                // return successful info
                if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), info))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), info, "", true);
                }
            }
            else {
                int index = Select_Item.SelectedIndex;
                string filter = (index == 0) ? "-1" : "-2";

                string id = index != 2 ? filter : DropDownList1.SelectedValue;
                string command = (file_url == "") ? "update News set title = @title,description = @description,content = @content where id = @id"
                                                  : "update News set title = @title,description = @description,content = @content,image = @image where id = @id";
                using (SqlCommand scom = new SqlCommand(command, scon))
                {
                    scom.Parameters.Add(new SqlParameter("@title", title.Text));
                    scom.Parameters.Add(new SqlParameter("@id", id));
                    scom.Parameters.Add(new SqlParameter("@description", description.Text));
                    scom.Parameters.Add(new SqlParameter("@image", "Data/" + file_url));
                    scom.Parameters.Add(new SqlParameter("@content", summary.Text));

                    scom.ExecuteNonQuery();
                }

                DropDownList1.DataBind();

                // update info
                title.Text = "";
                description.Text = "";
                summary.Text = "";
                post.Text = "Post bài >>";
                Select_Item.SelectedIndex = 2;

                // return successful info
                if (!Page.ClientScript.IsStartupScriptRegistered(this.GetType(), info))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), info, "", true);
                }
            
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["State"] = "1";
        Select_Item.SelectedIndex = 2;
        using (SqlConnection scon = new SqlConnection
        (System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString()))
        {
            scon.Open();
            try
            {
                using (SqlCommand scom = new SqlCommand("Delete from News where id = @id", scon))
                {
                    scom.Parameters.Add(new SqlParameter("@id", DropDownList1.SelectedValue));
                    scom.ExecuteNonQuery();
                }

                // update info
                title.Text = "";
                description.Text = "";
                summary.Text = "";
                post.Text = "Post bài >>";

                show_info.Text = "   ---> Đã xóa " + DropDownList1.SelectedValue;
                DropDownList1.DataBind();
            }
            catch (Exception ex)
            {
                show_info.Text = "   --> Lỗi: " + ex.Message;
            }

        }
    }

    protected void selected_index_changed(object sender, EventArgs e)
    {
        Session["State"] = "1";
        int index = Select_Item.SelectedIndex;
        if (index == 2) return;
        string filter = index == 0 ? "-1" : "-2";

        using (SqlConnection scon = new SqlConnection
        (System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString()))
        {
            scon.Open();
            try
            {
                using (SqlCommand scom = new SqlCommand("Select title,description,image,content from News where id = @id", scon))
                {
                    scom.Parameters.Add(new SqlParameter("@id",filter));
                    SqlDataReader sreader = scom.ExecuteReader();
                    sreader.Read();
                    title.Text = sreader.GetValue(0).ToString();
                    description.Text = sreader.GetValue(1).ToString();
                    summary.Text = sreader.GetValue(3).ToString();
                    post.Text = "Save";
                }
                DropDownList1.DataBind();
            }
            catch (Exception ex)
            {
                show_info.Text = "   --> Lỗi: " + ex.Message;
            }
        }
    }

    protected void LinkButton1_Edit(object sender, EventArgs e)
    {
        Session["State"] = "1";
        using (SqlConnection scon = new SqlConnection
        (System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString()))
        {
            scon.Open();
            try
            {
                using (SqlCommand scom = new SqlCommand("Select title,description,image,content from News where id = @id", scon))
                {
                    scom.Parameters.Add(new SqlParameter("@id", DropDownList1.SelectedValue));
                    SqlDataReader sreader = scom.ExecuteReader();
                    sreader.Read();
                    title.Text = sreader.GetValue(0).ToString();
                    description.Text = sreader.GetValue(1).ToString();
                    summary.Text  = sreader.GetValue(3).ToString();
                    post.Text = "Save";
                }
                DropDownList1.DataBind();
            }
            catch (Exception ex)
            {
                show_info.Text = "   --> Lỗi: " + ex.Message;
            }

        }
    }
}