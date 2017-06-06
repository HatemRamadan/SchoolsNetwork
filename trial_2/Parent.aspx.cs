using System;
using System.Collections.Generic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Parent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void apply(object sender, EventArgs e)
    {
        Response.Redirect("Application.aspx",true);

    }

    protected void view_schools_accepted(object sender, EventArgs e)
    {
        Response.Redirect("Enroll.aspx", true);
    }

    protected void view_Teachers_along_with_their_ratings(object sender, EventArgs e)
    {
        Response.Redirect("TeachersRatings.aspx", true);
    }

    protected void view_my_children_schools(object sender, EventArgs e)
    {
        Response.Redirect("ChildrenSchools.aspx", true);
    }

  
    protected void view_reports(object sender, EventArgs e)
    {
        Response.Redirect("ViewReports.aspx",true);
    }

    protected void view_my_reviews(object sender, EventArgs e)
    {
        Response.Redirect("Reviews.aspx", true);
    }

    protected void Logout(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx",true);
    }
}