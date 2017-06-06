<%@ Page Language="C#" AutoEventWireup="true" CodeFile="review_student.aspx.cs" Inherits="review_student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 276px">
    <form id="form1" runat="server">
    <div id="report_elements" runat="server">
        <asp:Button ID="home" runat="server" Text="Home" OnClick="home_Click" />
        <asp:Button ID="teacher" runat="server" Text="My Page" OnClick="teacher_Click" />
        <br /> 
        <br />
        Write The Students' Username in Here
        <br />
        <asp:TextBox ID="s_username" runat="server" ></asp:TextBox>
        <br />
        <br />
        Write Your Review In Here
        <br />
        <asp:TextBox ID="content" runat="server" BorderStyle="Groove" Columns="5" Height="200px" Width="503px"></asp:TextBox>
        <br />
        <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" />
                
    
    </div>
    </form>
</body>
</html>
