<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="client.aspx.cs" Inherits="ADSD_ERD.client" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function isDelete() {
            return confirm("Are your sure you want to delete?");
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>   
        <div>
            <asp:Label ID="Label1" runat="server" Text="Client Id"></asp:Label>
            <asp:TextBox ID="txtCid" runat="server"></asp:TextBox>
        </div>
          
        <div>
            <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        </div>
        
        <div>
            <asp:Label ID="Label3" runat="server" Text="Address No"></asp:Label>
            <asp:TextBox ID="txtAddNo" runat="server"></asp:TextBox>
        </div>
        
        <div>
            <asp:Label ID="Label4" runat="server" Text="Address Line"></asp:Label>
            <asp:TextBox ID="txtAddLine" runat="server"></asp:TextBox>
        </div>
        
        <div>
            <asp:Label ID="Label5" runat="server" Text="City"></asp:Label>
            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
        </div>
        
        <div>
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Delete" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Add" />
        </div> 
    </div>
        <asp:GridView ID="GVClient" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="CID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="GVClient_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="CID" HeaderText="CID" ReadOnly="True" SortExpression="CID" />
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                <asp:BoundField DataField="ADD_NO" HeaderText="ADD_NO" SortExpression="ADD_NO" />
                <asp:BoundField DataField="ADD_LINE" HeaderText="ADD_LINE" SortExpression="ADD_LINE" />
                <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY" />
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" /> 
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
&nbsp;&nbsp;&nbsp;
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CESConnection %>" ProviderName="<%$ ConnectionStrings:CESConnection.ProviderName %>" SelectCommand="SELECT * FROM &quot;CLIENT&quot;"
             > 
        </asp:SqlDataSource>
    </form>
</body>
</html>
