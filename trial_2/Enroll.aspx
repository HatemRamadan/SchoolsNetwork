<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Enroll.aspx.cs" Inherits="Enroll" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="width:375px; height:458px; padding:10px;border:10px solid yellowgreen;">
        <div id="div1" runat="server">

        </div>
        <div id ="div2" runat="server">
         <p>
        <asp:Label ID="Label1" runat="server" Text="Child's name"></asp:Label>  &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
         <asp:TextBox ID="Child_name" runat="server"></asp:TextBox>
         </p>
        <asp:Label ID="Label2" runat="server" Text="School name"></asp:Label>  &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
         <asp:TextBox ID="School_name" runat="server"></asp:TextBox>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" BackColor="#CCFFCC" BorderColor="#00CC99" ForeColor="#000099" Height="39px" OnClick="Apply" style="margin-left: 0px" Text="Enroll" Width="157px" />
             &nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" ForeColor="#00CC00" Height="45px" Text="Done!" Visible="False" Width="50px"></asp:Label>
             </p>
            
        </div>
        <div id ="div3" runat ="server">
               <asp:Button ID="Button2" runat="server" BackColor="#CCFFCC" BorderColor="#00CC99" ForeColor="#000099" Height="39px" OnClick="Back" style="margin-left: 0px" Text="Profile" Width="88px" />
        </div>
    </form>
    
</body>
</html>
