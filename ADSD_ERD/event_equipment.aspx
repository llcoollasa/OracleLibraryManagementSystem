<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="event_equipment.aspx.cs" Inherits="ADSD_ERD.event_equipment" %>

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
                <li><a href="event_staff.aspx">Event Staff</a></li>
                <li><a href="event_equipment.aspx"><strong>Event Equipments</strong></a></li>
                <li><a href="event_requirement_form.aspx">Event Requirement Form</a></li>
            </ul>
        </div>
        <div class="right">
            <div class="header"><strong>Event Equipment Management</strong></div>
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
                            <Strong>Equipment</Strong> 
                        </div>
                        <div> 
                            <asp:DropDownList ID="DDLEquipment" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceEQ" DataTextField="NAME" DataValueField="EQID" OnSelectedIndexChanged="DDLEquipment_SelectedIndexChanged"></asp:DropDownList> 
                            <asp:SqlDataSource ID="SqlDataSourceEQ" runat="server" ConnectionString="<%$ ConnectionStrings:CESConnection %>" ProviderName="<%$ ConnectionStrings:CESConnection.ProviderName %>" SelectCommand="SELECT &quot;EQID&quot;, &quot;NAME&quot; FROM &quot;EQUIPMENT&quot;"></asp:SqlDataSource>
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
                                <asp:Label ID="lblqty" runat="server" Text="Quantity"></asp:Label> :
                            </span>
                            <span>
                                <asp:Label ID="lQty" runat="server" Text=""></asp:Label>
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
                    <div>Allocate Quantity : <asp:TextBox ID="txtAllocatedQty" runat="server"></asp:TextBox></div>
                    <div><asp:Button ID="btnAdd" runat="server" Text="Add Equipment to Event" OnClick="btnAdd_Click" /></div>                    
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
                    GridLines="Vertical" OnRowCommand="GVEvent_RowCommand"
                    >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="EID" HeaderText="EID" ReadOnly="True" SortExpression="EID" />
                            <asp:BoundField DataField="EQID" HeaderText="EQID" ReadOnly="True" SortExpression="EQID" />
                            <asp:BoundField DataField="QTY" HeaderText="QTY" ReadOnly="True" SortExpression="QTY" />
                            <asp:BoundField DataField="NAME" HeaderText="NAME" ReadOnly="True" SortExpression="NAME" />
                            <asp:BoundField DataField="NAME1" HeaderText="NAME1" ReadOnly="True" SortExpression="NAME1" />
                            <asp:BoundField DataField="CASEE.TYPEWHEN'INT'THEN'INTERNAL'ELSE'EXTERNAL'END" HeaderText="TYPE" ReadOnly="True" SortExpression="CASEE.TYPEWHEN'INT'THEN'INTERNAL'ELSE'EXTERNAL'END" />
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
	                    EE.EID,
	                    EE.EQID,
	                    EE.QTY,
	                    S.NAME,
	                    E.NAME,
		                    CASE E.TYPE
			                    WHEN 'INT' THEN 'INTERNAL'
			                    ELSE 'EXTERNAL'
		                    END
	
                    FROM EVENT_EQUIPMENT EE
                    LEFT JOIN EQUIPMENT E
                    ON EE.EQID = E.EQID

                    LEFT JOIN SUPPLIER S
                    ON E.SUP_ID = S.SUP_ID">

                    </asp:SqlDataSource>

                </div>
                </form>
            </div>
            </div>
        </div>
</body>
</html>
