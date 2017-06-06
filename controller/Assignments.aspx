<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Assignments.aspx.cs" Inherits="Assignments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div  id="div0" runat="server"> 
    
        <asp:Label ID="Label1" runat="server" Text="Write your course Code"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="37px" Width="185px" ></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Height="31px" Text="View Assignments" Width="136px" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Button ID="Button4" runat="server" Height="30px" Text="View Grades" Width="135px" OnClick="Button4_Click" />
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" Height="31px" Text="Solve Assignment" Width="156px" OnClick="Button3_Click" />
        <br />
        <p>
            <asp:Button ID="Button2" runat="server" Height="39px" Text="Back to Profile" Width="159px" OnClick="Button2_Click" />
        </p>
    </div>
    </form>
</body>
</html>
