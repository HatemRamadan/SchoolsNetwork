<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Activities.aspx.cs" Inherits="Activities" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div0" runat="server">
       <h3 style="color:red">
           <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Back To Profile" />
        </h3>
        <h3 style="color:red">Your School Activities</h3>
        <br />
        <br />
    
    </div>
        <h3 style="color:red">Join Activity</h3>
        <br/>
        <asp:Label ID="Label1" runat="server" Text="Enter Adminstrator Name"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="37px" Width="162px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Enter Teacher Name"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Height="37px" Width="162px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Enter Activity time"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox3" runat="server" Height="37px" Width="162px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Enter Activity Type"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox4" runat="server" Height="37px" Width="162px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Apply For Activity" OnClick="Button1_Click" />
    </form>
</body>
</html>
