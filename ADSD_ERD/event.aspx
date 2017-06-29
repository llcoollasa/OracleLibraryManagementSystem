<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="event.aspx.cs" Inherits="ADSD_ERD._event" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Event</title>
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
                <li><a href="equipment.aspx">Equipment</a></li>
                <li><a href="staff.aspx">Staff</a></li>
                <li><a href="event.aspx"><strong>Event</strong></a></li>
                <li><a href="event_staff.aspx">Event Staff</a></li>
                <li><a href="event_equipment.aspx">Event Equipments</a></li>
                <li><a href="event_requirement_form.aspx">Event Requirement Form</a></li>
            </ul>
        </div>
        <div class="right">
            <div class="header"><strong>Event</strong></div>
            <div class="content">
                <form id="form1" runat="server">
                <div class="form">
                    <table>
                        <tr>
                            <td><asp:Label ID="Label1" runat="server" Text="Event ID"></asp:Label></td>
                            <td><asp:TextBox ID="txtEid" runat="server" Enabled="False" ></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label2" runat="server" Text="Client"></asp:Label></td>
                            <td>
                              <asp:DropDownList ID="DDLClient" runat="server" DataSourceID="SqlDataSourceClientList" DataTextField="NAME" DataValueField="CID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceClientList" runat="server" ConnectionString="<%$ ConnectionStrings:CESConnection %>" ProviderName="<%$ ConnectionStrings:CESConnection.ProviderName %>" SelectCommand="SELECT CID, &quot;NAME&quot; FROM CLIENT"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label3" runat="server" Text="Name"></asp:Label></td>
                            <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label4" runat="server" Text="Number"></asp:Label></td>
                            <td><asp:TextBox ID="txtNumber" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="vertical-align:top;"><asp:Label ID="Label5" runat="server" Text="Date"></asp:Label></td>
                            <td>
                                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                    <NextPrevStyle VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#808080" />
                                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                    <SelectorStyle BackColor="#CCCCCC" />
                                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                </asp:Calendar>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label6" runat="server" Text="Location"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="DDLLocation" runat="server" DataSourceID="SqlDataSourceLocationDDL" DataTextField="LOCATION" DataValueField="LOCATION">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceLocationDDL" runat="server" ConnectionString="<%$ ConnectionStrings:CESConnection %>" ProviderName="<%$ ConnectionStrings:CESConnection.ProviderName %>" SelectCommand="SELECT LOCATION FROM EVENT GROUP BY LOCATION"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label7" runat="server" Text="Project Cost"></asp:Label></td>
                            <td><asp:TextBox ID="txtProjectCost" runat="server"></asp:TextBox></td>
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
                    ID="GVEvent"
                    runat="server"
                    AllowPaging="True"
                    AllowSorting="True"
                    AutoGenerateColumns="False"
                    BackColor="White"
                    BorderColor="#DEDFDE"
                    BorderStyle="None"
                    BorderWidth="1px"
                    CellPadding="4"
                    DataSourceID="SqlDataSource1"
                    ForeColor="Black"
                    GridLines="Vertical" OnSelectedIndexChanged="GVEvent_SelectedIndexChanged"
                    >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="EID" HeaderText="EID" ReadOnly="True" SortExpression="EID" />
                            <asp:BoundField DataField="CID" HeaderText="CID" ReadOnly="True" SortExpression="CID" />
                            <asp:BoundField DataField="CLIENT" HeaderText="CLIENT" SortExpression="CLIENT" ReadOnly="True" />
                            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" ReadOnly="True" />
                            <asp:BoundField DataField="number" HeaderText="NUMBER" SortExpression="number" ReadOnly="True" />
                            <asp:BoundField DataField="date" DataFormatString="{0:yyyy-MM-dd}" HeaderText="DATE" ReadOnly="True" SortExpression="date" />
                            <asp:BoundField DataField="LOCATION" HeaderText="LOCATION" SortExpression="LOCATION" ReadOnly="True" />
                            <asp:BoundField DataField="PROJECT_COST" HeaderText="PROJECT_COST" ReadOnly="True" SortExpression="PROJECT_COST" />
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
                    ID="SqlDataSource1"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:CESConnection %>"
                    ProviderName="<%$ ConnectionStrings:CESConnection.ProviderName %>"
                    SelectCommand="SELECT E.EID, E.CID, E.&quot;NAME&quot;, E.&quot;number&quot;, E.&quot;date&quot;, E.LOCATION, E.PROJECT_COST, &quot;C&quot;.CID AS EXPR1, &quot;C&quot;.&quot;NAME&quot; AS Client FROM EVENT E LEFT OUTER JOIN CLIENT &quot;C&quot; ON E.CID = &quot;C&quot;.CID">
                    </asp:SqlDataSource>
                </div>
                </form>
            </div>
            </div>
        </div>
</body>
</html>
