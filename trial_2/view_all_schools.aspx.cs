using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class view_all_schools : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("categorise_by_level", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        Control myControl1 = FindControl("div0");
        if (myControl1 != null)
        {

            while (rdr.Read())
            {

                //Get the value of the attribute name in the Company table
                string level = rdr.GetString(rdr.GetOrdinal("school_level"));
                //Get the value of the attribute field in the Company table
                string SchoolName = rdr.GetString(rdr.GetOrdinal("school_name"));
                string phone_num = rdr.GetString(rdr.GetOrdinal("phone_num"));

                //Create a new label and add it to the HTML form
                Label ChildNamelbl1 = new Label();
                Label ChildNamelbl2 = new Label();
                Label ChildNamelbl3 = new Label();
                ChildNamelbl1.ForeColor = System.Drawing.Color.Green;
                ChildNamelbl2.ForeColor = System.Drawing.Color.Green;
                ChildNamelbl3.ForeColor = System.Drawing.Color.Green;
                ChildNamelbl1.Text = "Level: ";
                ChildNamelbl2.Text = "Name: ";
                ChildNamelbl3.Text = "phone: ";
                Label ChildNamelbl5 = new Label();
                Label ChildNamelbl6 = new Label();

                Label ChildNamelbl4 = new Label();
                ChildNamelbl4.Text = level + "  <br /> <br />";
                ChildNamelbl5.Text = SchoolName + "  <br /> <br />";
                ChildNamelbl6.Text = phone_num + "  <br /> <br />" + "  <br /> <br />" + "  <br /> <br />";
                myControl1.Controls.Add(ChildNamelbl1);
                myControl1.Controls.Add(ChildNamelbl4);
                myControl1.Controls.Add(ChildNamelbl2);
                myControl1.Controls.Add(ChildNamelbl5);
                myControl1.Controls.Add(ChildNamelbl3);
                myControl1.Controls.Add(ChildNamelbl6);


            }


        }
    }

    protected void HomePage(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx",true);
    }
}