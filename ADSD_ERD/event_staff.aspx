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
                <li><a href="event_requirement_form.aspx">Event Requirement Form</a></li>
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
                            <asp:DropDownList ID="DDLStaff" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceEquipment" DataTextField="NAME" DataValueField="EQID" OnSelectedIndexChanged="DDLStaff_SelectedIndexChanged"></asp:DropDownList> 
                            <asp:SqlDataSource ID="SqlDataSourceEquipment" runat="server" ConnectionString="<%$ ConnectionStrings:CESConnection %>" ProviderName="<%$ ConnectionStrings:CESConnection.ProviderName %>" SelectCommand="SELECT &quot;EQID&quot;, &quot;NAME&quot; FROM &quot;EQUIPMENT&quot;"></asp:SqlDataSource>
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

                <div class="clearFloat"></div>

                <div class="control">
                    <asp:Button ID="btnAdd" runat="server" Text="Add Staff Member to Event" OnClick="btnAdd_Click" />
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
                    DataSourceID="SqlDataSourceGrid"
                    ForeColor="Black"
                    GridLines="Vertical" OnRowDeleting="GVEvent_RowDeleting" OnSelectedIndexChanged="GVEvent_SelectedIndexChanged" OnRowCommand="GVEvent_RowCommand"
                    >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="EID" HeaderText="EID" ReadOnly="True" SortExpression="EID" />
                            <asp:BoundField DataField="SID" HeaderText="SID" ReadOnly="True" SortExpression="SID" />
                            <asp:BoundField DataField="NAME" HeaderText="NAME" ReadOnly="True" SortExpression="NAME" />
                            <asp:BoundField DataField="JOB_ROLE" HeaderText="JOB_ROLE" ReadOnly="True" SortExpression="JOB_ROLE" />
                            <asp:BoundField DataField="CASES.TYPEWHEN'INT'THEN'INTERNAL'ELSE'EXTERNAL'END" HeaderText="TYPE" ReadOnly="True" SortExpression="CASES.TYPEWHEN'INT'THEN'INTERNAL'ELSE'EXTERNAL'END" />
                            <asp:ButtonField ButtonType="Button" CommandName="btnDelete" Text="Delete">
                            <ControlStyle ForeColor="Red" />
                            </asp:ButtonField>
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

                    <asp:SqlDataSource ID="SqlDataSourceGrid" runat="server" ConnectionString="<%$ ConnectionStrings:CESConnection %>" ProviderName="<%$ ConnectionStrings:CESConnection.ProviderName %>" SelectCommand="
                    SELECT 
	                    ES.EID,
	                    ES.SID,
	                    S.NAME,
	                    S.job_role,
		                    CASE S.TYPE
			                    WHEN 'INT' THEN 'INTERNAL'
			                    ELSE 'EXTERNAL'
		                    END
	
                    FROM EVENT_STAFF ES

	                    LEFT JOIN STAFF S
	                    ON ES.SID = S.SID

                    ORDER BY ES.SID">

                    </asp:SqlDataSource>

                </div>
                </form>
            </div>
            </div>
        </div>
</body>
</html>
