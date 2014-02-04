<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="RoomMgt.aspx.cs" Inherits="Admin_RoomMgt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>Room Management</h1>
    <div><h2>Unit Types</h2>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
                GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="UnitTypeName" HeaderText="Unit Type" 
                        SortExpression="UnitTypeName" />
                    <asp:BoundField DataField="DailyRate" HeaderText="Daily Rate" 
                        SortExpression="DailyRate" DataFormatString="{0:n}" />
                    <asp:BoundField DataField="MonthlyRate" HeaderText="Monthly Rate" 
                        SortExpression="MonthlyRate" DataFormatString="{0:n}" />
                    <asp:BoundField DataField="YearlyRate" HeaderText="Yearly Rate" 
                        SortExpression="YearlyRate" DataFormatString="{0:n}" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" 
                        SortExpression="Gender" />
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
                SelectCommand="SELECT [UnitTypeName], [DailyRate], [MonthlyRate], [YearlyRate], [Gender] FROM [UnitType]">
            </asp:SqlDataSource>
        </p>
    </div>
    <div>
    <h2>Rooms</h2>
        <p>
            <asp:Button ID="btnAddRoom" runat="server" Text="Add New Room" 
                onclick="btnAddRoom_Click" />
        </p>
        <p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" 
                GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="RoomNo" HeaderText="Room No" 
                        SortExpression="RoomNo" />
                    <asp:BoundField DataField="UnitTypeName" HeaderText="Unit Type" 
                        SortExpression="UnitTypeName" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                SelectCommand="SELECT Rooms.RoomNo, UnitType.UnitTypeName FROM Rooms INNER JOIN UnitType ON Rooms.UnitTypeID = UnitType.UnitTypeID">
            </asp:SqlDataSource>
        </p>
    </div>
    <div>
    <h2>Bedspaces</h2>
        <p>
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                Text="Add Bedspace" />
        </p>
        <p>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" 
                GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="RoomNo" HeaderText="Room No" 
                        SortExpression="RoomNo" />
                    <asp:TemplateField HeaderText="Bed Side">
                    <ItemTemplate>
                    <%# getBedside(int.Parse(Eval("BedSide").ToString())) %>
                    </ItemTemplate>
                    </asp:TemplateField>
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:CONNSTRING %>" 
                SelectCommand="SELECT Rooms.RoomNo, BedSpaces.BedSide FROM Rooms INNER JOIN BedSpaces ON Rooms.RoomID = BedSpaces.RoomID">
            </asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

