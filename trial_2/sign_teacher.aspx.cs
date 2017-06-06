using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sign_teacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void sign_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("sign_up_teacher", conn);
        cmd.CommandType = CommandType.StoredProcedure;


        String Date = ((TextBox)FindControl("day")).Text + "/" + ((TextBox)FindControl("month")).Text + "/" + ((TextBox)FindControl("year")).Text + " 11:59";
        DateTime dueDate = DateTime.Parse(Date);
        
        String ssn = ((TextBox)FindControl("ssn")).Text;
        String f_name = ((TextBox)FindControl("f_name")).Text;
        String m_name = ((TextBox)FindControl("m_name")).Text;
        String l_name = ((TextBox)FindControl("l_name")).Text;
        String email = ((TextBox)FindControl("email")).Text;
        String address= ((TextBox)FindControl("address")).Text;
        String gender = ((TextBox)FindControl("gender")).Text;
        String school = ((TextBox)FindControl("school")).Text;

        cmd.Parameters.Add(new SqlParameter("@ssn", ssn));
        cmd.Parameters.Add(new SqlParameter("@f_name", f_name));
        cmd.Parameters.Add(new SqlParameter("@m_name", m_name));
        cmd.Parameters.Add(new SqlParameter("@l_name", l_name));
        cmd.Parameters.Add(new SqlParameter("@gender", gender));
        cmd.Parameters.Add(new SqlParameter("@e_address", address));
        cmd.Parameters.Add(new SqlParameter("@bithdate", Date));
        cmd.Parameters.Add(new SqlParameter("@e_mail", email));
        cmd.Parameters.Add(new SqlParameter("@school_name", school));
        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        conn.Close();
        Response.Redirect("Default.aspx");
    }
}