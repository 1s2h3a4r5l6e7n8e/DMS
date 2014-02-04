<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageTenant.aspx.cs" Inherits="Admin_ManageTenant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Tenant Management</h1>
    <p>
        <asp:Button ID="btnAdd" runat="server" Text="Add New Tenant" 
            onclick="btnAdd_Click" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="FName" HeaderText="First Name" 
                    SortExpression="FName" />
                <asp:BoundField DataField="MName" HeaderText="Middle Name" 
                    SortExpression="MName" />
                <asp:BoundField DataField="LName" HeaderText="Last Name" 
                    SortExpression="LName" />
                <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate>
                    <%# getGender(int.Parse(Eval("Gender").ToString())) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="BDate" HeaderText="Birthday" SortExpression="BDate" 
                    DataFormatString="{0:MMMM dd,yyyy}" />
                <asp:BoundField DataField="UN" HeaderText="Username" SortExpression="UN" />
                <asp:BoundField DataField="DateRegistered" HeaderText="Date Registered" 
                    SortExpression="DateRegistered" DataFormatString="{0:MMMM dd,yyyy HH:mm tt}" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
            SelectCommand="SELECT FName, MName, LName, Gender, Email, BDate, Street, City, Region, Country, MobileNo, UN, PhotoFile, DateRegistered FROM Tenants ORDER BY LName">
        </asp:SqlDataSource>
    </p>
    <p>&nbsp;</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

