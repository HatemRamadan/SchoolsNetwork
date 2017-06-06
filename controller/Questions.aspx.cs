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

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("view_all_Questions", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@course", ((TextBox)FindControl("TextBox1")).Text));
        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        Control myControl1 = FindControl("div0");

        while (rdr.Read())
        {

            string Q = rdr.GetString(rdr.GetOrdinal("question"));
            String A = "";
            try {
            A = rdr.GetString(rdr.GetOrdinal("answer"));
            }
            catch (Exception)
            {
                A = "Not Answered yet";
            }

            Label Namelbl = new Label();
            Namelbl.ForeColor = System.Drawing.Color.Green;
            Namelbl.Text = "Question : " + Q + "  <br />" + "Answer : " + A + "<br /> <br/>";
            myControl1.Controls.Add(Namelbl);
        }
        conn.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Student_Profile.aspx");
    }
    
}