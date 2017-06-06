<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeachersRatings.aspx.cs" Inherits="TeachersRatings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="width:375px; height:347px; padding:10px;border:10px solid yellowgreen;">
        <p>

             <asp:Label ID="Label3" runat="server" Text="Teachers of my children"></asp:Label>
        </p>
        <div id="div0" runat="server">
        </div>
        <div id="div1" runat="server">

        </div>
        <div id ="div2" runat="server">
         <p>
        <asp:Label ID="Label1" runat="server" Text="Teacher's username"></asp:Label>  &nbsp;&nbsp;<asp:TextBox ID="Teacher_username" runat="server"></asp:TextBox>
             &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
         </p>
        <asp:Label ID="Label2" runat="server" Text="Your rating"></asp:Label>  &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
         <asp:TextBox ID="Rate" runat="server"></asp:TextBox>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" BackColor="#CCFFCC" BorderColor="#00CC99" ForeColor="#000099" Height="39px" OnClick="Rate_teacher" style="margin-left: 0px" Text="Rate" Width="157px" />
             &nbsp;&nbsp;
               
             </p>
            
        </div>
        <div id ="div3" runat ="server">
               <asp:Button ID="TeacherRatingBack" runat="server" BackColor="#CCFFCC" BorderColor="#00CC99" ForeColor="#000099" Height="39px" OnClick="Back_to_profile" style="margin-left: 0px" Text="Profile" Width="88px" />
           </div>
    </form>
    
</body>
</html>
