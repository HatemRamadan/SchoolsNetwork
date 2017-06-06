using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Assignments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Student_Profile.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("view_my_assignments", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@ssn", ((int)(Session["ssn"]))));
        cmd.Parameters.Add(new SqlParameter("@course", ((TextBox)FindControl("TextBox1")).Text));
        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        Control myControl1 = FindControl("div0");

        while (rdr.Read())
        {

            String ass_num =""+rdr.GetInt32(rdr.GetOrdinal("assignment_num"));
            String course =rdr.GetString(rdr.GetOrdinal("course"));
            String due_date = ""+rdr.GetDateTime(rdr.GetOrdinal("due_date"));
            String post_date = ""+rdr.GetDateTime(rdr.GetOrdinal("post_date"));
            String content = rdr.GetString(rdr.GetOrdinal("content"));

            Label Namelbl = new Label();
            Namelbl.ForeColor = System.Drawing.Color.Green;
            Namelbl.Text = "Assignment Number : " + ass_num +"<br/>" +
                "Course : " + course + "<br/>" +
                "Post Date : " + post_date + "<br/>" +
                "Due Date : " + due_date + "<br/>" +
                "Content : " + content + "<br/>" + "  <br /> <br />";
            myControl1.Controls.Add(Namelbl);
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("solve_assignment.aspx");
    }


    protected void Button4_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("view_assignments_grades", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@ssn", ((int)(Session["ssn"]))));
        cmd.Parameters.Add(new SqlParameter("@course", ((TextBox)FindControl("TextBox1")).Text));
        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        Control myControl1 = FindControl("div0");


        while (rdr.Read())
        {

            String course = rdr.GetString(rdr.GetOrdinal("course"));
            String ass_num = "" + rdr.GetInt32(rdr.GetOrdinal("assignment_num"));
            String is_marked =rdr.GetBoolean(rdr.GetOrdinal("is_marked"))? "YES" : "NO";
            String score = "0";
            try { score = "" + rdr.GetString(rdr.GetOrdinal("score")); }
            catch (Exception) { }

            Label Namelbl = new Label();
            Namelbl.ForeColor = System.Drawing.Color.Green;
            Namelbl.Text = "Assignment Number : " + ass_num + "<br/>" +
                "Course : " + course + "<br/>" +
                "IS Marked?? : " + is_marked + "<br/>" +
                "Score : " + score + "<br/>"+"<br/> <br/>";
            myControl1.Controls.Add(Namelbl);
        }
    }
}