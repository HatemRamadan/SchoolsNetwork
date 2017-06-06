<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Teacher.aspx.cs" Inherits="Teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teacher Home Page</title>
</head>
<body>
     <form id="form1" runat="server">
    <div>
    
    </div>
    <div id ="buttons_div" style="margin-left: 40px">
        <asp:Button ID="list_courses" Text="View My Courses" runat="server"  BorderStyle="Groove" OnClick="list_courses_Click"/>
        <asp:Button ID="post_assignment" text ="Post An Assignment" runat="server" BorderStyle="Groove" OnClick="post_assignment_Click"/> 
        <asp:Button ID="view_assignments" text ="View My Assignments" runat="server" BorderStyle="Groove" OnClick="view_assignments_Click"/> 
        <asp:TextBox ID="assgn_code"  runat="server" Visible="False">please enter the course code</asp:TextBox>
         <asp:Button ID="report_student" text ="Write A Report" runat="server" BorderStyle="Groove" OnClick="report_student_Click"/> 
        <asp:Button ID="answer_question" text ="Answer Questions" runat="server" BorderStyle="Groove" OnClick="answer_question_Click"/> 
        <asp:TextBox ID="q_code"  runat="server" Visible="False">please enter the course code</asp:TextBox>
        <asp:Button ID="view_students" text ="View All My Students" runat="server" BorderStyle="Groove" OnClick="view_students_Click"/> 
        <br />
        <br />
        <asp:Button ID="logout" runat="server" Text="Log Out" OnClick="logout_Click" />
        
    </div>
    
     </form>
</body>
</html>
