<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student_Profile.aspx.cs" Inherits="Student_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Profile</title>
    <style>

        a{
            color:white;
            text-decoration:none;
        }
ul{
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #555555;
}

li{
	color: white;
	float: left;
	text-align: center;
	overflow: hidden;
	display: block;
	padding: 16px;
	text-decoration: none;
}

li:hover{
	background-color:#111111;
}


</style>


</head>
<body>

    <ul>
	<li><a href="courses.aspx">My Coursrs</a></li>
	<li><a href="Activities.aspx">My Activities</a></li>
	<li id="clubsLink" runat="server"> <a href="clubs.aspx">Clubs</a></li>
	</ul>


    <form id="form1" runat="server">
    <div id="div1" runat="server">
    </div>

        <div>
            <h1 style="color:red"> Change Password</h1>

            <asp:Label ID="Label1" runat="server" Text="Enter new Password"></asp:Label>



        <p>
            <asp:TextBox Textmode="Password" ID="TextBox1" runat="server" Height="38px" Width="190px"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Change" />
        </p>
            <p>
                <asp:Button ID="Button2" runat="server" OnClick="HomePage" Text="Log out" />
            </p>

        </div>

    </form>
</body>
</html>
