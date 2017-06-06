using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_students : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("view_my_students", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@teacher", ((string)(Session["username"]))));
        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        Control myControl = FindControl("students");
        while(rdr.Read())
        {
            String user = rdr.GetString(rdr.GetOrdinal("s_username"));
            String name = rdr.GetString(rdr.GetOrdinal("name"));
            int grade= rdr.GetInt32(rdr.GetOrdinal("grade"));
            Label nl = new Label();
            nl.Text = "Student Username: " + user + "<br />"+ "Student Name: " + name+"<br />"+" Grade: " +grade+ "<br />"+ "<br />";
            myControl.Controls.Add(nl);

        }

    }

    protected void home_Click(object sender, EventArgs e)
    {
        Response.Redirect("Teacher.aspx"); 
    }
}