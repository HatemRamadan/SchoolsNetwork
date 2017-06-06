<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_questions.aspx.cs" Inherits="view_questions" Debug="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="questions" runat="server">
        <asp:Button ID="Button1" runat="server" Text="My Page" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:ListBox ID="q_list" runat="server">
            
        </asp:ListBox>
        <br />
        <asp:TextBox ID="content" runat="server" Columns="2000" Height="196px" Rows="2000" Width="725px"></asp:TextBox>
        <asp:Button ID="answer" runat="server" Text="Answer The Question" OnClick="answer_Click"  />
        <asp:Button ID="update" runat="server" Text="Click Me!!" OnClick="update_Click" />
     </div>
    </form>
</body>
</html>
