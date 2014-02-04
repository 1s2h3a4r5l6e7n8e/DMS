<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="EmployeeReg.aspx.cs" Inherits="Admin_EmployeeReg" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            text-decoration: none;
            width: 180px;
        }
        .style3
        {
            text-decoration: none;
            width: 120px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

    <table style="width:100%;">
        <tr>
            <td class="style1" colspan="3">
                <h1>
                    Employee Registration</h1>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Date of Employment</td>
            <td class="style2">
                <asp:TextBox ID="txtDateEmployeed" runat="server" Width="180px" Placeholder="-Click to Pick Date-"></asp:TextBox>

                 <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtDateEmployeed">
                </asp:CalendarExtender>
                <asp:MaskedEditExtender Mask="99/99/9999" TargetControlID="txtDateEmployeed" MaskType="Date" ID="MaskedEditExtender2" runat="server">
                </asp:MaskedEditExtender>

            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="txtDateEmployeed" 
                    ErrorMessage="Please indicate Date of Employment!" ForeColor="Red" ValidationGroup="RegEmployee">*</asp:RequiredFieldValidator>
            </td>
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
                    ForeColor="Red" ValidationGroup="RegEmployee">*</asp:RequiredFieldValidator>
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
                    ForeColor="Red" ValidationGroup="RegEmployee">*</asp:RequiredFieldValidator>
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
                    ForeColor="Red" ValidationGroup="RegEmployee">*</asp:RequiredFieldValidator>
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
                    ForeColor="Red" ValidationGroup="RegEmployee">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Birthday</td>
            <td class="style2">
               
                <asp:TextBox ID="txtBDay" runat="server" Width="180px" ValidationGroup="BdayVal" Placeholder="-Click to Pick Date-"></asp:TextBox>
                 <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtBDay">
                </asp:CalendarExtender>
                <asp:MaskedEditExtender Mask="99/99/9999" TargetControlID="txtBDay" MaskType="Date" ID="MaskedEditExtender1" runat="server">
                </asp:MaskedEditExtender>


            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtBDay" ErrorMessage="Please indicate Birthdate!" 
                    ForeColor="Red" ValidationGroup="RegEmployee">*</asp:RequiredFieldValidator>
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
                    ForeColor="Red" ValidationGroup="RegEmployee">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Email</td>
            <td class="style2">
                <asp:TextBox ID="txtEmail" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtEmail" Text="*" Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Please enter a valid email address!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ValidationGroup="RegEmployee"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Please indicate Email!" 
                    ForeColor="Red" ValidationGroup="RegEmployee">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Admin Level</td>
            <td class="style2">
                <asp:DropDownList ID="ddlAdminLevel" runat="server">
                    <asp:ListItem Value="">- Select -</asp:ListItem>
                    <asp:ListItem Value="1">Full</asp:ListItem>
                    <asp:ListItem Value="2">Limited</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="ddlAdminLevel" ErrorMessage="Please select Admin Level!" 
                    ForeColor="Red" ValidationGroup="RegEmployee">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Username</td>
            <td class="style2">
                <asp:TextBox ID="txtUN" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtUN" ErrorMessage="Please indicate Username!" 
                    ForeColor="Red" ValidationGroup="RegEmployee">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Password</td>
            <td class="style2">
                <asp:TextBox ID="txtPwd1" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="txtPwd1" ErrorMessage="Please indicate Password!" 
                    ForeColor="Red" ValidationGroup="RegEmployee">*</asp:RequiredFieldValidator>
                <%--<asp:CompareValidator ForeColor="Red" ControlToValidate="txtPwd2" ControlToCompare="txtPwd1" ValidationGroup="RegEmployee" ID="CompareValidator2" runat="server" ErrorMessage="Passwords don't match!">*</asp:CompareValidator>--%>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Repeat Password</td>
            <td class="style2">
                <asp:TextBox ID="txtPwd2" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtPwd1" ControlToValidate="txtPwd2" 
                    ErrorMessage="Password do not match!" ForeColor="Red" 
                    ValidationGroup="RegEmployee">*</asp:CompareValidator>
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
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="Add employee cannot be completed. Please check below:" style="color: #FF0000" ValidationGroup="RegEmployee" />           
                <asp:Label ForeColor="Red" ID="lblAlert" runat="server" Text=""></asp:Label>
                <br />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                    onclick="btnSubmit_Click" ValidationGroup="RegEmployee" />
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
            </td>
            <td>
                
            </td>
        </tr>
    </table>
    <div>
    
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>
