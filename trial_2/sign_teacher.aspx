<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sign_teacher.aspx.cs" Inherits="sign_teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <p>Your SSN    <asp:TextBox ID="ssn" runat="server"></asp:TextBox></p>
    <p>First Name  <asp:TextBox ID="f_name" runat="server"></asp:TextBox></p>
    <p>Middle Name <asp:TextBox ID="m_name" runat="server"></asp:TextBox></p>
    <p>Last Name   <asp:TextBox ID="l_name" runat="server"></asp:TextBox></p>
    <p>Gender      <asp:TextBox ID="gender" runat="server"></asp:TextBox></p>
    <p>E-Mail      <asp:TextBox ID="email" runat="server"></asp:TextBox></p>
    <p>Address     <asp:TextBox ID="address" runat="server"></asp:TextBox></p>
    <p>Birthdate: Day <asp:TextBox ID="day" runat="server"></asp:TextBox> Month <asp:TextBox ID="month" runat="server"></asp:TextBox> Year <asp:TextBox ID="year" runat="server"></asp:TextBox></p>
    <p>School Name <asp:TextBox ID="school" runat="server"></asp:TextBox></p>
    </div>
        <asp:Button ID="sign" runat="server" Text="Sign Up" OnClick="sign_Click" />
    </form>
</body>
</html>
