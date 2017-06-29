<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Equipment.aspx.cs" Inherits="ADSD_ERD.Equipment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Equipment</title>
     <link rel="stylesheet" href="css/app.css" type="text/css" />
</head>
<body>
    <div class="wrapper">
        <div class="top-header"><h1>Ceylon Entertainment Service</h1></div>
        <div class="left">
            <ul>
                <li><a href="home_page.aspx">Home</a></li>
                <li><a href="client.aspx">Client</a></li>
                <li><a href="supplier.aspx">Supplier</a></li>
                <li><a href="equipment.aspx"><strong>Equipment</strong></a></li>
                <li><a href="staff.aspx">Staff</a></li>
                <li><a href="event.aspx">Event</a></li>
                <li><a href="event_staff.aspx">Event Staff</a></li>
                <li><a href="event_equipment.aspx">Event Equipments</a></li>
                <li><a href="event_requirement_form.aspx">Event Requirement Form</a></li>
            </ul>
        </div>
        <div class="right">
            <div class="header"><strong>Equipment</strong></div>
            <div class="content">
                <form id="form1" runat="server">
                <div class="form">
                    <table>
                        <tr>
                            <td><asp:Label ID="Label1" runat="server" Text="Equipment ID"></asp:Label></td>
                            <td><asp:TextBox ID="txteqid" runat="server" Enabled="False" ></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label2" runat="server" Text="Supplier"></asp:Label></td>
                            <td>
                              <asp:DropDownList ID="DDLSupplier" runat="server" DataSourceID="SqlDataSourceSupplier" DataTextField="NAME" DataValueField="SUP_ID">
                                  <asp:ListItem>None</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceSupplier" runat="server" ConnectionString="<%$ ConnectionStrings:CESConnection %>" ProviderName="<%$ ConnectionStrings:CESConnection.ProviderName %>" SelectCommand="SELECT SUP_ID, &quot;NAME&quot; FROM SUPPLIER UNION SELECT 0 AS EXPR1, 'None' AS EXPR2 FROM dual"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label3" runat="server" Text="Name"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label4" runat="server" Text="Quantity"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtQty" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label5" runat="server" Text="Type"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="DDLType" runat="server">
                                    <asp:ListItem Selected="True" Value="INT">Internal</asp:ListItem>
                                    <asp:ListItem Value="EXT">External</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><asp:CheckBox ID="ChkAvailability" runat="server" Checked="True" Text="Availablity" /></td>
                        </tr>
                        <tr class="controllers">
                            <td colspan="2">
                                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click"  />
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" ForeColor="Red" OnClick="btnDelete_Click" />
                            </td>
                        </tr>
                    </table>

                </div>
                <div class="grid">
                    <asp:GridView
                    ID="GVEquipment"
                    runat="server"
                    AllowPaging="True"
                    AllowSorting="True"
                    AutoGenerateColumns="False"
                    BackColor="White"
                    BorderColor="#DEDFDE"
                    BorderStyle="None"
                    BorderWidth="1px"
                    CellPadding="4"
                    DataSourceID="SqlDataSource2"
                    ForeColor="Black"
                    GridLines="Vertical" OnSelectedIndexChanged="GVEquipment_SelectedIndexChanged" OnLoad="GVEquipment_Load"
                    >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="EQID" HeaderText="EQID" ReadOnly="True" SortExpression="EQID"/>
                            <asp:BoundField DataField="SUP_ID" HeaderText="SUP ID" ReadOnly="True" SortExpression="SUP_ID" />
                            <asp:BoundField DataField="NAME" HeaderText="SUP NAME" ReadOnly="True" SortExpression="NAME" />
                            <asp:BoundField DataField="NAME1" HeaderText="NAME" ReadOnly="True" SortExpression="NAME1" />
                            <asp:BoundField DataField="QTY" HeaderText="QTY" ReadOnly="True" SortExpression="QTY" />
                            <asp:BoundField DataField="TYPE" HeaderText="TYPE" ReadOnly="True" SortExpression="TYPE" />
                            <asp:BoundField DataField="AVAILABLE" HeaderText="AVAILABLE" ReadOnly="True" SortExpression="AVAILABLE" />
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

                    <asp:SqlDataSource
                    ID="SqlDataSource2"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:CESConnection %>"
                    ProviderName="<%$ ConnectionStrings:CESConnection.ProviderName %>"
                    SelectCommand="SELECT 
E.EQID AS EQID,
S.SUP_ID AS SUP_ID,
S.NAME AS NAME,
E.NAME AS NAME1,
E.QTY AS QTY,
E.TYPE AS TYPE,
E.AVAILABLE AS  AVAILABLE
FROM equipment E
LEFT JOIN  supplier S
ON E.sup_id = S.sup_id">
                    </asp:SqlDataSource>
                </div>
                </form>
            </div>
            </div>
        </div>
</body>
</html>
