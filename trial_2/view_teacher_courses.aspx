<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_teacher_courses.aspx.cs" Inherits="view_teacher_courses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body >
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="courseslbl" BorderStyle="Dashed" runat="server" ></asp:Label>
        <asp:Button ID="home" Text="Return to My Home Page" runat="server" OnClick="home_Click" />
    </div>
     <div id="courses">
    
    </div>
    </form>
</body>
</html>
