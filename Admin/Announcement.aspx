<%@ Page Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="Announcement.aspx.cs" Inherits="Admin_Announcement" %>


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
            width: 66px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style3">
                    Subject</td>
                <td class="style2">
                    <asp:TextBox ID="txtSubject" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Please indicate Subject!" ForeColor="Red" 
                        ControlToValidate="txtMsg" ValidationGroup="AddAnnouncement">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Message</td>
                <td class="style2">
                    <asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Please indicate Message!" ForeColor="Red" 
                        ControlToValidate="txtSubject" ValidationGroup="AddAnnouncement">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                        onclick="btnSubmit_Click" ValidationGroup="AddAnnouncement" />
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="txtCancel" runat="server" Text="Cancel" />
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