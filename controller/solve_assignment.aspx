<%@ Page Language="C#" AutoEventWireup="true" CodeFile="solve_assignment.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div1" runat="server">
    
        <asp:Label ID="Label1" runat="server" Text="Write Assignment number"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Write The course Code"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Height="27px" Width="157px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Your Answer"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox3" runat="server" Height="205px" Width="541px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Height="37px" Text="Submit solution" Width="156px" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Height="44px" Text="Back to profile" Width="173px" OnClick="Button2_Click" />
        <br />
    
    </div>
    </form>
</body>
</html>
