using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class VeiwReports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("view_reports", conn);
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
                string ChildName = rdr.GetString(rdr.GetOrdinal("name"));
                //Get the value of the attribute field in the Company table
                string TeacherName = rdr.GetString(rdr.GetOrdinal("Teacher"));
                string time = rdr.GetDateTime(rdr.GetOrdinal("issuing date"))+"";
                string comment = rdr.GetString(rdr.GetOrdinal("comment"));
                string id = rdr.GetInt64(rdr.GetOrdinal("id"))+"";

                //Create a new label and add it to the HTML form
                Label ChildNamelbl = new Label();
                ChildNamelbl.Text = "Report nr: "+id+" about "+ChildName + " : ";
                myControl1.Controls.Add(ChildNamelbl);


                Label SchoolNamelbl = new Label();
                SchoolNamelbl.ForeColor = System.Drawing.Color.Green;
                SchoolNamelbl.Text = comment ;
                myControl1.Controls.Add(SchoolNamelbl);

                Label posted_at = new Label();
                //SchoolNamelbl.ForeColor = System.Drawing.Color.Green;
                posted_at.Text = " Issued on: " + time +" by: "+ TeacherName+ " <br /> <br />";
                myControl1.Controls.Add(posted_at);
            }
            if (i == 0)
            {
                Label lbl = new Label();
                lbl.Text = "There are no reports";
                Control myControl2 = FindControl("div1");
                myControl1.Controls.Add(lbl);
                myControl2.Visible = false;
            }
        }

    }

    protected void Send(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("reply_to_reports", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string id = ((TextBox)form1.FindControl("reportId")).Text;
        string reply = ((TextBox)form1.FindControl("reportId0")).Text;
        cmd.Parameters.Add(new SqlParameter("@reply", reply));
        cmd.Parameters.Add(new SqlParameter("@Id", Int32.Parse(id) ));
        cmd.Parameters.Add(new SqlParameter("@username", ((string)Session["username"])));
        try
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        catch
        {
            conn.Close();
            Response.Write("<script>alert('You have already replied to this report')</script>");
        }
    }

    protected void Back(object sender, EventArgs e)
    {
        Response.Redirect("Parent.aspx",true);
    }
}