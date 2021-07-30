<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportFacebookUsers.aspx.cs" Inherits="CyberglobesAdminSite.ReportFacebookUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

        </div>
    	<telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
			<MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
				<Columns>
					<telerik:GridBoundColumn DataField="Id" DataType="System.Int32" FilterControlAltText="Filter Id column" HeaderText="Id" ReadOnly="True" SortExpression="Id" UniqueName="Id">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="FacebookId" FilterControlAltText="Filter FacebookId column" HeaderText="FacebookId" SortExpression="FacebookId" UniqueName="FacebookId">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="FacebookUsername" FilterControlAltText="Filter FacebookUsername column" HeaderText="FacebookUsername" SortExpression="FacebookUsername" UniqueName="FacebookUsername">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="Name" UniqueName="Name">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="Gender" FilterControlAltText="Filter Gender column" HeaderText="Gender" SortExpression="Gender" UniqueName="Gender">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="Locale" FilterControlAltText="Filter Locale column" HeaderText="Locale" SortExpression="Locale" UniqueName="Locale">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="Hometown" FilterControlAltText="Filter Hometown column" HeaderText="Hometown" SortExpression="Hometown" UniqueName="Hometown">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="Location" FilterControlAltText="Filter Location column" HeaderText="Location" SortExpression="Location" UniqueName="Location">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="LastWorkDetails" FilterControlAltText="Filter LastWorkDetails column" HeaderText="LastWorkDetails" SortExpression="LastWorkDetails" UniqueName="LastWorkDetails">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="ContactInfo" FilterControlAltText="Filter ContactInfo column" HeaderText="ContactInfo" SortExpression="ContactInfo" UniqueName="ContactInfo">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="Birthday" FilterControlAltText="Filter Birthday column" HeaderText="Birthday" SortExpression="Birthday" UniqueName="Birthday">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="RelationshipStatus" FilterControlAltText="Filter RelationshipStatus column" HeaderText="RelationshipStatus" SortExpression="RelationshipStatus" UniqueName="RelationshipStatus">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="UpdatedTime" DataType="System.DateTime" FilterControlAltText="Filter UpdatedTime column" HeaderText="UpdatedTime" SortExpression="UpdatedTime" UniqueName="UpdatedTime">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="Bio" FilterControlAltText="Filter Bio column" HeaderText="Bio" SortExpression="Bio" UniqueName="Bio">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="Quotes" FilterControlAltText="Filter Quotes column" HeaderText="Quotes" SortExpression="Quotes" UniqueName="Quotes">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="About" FilterControlAltText="Filter About column" HeaderText="About" SortExpression="About" UniqueName="About">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="Email" FilterControlAltText="Filter Email column" HeaderText="Email" SortExpression="Email" UniqueName="Email">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="MobilePhone" FilterControlAltText="Filter MobilePhone column" HeaderText="MobilePhone" SortExpression="MobilePhone" UniqueName="MobilePhone">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="Image" FilterControlAltText="Filter Image column" HeaderText="Image" SortExpression="Image" UniqueName="Image">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="UploadMethod" FilterControlAltText="Filter UploadMethod column" HeaderText="UploadMethod" SortExpression="UploadMethod" UniqueName="UploadMethod">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="UploadUser" FilterControlAltText="Filter UploadUser column" HeaderText="UploadUser" SortExpression="UploadUser" UniqueName="UploadUser">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="ParentID" FilterControlAltText="Filter ParentID column" HeaderText="ParentID" SortExpression="ParentID" UniqueName="ParentID">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="rsvp_status" FilterControlAltText="Filter rsvp_status column" HeaderText="rsvp_status" SortExpression="rsvp_status" UniqueName="rsvp_status">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="SavedID" DataType="System.Int32" FilterControlAltText="Filter SavedID column" HeaderText="SavedID" SortExpression="SavedID" UniqueName="SavedID">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="GroupJoinDate" DataType="System.DateTime" FilterControlAltText="Filter GroupJoinDate column" HeaderText="GroupJoinDate" SortExpression="GroupJoinDate" UniqueName="GroupJoinDate">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="GroupMembershipLevel" FilterControlAltText="Filter GroupMembershipLevel column" HeaderText="GroupMembershipLevel" SortExpression="GroupMembershipLevel" UniqueName="GroupMembershipLevel">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="ParentType" FilterControlAltText="Filter ParentType column" HeaderText="ParentType" SortExpression="ParentType" UniqueName="ParentType">
					</telerik:GridBoundColumn>
					<telerik:GridBoundColumn DataField="ProfileAboutID" DataType="System.Int32" FilterControlAltText="Filter ProfileAboutID column" HeaderText="ProfileAboutID" SortExpression="ProfileAboutID" UniqueName="ProfileAboutID">
					</telerik:GridBoundColumn>
				</Columns>
			</MasterTableView>
		</telerik:RadGrid>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CyberglobesExportDBConnectionString %>" SelectCommand="SELECT * FROM [FacebookUser]"></asp:SqlDataSource>
    </form>
</body>
</html>
