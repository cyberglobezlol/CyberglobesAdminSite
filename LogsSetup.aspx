<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogsSetup.aspx.cs" Inherits="CyberglobesAdminSite.LogsSetup" %>

<!DOCTYPE html>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=10" /> 

    <%--<script type="text/javascript" src="Scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-ui.js"></script>
    <link rel="stylesheet" href="Scripts/jquery-ui.min.css" />
    <link rel="stylesheet" href="Scripts/jquery-ui.structure.min.css" />--%>

<%--    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="Scripts/bootstrap.min.css" />--%>


    <title></title>
    <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
    <style type="text/css">
        .auto-style1 {
            width: 80px;
            height: 73px;
        }
        .auto-style2 {
            font-size: x-large;
            color:white;
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

        #form1 {
            margin-top: 0px;
        }

    </style>
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
                                   <%-- <img class="logo-img" src="Images/CyberglobesLogoHorizontal.png" style="height: 70px; width: 347px;" alt="" />--%>
                                </a>

                            </td>
                            <td><span class="auto-style2">System Logs for Administrator </span></td>
                            <td style="width:25%">&nbsp;</td>
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
       

          <div class="container-fluid" style="height:100%">

                    <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="true" Export AllowPaging="True" AllowSorting="True" 
                        DataSourceID="SqlDataSource1" CellSpacing="-1" GridLines="Both" Skin="Black" style="height:100%">
                        <ExportSettings ExportOnlyData="true" Excel-Format="Biff"></ExportSettings>
						<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                        <ClientSettings AllowDragToGroup="True">
                            <Scrolling AllowScroll="False" UseStaticHeaders="False" />
                        </ClientSettings>

                        <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CommandItemDisplay="Top" EditMode="PopUp" Height="100%" >
                            <CommandItemSettings ShowAddNewRecordButton="false" ShowExportToExcelButton="true" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="Id" ItemStyle-Width="30px" DataType="System.Int32" FilterControlAltText="Filter Id column" HeaderText="Id" ReadOnly="True" SortExpression="Id" UniqueName="Id">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Action" FilterControlAltText="Filter Action column" HeaderText="Action" SortExpression="Action" UniqueName="Action">
                                </telerik:GridBoundColumn>                               
                                <telerik:GridBoundColumn DataField="Search" FilterControlAltText="Filter Search column" HeaderText="Search" SortExpression="Search" UniqueName="Search">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="TimeStamp" FilterControlAltText="Filter TimeStamp column" HeaderText="TimeStamp" SortExpression="TimeStamp" UniqueName="TimeStamp" DataType="System.DateTime">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CyberglobesUserId" DataType="System.Int32" FilterControlAltText="Filter CyberglobesUserId column" HeaderText="UserId" SortExpression="CyberglobesUserId" UniqueName="CyberglobesUserId">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="UserAgent" FilterControlAltText="Filter UserAgent column" HeaderText="UserAgent" SortExpression="UserAgent" UniqueName="UserAgent">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="UserIP" FilterControlAltText="Filter UserIP column" HeaderText="UserIP" SortExpression="UserIP" UniqueName="UserIP">
                                </telerik:GridBoundColumn>



                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CyberglobesAppConnectionString %>" SelectCommand="SELECT top(10000) * FROM [CyberglobesLogs] order by TimeStamp desc" >
                </asp:SqlDataSource>

    </form>
    <p>
        &nbsp;</p>
</body>
</html>
