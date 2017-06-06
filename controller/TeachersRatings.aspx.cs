using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Collections;
using System.Collections.Generic;

public partial class TeachersRatings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        

        SqlCommand cmd = new SqlCommand("view_teachers_of_my_Children", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        SqlCommand cmd2 = new SqlCommand("view_rating", conn);
        cmd2.CommandType = CommandType.StoredProcedure;


        string user_name = ((string)(Session["username"]));
        cmd.Parameters.Add(new SqlParameter("@username", user_name));
        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        Control myControl1 = FindControl("div1");
        if (myControl1 != null)
        {
            int i = 0;
            while (rdr.Read())
            {
                i = 1;
                //Get the value of the attribute name in the Company table
                string ChildName = rdr.GetString(rdr.GetOrdinal("name"));
                //Get the value of the attribute field in the Company table
                string TeacherName = rdr.GetString(rdr.GetOrdinal("t_username"));

                cmd2.Parameters.Add(new SqlParameter("@teacher", TeacherName));
                SqlParameter value = cmd2.Parameters.Add("@Rate", SqlDbType.Float);
                value.Direction = ParameterDirection.Output;
                cmd2.ExecuteNonQuery();
                    //Create a new label and add it to the HTML form
                    Label ChildNamelbl = new Label();
                ChildNamelbl.Text = ChildName + "'s Teacher( ";
                myControl1.Controls.Add(ChildNamelbl);


                Label TeacherNamelbl = new Label();
                TeacherNamelbl.ForeColor = System.Drawing.Color.Green;
                TeacherNamelbl.Text = TeacherName + " ) has a rating: ";
                myControl1.Controls.Add(TeacherNamelbl);
                Label Rating = new Label();
                if (value.Value.ToString().Equals("0") || value.Value.ToString().Equals("0.0"))
                {
                    Rating.Text = "Not rated yet" + "  <br /> <br />";

                }
                else
                {
                    Rating.Text = value.Value.ToString() + "  <br /> <br />";

                }

                myControl1.Controls.Add(Rating);
            }
            if (i == 0)
            {

                Control myControl2 = FindControl("div2");
                myControl2.Visible = false;
            }
        }
    }

    protected void Back_to_profile(object sender, EventArgs e)
    {
        Response.Redirect("Parent.aspx",true);
    }

    protected void Rate_teacher(object sender, EventArgs e)
    {
        string Teacher_name = ((TextBox)form1.FindControl("Teacher_username")).Text;
        String rating = ((TextBox)form1.FindControl("Rate")).Text;
        int Rating = Int32.Parse(rating);
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);


        SqlCommand cmd = new SqlCommand("rate_teacher", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@username", ((string)Session["username"])));
        cmd.Parameters.Add(new SqlParameter("@teacher",Teacher_name ));
        cmd.Parameters.Add(new SqlParameter("@rate",Rating));
        conn.Open();

        try { cmd.ExecuteNonQuery();
            Response.Redirect("TeachersRatings.aspx",true);
        }
        catch
        {
            Response.Write("<script>alert('You hava already rated this teacher')</script>");
            conn.Close();
        }
    }
}