<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Questions.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div0" runat="server">
    
        <asp:Label ID="Label1" runat="server" Text="Write the Course Code"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="35px" Width="172px" ></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="View Questions" OnClick="Button1_Click" />
        <br />
        <br />
        <br />
        <br />
    
    </div>
        <asp:Button ID="Button2" runat="server" Text="Back to My Profile" OnClick="Button2_Click" />
    </form>
</body>
</html>
