using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Activities : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("view_mySchool_Activities", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@ssn", ((int)(Session["ssn"]))));
        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        Control myControl1 = FindControl("div0");

        while (rdr.Read())
        {

            string admin = rdr.GetString(rdr.GetOrdinal("Adminstrator"));
            string teacher = rdr.GetString(rdr.GetOrdinal("Teacher"));
            string time = ""+rdr.GetDateTime(rdr.GetOrdinal("timedate"));
            string a_type = rdr.GetString(rdr.GetOrdinal("activity_type"));
            string loc = rdr.GetString(rdr.GetOrdinal("activity_location"));
            string eq = "";
            try { eq = rdr.GetString(rdr.GetOrdinal("equipment")); } catch (Exception) { }

            Label Namelbl = new Label();
            Namelbl.ForeColor = System.Drawing.Color.Green;
            Namelbl.Text = "Adminstrator : " + admin + "<br/>" +
                "Teacher : " + teacher +"<br/>"+
                "Time : " + time + "<br/>" +
                "Activity Type : " + a_type + "<br/>" +
                "Activity Location : " + loc + "<br/>" +
                "Equipment : " + eq + "<br/>" + "  <br /> <br />";
            myControl1.Controls.Add(Namelbl);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Apply_for_activity", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        try
        {
        cmd.Parameters.Add(new SqlParameter("@ssn", ((int)(Session["ssn"]))));
        cmd.Parameters.Add(new SqlParameter("@admin", ((TextBox)FindControl("TextBox1")).Text));
        cmd.Parameters.Add(new SqlParameter("@teacher", ((TextBox)FindControl("TextBox2")).Text));
        cmd.Parameters.Add(new SqlParameter("@time", DateTime.Parse(((TextBox)FindControl("TextBox3")).Text)));
        cmd.Parameters.Add(new SqlParameter("@type", ((TextBox)FindControl("TextBox4")).Text));
        conn.Open();

            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('You have successfully Applied For The Activity')</script>");

        }
        catch (Exception)
        {
            Response.Write("<script>alert('Incorrect  Data')</script>");
            conn.Close();
        }

    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Student_Profile.aspx",true);
    }
}