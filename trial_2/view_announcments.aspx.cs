using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class view_announcments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("view_reviews", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@school_name", ((string)(Session["school"]))));
        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        Control myControl1 = FindControl("div1");
        int i = 0;
        
        while (rdr.Read())
        {
            i = 1;
            
            //Get the value of the attribute name in the Company table
            string level = rdr.GetString(rdr.GetOrdinal("Reviews"));
            //Get the value of the attribute field in the Company table
            Label ChildNamelbl1 = new Label();
            Label ChildNamelbl2 = new Label();

            ChildNamelbl1.ForeColor = System.Drawing.Color.Green;
            ChildNamelbl2.ForeColor = System.Drawing.Color.Green;
            ChildNamelbl1.Text = "School name: ";
            ChildNamelbl2.Text = "Review: ";
            
            Label ChildNamelbl5 = new Label();
            Label ChildNamelbl6 = new Label();

            ChildNamelbl5.Text = ((string)(Session["school"])) + "  <br /> <br />";
            ChildNamelbl6.Text = level + "  <br /> <br />" + "  <br /> <br />" + "  <br /> <br />";

            myControl1.Controls.Add(ChildNamelbl1);
            myControl1.Controls.Add(ChildNamelbl5);
            myControl1.Controls.Add(ChildNamelbl2);
            myControl1.Controls.Add(ChildNamelbl6);


        }
        if (i == 0)
        {
            Label l = new Label();
            l.Text = "There are no reviews about this school";
            myControl1.Controls.Add(l);

        }

        SqlCommand cmd2 = new SqlCommand("view_announcments", conn);
        cmd2.CommandType = CommandType.StoredProcedure;
        cmd2.Parameters.Add(new SqlParameter("@school", ((string)(Session["school"]))));

        rdr = cmd2.ExecuteReader(CommandBehavior.CloseConnection);
        Control myControl2 = FindControl("div2");
        int j = 0;

        while (rdr.Read())
        {
            j = 1;

            //Get the value of the attribute name in the Company table
            string time = rdr.GetDateTime(rdr.GetOrdinal("time_date"))+"";
            string desc = rdr.GetString(rdr.GetOrdinal("announcement_description"));
            string type = rdr.GetString(rdr.GetOrdinal("announcment_type"));
            string title = rdr.GetString(rdr.GetOrdinal("title"));

            //Get the value of the attribute field in the Company table
            Label ChildNamelbl1 = new Label();
            Label ChildNamelbl2 = new Label();
            Label ChildNamelbl7 = new Label();
            Label ChildNamelbl8 = new Label();

            ChildNamelbl1.ForeColor = System.Drawing.Color.Green;
            ChildNamelbl2.ForeColor = System.Drawing.Color.Green;
            ChildNamelbl7.ForeColor = System.Drawing.Color.Green;
            ChildNamelbl8.ForeColor = System.Drawing.Color.Green;
            ChildNamelbl1.Text = "Title: ";
            ChildNamelbl2.Text = "Time: ";
            ChildNamelbl7.Text = "type: ";
            ChildNamelbl8.Text = "Description: ";

            Label ChildNamelbl5 = new Label();
            Label ChildNamelbl6 = new Label();
            Label ChildNamelbl9 = new Label();
            Label ChildNamelbl10 = new Label();

            ChildNamelbl5.Text = title + "  <br /> <br />";
            ChildNamelbl6.Text = time + "  <br /> <br />" ;
            ChildNamelbl9.Text = type + "  <br /> <br />";
            ChildNamelbl10.Text = desc + "  <br /> <br />"+ "  <br /> <br />" + "  <br /> <br />";

            myControl2.Controls.Add(ChildNamelbl1);
            myControl2.Controls.Add(ChildNamelbl5);
            myControl2.Controls.Add(ChildNamelbl2);
            myControl2.Controls.Add(ChildNamelbl6);
            myControl2.Controls.Add(ChildNamelbl7);
            myControl2.Controls.Add(ChildNamelbl9);
            myControl2.Controls.Add(ChildNamelbl8);
            myControl2.Controls.Add(ChildNamelbl10);

        }
        if (j == 0)
        {
            Label l = new Label();
            l.Text = "There are no announcments";
            myControl2.Controls.Add(l);

        }
        conn.Close();

    }

    protected void HomePage(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx",true);
    }
}