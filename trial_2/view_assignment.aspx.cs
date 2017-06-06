using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_assignment : System.Web.UI.Page
{
    
   static Dictionary<int, String> s_assign ;
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    
    protected void grade_Click(object sender, EventArgs e)
    {
        ListBox questions = (ListBox)FindControl("assign_list");
        String score = ((TextBox)FindControl("score")).Text;
        String student;
        String code=(String )Session["assgn_code"];
        int assign_num;
        int sind = questions.SelectedIndex;

        
          if (s_assign.ContainsKey(sind))
        {
            String item = s_assign[sind];
            student = item.Split('#')[0];
            code = item.Split('#')[1];
            assign_num = Int32.Parse(item.Split('#')[2]);

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            SqlCommand cmd = new SqlCommand("grade_assignment", conn);
            cmd.CommandType = CommandType.StoredProcedure;



            string username = ((string)(Session["username"]));
            cmd.Parameters.Add(new SqlParameter("@teacher", username));
            cmd.Parameters.Add(new SqlParameter("@course", code));
            cmd.Parameters.Add(new SqlParameter("@st_username", student));
            cmd.Parameters.Add(new SqlParameter("@assign_num", assign_num));
            cmd.Parameters.Add(new SqlParameter("@grade", score));


            conn.Open();

            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            ((Button)FindControl("update")).Visible = true;


    }
    }
    protected void update_Click(object sender, EventArgs e)
    {
        s_assign = new Dictionary<int, String>();
         //((Button)(FindControl("grade"))).Visible = true;
        //((Button)(FindControl("update"))).Visible = false;
        //((ListBox)(FindControl("assign_list"))).Visible = true;
        //((TextBox)(FindControl("score"))).Visible = true;

        String code = (String)Session["assgn_code"];
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("solution_for_a_certin_teacher", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string username = ((string)(Session["username"]));
        cmd.Parameters.Add(new SqlParameter("@user_name", username));
        cmd.Parameters.Add(new SqlParameter("@code", code));
        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        ListBox myControl1 = (ListBox)FindControl("assign_list");
        myControl1.Items.Clear();
        while (rdr.Read())
        {


            String student = rdr.GetString(rdr.GetOrdinal("s_username"));
            String content = rdr.GetString(rdr.GetOrdinal("content"));
           
            int assign_num = rdr.GetInt32(rdr.GetOrdinal("assignment_num"));
            String item = student + "  " + code + " " + assign_num + " " + content;
            int c = myControl1.Items.Count;
            myControl1.Items.Add(item);
            s_assign[c] = student + "#" + code + "#" + assign_num;
        }
        
        //  Response.Write(x);
    }


    protected void teacher_Click(object sender, EventArgs e)
    {
        Response.Redirect("Teacher.aspx");
    }
}