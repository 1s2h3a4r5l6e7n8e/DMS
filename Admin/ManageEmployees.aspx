<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageEmployees.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Manage Employees</h1>

    <asp:Button ID="btnAddEmployee" runat="server" PostBackUrl="EmployeeReg.aspx" 
        Text="Add Employee" />
    <br />
    <br />

        Select Category:
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>--Select Search Category--</asp:ListItem>
        </asp:DropDownList>
&nbsp;Search Field:
        <asp:TextBox ID="TextBox1" runat="server" Width="236px"></asp:TextBox>
&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" />
    <br />
        <br />
        <asp:GridView ID="GrdEmployees" runat="server" CellPadding="4" DataSourceID="SqlDS_Employees" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="EmployeeID" OnSelectedIndexChanged="GrdEmployees_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
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
            <Columns>
                <asp:BoundField DataField="EmployeeID" HeaderText="Employee No." 
                    InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
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
                <asp:TemplateField HeaderText="Admin Access">
                    <ItemTemplate>
                    <p align="center"><%# getAdminAccess(int.Parse(Eval("AdminLevel").ToString()))%></p>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="UN" HeaderText="UN" SortExpression="UN" />
                <asp:BoundField DataField="DateOfEmployment" HeaderText="Date Of Employment" 
                    SortExpression="DateOfEmployment" />
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" 
                    SelectText="View/Edit" />
            </Columns>
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDS_Employees" runat="server" ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" SelectCommand="SELECT * FROM [Employees] ORDER BY EmployeeID DESC"></asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

