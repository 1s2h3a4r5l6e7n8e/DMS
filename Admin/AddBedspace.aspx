<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="AddBedspace.aspx.cs" Inherits="Admin_AddBedspace" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 111px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Add Bedspace</h1>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    Select Room No.</td>
                <td>
                    <asp:DropDownList ID="ddlRoomNo" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="RoomNo" DataValueField="RoomID" 
                        style="margin-bottom: 0px" AppendDataBoundItems="True">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                        SelectCommand="SELECT [RoomID], [RoomNo], [UnitTypeID] FROM [Rooms]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Select Side</td>
                <td>
                    <asp:DropDownList ID="ddlSide" runat="server">
                        <asp:ListItem Value="">- Select -</asp:ListItem>
                        <asp:ListItem Value="1">Left</asp:ListItem>
                        <asp:ListItem Value="2">Right</asp:ListItem>
                        <asp:ListItem Value="1">Top</asp:ListItem>
                        <asp:ListItem Value="2">Bottom</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                        Text="Submit" />
                </td>
            </tr>
        </table>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

