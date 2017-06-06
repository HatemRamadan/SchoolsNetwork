using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void list_courses_Click(object sender, EventArgs e)
    {
        Response.Redirect("view_teacher_courses.aspx");
    }

    protected void post_assignment_Click(object sender, EventArgs e)
    {
        Response.Redirect("post_assignments.aspx");
    }

    protected void report_student_Click(object sender, EventArgs e)
    {
        Response.Redirect("review_student.aspx");
    }

    protected void view_students_Click(object sender, EventArgs e)
    {
        Response.Redirect("view_students.aspx");
    }

    protected void answer_question_Click(object sender, EventArgs e)
    {
        if (((TextBox)(FindControl("q_code"))).Visible == false)
            ((TextBox)(FindControl("q_code"))).Visible = true;
        else
        {
            Session["q_code"] = ((TextBox)(FindControl("q_code"))).Text;
            Response.Redirect("view_questions.aspx");
        }

    }

    protected void view_assignments_Click(object sender, EventArgs e)
    {
        if (((TextBox)(FindControl("assgn_code"))).Visible == false)
            ((TextBox)(FindControl("assgn_code"))).Visible = true;
        else
        {
            Session["assgn_code"] = ((TextBox)(FindControl("assgn_code"))).Text;
            Response.Redirect("view_assignment.aspx");
        }
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
}