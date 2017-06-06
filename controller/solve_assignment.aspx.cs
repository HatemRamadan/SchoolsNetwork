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

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Student_Profile.aspx",true);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("solve_assignment", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@ssn", ((int)(Session["ssn"]))));
        cmd.Parameters.Add(new SqlParameter("@ass_num", Int32.Parse(((TextBox)FindControl("TextBox1")).Text)));
        cmd.Parameters.Add(new SqlParameter("@course", ((TextBox)FindControl("TextBox2")).Text));
        cmd.Parameters.Add(new SqlParameter("@solution_time",DateTime.Today));
        cmd.Parameters.Add(new SqlParameter("@content", ((TextBox)FindControl("TextBox3")).Text));

        conn.Open();

        try
        {
            cmd.ExecuteNonQuery();
            Label Namelbl = new Label();
            Namelbl.ForeColor = System.Drawing.Color.Green;
            Namelbl.Text = "Your Solution is successfully submitted";
            Control myControl1 = FindControl("div1");
            myControl1.Controls.Add(Namelbl);
        }

        catch (Exception)
        {
            Response.Write("<script>alert('Invalid Data, Please check the assignment number and the course code')</script>");
            conn.Close();
        }
    }
}