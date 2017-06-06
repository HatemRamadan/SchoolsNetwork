<%@ Page Language="C#" AutoEventWireup="true" CodeFile="post_assignments.aspx.cs" Inherits="post_assignments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="home" runat="server" Text="My Page" OnClick="home_Click" />
        <div style="height: 432px">
        <p>Enter The Course Code</p>
        <asp:TextBox ID="code" runat="server"></asp:TextBox>
        <br />
        <p>Enter due date in the form day/month/year</p>
        <asp:TextBox ID="day" runat="server"></asp:TextBox>
        <asp:TextBox ID="month" runat="server"></asp:TextBox>
        <asp:TextBox ID="year" runat="server"></asp:TextBox>
        <br />

        <p>Please Copy The Assignment Text into Here</p>
        <asp:TextBox ID="content" runat="server" Height="160px" Width="1156px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="post" runat="server" OnClick="post_Click" Text="Post The Assignment" />
        
    </div>
        <br />
        <asp:Label runat="server" id="result" Visible="false">
            Successfull!!
        </asp:Label>
        <br />
        <p>
        <asp:Label runat="server" id="result0" Visible="False">Incorrect Data!!</asp:Label>
        </p>
    </form>
</body>
</html>
