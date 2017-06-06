<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewReports.aspx.cs" Inherits="VeiwReports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div0" runat="server">

        </div>
        <div id ="div1" runat="server">
         <p>
        <asp:Label ID="Label1" runat="server" Text="Report to be replied to:"></asp:Label>  &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</p>
            <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
         <asp:TextBox ID="reportId" runat="server" placeholder="Report nr"></asp:TextBox>
         </p>
            <p>
        <asp:Label ID="Label2" runat="server" Text="Reply"></asp:Label>  
         </p>
            <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:TextBox ID="reportId0" runat="server" placeholder="write your reply here" Height="113px" Width="243px"></asp:TextBox>
         </p>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" BackColor="#CCFFCC" BorderColor="#00CC99" ForeColor="#000099" Height="39px" OnClick="Send" style="margin-left: 0px" Text="Send" Width="157px" />
             &nbsp;&nbsp;
             </p>
            
        </div>
        <div id ="div2" runat ="server">
               <asp:Button ID="Button2" runat="server" BackColor="#CCFFCC" BorderColor="#00CC99" ForeColor="#000099" Height="39px" OnClick="Back" style="margin-left: 0px" Text="Profile" Width="88px" />
        </div>
    </form>
</body>
</html>
