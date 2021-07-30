<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TweeterIntervalSetup.aspx.cs" Inherits="TweeterIntervalSetup" %>

<!DOCTYPE html>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="X-UA-Compatible" content="IE=10" />

	<%--<script type="text/javascript" src="Scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-ui.js"></script>
    <link rel="stylesheet" href="Scripts/jquery-ui.min.css" />
    <link rel="stylesheet" href="Scripts/jquery-ui.structure.min.css" />

    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="Scripts/bootstrap.min.css" />--%>


	<title></title>
	<telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" />
	<style type="text/css">
		.auto-style2 {
			font-size: x-large;
			color: white;
		}

		.ddlIntervalPool {
			/*width: 200px;
            height: 40px;*/
		}

		/*NAVIGATION STYLE*/

		.navbar, .navbar-default {
			background-color: rgba(40, 40, 40, 0.88);
			box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
			min-height: 70px;
			height: 77px;
			border: 0;
		}

		.background {
			background-image: url("Images/purplePolygon.jpg");
			background-repeat: no-repeat;
			background-size: cover;
		}

		.rgEditPopup {
			width: 810px !important;
		}

		body {
		}

		.radgrid, .rgEditFormContainer tr {
			/*vertical-align:middle;*/
			/*height:40px;*/
		}

		.radgrid, .rgEditFormContainer td input[type=text] {
			vertical-align: middle;
			/*height:40px;*/
		}

		.editItem {
			height: 30px;
			vertical-align: middle;
		}


		.rgEditFormContainer table {
			table-layout: fixed;
			width: 100%;
		}

			.rgEditFormContainer table td:nth-child(1) {
				width: 140px;
			}
	</style>

	<script>




		function OpenPopup() {
			var m = window.open('https://www.cyberglobes.info/HtmlMapPlacement/HtmlMapWithNoMenu.html', 'popUpWindow', ',width=1000,height=700,left=600,top=300,resizable=1,minimize=yes,dialog=yes');
			m.focus();
			return false;
		}

		function HandlePopupResult(lat, lng, radius) {

			//alert("result of popup is: " + lat + ' ' + lng + ' ' + radius );



			if ($find('RadGrid1').get_masterTableView().get_editItems() != "") {
				var editItems = $find('RadGrid1').get_masterTableView().get_editItems()[0].get_editFormItem();
				$(editItems).find("input[id*='Lat']").val(lat);
				$(editItems).find("input[id*='Long']").val(lng);
				$(editItems).find("input[id*='Radius']").val(radius);

				setFocus(editItems);

			}

			else if ($find('RadGrid1').get_masterTableView().get_insertItem() != "") {
				var insertItem = $find('RadGrid1').get_masterTableView().get_insertItem();

				$(insertItem).find("input[id*='Lat']").val(lat);
				$(insertItem).find("input[id*='Long']").val(lng);
				$(insertItem).find("input[id*='Radius']").val(radius);

				setFocus(insertItem);

			}

		}

		function setFocus(Items) {

			setTimeout(function () {
				$(Items).find("input[id*='Lat']").focus();
				$(Items).find("input[id*='Lat']").blur();
				$(Items).find("input[id*='Long']").focus();
				$(Items).find("input[id*='Long']").blur();
				$(Items).find("input[id*='Radius']").focus();
				$(Items).find("input[id*='Radius']").blur();


			}, 500);

		}


	</script>
</head>
<body class="background">
	<form id="form1" runat="server">
		<%--<div><img alt="" class="auto-style1" src="TNI.png" /> <span class="auto-style2">TNI - OSINT Solution Users Administrator </span> </div>--%>
		<section id="header">


			<nav class="navbar navbar-default">
				<div class="container">
					<table style="width: 100%;" border="0">
						<tr>
							<td>
								<a class="navbar-brand">
									<%--<img class="logo-img" src="Images/CyberglobesLogoHorizontal.png" style="height: 70px; width: 347px;" alt="" />--%>
								</a>

							</td>
							<td><span class="auto-style2">Interval Dashboard</span></td>
							<td style="width: 25%">&nbsp;</td>
						</tr>

					</table>
					<!--<object type="image/svg+xml" data="xtrmx/assets/General/.svg" class="logo-img"></object>-->




					<!-- /.navbar-header -->


				</div>
				<!-- /.container -->
			</nav>

		</section>

		<telerik:RadScriptManager ID="RadScriptManager1" runat="server">
			<Scripts>
				<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
				<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
				<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
			</Scripts>
		</telerik:RadScriptManager>
		<br />
		<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
			<AjaxSettings>
				<telerik:AjaxSetting AjaxControlID="RadGrid1">
					<UpdatedControls>
						<telerik:AjaxUpdatedControl ControlID="RadGrid1" UpdatePanelHeight="100%"></telerik:AjaxUpdatedControl>
					</UpdatedControls>
				</telerik:AjaxSetting>
			</AjaxSettings>

		</telerik:RadAjaxManager>

		<%--  <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticUpdates="True" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True"
            AutoGenerateEditColumn="True" DataSourceID="CyberglobesSqlDataSource" ShowGroupPanel="True" Skin="Black" AllowAutomaticInserts="True">
            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ClientSettings AllowDragToGroup="True">
                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
            </ClientSettings>
            <MasterTableView AllowAutomaticUpdates="true" AutoGenerateColumns="False" DataSourceID="CyberglobesSqlDataSource" CommandItemDisplay="Top">
                <Columns>
                    <telerik:GridBoundColumn DataField="Id" DataType="System.Int32" FilterControlAltText="Filter Id column" HeaderText="Id" SortExpression="Id" UniqueName="Id">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UserName" FilterControlAltText="Filter UserName column" HeaderText="UserName" SortExpression="UserName" UniqueName="UserName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UserPassword" FilterControlAltText="Filter UserPassword column" HeaderText="UserPassword" SortExpression="UserPassword" UniqueName="UserPassword">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="QueriesRemaining" DataType="System.Int32" FilterControlAltText="Filter QueriesRemaining column" HeaderText="QueriesRemaining" ReadOnly="True" SortExpression="QueriesRemaining" UniqueName="QueriesRemaining">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="QueriesGiven" DataType="System.Int32" FilterControlAltText="Filter QueriesGiven column" HeaderText="QueriesGiven" ReadOnly="True" SortExpression="QueriesGiven" UniqueName="QueriesGiven">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StartDate" DataType="System.DateTime" FilterControlAltText="Filter StartDate column" HeaderText="StartDate" ReadOnly="True" SortExpression="StartDate" UniqueName="StartDate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EndDate" DataType="System.DateTime" FilterControlAltText="Filter EndDate column" HeaderText="EndDate" ReadOnly="True" SortExpression="EndDate" UniqueName="EndDate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Permissions" FilterControlAltText="Filter Permissions column" HeaderText="Permissions" SortExpression="Permissions" UniqueName="Permissions">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SoftwareActive" DataType="System.Int32" FilterControlAltText="Filter SoftwareActive column" HeaderText="SoftwareActive" SortExpression="SoftwareActive" UniqueName="SoftwareActive">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="CyberglobesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CyberglobesAppConnectionString %>" DeleteCommand="DELETE FROM [CyberglobesUsers] WHERE [Id] = @Id" InsertCommand="INSERT INTO [CyberglobesUsers] ([UserName], [UserPassword], [QueriesRemaining], [QueriesGiven], [StartDate], [EndDate], [Permissions], [SoftwareActive]) VALUES (@UserName, @UserPassword, @QueriesRemaining, @QueriesGiven, @StartDate, @EndDate, @Permissions, @SoftwareActive)" SelectCommand="SELECT [Id], [UserName], [UserPassword], [QueriesRemaining], [QueriesGiven], [StartDate], [EndDate], [Permissions], [SoftwareActive] FROM [CyberglobesUsers]" UpdateCommand="UPDATE [CyberglobesUsers] SET [UserName] = @UserName, [UserPassword] = @UserPassword, [QueriesRemaining] = @QueriesRemaining, [QueriesGiven] = @QueriesGiven, [StartDate] = @StartDate, [EndDate] = @EndDate, [Permissions] = @Permissions, [SoftwareActive] = @SoftwareActive WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="UserPassword" Type="String" />
                <asp:Parameter Name="QueriesRemaining" Type="Int32" />
                <asp:Parameter Name="QueriesGiven" Type="Int32" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="Permissions" Type="String" />
                <asp:Parameter Name="SoftwareActive" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="UserPassword" Type="String" />
                <asp:Parameter Name="QueriesRemaining" Type="Int32" />
                <asp:Parameter Name="QueriesGiven" Type="Int32" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="Permissions" Type="String" />
                <asp:Parameter Name="SoftwareActive" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>--%>


		<div class="container-fluid">

			<telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True"
				DataSourceID="SqlDataSource2" AllowAutomaticInserts="True" AutoGenerateDeleteColumn="True" AutoGenerateEditColumn="True" CellSpacing="-1" GridLines="Both" OnItemDataBound="RadGrid1_ItemDataBound" OnItemCreated="RadGrid1_ItemCreated" Skin="Black" >
				<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
				<ClientSettings AllowDragToGroup="True">
					<Scrolling AllowScroll="False" UseStaticHeaders="False" />
				</ClientSettings>
				<MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CommandItemDisplay="Top" DataKeyNames="Id" EditMode="PopUp" Height="100%">
					<Columns>
						<telerik:GridBoundColumn DataField="Id" ItemStyle-Width="30px" DataType="System.Int32" FilterControlAltText="Filter Id column" HeaderText="Id" ReadOnly="True" SortExpression="Id" UniqueName="Id">
							<ItemStyle Width="30px"></ItemStyle>
						</telerik:GridBoundColumn>

						<telerik:GridTemplateColumn HeaderText="Name">
							<ItemTemplate>
								<asp:Label ID="lblName" Text='<%# Eval("Name") %>' runat="server"> </asp:Label>
							</ItemTemplate>
							<EditItemTemplate>
								<telerik:RadTextBox ID="txtName" CssClass="RadGrid_Black" runat="server" Skin="Black" Text='<%# Bind("Name") %>'></telerik:RadTextBox>
								<asp:RequiredFieldValidator ID="RFName" runat="server" ErrorMessage="Please enter a valid Name." ForeColor="Red" ControlToValidate="txtName"></asp:RequiredFieldValidator>

							</EditItemTemplate>

						</telerik:GridTemplateColumn>
						<%--<telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="Name" UniqueName="Name">
                                    <ColumnValidationSettings EnableRequiredFieldValidation="true">
                                        <RequiredFieldValidator ID="RFNameOld" runat="server" ErrorMessage="Please enter a valid Name." ForeColor="Red"></RequiredFieldValidator>
                                    </ColumnValidationSettings>
                                </telerik:GridBoundColumn>--%>
						<%-- <telerik:GridBoundColumn DataField="StartTime" DataType="System.DateTime" FilterControlAltText="Filter StartTime column" HeaderText="StartTime" SortExpression="StartTime" UniqueName="StartTime">
                    </telerik:GridBoundColumn>--%>
						<telerik:GridDateTimeColumn DataField="StartTime" PickerType="DatePicker" HeaderText="StartTime" UniqueName="StartTime" MinDate="1/1/1999" DataFormatString="{0:dd/MM/yyyy}">
							<ColumnValidationSettings EnableRequiredFieldValidation="true">
								<RequiredFieldValidator ID="RFStartTime" runat="server" ErrorMessage="Please enter a valid date." ForeColor="Red"></RequiredFieldValidator>
							</ColumnValidationSettings>

						</telerik:GridDateTimeColumn>
						<%--<telerik:GridBoundColumn DataField="EndTime" DataType="System.DateTime" FilterControlAltText="Filter EndTime column" HeaderText="EndTime" SortExpression="EndTime" UniqueName="EndTime">
                    </telerik:GridBoundColumn>--%>
						<telerik:GridDateTimeColumn DataField="EndTime" PickerType="DatePicker" HeaderText="EndTime" UniqueName="EndTime" MinDate="1/1/1999" DataFormatString="{0:dd/MM/yyyy}">
							<ColumnValidationSettings EnableRequiredFieldValidation="true">
								<RequiredFieldValidator ID="RFEndTime" runat="server" ErrorMessage="Please enter a valid date." ForeColor="Red"></RequiredFieldValidator>
							</ColumnValidationSettings>

						</telerik:GridDateTimeColumn>
						<telerik:GridCheckBoxColumn DataField="IsActive" DataType="System.Boolean" FilterControlAltText="Filter IsActive column" HeaderText="IsActive" SortExpression="IsActive" UniqueName="IsActive">
						</telerik:GridCheckBoxColumn>
						<telerik:GridBoundColumn Visible="false" DataField="Formula" FilterControlAltText="Filter Formula column" HeaderText="Formula" SortExpression="Formula" UniqueName="Formula">
						</telerik:GridBoundColumn>
						<telerik:GridNumericColumn DataField="Latitutde" DecimalDigits="14" FilterControlAltText="Filter Latitutde column" HeaderText="Latitutde" SortExpression="Latitutde" UniqueName="Latitutde" DataType="System.Decimal">
						</telerik:GridNumericColumn>
						<telerik:GridNumericColumn DataField="Longitude" DecimalDigits="14" DataType="System.Decimal" FilterControlAltText="Filter Longitude column" HeaderText="Longitude" SortExpression="Longitude" UniqueName="Longitude">
						</telerik:GridNumericColumn>
						<telerik:GridNumericColumn DataField="Radius" DecimalDigits="0" DataType="System.Int32" FilterControlAltText="Filter Radius column" HeaderText="Radius" SortExpression="Radius" UniqueName="Radius">
						</telerik:GridNumericColumn>
						<%-- <telerik:GridBoundColumn DataField="IntervalPool" FilterControlAltText="Filter IntervalPool column" HeaderText="IntervalPool" SortExpression="IntervalPool" UniqueName="IntervalPool">
                    </telerik:GridBoundColumn>--%>
						<%-- <telerik:GridDropDownColumn DataField="IntervalPool" HeaderText="IntervalPool" UniqueName="IntervalPool" ListDataMember="IntervalPool"
                        EmptyListItemText="--Choose--" EmptyListItemValue=""> 
                       
                    </telerik:GridDropDownColumn>
						--%>

						<telerik:GridTemplateColumn HeaderText="IntervalPool">
							<ItemTemplate>
								<asp:Label ID="lblIntervalPool" Text='<%# Eval("IntervalPool") %>' runat="server"> </asp:Label>
							</ItemTemplate>
							<EditItemTemplate>
								<telerik:RadComboBox ID="cmbIntervalPool" CssClass="RadGrid_Black" runat="server" SelectedValue='<%# Bind("IntervalPool") %>' Skin="Black">
									<Items>
										<telerik:RadComboBoxItem Text="Select..." Value=""></telerik:RadComboBoxItem>
										<telerik:RadComboBoxItem Text="1 hour" Value="1hour"></telerik:RadComboBoxItem>
										<telerik:RadComboBoxItem Text="1 day" Value="1day"></telerik:RadComboBoxItem>
										<telerik:RadComboBoxItem Text="1 week" Value="1week"></telerik:RadComboBoxItem>

									</Items>

								</telerik:RadComboBox>

								<asp:RequiredFieldValidator ID="RFcmbIntervalPool" runat="server" ErrorMessage="Please enter valid Interval." Text="Please enter valid Interval." ForeColor="Red" ControlToValidate="cmbIntervalPool" InitialValue="Select..."></asp:RequiredFieldValidator>

							</EditItemTemplate>
						</telerik:GridTemplateColumn>

						<telerik:GridTemplateColumn HeaderText="HiddenQ">
							<ItemTemplate>
								<asp:Label ID="lblHiddenQ" Text='<%# Eval("HiddenQ") %>' runat="server"> </asp:Label>
							</ItemTemplate>
							<EditItemTemplate>
								<telerik:RadTextBox ID="txtHiddenQ" CssClass="RadGrid_Black" runat="server" Skin="Black" Text='<%# Bind("HiddenQ") %>'></telerik:RadTextBox>

							</EditItemTemplate>
						</telerik:GridTemplateColumn>



						<%--                                <telerik:GridBoundColumn DataField="HiddenQ" FilterControlAltText="Filter HiddenQ column" HeaderText="HiddenQ" SortExpression="HiddenQ" UniqueName="HiddenQ">
                                </telerik:GridBoundColumn>--%>
					</Columns>

				</MasterTableView>
			</telerik:RadGrid>

			<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
				ConnectionString="<%$ ConnectionStrings:CyberglobesAppConnectionString %>" 
				DeleteCommand="DELETE FROM [TwitterTweetsInterval] WHERE [Id] = @Id" 
				InsertCommand="INSERT INTO [TwitterTweetsInterval] ([Name], [StartTime], [EndTime], [IsActive], [Formula], [Latitutde], [Longitude], [Radius], [IntervalPool], [HiddenQ]) VALUES (@Name, @StartTime, @EndTime, @IsActive, @Formula, @Latitutde, @Longitude, @Radius, @IntervalPool, @HiddenQ)" 
				SelectCommand="SELECT * FROM [TwitterTweetsInterval]" 
				UpdateCommand="UPDATE [TwitterTweetsInterval] SET [Name] = @Name, [StartTime] = @StartTime, [EndTime] = @EndTime, [IsActive] = @IsActive, [Formula] = @Formula, [Latitutde] = @Latitutde, [Longitude] = @Longitude, [Radius] = @Radius, [IntervalPool] = @IntervalPool, [HiddenQ] = @HiddenQ WHERE [Id] = @Id">
				<DeleteParameters>
					<asp:Parameter Name="Id" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="Name" Type="String" />
					<asp:Parameter Name="StartTime" Type="DateTime" />
					<asp:Parameter Name="EndTime" Type="DateTime" />
					<asp:Parameter Name="IsActive" Type="Boolean" />
					<asp:Parameter Name="Formula" Type="String" />
					<asp:Parameter Name="Latitutde" Type="Decimal" />
					<asp:Parameter Name="Longitude" Type="Decimal" />
					<asp:Parameter Name="Radius" Type="Int32" />
					<asp:Parameter Name="IntervalPool" Type="String" />
					<asp:Parameter Name="HiddenQ" Type="String" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="Name" Type="String" />
					<asp:Parameter Name="StartTime" Type="DateTime" />
					<asp:Parameter Name="EndTime" Type="DateTime" />
					<asp:Parameter Name="IsActive" Type="Boolean" />
					<asp:Parameter Name="Formula" Type="String" />
					<asp:Parameter Name="Latitutde" Type="Decimal" />
					<asp:Parameter Name="Longitude" Type="Decimal" />
					<asp:Parameter Name="Radius" Type="Int32" />
					<asp:Parameter Name="IntervalPool" Type="String" />
					<asp:Parameter Name="HiddenQ" Type="String" />
					<asp:Parameter Name="Id" Type="Int32" />
				</UpdateParameters>
			</asp:SqlDataSource>

		</div>

	</form>
	<p>
		&nbsp;
	</p>
</body>
</html>
