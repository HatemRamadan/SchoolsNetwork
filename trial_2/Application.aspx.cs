using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class Application : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Button2.Visible = false;
        Label7.Visible = false;
    }

    protected void Apply(object sender, EventArgs e)
    {
        string user_name = (string)(Session["username"]);
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("register_a_child", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        SqlCommand cmd2 = new SqlCommand("apply_for_my_child", conn);
        cmd2.CommandType = CommandType.StoredProcedure;

        string ssn = ((TextBox)form1.FindControl("SSN")).Text;
        //string username = ((TextBox)form1.FindControl("parent")).Text;
        string birthdate = ((TextBox)form1.FindControl("b_date")).Text;
        string name = ((TextBox)form1.FindControl("Child_name")).Text;
        string school_name = ((TextBox)form1.FindControl("school_name")).Text;
        string gender = ((RadioButtonList)form1.FindControl("rbtLstRating")).SelectedValue;

        cmd.Parameters.Add(new SqlParameter("@name", name));
        cmd.Parameters.Add(new SqlParameter("@ssn", ssn));
        cmd.Parameters.Add(new SqlParameter("@b_date", birthdate));
        cmd.Parameters.Add(new SqlParameter("@gender", gender));
        cmd.Parameters.Add(new SqlParameter("@parent", user_name));

        cmd2.Parameters.Add(new SqlParameter("@username", user_name));
        cmd2.Parameters.Add(new SqlParameter("@ssn", ssn));
        cmd2.Parameters.Add(new SqlParameter("@school_name",school_name));

        try
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();

            // Response.Write("<script>alert('Application has been sent successfully!')</script>");
            Button2.Visible = true;
            Label7.Visible = true;

            
        }
        catch (Exception )
        {
            conn.Close();
            Response.Write("<script>alert('Incorrect data')</script>");
            Button2.Visible = false;
            Label7.Visible = false;
        }
    }

    protected void Okay(object sender, EventArgs e)
    {
        Response.Redirect("Parent.aspx",true);
    }
}