<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ViewTenant.aspx.cs" Inherits="Admin_ViewTenant" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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
        .style2
        {
            color: #FF0000;
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
        .style3
        {
            width: 120px;
            height: 25px;
        }
        .style4
        {
            height: 25px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
     <h2>View Tenant</h2>
    <table class="auto-style1" border="1">
        <tr>
            <td class="auto-style2">
                <asp:Image ID="ImgPhoto" runat="server" Width="200px" />
            </td>
            <td>
                Upload New Photo:<br>
                <asp:FileUpload ID="FupPhoto" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Tenant ID:</td>
            <td>
                <asp:Label ID="lblTenantID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">First Name:</td>
            <td>
                <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtFName" 
                    ID="RequiredFieldValidator1" runat="server" 
                    CssClass="style2" ErrorMessage="Enter first name!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Middle Name:</td>
            <td>
                <asp:TextBox ID="txtMName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtMName" 
                    ID="RequiredFieldValidator2" runat="server" 
                    CssClass="style2" ErrorMessage="Enter middle name!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Last Name:</td>
            <td>
                <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtLName" 
                    ID="RequiredFieldValidator3" runat="server" 
                    CssClass="style2" ErrorMessage="Enter last name!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
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
                <asp:RequiredFieldValidator ControlToValidate="ddlGender" 
                    ID="RequiredFieldValidator5" runat="server" 
                    CssClass="style2" ErrorMessage="Select gender!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Date of Birth:</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                <asp:MaskedEditExtender ID="txtDOB_MaskedEditExtender" runat="server" Enabled="True" 
                    TargetControlID="txtDOB" Mask="99/99/9999" MaskType="Date">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="txtDOB_CalendarExtender" runat="server" 
                    TargetControlID="txtDOB">
                </asp:CalendarExtender>
                <asp:RequiredFieldValidator ControlToValidate="txtDOB" 
                    ID="RequiredFieldValidator4" runat="server" 
                    CssClass="style2" ErrorMessage="Enter date of birth!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Contact No.</td>
            <td>
                <asp:TextBox ID="txtContactNo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtContactNo" 
                    ID="RequiredFieldValidator6" runat="server" 
                    CssClass="style2" ErrorMessage="Enter contact number!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Email Address:</td>
            <td>
                <asp:TextBox ID="txtEmailAdd" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ControlToValidate="txtEmailAdd" 
                    ID="RequiredFieldValidator7" runat="server" 
                    CssClass="style2" ErrorMessage="Enter email address!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ControlToValidate="txtEmailAdd" 
                    ID="RegularExpressionValidator1" runat="server" 
                    CssClass="style2" ErrorMessage="Email address is not valid!" 
                    ValidationGroup="UpdateTenant" Display="Dynamic" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Street Address</td>
            <td>
                <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtStreet" ErrorMessage="Enter street address!" 
                    ForeColor="Red" ValidationGroup="UpdateTenant">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">City</td>
            <td>
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtCity" ErrorMessage="Enter city!" ForeColor="Red" 
                    ValidationGroup="UpdateTenant">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">Region</td>
            <td class="style4">
                <asp:TextBox ID="txtRegion" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="txtRegion" ErrorMessage="Enter region!" ForeColor="Red" 
                    ValidationGroup="UpdateTenant">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Country</td>
            <td>
                <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                    ControlToValidate="txtCountry" ErrorMessage="Enter Country!" ForeColor="Red" 
                    ValidationGroup="UpdateTenant">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Username:</td>
            <td>
                <asp:Label ID="lblUN" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
<<<<<<< HEAD
            <td class="auto-style3">- Reset Password -</td>
            <td class="auto-style4">
                <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" OnClick="btnResetPassword_Click" />

=======
            <td class="auto-style2">Reset Password</td>
            <td>
                <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" OnClick="btnResetPassword_Click" />

    <asp:ModalPopupExtender ID="MPEResetPass0" TargetControlID="btnResetPassword" 
                    PopupControlID="ResetPWDPanel" CancelControlID="btnCancel" runat="server">
    </asp:ModalPopupExtender>

            </td>
        </tr>
        <tr>
            
                

>>>>>>> c7617e9042a340e3d4ec1c689d4c0b2f54ecd303
    <asp:ModalPopupExtender ID="MPEResetPass" TargetControlID="btnResetPassword" PopupControlID="ResetPWDPanel" CancelControlID="btnCancel" runat="server">
    </asp:ModalPopupExtender>

            </td>
        </tr>
        </table>

     <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        HeaderText="Employee infomation updates can't be saved. Please review the following:" 
        style="color: #FF0000" ValidationGroup="UpdateEmployee" />
     <br />

     <asp:Label ID="lblAlert" runat="server" style="color: #FF0000"></asp:Label>

     <asp:Button ID="btnUpdate" runat="server" Text="Update Tenant" 
        OnClick="btnUpdate_Click" ValidationGroup="UpdateTenant" 
         OnClientClick="if(Page_ClientValidate()){ this.disabled = true; this.value = 'Loading...';}" 
         UseSubmitBehavior="false" />

    <asp:ConfirmButtonExtender ID="btnUpdate_ConfirmButtonExtender" runat="server" 
        ConfirmText="Are you sure you want to update this employee's information?" 
        TargetControlID="btnUpdate">
    </asp:ConfirmButtonExtender>

     <br />

    <asp:Panel ID="ResetPWDPanel" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Dotted">
        Are you sure you want to reset Tenant&#39;s password?<br />
    <br />
    Enter your password to confirm: 
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
            ControlToValidate="txtPassword" ErrorMessage="Please enter your password!" 
            style="color: #FF0000" ValidationGroup="ResetPass" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnResetPass2" runat="server" 
            Text="Confirm and go reset Tenant's password!" 
            onclick="btnResetPass2_Click" ValidationGroup="ResetPass" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
    </asp:Panel>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

