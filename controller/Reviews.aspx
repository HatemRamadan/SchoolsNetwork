<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reviews.aspx.cs" Inherits="Reviews" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div0" runat="server">
    
    </div>
        <div id="div1" runat="server">
             <p>
        <asp:Label ID="Label1" runat="server" Text="Delete a review about"></asp:Label>  &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
         <asp:TextBox ID="School_name" runat="server"  placeholder="School name"></asp:TextBox>
         </p>
        
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" BackColor="#CCFFCC" BorderColor="#00CC99" ForeColor="#000099" Height="39px" OnClick="Delete" style="margin-left: 0px" Text="Delete" Width="157px" />
             
             </p>
        </div>
        
         
        <div id="div2" runat="server">
                           <asp:Button ID="Button2" runat="server" BackColor="#CCFFCC" BorderColor="#00CC99" ForeColor="#000099" Height="39px" OnClick="Back" style="margin-left: 0px" Text="Profile" Width="157px" />

        </div>
    </form>
</body>
</html>
