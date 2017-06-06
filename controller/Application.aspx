<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Application.aspx.cs" Inherits="Application" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body style="height: 313px">
    <form id="form1" runat="server">
    <div id ="div1" style="width:200px;height:533px; padding:10px;border:10px solid yellowgreen;">
        <p>
        
        <asp:Label ID="Label1" runat="server" Text="Child's name"></asp:Label>  &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
         <asp:TextBox ID="Child_name" runat="server"></asp:TextBox>    
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" Text="Child's SSN"></asp:Label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <asp:TextBox ID="SSN" runat="server"></asp:TextBox>
        </p>
    <p>
        <asp:Label ID="Label3" runat="server" Text="Child's birthdate"></asp:Label>  &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="b_date" runat="server" Height="25px" Width="168px"></asp:TextBox>
    </p>
        <p>
        &nbsp;&nbsp;<asp:Label ID="Label6" runat="server" Text="gender"></asp:Label>  &nbsp;<asp:RadioButtonList ID="rbtLstRating" runat="server" 
                RepeatDirection="Horizontal" RepeatLayout="Table">
                <asp:ListItem Text="male" Value="male"></asp:ListItem>
                <asp:ListItem Text="female" Value="female"></asp:ListItem>
               
            </asp:RadioButtonList>
       
    </p>
    
    <p>
        &nbsp;<asp:Label ID="Label5" runat="server" Text="school name"></asp:Label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="school_name" runat="server"></asp:TextBox>
    </p>
        <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" BackColor="#CCFFCC" BorderColor="#00CC99" ForeColor="#000099" Height="39px" OnClick="Apply" style="margin-left: 0px" Text="Apply" Width="81px" />
    </p>
        </div>
    <div id ="div" runat="server">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label7" runat="server" Text="Application has been submitted successfuly!" Visible="False"></asp:Label> 
        <br />
    </div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
        <asp:Button ID="Button2" runat="server" BackColor="#CCFFCC" BorderColor="#00CC99" ForeColor="#000099" Height="39px" OnClick="Okay" style="margin-left: 0px" Text="Okay" Width="81px" Visible="False" />
        </form>
    
    </body>
</html>
