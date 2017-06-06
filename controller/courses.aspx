<%@ Page Language="C#" AutoEventWireup="true" CodeFile="courses.aspx.cs" Inherits="_Default" %>

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

           <asp:Button ID="Button1" runat="server" Height="33px" OnClick="Button1_Click" Text="Ask Question" Width="151px" />
           <br />
           <br />

       </div>


        <asp:Button ID="Button2" runat="server" Height="41px" Text="View Questions" Width="150px" OnClick="Button2_Click" />


        <br />
        <p>
            <asp:Button ID="Button3" runat="server" Height="37px" OnClick="Button3_Click" Text="View Assignments" Width="148px" />
        </p>


    </form>
</body>
</html>
