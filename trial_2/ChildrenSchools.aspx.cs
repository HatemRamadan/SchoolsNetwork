using System;
using System.Collections.Generic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class ChildrenSchools : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("view_schools_of_my_children", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@username", ((string)(Session["username"]))));
        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        Control myControl1 = FindControl("div0");

            int i = 0;
            while (rdr.Read())
            {
                i = 1;
                //Get the value of the attribute name in the Company table
               
                string SchoolName = rdr.GetString(rdr.GetOrdinal("school_name"));

               
                Label SchoolNamelbl = new Label();
                SchoolNamelbl.ForeColor = System.Drawing.Color.Green;
                SchoolNamelbl.Text = SchoolName + "  <br /> <br />";
                myControl1.Controls.Add(SchoolNamelbl);
            }
            if (i == 0)
            {
                Label lbl = new Label();
                lbl.Text = "none of your children is enrolled in any school";
                Control myControl2 = FindControl("div1");
                myControl1.Controls.Add(lbl);
                myControl2.Visible = false;
            }
        }
    

    protected void Back(object sender, EventArgs e)
    {
        Response.Redirect("Parent.aspx",true);
    }

    protected void Send(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("write_review", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string school_name = ((TextBox)form1.FindControl("School_name")).Text;
        string review = ((TextBox)form1.FindControl("rev")).Text;
        cmd.Parameters.Add(new SqlParameter("@username", ((string)Session["username"])));
        cmd.Parameters.Add(new SqlParameter("@School_name", school_name));
        cmd.Parameters.Add(new SqlParameter("@review", review));
        try
        {
           
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        catch
        {
            conn.Close();
            Response.Write("<script>alert('You have already written a review about this school')</script>");
        }
    }
}