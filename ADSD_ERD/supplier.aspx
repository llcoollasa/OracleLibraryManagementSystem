<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="supplier.aspx.cs" Inherits="ADSD_ERD.supplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supplier</title>
     <link rel="stylesheet" href="css/app.css" type="text/css" />
</head>
<body>
    <div class="wrapper">
        <div class="top-header"><h1>Ceylon Entertainment Service</h1></div>
        <div class="left">
            <ul>
                <li><a href="home_page.aspx">Home</a></li>
                <li><a href="client.aspx">Client</a></li>                
                <li><a href="supplier.aspx"><strong>Supplier</strong></a></li>                
                <li><a href="equipment.aspx">Equipment</a></li>                
                <li><a href="staff.aspx">Staff</a></li>                
                <li><a href="event.aspx">Event</a></li>                
                <li><a href="event-staff.aspx">Event Staff</a></li>                
                <li><a href="event-equipment.aspx">Event Equipments</a></li>                
                <li><a href="event-requirement-form.aspx">Event Requirement Form</a></li>
            </ul>
        </div>
        <div class="right">
            <div class="header"><strong>Supplier</strong></div>
            <div class="content">
                <form id="form1" runat="server">
                <div class="form">   
                    <table>
                        <tr>
                            <td><asp:Label ID="Label1" runat="server" Text="Supplier Id"></asp:Label></td>
                            <td><asp:TextBox ID="txtSupId" runat="server" Enabled="False" ></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label2" runat="server" Text="Name"></asp:Label></td>
                            <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label3" runat="server" Text="Address No"></asp:Label></td>
                            <td><asp:TextBox ID="txtAddNo" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label4" runat="server" Text="Address Line"></asp:Label></td>
                            <td><asp:TextBox ID="txtAddLine" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label5" runat="server" Text="City"></asp:Label></td>
                            <td><asp:TextBox ID="txtCity" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr class="controllers">
                            <td colspan="2">
                                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click"  />                    
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />                    
                                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
            &nbsp;<asp:Button ID="btnDelete" runat="server" Text="Delete" ForeColor="Red" OnClick="btnDelete_Click"/>
                            </td> 
                        </tr>
                    </table>
       
                </div>
                <div class="grid">
                    <asp:GridView ID="GVSupplier" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="SUP_ID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GVSupplier_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="SUP_ID" HeaderText="SUP_ID" ReadOnly="True" SortExpression="SUP_ID" />
                            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                            <asp:BoundField DataField="ADD_NO" HeaderText="ADD_NO" SortExpression="ADD_NO" />
                            <asp:BoundField DataField="ADD_LINE" HeaderText="ADD_LINE" SortExpression="ADD_LINE" />
                            <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY" />
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" /> 
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
        
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CESConnection %>" ProviderName="<%$ ConnectionStrings:CESConnection.ProviderName %>" SelectCommand="SELECT * FROM &quot;SUPPLIER&quot;"
                         > 
                    </asp:SqlDataSource>
                </div>
                </form>
            </div>
            </div>
        </div>
</body>
</html>
