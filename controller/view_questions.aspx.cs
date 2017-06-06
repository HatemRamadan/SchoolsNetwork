using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_questions : System.Web.UI.Page
{
    static int j = 0;
    static Dictionary<int, String> Assignments;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    
    protected void answer_Click(object sender, EventArgs e)
    {
        j++;
        ListBox questions = (ListBox)FindControl("q_list");
        String content = ((TextBox)FindControl("content")).Text;
        String student;
        String code;
        int q_num;
        int sind = questions.SelectedIndex;
        if (Assignments.ContainsKey(sind))
        {
            String item = Assignments[sind];
            student = item.Split('#')[0];
            code = item.Split('#')[1];
            q_num = Int32.Parse(item.Split('#')[2]);

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            SqlCommand cmd = new SqlCommand("answer_question", conn);
            cmd.CommandType = CommandType.StoredProcedure;



            string username = ((string)(Session["username"]));
            cmd.Parameters.Add(new SqlParameter("@Teacher", username));
            cmd.Parameters.Add(new SqlParameter("@course", code));
            cmd.Parameters.Add(new SqlParameter("@st_username", student));
            cmd.Parameters.Add(new SqlParameter("@question_num", q_num));
            cmd.Parameters.Add(new SqlParameter("@content", content));


            conn.Open();
            int s = 0;
            try
            {
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            }
            catch (SqlException)
            {
                s = 1;
            }
            if (s == 1)
                Response.Write("Already Answerd Or incorrect Data");
            else
            {
                Response.Write("Successful!!");
                q_list.Items.Clear();
            }
        }
    }

    protected void update_Click(object sender, EventArgs e)
    {
        Assignments = new Dictionary<int, String>();
        String code = (String)Session["q_code"];
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);


        SqlCommand cmd = new SqlCommand("view_questions_about_my_courses", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        

        string username = ((string)(Session["username"]));
        cmd.Parameters.Add(new SqlParameter("@Teacher", username));
        cmd.Parameters.Add(new SqlParameter("@code", (String)Session["q_code"]));
        conn.Open();

        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        ListBox myControl1 = (ListBox)FindControl("q_list");
        myControl1.Items.Clear();
        while (rdr.Read())
        {

            Label lbl = new Label();
            String student = rdr.GetString(rdr.GetOrdinal("s_username"));
            String content = rdr.GetString(rdr.GetOrdinal("content"));
            String item = student + "  " + code + " " + content;
            int q_num = rdr.GetInt32(rdr.GetOrdinal("question_num"));
            int c = myControl1.Items.Count;

            myControl1.Items.Add(item);
            Assignments[c] = student + "#" + code + "#" + q_num;
        }
      
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Teacher.aspx");
    }
}