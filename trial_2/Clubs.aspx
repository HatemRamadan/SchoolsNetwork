<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Clubs.aspx.cs" Inherits="Clubs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div0" runat="server">
    
    </div>
        <h2 style="color:red"> JOIN CLUB </h2>
        <asp:Label ID="Label1" runat="server" Text="Enter The club name"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="37px" Width="169px"  ></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Join" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Back to Profile" OnClick="Button2_Click" />
    </form>
</body>
</html>
