<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChildrenSchools.aspx.cs" Inherits="ChildrenSchools" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #div1 {
            height: 308px;
        }
        #div2 {
            height: 80px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="width:375px; height:453px; padding:10px;border:10px solid yellowgreen;">
    <div id="div0" runat="server">
     
    </div>
        <div id="div1">
           <p>
             <asp:Label ID="Label1" runat="server" Text="School name"></asp:Label>
             &nbsp;
             <asp:TextBox ID="School_name" runat="server"></asp:TextBox>
        </p>
        <p>

        &nbsp;
             <asp:Label ID="Label2" runat="server" Text="Review"></asp:Label>

        </p>
             <p style="height: 149px">
             &nbsp;
             <asp:TextBox ID="rev" runat="server" Height="140px" Width="293px" style="margin-left: 0px"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" BackColor="#CCFFCC" BorderColor="#00CC99" ForeColor="#000099" Height="39px" OnClick="Send" style="margin-left: 0px" Text="Send" Width="116px" />
         </p>
            <br />
            <asp:Button ID="Button1" runat="server" BackColor="#CCFFCC" BorderColor="#00CC99" ForeColor="#000099" Height="39px" OnClick="Back" style="margin-left: 0px" Text="Profile" Width="68px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
    </form>
</body>
</html>
