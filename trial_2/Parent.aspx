<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Parent.aspx.cs" Inherits="Parent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 316px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div  id ="div1" style="width:243px; height:469px; padding:10px;border:10px solid yellowgreen;">
     &nbsp;
     <asp:Button ID="Button1" runat="server" OnClick="apply" Text="Apply for a child" />
        <br />
        <br />
&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" OnClick="view_schools_accepted" Text="Enroll a Child" Width="177px" />
        <br />
        <br />
&nbsp;
      <asp:Button ID="Button3" runat="server" OnClick="view_Teachers_along_with_their_ratings" Text="View Taechers of my children" Width="178px" Height="30px" />
        <br />
        <br />
&nbsp;
      <asp:Button ID="Button4" runat="server" OnClick="view_my_children_schools" Text="View my children schools" Width="178px" Height="30px" />
        <br />
        <br />
&nbsp;
    <asp:Button ID="Button5" runat="server" OnClick="view_my_reviews" Text="View my reviews" Width="178px" Height="30px" />
        <br />
        <br />
&nbsp;&nbsp;
    <asp:Button ID="Button6" runat="server" OnClick="view_reports" Text="View Reports about my children" Width="178px" Height="30px" />
        <br />
&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;
    <asp:Button ID="Button7" runat="server" OnClick="Logout" Text="Log out" Width="178px" Height="30px" />
    </div>
       
    </form>
</body>
</html>
