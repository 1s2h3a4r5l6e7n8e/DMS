<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="TenantReg.aspx.cs" Inherits="Admin_TenantReg" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 180px;
        }
        .style3
        {
            text-decoration: none;
            width: 118px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Tenant Registration</h1>
    <div>
    
    <table style="width:100%;">
        <tr>
            <td class="style3">

            </td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                First Name</td>
            <td class="style2">
                <asp:TextBox ID="txtFName" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtFName" ErrorMessage="Please indicate First Name!" 
                    ForeColor="Red" ValidationGroup="RegTenant">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Middle Name</td>
            <td class="style2">
                <asp:TextBox ID="txtMName" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtMName" ErrorMessage="Please indicate Middle Name!" 
                    ForeColor="Red" ValidationGroup="RegTenant">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Last Name</td>
            <td class="style2">
                <asp:TextBox ID="txtLName" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtLName" ErrorMessage="Please indicate Last Name!" 
                    ForeColor="Red" ValidationGroup="RegTenant">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Gender</td>
            <td class="style2">
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem Value="">- Select -</asp:ListItem>
                    <asp:ListItem Value="1">Male</asp:ListItem>
                    <asp:ListItem Value="2">Female</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="ddlGender" ErrorMessage="Please select Gender!" 
                    ForeColor="Red" ValidationGroup="RegTenant">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Birthday</td>
            <td class="style2">
                <asp:TextBox ID="txtBDay" runat="server" Width="180px" ValidationGroup="BdayVal"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtBDay">
                </asp:CalendarExtender>
                <asp:MaskedEditExtender Mask="99/99/9999" TargetControlID="txtBDay" MaskType="Date" ID="MaskedEditExtender1" runat="server">
                </asp:MaskedEditExtender>
                
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtBDay" ErrorMessage="Please indicate Birthdate!" 
                    ForeColor="Red" ValidationGroup="RegTenant">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Contact No</td>
            <td class="style2">
                <asp:TextBox ID="txtContact" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtContact" ErrorMessage="Please indicate Contact No.!" 
                    ForeColor="Red" ValidationGroup="RegTenant">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Email</td>
            <td class="style2">
                <asp:TextBox ID="txtEmail" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Please indicate Email!" 
                    ForeColor="Red" ValidationGroup="RegTenant">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Street</td>
            <td class="style2">
                <asp:TextBox ID="txtStreet" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtStreet" ErrorMessage="Please indicate Street!" 
                    ForeColor="Red" ValidationGroup="RegTenant">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                City/Province</td>
            <td class="style2">
                <asp:TextBox ID="txtCity" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtCity" ErrorMessage="Please indicate City/Province!" 
                    ForeColor="Red" ValidationGroup="RegTenant">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Region</td>
            <td class="style2">
                <asp:TextBox ID="txtRegion" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="txtRegion" ErrorMessage="Please indicate Region!" 
                    ForeColor="Red" ValidationGroup="RegTenant">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Country</td>
            <td class="style2">
                <asp:TextBox ID="txtCountry" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="txtCountry" ErrorMessage="Please indicate Country!" 
                    ForeColor="Red" ValidationGroup="RegTenant">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Username</td>
            <td class="style2">
                <asp:TextBox ID="txtUN" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ControlToValidate="txtUN" ErrorMessage="Please indicate Username!" 
                    ForeColor="Red" ValidationGroup="RegTenant">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Password</td>
            <td class="style2">
                <asp:TextBox ID="txtPwd1" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                    ControlToValidate="txtPwd1" ErrorMessage="Please indicate Password!" 
                    ForeColor="Red" ValidationGroup="RegTenant">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Repeat Password</td>
            <td class="style2">
                <asp:TextBox ID="txtPwd2" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToCompare="txtPwd1" ControlToValidate="txtPwd2" 
                    ErrorMessage="Password not match!" ForeColor="Red" 
                    ValidationGroup="RegTenant">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Photo: (..JPG, MAX 1MB)</td>
            <td class="style2">
                <asp:FileUpload ID="FupPhoto" runat="server" />

            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                    HeaderText="Add Tenant cannot be completed. Please check the ff errors below:" 
                    ValidationGroup="RegTenant" />
                <asp:Label ID="lblAlert" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                    onclick="btnSubmit_Click" ValidationGroup="RegTenant" />
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Height="26px" 
                    Width="60px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

