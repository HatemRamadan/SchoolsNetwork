<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sign_parent.aspx.cs" Inherits="sign_parent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <p>First Name  <asp:TextBox ID="f_name" runat="server"></asp:TextBox></p>
    <p>Last Name   <asp:TextBox ID="l_name" runat="server"></asp:TextBox></p>
    <p>E-Mail      <asp:TextBox ID="email" runat="server"></asp:TextBox></p>
    <p>Landline      <asp:TextBox ID="home_phone" runat="server"></asp:TextBox></p>
    <p>Mobile Phone     <asp:TextBox ID="phone" runat="server"></asp:TextBox></p>
    <p>address      <asp:TextBox ID="address" runat="server"></asp:TextBox></p>
    <p>Username      <asp:TextBox ID="username" runat="server"></asp:TextBox></p>
    <p>Password      <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox></p>

    </div>
        <asp:Button ID="sign" runat="server" Text="Sign Up" OnClick="sign_Click" />
    </form>
</body>
</html>
