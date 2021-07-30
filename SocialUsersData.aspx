<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SocialUsersData.aspx.cs" Inherits="CyberglobesAdminSite.SocialUsersData" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" />
    <script src="Scripts/jquery-3.3.1.min.js"></script>

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
            background-color: rgba(40, 40, 40, 0.78);
            /*box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);*/
            /*min-height: 70px;*/
            height: 100px;
            border: 0;
        }

        .background {
            background-image: url("Images/purplePolygon.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            margin:0;
        }

        #form1 {
            margin-top: 0px;
        }

        body html{
            
            width: 100%; height: 100%;
        }

        .iframRow #SocialDataIFrame
        {           
            display:block;
            width: 100%;
            height: 100%;
            border: none;
        }

        .header {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 100px;
        }

        .iframRow {
            position: absolute;
            top: 100px;
            left: 0;
            right: 0;
            bottom: 0;
            
        }



    </style>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">

                $(document).ready(function () {
                    debugger;
                    RadComboBoxSocialType_SelectedIndexChanged();
                   
                })

                function RadComboBoxSocialType_SelectedIndexChanged() {
                    debugger;
                    var combo = $find('<%=rcbServerList.ClientID %>');
                    //alert(combo.get_selectedItem().get_value());

                    $('#SocialDataIFrame').attr('src', combo.get_selectedItem().get_value() + "/CyberglobesAdminSite/ReportSocialUsers.aspx?key=" + $('#hiddenKey').val() );

                }


        </script>
    </telerik:RadCodeBlock>

    <title></title>
</head>
<body class="background">
    <form id="form1" runat="server">

        <asp:HiddenField ID="hiddenKey" runat="server"/>
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
                            <td><span class="auto-style2" style="text-align: center">Social Users</span></td>
                            <td style="width: 25%">&nbsp;</td>
                        </tr>

                    </table>
                </div>
                <div class="container" style="margin: 0 20px;">
                   
                    <telerik:RadComboBox RenderMode="Lightweight" ID="rcbServerList" Skin="BlackMetroTouch" DataSourceID="SqlDataSource1"
                    Width="400px" AppendDataBoundItems="true" datatextfield="OrganizationCode" 
                    datavaluefield="ServerDomain" runat="server" OnClientSelectedIndexChanged="RadComboBoxSocialType_SelectedIndexChanged" >
                    </telerik:RadComboBox>
                </div>
            </nav>

        </section>
      
        <div class="iframRow">
            <iframe id="SocialDataIFrame" runat="server"></iframe>
        </div>



        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
            </Scripts>
        </telerik:RadScriptManager>
        <br />
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" UpdateInitiatorPanelsOnly="true">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadGrid1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                    </UpdatedControls>

                </telerik:AjaxSetting>
            </AjaxSettings>

        </telerik:RadAjaxManager>

         <asp:SqlDataSource ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:CyberglobesAppConnectionString %>"
            ProviderName="System.Data.SqlClient" SelectCommand="select [Id] , [OrganizationCode] , [ServerDomain] 
            FROM [CyberglobesApp].[dbo].[CyberglobesServer] where [IsAvatarsPool] = 1" 
            runat="server"></asp:SqlDataSource>


    </form>
</body>
</html>
