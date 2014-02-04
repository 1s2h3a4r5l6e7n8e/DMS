<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ChangeMyPassword.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 33%;
            height: 57px;
        }
        .auto-style2 {
            height: 19px;
        }
        .auto-style3 {
            height: 34px;
        }
        .auto-style4 {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<h1>Change My Password</h1>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Username:</td>
            <td class="auto-style2">
                <asp:Label ID="lblUsername" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Enter Old Password:</td>
            <td>
                <asp:TextBox ID="txtOldPass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPass" ErrorMessage="Please enter your OLD password." CssClass="auto-style4" Display="Dynamic" ValidationGroup="ChangePass"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Enter New Password:</td>
            <td>
                <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPass" ErrorMessage="Type a NEW password." CssClass="auto-style4" Display="Dynamic" ValidationGroup="ChangePass"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Retype New Password:</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtRetypeNewPass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRetypeNewPass" ErrorMessage="Retype your NEW password" CssClass="auto-style4" Display="Dynamic" ValidationGroup="ChangePass"></asp:RequiredFieldValidator>
                <asp:CompareValidator ControlToCompare="txtNewPass" ControlToValidate="txtRetypeNewPass" ID="CompareValidator1" runat="server" ErrorMessage="New passwords don't match!" CssClass="auto-style4" Display="Dynamic" ValidationGroup="ChangePass"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblAlert" runat="server" style="color: #FF0000"></asp:Label>

            </td>
        </tr>
    </table>
    <asp:Button ID="btnChangePass" runat="server" OnClick="btnChangePass_Click" Text="Change My Password" ValidationGroup="ChangePass" />
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

