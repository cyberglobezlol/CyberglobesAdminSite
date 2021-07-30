<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportSocialUsers.aspx.cs" Inherits="CyberglobesAdminSite.ReportSocialUsers" %>

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
            margin:0;
            background-image: url("Images/purplePolygon.jpg");
            background-repeat: no-repeat;
            
          
            background-size: cover;
        }

        #form1 {
            margin-top: 0px;
        }

        #RadGrid1 tr {
            color:white;
        }
    </style>
</head>
<body class="background">
    <form id="form1" runat="server">
        <%--<div><img alt="" class="auto-style1" src="TNI.png" /> <span class="auto-style2">TNI - OSINT Solution Users Administrator </span> </div>--%>
        <%--<section id="header">     

            <nav class="navbar navbar-default">
                <div class="container">
                    <table style="width: 100%;" border="0">
                        <tr>
                            <td>
                                <a class="navbar-brand">
                                    <img class="logo-img" src="Images/CyberglobesLogoHorizontal.png" style="height: 70px; width: 347px;" alt="" />
                                </a>

                            </td>
                            <td><span class="auto-style2" style="text-align:center" >Social Users</span></td>
                            <td style="width:25%">&nbsp;</td>
                        </tr>
                       
                    </table>
                    

                </div>
              
            </nav>

        </section>--%>

        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
            </Scripts>
        </telerik:RadScriptManager>
     
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" UpdateInitiatorPanelsOnly="true">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadGrid1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                    </UpdatedControls>

                </telerik:AjaxSetting>
            </AjaxSettings>

        </telerik:RadAjaxManager>

        <div>
                <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" AllowPaging="true" DataSourceID="SqlDataSource1" runat="server"
                    GridLines="None" Skin="BlackMetroTouch" ForeColor="White" AllowSorting="true" AllowFilteringByColumn="True" OnPreRender="RadGrid1_PreRender"
                    ShowStatusBar="true" EnableLinqExpressions="false" AutoGenerateColumns="False" ClientSettings-Resizing-AllowColumnResize="true">
                    <MasterTableView DataKeyNames="Id" TableLayout="Fixed">
                        <Columns>
                            <telerik:GridBoundColumn DataField="Id" DataType="System.Int32" FilterControlAltText="Filter Id column" HeaderText="Id" ReadOnly="True" SortExpression="Id" UniqueName="Id">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Username" DataField="Username" HeaderText="User name"
                                AllowFiltering="false" HeaderStyle-Width="200px" />
                            <telerik:GridBoundColumn UniqueName="Password" DataField="Password" HeaderText="Password"
                                AllowFiltering="false" HeaderStyle-Width="200px" />
                            <telerik:GridBoundColumn UniqueName="Accesstoken" DataField="Accesstoken" HeaderText="Accesstoken"
                                AllowFiltering="false" HeaderStyle-Width="400px" />
                            <telerik:GridBoundColumn UniqueName="Cookie" DataField="Cookie" HeaderText="Cookie"
                                AllowFiltering="false" HeaderStyle-Width="600px" />
                            <telerik:GridBoundColumn DataField="LastUseTime" DataType="System.DateTime" HeaderText="LastUseTime" UniqueName="LastUseTime"
                                AllowFiltering="false" HeaderStyle-Width="200px" />
                            <telerik:GridBoundColumn DataField="CreateTime" DataType="System.DateTime" HeaderText="CreateTime" UniqueName="CreateTime"
                                AllowFiltering="false" HeaderStyle-Width="200px" />
                            <telerik:GridBoundColumn UniqueName="SocialType" DataField="SocialType" HeaderText="SocialType"
                                HeaderStyle-Width="200px">
                                <FilterTemplate>
                                    <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxSocialType" Skin="BlackMetroTouch" DataSourceID="SqlDataSource2" DataTextField="SocialType"
                                        DataValueField="SocialType" Width="200px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("SocialType").CurrentFilterValue %>'
                                        runat="server" OnClientSelectedIndexChanged="SocialTypeChanged">
                                        <Items>
                                            <telerik:RadComboBoxItem Text="All" />
                                        </Items>
                                    </telerik:RadComboBox>
                                    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                        <script type="text/javascript">
                                            function SocialTypeChanged(sender, args) {
                                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                                tableView.filter("SocialType", args.get_item().get_value(), "EqualTo");
                                            }
                                        </script>
                                    </telerik:RadScriptBlock>
                                </FilterTemplate>

                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn UniqueName="Uid" DataField="Uid" HeaderText="Uid"
                                AllowFiltering="false" HeaderStyle-Width="200px" />
                            <telerik:GridBoundColumn UniqueName="AccesstokenSecret" DataField="AccesstokenSecret" HeaderText="AccesstokenSecret"
                                AllowFiltering="false" HeaderStyle-Width="200px" />
                            <telerik:GridBoundColumn UniqueName="Company" DataField="Company" HeaderText="Company"
                                HeaderStyle-Width="200px">
                                <FilterTemplate>
                                    <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxCompany" Skin="BlackMetroTouch" DataSourceID="SqlDataSource3" DataTextField="Company"
                                        DataValueField="Company" Width="200px" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("Company").CurrentFilterValue %>'
                                        runat="server" OnClientSelectedIndexChanged="CompanyChanged">
                                        <Items>
                                            <telerik:RadComboBoxItem Text="All" />
                                        </Items>
                                    </telerik:RadComboBox>
                                    <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
                                        <script type="text/javascript">
                                            function CompanyChanged(sender, args) {
                                                var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                                tableView.filter("Company", args.get_item().get_value(), "EqualTo");
                                            }
                                        </script>
                                    </telerik:RadScriptBlock>
                                </FilterTemplate>

                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Blob" DataField="Blob" HeaderText="Blob"
                                AllowFiltering="false" HeaderStyle-Width="200px" />
                            <telerik:GridBoundColumn UniqueName="Status" DataField="Status" HeaderText="Status"
                                AllowFiltering="false" HeaderStyle-Width="200px" />
                            <telerik:GridBoundColumn UniqueName="AvatarID" DataField="AvatarID" HeaderText="AvatarID"
                                AllowFiltering="false" HeaderStyle-Width="200px" />
                            <telerik:GridBoundColumn UniqueName="UserAgentWeb" DataField="UserAgentWeb" HeaderText="UserAgentWeb"
                                AllowFiltering="false" />
                            <telerik:GridBoundColumn UniqueName="UserAgentMobile" DataField="UserAgentMobile" HeaderText="UserAgentMobile"
                                AllowFiltering="false" />



                        </Columns>
                    </MasterTableView>

                </telerik:RadGrid>
            </div>
          <br />
            <div style="width:1200px;">
                <telerik:RadHtmlChart runat="server" ID="RadHtmlChart1" skin="BlackMetroTouch" DataSourceID="SqlDataSource4">
                    <PlotArea>
                        <Series>
                            <telerik:BarSeries Name="avatars" DataFieldY="count_avatars" Gap="1" Spacing="10">
                                <TooltipsAppearance Color="Black" DataFormatString="{N}">
                                </TooltipsAppearance>
                                <LabelsAppearance Visible="false">
                                </LabelsAppearance>

                            </telerik:BarSeries>

                        </Series>
                        <XAxis DataLabelsField="Company" Color="White">
                            <LabelsAppearance>
                                <TextStyle Color="White" FontSize="14" />
                                <ClientTemplate>
                                #if (dataItem.Company.length > 25) {# #=dataItem.Company.substr(0,24)# #} 
                                    else {# #=dataItem.Company# #} #
                                </ClientTemplate>
                            </LabelsAppearance>
                            <MinorGridLines Visible="false"></MinorGridLines>
                            <MajorGridLines Visible="false"></MajorGridLines>
                        </XAxis>
                        <YAxis Color="White">
                            <LabelsAppearance DataFormatString="{N}"></LabelsAppearance>
                            <MinorGridLines Visible="false"></MinorGridLines>
                            <LabelsAppearance>
                                <TextStyle Color="White" FontSize="24" />
                            </LabelsAppearance>
                        </YAxis>
                    </PlotArea>
                    <Legend>
                        <Appearance Visible="false"></Appearance>
                    </Legend>
                    <ChartTitle Text="Avatars per pool">
                        <Appearance>
                            <TextStyle Color="White" FontSize="24" />
                        </Appearance>
                    </ChartTitle>
                </telerik:RadHtmlChart>

            </div>

      

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CyberglobesAppConnectionString %>"
            SelectCommand="SELECT [Id]
                    ,[Username]
                    ,[Password] 
                    ,[Accesstoken]
                    ,[Cookie]
                    ,[LastUseTime]
                    ,[CreateTime]
                    ,[SocialType]
                    ,[Uid]
                    ,[AccesstokenSecret]
                    ,[Company]
                    ,[Blob]
                    ,[Status]
                    ,[AvatarID]
                    ,[UserAgentWeb]
                    ,[UserAgentMobile]
                    FROM [CyberglobesApp].[dbo].[SocialUsers]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:CyberglobesAppConnectionString %>"
            ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT SocialType FROM [CyberglobesApp].[dbo].[SocialUsers]"
            runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:CyberglobesAppConnectionString %>"
            ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT Company FROM [CyberglobesApp].[dbo].[SocialUsers]"
            runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" ConnectionString="<%$ ConnectionStrings:CyberglobesAppConnectionString %>"
            ProviderName="System.Data.SqlClient" SelectCommand= "select [Company] , count(Id) as [count_avatars]
                        from [CyberglobesApp].[dbo].[SocialUsers]
					    where [Company] is not null  and [Company] <> '' group by [Company]" 
            runat="server"></asp:SqlDataSource>



    </form>

</body>
</html>
