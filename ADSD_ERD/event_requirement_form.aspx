<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="event_requirement_form.aspx.cs" Inherits="ADSD_ERD.event_requirement_form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Event Requirement Form</title>
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
                <li><a href="event-staff.aspx">Event Staff</a></li>
                <li><a href="event-equipment.aspx">Event Equipments</a></li>
                <li><a href="event-requirement-form.aspx"><strong>Event Requirement Form</strong></a></li>
            </ul>
        </div>
        <div class="right">
            <div class="header"><h1>Event Requirement Form</h1></div>
            <div class="content">
                <form id="form1" runat="server">

                <div class="grid">

                    <div>
                        <div>
                            <div style="width:260px;float:left">
                                EVENT NAME
                            </div>
                            <div style="width:520px;float:left">
                                <asp:DropDownList ID="DDLEvent" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceEvent" DataTextField="NAME" DataValueField="EID" OnSelectedIndexChanged="DDLEvent_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceEvent" runat="server" ConnectionString="<%$ ConnectionStrings:CESConnection %>" ProviderName="<%$ ConnectionStrings:CESConnection.ProviderName %>" SelectCommand="SELECT &quot;EID&quot;, &quot;NAME&quot; FROM &quot;EVENT&quot;"></asp:SqlDataSource>                        
                            </div>

                            <div style="width:260px;float:left">CLIENT NAME</div>
                            <div style="width:520px;float:left">
                                <asp:Label ID="lblClientName" runat="server" Text="&nbsp;"></asp:Label>
                            </div>  

                            <div style="width:260px;float:left">CLIENT ADDRESS</div>
                            <div style="width:520px;float:left">
                                <asp:Label ID="lblClientAddress" runat="server" Text="&nbsp;"></asp:Label>
                            </div>

                            <div style="width:260px;float:left">EVENT NUMBER</div>
                            <div style="width:520px;float:left">
                                <asp:Label ID="lblEventNumber" runat="server" Text="&nbsp;"></asp:Label>
                            </div>

                            <div style="width:260px;float:left">EVENT DATE</div>
                            <div style="width:520px;float:left">
                                <asp:Label ID="lblEventDate" runat="server" Text="&nbsp;"></asp:Label>
                            </div>

                            <div style="width:260px;float:left">EVENT LOCATION</div>
                            <div style="width:520px;float:left">
                                <asp:Label ID="lblEventLocation" runat="server" Text="&nbsp;"></asp:Label>
                            </div>

                            <div style="width:260px;float:left">PROJECTED COST</div>
                            <div style="width:520px;float:left">
                                <asp:Label ID="lblProjectCost" runat="server" Text="&nbsp;"></asp:Label>
                            </div>

                            <div style="width:260px;float:left">STAFF REQUIRED</div>
                            <div style="width:520px;float:left">
                                <asp:Label ID="lblStaff" runat="server" Text="&nbsp;"></asp:Label>
                            </div>

                            <div style="width:260px;float:left">EQUIPMENT REQUIRED</div>
                            <div style="width:520px;float:left">
                                <asp:Label ID="lblEquipment" runat="server" Text="&nbsp;"></asp:Label>
                            </div>



                        </div>
                    </div>

                </div>
                </form>
            </div>
            </div>
        </div>
</body>
</html>
