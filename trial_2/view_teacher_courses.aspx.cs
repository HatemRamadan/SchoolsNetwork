using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_teacher_courses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String username = (String)Session["username"];
        
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("get_courses_taught_by_a_teacher", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@user_name", username));
        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        Control coursesDiv = FindControl("courses");
        Control clbl = FindControl("courseslbl");
        while (rdr.Read())
        {
            String courseName = rdr.GetString(rdr.GetOrdinal("name"));
            String level = rdr.GetString(rdr.GetOrdinal("school_level"));
            String code  = rdr.GetString(rdr.GetOrdinal("code"));
            int grade = rdr.GetInt32(rdr.GetOrdinal("grade"));
            Label someCourse = new Label();
            
            someCourse.Text = "Course Code: "+code+ "<br />"+ "Course Name: " + courseName + "<br />"+ " Level: " + level + "<br />"+ " Grade: " + grade + "<br />"+ "<br />";
            //coursesDiv.Controls.Add(someCourse);
            form1.Controls.Add(someCourse);   
        }
    }

    protected void home_Click(object sender, EventArgs e)
    {
        Response.Redirect("Teacher.aspx");
    }
}