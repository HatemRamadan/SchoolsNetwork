using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class review_student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void home_Click(object sender, EventArgs e)
    {
        //Response.Redirect("Default.aspx");
    }

    protected void teacher_Click(object sender, EventArgs e)
    {
        Response.Redirect("Teacher.aspx");

    }

    protected void submit_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("post_monthly_report", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        
        cmd.Parameters.Add(new SqlParameter("@teacher", ((string)(Session["username"]))));
        cmd.Parameters.Add(new SqlParameter("@student_username", (((TextBox)(FindControl("s_username")))).Text));
        cmd.Parameters.Add(new SqlParameter("@content", (((TextBox)(FindControl("content")))).Text));
        cmd.Parameters.Add(new SqlParameter("@current_time", DateTime.Today));

        int i = 0;
        conn.Open();
        try
        {
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch (SqlException)
        {
            i = 1;
            Response.Write("Wrong Data");
        }
        if(i==0)
            Response.Write("Done");
        conn.Close();

    }
}