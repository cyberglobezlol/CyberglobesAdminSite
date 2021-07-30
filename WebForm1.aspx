<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CyberglobesAdminSite.WebForm1" %>
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
                            <td><span class="auto-style2" style="text-align:center" >System Users Passwords Administrator </span></td>
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

       

          <div class="container-fluid" style="height:90%">

                    <telerik:RadGrid   AllowAutomaticUpdates="True" AutoGenerateEditColumn="True" ID="RadGrid1" runat="server" AllowSorting="True"  DataSourceID="SqlDataSource1" Skin="BlackMetroTouch">
						<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
						<MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="Id">
							<Columns>
								<telerik:GridBoundColumn DataField="Id" DataType="System.Int32" FilterControlAltText="Filter Id column" HeaderText="Id" ReadOnly="True" SortExpression="Id" UniqueName="Id">
								</telerik:GridBoundColumn>
                                   <telerik:GridTemplateColumn HeaderText="Username">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" Text='<%# Eval("Username") %>' runat="server"> </asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox ID="txtUsername" CssClass="RadGrid_Black" runat="server" Skin="Black" Text='<%# Bind("Username") %>'>  </telerik:RadTextBox>
                                        <asp:RequiredFieldValidator ID="RFName" runat="server" ErrorMessage="Please enter a valid Name." ForeColor="Red" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>

                                   <telerik:GridTemplateColumn HeaderText="Password">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPassword" Text='<%# Eval("Password") %>' runat="server"> </asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox ID="txtPassword" CssClass="RadGrid_Black" runat="server" Skin="Black" Text='<%# Bind("Password") %>'>  </telerik:RadTextBox>
                                        <asp:RequiredFieldValidator ID="RFPassword" runat="server" ErrorMessage="Please enter a valid Password." ForeColor="Red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>

								<telerik:GridTemplateColumn HeaderText="Email">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmail" Text='<%# Eval("Email") %>' runat="server"> </asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <telerik:RadTextBox ID="txtEmail" CssClass="RadGrid_Black" runat="server" Skin="Black" Text='<%# Bind("Email") %>'>  </telerik:RadTextBox>
                                        <asp:RequiredFieldValidator ID="RFEmail" runat="server" ErrorMessage="Please enter a valid Email." ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>

	
								<%--<telerik:GridBoundColumn DataField="StartDate" DataType="System.DateTime" FilterControlAltText="Filter StartDate column" HeaderText="StartDate" SortExpression="StartDate" UniqueName="StartDate">
								</telerik:GridBoundColumn>
								<telerik:GridBoundColumn DataField="EndDate" DataType="System.DateTime" FilterControlAltText="Filter EndDate column" HeaderText="EndDate" SortExpression="EndDate" UniqueName="EndDate">
								</telerik:GridBoundColumn>--%>
							</Columns>
						</MasterTableView>
					</telerik:RadGrid>
					<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CyberglobesAppConnectionString %>" UpdateCommand="Update [CyberglobesClientUsers] SET [Username] = @Username, [Password] = @Password, [Email] = @Email WHERE [Id] = @Id" SelectCommand="SELECT [Id], [Username], [Password], [Email], [StartDate], [EndDate] FROM [CyberglobesClientUsers]">
						<UpdateParameters>
                        <asp:Parameter Name="Username" Type="String" />
                        <%--<asp:Parameter Name="StartDate" Type="DateTime" />
                        <asp:Parameter Name="EndDate" Type="DateTime" />--%>
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>

					</asp:SqlDataSource>
                </div>

    </form>
  
</body>
</html>
