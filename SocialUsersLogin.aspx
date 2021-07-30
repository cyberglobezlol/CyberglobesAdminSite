<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SocialUsersLogin.aspx.cs" Inherits="CyberglobesAdminSite.SocialUsersLogin" %>


<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" />
    <style type="text/css">
        .validationSummary {
            font-family: "Segoe UI",Arial,Helvetica,sans-serif;
            font-size: 12px;
        }

        .validators input,
        .validators input.rfdTextInput {
            margin-bottom: 3px;
        }

        .fieldRow {
            margin-top: 4px;
        }

            .fieldRow label {
                width: 140px;
                display: block;
                float: left;
            }

        .RadForm_MetroTouch .mtFix {
            margin-top: 50px;
        }

        .demo-container strong {
            display: block;
            font-size: 14px;
            margin-bottom: 30px;
        }

        .size-custom {
            min-width: 400px;
            min-height: 328px;
            vertical-align:bottom;
             

        }

        .demo-containers {
            max-width: 1000px;
            margin: 0 auto;
           
        }

        .login{
            vertical-align:central;            

        }

        .background {
            background-image: url("Images/purplePolygon.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            margin: 0;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
        }

        .centered {
            position: fixed;
            top: 50%;
            left: 50%;
            /* bring your own prefixes */
            transform: translate(-50%, -50%);
        }


    </style>

    <title></title>
</head>
<body class="background">
    <form id="form1" runat="server">

        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        

            <div class="validationSummary centered">
                <telerik:RadFormDecorator RenderMode="Lightweight" Skin="BlackMetroTouch" ID="RadFormDecorator1" runat="server" DecoratedControls="All"
                     ></telerik:RadFormDecorator>

             
                    <asp:Panel runat="server" ID="Panel1">
                       
                        <asp:Login ID="Login2" runat="server" Align="Center"  EnableViewState="false" OnAuthenticate="Login2_Authenticate" DestinationPageUrl="~/SocialUsersData.aspx">
                            <LayoutTemplate>
                                <table cellpadding="1" cellspacing="0" width="100%">
                                    <tr>
                                        <td>
                                            <table cellpadding="0" width="100%">
                                                <tr>
                                                    <td colspan="2">
                                                        <p><strong>Login to Social users report</strong></p>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                            ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                            ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            
                                                <tr>
                                                    <td align="center" colspan="2" style="color: Red;">
                                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="text-align: right;">
                                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1"></asp:Button>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                        </asp:Login>
                       
                     
                    </asp:Panel>

            </div>
        

        <telerik:RadAjaxManager runat="server" ID="AjaxManager1">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="Configurator1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Configurator1" />
                        <telerik:AjaxUpdatedControl ControlID="RadFormDecorator1" />
                        <telerik:AjaxUpdatedControl ControlID="Panel1" LoadingPanelID="RadAjaxLoadingPanel1" />

                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>

        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
        </telerik:RadAjaxLoadingPanel>



    </form>
</body>
</html>
