using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class post_assignments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void post_Click(object sender, EventArgs e)
    {
 
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("post_assignment", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        
        String Date = ((TextBox)FindControl("day")).Text+ "/" + ((TextBox)FindControl("month")).Text + "/" + ((TextBox)FindControl("year")).Text + " 11:59";
        DateTime currentTime = DateTime.Today;
        DateTime dueDate = DateTime.Parse(Date);
        String username = (String)Session["username"];
        String content = ((TextBox)FindControl("content")).Text;
        String code = ((TextBox)FindControl("code")).Text;
        cmd.Parameters.Add(new SqlParameter("@user_name", username));
        cmd.Parameters.Add(new SqlParameter("@post_date", currentTime));
        cmd.Parameters.Add(new SqlParameter("@due_date", dueDate));
        cmd.Parameters.Add(new SqlParameter("@content", content));
        cmd.Parameters.Add(new SqlParameter("@code", code));
        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        if (rdr.Read())
            ((Label)FindControl("result")).Visible = true;

        conn.Close();

    }

    protected void home_Click(object sender, EventArgs e)
    {
        Response.Redirect("Teacher.aspx");
    }
}