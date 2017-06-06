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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void signup(object sender, EventArgs e)
    {
        if(((RadioButtonList)form1.FindControl("rbtLstRating")).SelectedValue.Equals("Teacher"))
        {
            Response.Redirect("sign_teacher.aspx",true);
        }
        else
            if (((RadioButtonList)form1.FindControl("rbtLstRating")).SelectedValue.Equals("Parent"))
        {
            Response.Redirect("sign_parent.aspx",true);
       }
        else
        {
            Response.Write("<script>alert('Please select either parent or teacher')</script>");
        }
    }

    protected void Login(object sender, EventArgs e)
    {
        if (((RadioButtonList)form1.FindControl("rbtLstRating0")).SelectedValue.Equals("Parent"))
        {
            
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("check_usernameP", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string username = ((TextBox)form1.FindControl("username1")).Text;
            string password = ((TextBox)form1.FindControl("passward")).Text;

            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@password", password));
             SqlParameter flag = cmd.Parameters.Add("@response", SqlDbType.Int);
            flag.Direction = ParameterDirection.Output;
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            if (flag.Value.ToString().Equals("0"))
            {
                Response.Write("<script>alert('Wrong username or password')</script>");
            }
            else
            {
                Session["username"] = username;
                Response.Redirect("Parent.aspx",true);
            }

               
                
            }
            catch (Exception)
            {
                conn.Close();
               
               }
        }
        else
        {
            if (((RadioButtonList)form1.FindControl("rbtLstRating0")).SelectedValue.Equals("Teacher"))
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd = new SqlCommand("check_usernameT", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                string username = ((TextBox)form1.FindControl("username1")).Text;
                string password = ((TextBox)form1.FindControl("passward")).Text;

                cmd.Parameters.Add(new SqlParameter("@username", username));
                cmd.Parameters.Add(new SqlParameter("@password", password));
                SqlParameter flag = cmd.Parameters.Add("@response", SqlDbType.Int);
                flag.Direction = ParameterDirection.Output;
                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    if (flag.Value.ToString().Equals("0"))
                    {
                        Response.Write("<script>alert('Wrong username or password')</script>");
                    }
                    else
                    {
                        Session["username"] = username;
                        Response.Redirect("Teacher.aspx", true);
                    }



                }
                catch (Exception)
                {
                    conn.Close();

                }

            }

            else
            {
                if (((RadioButtonList)form1.FindControl("rbtLstRating0")).SelectedValue.Equals("Student"))
                {
                    string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
                    SqlConnection conn = new SqlConnection(connStr);
                    SqlCommand cmd = new SqlCommand("check_usernameS", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    string username = ((TextBox)form1.FindControl("username1")).Text;
                    string password = ((TextBox)form1.FindControl("passward")).Text;

                    cmd.Parameters.Add(new SqlParameter("@username", username));
                    cmd.Parameters.Add(new SqlParameter("@password", password));
                    SqlParameter flag = cmd.Parameters.Add("@response", SqlDbType.Int);
                    flag.Direction = ParameterDirection.Output;
                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        if (flag.Value.ToString().Equals("0"))
                        {
                            Response.Write("<script>alert('Wrong username or password')</script>");
                        }
                        else
                        {
                            Session["username"] = username;
                            Response.Redirect("Student_Profile.aspx", true);
                        }



                    }
                    catch (Exception)
                    {
                        conn.Close();

                    }

                }
                else
                {
                    Response.Write("<script>alert('Please select either parent or teacher or student')</script>");
                }
            }
           }
        


    }



    protected void Search_for_schools(object sender, EventArgs e)
    {
        Response.Redirect("search_for_school.aspx",true);
    }

    protected void View_schools(object sender, EventArgs e)
    {
        Response.Redirect("view_all_schools.aspx",true);
    }

    protected void view_announcments(object sender, EventArgs e)
    { 
            Response.Write("<script>alert('PLease enter a school name first')</script>");
      
        Session["school"] = school.Text;
        Response.Redirect("view_announcments.aspx",true);
    }
}