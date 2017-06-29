<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="event_staff.aspx.cs" Inherits="ADSD_ERD.event_staff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Event Staff</title>
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
                <li><a href="event.aspx">Event</a></li>
                <li><a href="event_staff.aspx"><strong>Event Staff</strong></a></li>
                <li><a href="event_equipment.aspx">Event Equipments</a></li>
                <li><a href="event_requirement-form.aspx">Event Requirement Form</a></li>
            </ul>
        </div>
        <div class="right">
            <div class="header"><strong>Event Staff Management</strong></div>
            <div class="content">
                <form id="form1" runat="server">
                <div class="form">

                    <div class="event">
                        <div>
                            <Strong>Event</Strong>
                        </div>
                        <div>
                            <asp:DropDownList ID="DDLEvent" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceEvent" DataTextField="NAME" DataValueField="EID" OnSelectedIndexChanged="DDLEvent_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceEvent" runat="server" ConnectionString="<%$ ConnectionStrings:CESConnection %>" ProviderName="<%$ ConnectionStrings:CESConnection.ProviderName %>" SelectCommand="SELECT &quot;EID&quot;, &quot;NAME&quot; FROM &quot;EVENT&quot;"></asp:SqlDataSource>
                        </div>
                        <div>
                            <span>
                                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label> : 
                            </span>
                            <span>
                                <asp:Label ID="lName" runat="server" Text=""></asp:Label>
                            </span>
                        </div>
                        <div>
                            <span>
                                <asp:Label ID="Label3" runat="server" Text="Number"></asp:Label> : 
                            </span>
                            <span>
                                <asp:Label ID="lNumber" runat="server" Text=""></asp:Label>
                            </span>
                        </div>
                        <div>
                            <span>
                                <asp:Label ID="Label5" runat="server" Text="Date"></asp:Label> : 
                            </span>
                            <span>
                                <asp:Label ID="lDate" runat="server" Text=""></asp:Label>
                            </span>
                        </div>
                        <div>
                            <span>
                                <asp:Label ID="Label2" runat="server" Text="Location"></asp:Label> : 
                            </span>
                            <span
                                <asp:Label ID="lLocation" runat="server" Text=""></asp:Label>
                            </span>
                        </div>
                        <div>
                            <span>
                                <asp:Label ID="Label4" runat="server" Text="Project Cost"></asp:Label> : 
                            </span>
                            <span>
                                <asp:Label ID="lProjectCost" runat="server" Text=""></asp:Label>
                            </span>
                        </div>
                    </div>
                            
                             
                    <div class="staff">
                        <div> 
                            <Strong>Staff</Strong> 
                        </div>
                        <div> 
                            <asp:DropDownList ID="DDLStaff" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceStaff" DataTextField="NAME" DataValueField="SID" OnSelectedIndexChanged="DDLStaff_SelectedIndexChanged"></asp:DropDownList> 
                            <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" ConnectionString="<%$ ConnectionStrings:CESConnection %>" ProviderName="<%$ ConnectionStrings:CESConnection.ProviderName %>" SelectCommand="SELECT &quot;SID&quot;, &quot;NAME&quot; FROM &quot;STAFF&quot;"></asp:SqlDataSource>
                        </div>
                        <div>
                            <span>
                                <asp:Label ID="lblStafName" runat="server" Text="Name"></asp:Label> : 
                            </span>
                            <span>
                                <asp:Label ID="lStafName" runat="server" Text=""></asp:Label>
                            </span>
                        </div>
                        <div>
                            <span>
                                <asp:Label ID="lblJobRole" runat="server" Text="Job Role"></asp:Label> : 
                            </span>
                            <span>
                                <asp:Label ID="lJobRole" runat="server" Text=""></asp:Label>
                            </span>
                        </div>
                        <div>
                            <span>
                                <asp:Label ID="lblType" runat="server" Text="Type"></asp:Label> : 
                            </span>
                            <span>
                                <asp:Label ID="lType" runat="server" Text=""></asp:Label>
                            </span>
                        </div>
                    </div>    

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
                    DataKeyNames="EID"
                    DataSourceID="SqlDataSource1"
                    ForeColor="Black"
                    GridLines="Vertical"
                    >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="EID" HeaderText="EID" ReadOnly="True" SortExpression="EID" />
                            <asp:BoundField DataField="CID" HeaderText="CID" SortExpression="CID" />
                            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                            <asp:BoundField DataField="number" HeaderText="number" SortExpression="number" />
                            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                            <asp:BoundField DataField="LOCATION" HeaderText="LOCATION" SortExpression="LOCATION" />
                            <asp:BoundField DataField="PROJECT_COST" HeaderText="PROJECT_COST" SortExpression="PROJECT_COST" />
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
                    SelectCommand="SELECT * FROM &quot;EVENT&quot;">
                    </asp:SqlDataSource>
                </div>
                </form>
            </div>
            </div>
        </div>
</body>
</html>
