using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sign_parent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void sign_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("register_a_parent", conn);
        cmd.CommandType = CommandType.StoredProcedure;


        
        String f_name = ((TextBox)FindControl("f_name")).Text;
        String l_name = ((TextBox)FindControl("l_name")).Text;
        String email = ((TextBox)FindControl("email")).Text;
        String address = ((TextBox)FindControl("address")).Text;
        String land= ((TextBox)FindControl("home_phone")).Text;
        String phone = ((TextBox)FindControl("phone")).Text;
        String username= ((TextBox)FindControl("username")).Text;
        String password = ((TextBox)FindControl("password")).Text;


        cmd.Parameters.Add(new SqlParameter("@f_name", f_name));
        cmd.Parameters.Add(new SqlParameter("@l_name", l_name));
        cmd.Parameters.Add(new SqlParameter("@address", address));
        cmd.Parameters.Add(new SqlParameter("@email", email));
        cmd.Parameters.Add(new SqlParameter("@home_num", land));
        cmd.Parameters.Add(new SqlParameter("@phone_num", phone));
        cmd.Parameters.Add(new SqlParameter("@username", username));
        cmd.Parameters.Add(new SqlParameter("@passward", password));

        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        conn.Close();
        Response.Redirect("Default.aspx");
    }
}