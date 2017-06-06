<%@ Page Language="C#" AutoEventWireup="true" CodeFile="post_question.aspx.cs" Inherits="post_question" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div1" runat="server">
    
        <asp:Label ID="Label1" runat="server" Text="Write The course name"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Height="27px" Width="308px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Write your question"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="93px" Width="532px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Post The Question" OnClick="Button1_Click" />
        <br />
    
    </div>
        <p>
            <asp:Button ID="Button2" runat="server" Text="Back To Profile" OnClick="Button2_Click" />
        </p>
    </form>
</body>
</html>
