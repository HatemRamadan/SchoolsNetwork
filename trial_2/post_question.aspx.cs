using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class post_question : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("post_question", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@ssn", ((int)(Session["ssn"]))));
        cmd.Parameters.Add(new SqlParameter("@course", ((TextBox)FindControl("TextBox2")).Text));
        cmd.Parameters.Add(new SqlParameter("@content", ((TextBox)FindControl("TextBox1")).Text));
        conn.Open();

        try
        {
            cmd.ExecuteNonQuery();
            Label Namelbl = new Label();
            Namelbl.ForeColor = System.Drawing.Color.Green;
            Namelbl.Text = "Your Question is successfully posted";
            Control myControl1 = FindControl("div1");
            myControl1.Controls.Add(Namelbl);
        }

        catch(Exception )
        {
            Response.Write("<script>alert('The Course name is not Correct')</script>");
        conn.Close();
        }
        


    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Student_Profile.aspx");
    }
}