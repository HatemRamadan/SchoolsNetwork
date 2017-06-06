<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_assignment.aspx.cs" Inherits="view_assignment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 181px">
    <asp:Button ID="teacher" Text="My Page" runat="server" OnClick="teacher_Click" />   
        <br />
        <br /> 
    <asp:ListBox ID="assign_list" runat="server" Visible="true" Width="420px"  >

    </asp:ListBox>
    <br />
      <asp:Button ID="grade" Text="Grade This Assignment" runat="server"  visible ="true" OnClick="grade_Click" />    
     <asp:Button ID="update" Text="Click me to Update!" runat="server" OnClick="update_Click"   />
     <asp:TextBox ID="score" runat="server" Visible="true"></asp:TextBox>
    </div>
    </form>
</body>
</html>
