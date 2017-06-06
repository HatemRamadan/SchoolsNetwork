using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Student_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd1 = new SqlCommand("get_Student_info", conn);
        cmd1.CommandType = CommandType.StoredProcedure;

        conn.Open();
        cmd1.Parameters.Add(new SqlParameter("@username", Session["username"]));
        SqlDataReader rdr = cmd1.ExecuteReader(CommandBehavior.CloseConnection);
        Control myControl1 = FindControl("div1");

        while (rdr.Read())
        {
            int ssn =rdr.GetInt32(rdr.GetOrdinal("SSN"));
            Session["ssn"] = ssn;
            int school = rdr.GetInt32(rdr.GetOrdinal("school_id"));

            Label Namelbl = new Label();
            Namelbl.ForeColor = System.Drawing.Color.Green;
            Namelbl.Text = "<h1> User name : " + (Session["username"]) + "<br/> <br/>" +
                "SSN : " + (Session["ssn"]) + "<br/> <br/>" +
                "School ID : " + school + "  <br /> <br /> <br/>";
            myControl1.Controls.Add(Namelbl);
        }
        conn.Close();


        SqlCommand cmd = new SqlCommand("is_HighSchool_Student", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@ssn", ((int)(Session["ssn"]))));
        SqlParameter flag = cmd.Parameters.Add("@flag",SqlDbType.Int);
        flag.Direction = ParameterDirection.Output;
        conn.Open();

        cmd.ExecuteNonQuery();

        if (flag.Value.ToString().Equals("0"))
        {
            Control c1 = FindControl("clubsLink");
            c1.Visible = false;
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("update_account", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        conn.Open();
        cmd.Parameters.Add(new SqlParameter("@ssn", (Int32)(Session["ssn"])));
        cmd.Parameters.Add(new SqlParameter("@new_password", ((TextBox)FindControl("TextBox1")).Text));
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        Response.Write("<script>alert('You have Changed Your Password successfully')</script>");
        
    }

    protected void HomePage(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx",true);
    }
}