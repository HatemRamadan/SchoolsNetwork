using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Clubs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("get_clubs", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@ssn", ((int)(Session["ssn"]))));
        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        Control myControl1 = FindControl("div0");

        while (rdr.Read())
        {

            string Club_Name = rdr.GetString(rdr.GetOrdinal("name"));
            string purpose = rdr.GetString(rdr.GetOrdinal("purpose"));
            
            Label Namelbl = new Label();
            Namelbl.ForeColor = System.Drawing.Color.Green;
            Namelbl.Text = "Club Name : " + Club_Name + "<br/>" +
                "Purpose : " + purpose + "<br/>" + "  <br /> <br />";
            myControl1.Controls.Add(Namelbl);
        }
    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Student_Profile.aspx",true);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Join_club", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@ssn", ((int)(Session["ssn"]))));
        cmd.Parameters.Add(new SqlParameter("@club_name", ((TextBox)FindControl("TextBox1")).Text));
        conn.Open();

        try
        {
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('You have successfully Joined The Club')</script>");

        }
        catch (Exception)
        {
            Response.Write("<script>alert('Invalid  Data')</script>");
            conn.Close();
        }
    }
}