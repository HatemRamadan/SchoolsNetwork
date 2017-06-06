using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Enroll : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("view_schools_accepted_children", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@username", ((string)(Session["username"]))));
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
                    string SchoolName = rdr.GetString(rdr.GetOrdinal("school_name"));

                    //Create a new label and add it to the HTML form
                    Label ChildNamelbl = new Label();
                    ChildNamelbl.Text = ChildName + " is accepted in ";
                    myControl1.Controls.Add(ChildNamelbl);


                    Label SchoolNamelbl = new Label();
                    SchoolNamelbl.ForeColor = System.Drawing.Color.Green;
                    SchoolNamelbl.Text = SchoolName + "  <br /> <br />";
                    myControl1.Controls.Add(SchoolNamelbl);
                }
                if (i == 0)
                {
                    Label lbl = new Label();
                    lbl.Text = "Non of your children were accepted Yet";
                    Control myControl2 = FindControl("div2");
                    myControl1.Controls.Add(lbl);
                    myControl2.Visible = false;
                }
            }
        }
       
    
    protected void Apply(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("enroll_my_child", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        
        string name = ((TextBox)form1.FindControl("Child_name")).Text;
        string school_name = ((TextBox)form1.FindControl("School_name")).Text;
        cmd.Parameters.Add(new SqlParameter("@School_name", school_name));
        cmd.Parameters.Add(new SqlParameter("@username",((string)Session["username"])));
        cmd.Parameters.Add(new SqlParameter("@name", name));
        try
        {
            SqlParameter flag = cmd.Parameters.Add("@flag", SqlDbType.Int);
            flag.Direction = ParameterDirection.Output;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            System.Diagnostics.Debug.WriteLine("FLAG"+ flag.Value.ToString());
            if (flag.Value.ToString().Equals("1"))
            {
                Label3.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('Incorrect data')</script>");
            }
        }
        catch
        {
            conn.Close();
            Response.Write("<script>alert('You have already enrolled this child')</script>");
        }
    }

    protected void Back(object sender, EventArgs e)
    {
        Response.Redirect("Parent.aspx",true);
    }

   
}