using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Reviews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("view_my_reviews", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@username", ((string)(Session["username"]))));
        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        Control myControl1 = FindControl("div0");
        if (myControl1 != null)
        {
            int i = 0;
            while (rdr.Read())
            {
                i = 1;

                //Get the value of the attribute name in the Company table
                string SchoolName = rdr.GetString(rdr.GetOrdinal("school_name"));
                //Get the value of the attribute field in the Company table
                string content = rdr.GetString(rdr.GetOrdinal("Review"));

                Label SchoolNamelbl = new Label();
                //SchoolNamelbl.ForeColor = System.Drawing.Color.Green;
                SchoolNamelbl.Text = "My review about ( "+ SchoolName + " ) is: ";
                myControl1.Controls.Add(SchoolNamelbl);
               
                //Create a new label and add it to the HTML form
                Label ChildNamelbl = new Label();
                ChildNamelbl.Text = content + "  <br /> <br />";
                myControl1.Controls.Add(ChildNamelbl);


            }
            if (i == 0)
            {
                Label lbl = new Label();
                lbl.Text = "You haven't reviewd any schools Yet";
                Control myControl2 = FindControl("div1");
                myControl1.Controls.Add(lbl);
                myControl2.Visible = false;
            }
        }
    }

    protected void Back(object sender, EventArgs e)
    {
        Response.Redirect("Parent.aspx",true);
    }

    protected void Delete(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("delete_a_review", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string school_name = ((TextBox)form1.FindControl("School_name")).Text;
        cmd.Parameters.Add(new SqlParameter("@username", ((string)Session["username"])));
        cmd.Parameters.Add(new SqlParameter("@School_name", school_name));
       
        try
        {
            
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            
        }
        catch
        {
            conn.Close();
                    }
        Response.Redirect("Reviews.aspx",true);
    }
}

  
