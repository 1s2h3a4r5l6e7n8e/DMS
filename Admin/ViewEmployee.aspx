<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ViewEmployee.aspx.cs" Inherits="Admin_ViewEmployee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .auto-style1
        {
            width: 43%;
            height: 237px;
        }
        .auto-style2
        {
            width: 120px;
        }
        .auto-style3
        {
            width: 120px;
            height: 19px;
        }
        .auto-style4
        {
            height: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h3>View Employee</h3>
    <table class="auto-style1" border="1">
        <tr>
            <td class="auto-style2">
                <asp:Image ID="ImgPhoto" runat="server" />
            </td>
            <td>
                Upload New Photo:<br>
                <asp:FileUpload ID="fupPhoto" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Employee ID:</td>
            <td>
                <asp:Label ID="lblEmpID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">First Name:</td>
            <td>
                <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Middle Name:</td>
            <td>
                <asp:TextBox ID="txtMName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Last Name:</td>
            <td>
                <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Gender</td>
            <td>
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem Value="">- Select -</asp:ListItem>
                    <asp:ListItem Value="1">Male</asp:ListItem>
                    <asp:ListItem Value="2">Female</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Date of Birth:</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Contact No.</td>
            <td>
                <asp:TextBox ID="txtContactNo" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Email Address:</td>
            <td>
                <asp:TextBox ID="txtEmailAdd" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Username:</td>
            <td>
                <asp:Label ID="lblUN" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">- Reset Password -</td>
            <td class="auto-style4">
                <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" OnClick="btnResetPassword_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Has Admin Access?</td>
            <td>
                <asp:DropDownList ID="ddlAdminAccess" runat="server">
                    <asp:ListItem Value="">- Select -</asp:ListItem>
                    <asp:ListItem Value="1">Full</asp:ListItem>
                    <asp:ListItem Value="2">Limited</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Date of Employment:</td>
            <td>
                <asp:TextBox ID="txtDOE" runat="server"></asp:TextBox>
            </td>
        </tr>  
    </table>

     <br />
        <asp:Button ID="btnUpdate" runat="server" Text="Update Employee" OnClick="btnUpdate_Click" />

    <p>&nbsp;</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

