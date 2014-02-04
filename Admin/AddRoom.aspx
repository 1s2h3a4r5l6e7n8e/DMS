<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="AddRoom.aspx.cs" Inherits="Admin_AddRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 114px;
        }
        .style3
        {
            width: 180px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Add New Room</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Room No.</td>
                <td class="style3">
                    <asp:TextBox ID="txtRoomNo" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Select Unit Type</td>
                <td class="style3">
                    <asp:DropDownList ID="ddlUnitType" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="Name" DataValueField="UnitTypeID" 
                        AppendDataBoundItems="True">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        
                        SelectCommand="SELECT UnitTypeID, UnitTypeName + ' for ' + CASE WHEN Gender=1 THEN 'Male' ELSE 'Female' END AS 'Name' FROM UnitType">
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                        Text="Submit" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

