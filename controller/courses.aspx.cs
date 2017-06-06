using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
       SqlConnection conn = new SqlConnection(connStr);

       SqlCommand cmd = new SqlCommand("show_courses", conn);
       cmd.CommandType = CommandType.StoredProcedure;

       cmd.Parameters.Add(new SqlParameter("@ssn", ((int)(Session["ssn"]))));
       conn.Open();

       SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
       Control myControl1 = FindControl("div0");
       
       while (rdr.Read())
       {

           string CourseName = rdr.GetString(rdr.GetOrdinal("name"));
            string Coursecode = rdr.GetString(rdr.GetOrdinal("code"));

            Label Namelbl = new Label();
           Namelbl.ForeColor = System.Drawing.Color.Green;
           Namelbl.Text ="CorseName : "+ CourseName + "  <br /> <br />" +"Course code: "+ Coursecode +"  <br /> <br />";

            myControl1.Controls.Add(Namelbl);
       }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("post_question.aspx",true);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Questions.aspx", true);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Assignments.aspx",true);
    }
}