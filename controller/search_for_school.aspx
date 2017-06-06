<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search_for_school.aspx.cs" Inherits="search_for_school" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="info" runat="server"></asp:TextBox>
        <asp:Button ID="search" runat="server" Text="Search" OnClick="search_Click" />
        <br />
        <asp:RadioButtonList ID="option" runat="server">
            <asp:ListItem Value="type">By Type</asp:ListItem> 
            <asp:ListItem Value="name">By Name</asp:ListItem>
            <asp:ListItem Value="address">By Address</asp:ListItem>
        </asp:RadioButtonList>

    </div>
        <div id="results">
            <asp:Table ID="res_table" runat="server" BackColor="Navy"
            BorderColor="WhiteSmoke"
            BorderWidth="2"
            ForeColor="Snow"
            CellPadding="5"
            CellSpacing="5">
                <asp:TableHeaderRow><asp:TableHeaderCell>ID</asp:TableHeaderCell><asp:TableHeaderCell>Name</asp:TableHeaderCell><asp:TableHeaderCell>Phone</asp:TableHeaderCell><asp:TableHeaderCell>address</asp:TableHeaderCell><asp:TableHeaderCell>email</asp:TableHeaderCell><asp:TableHeaderCell>mission</asp:TableHeaderCell><asp:TableHeaderCell>Vision</asp:TableHeaderCell><asp:TableHeaderCell>fees</asp:TableHeaderCell></asp:TableHeaderRow>

            </asp:Table>
        </div>
    </form>
</body>
</html>
