<%@ Page Title="" Language="C#" MasterPageFile="~/masterpages/AdminMaster.master" AutoEventWireup="true" CodeFile="Sample1.aspx.cs" Inherits="DevSamples_Sample1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

<h3>Line Chart Sample</h3>

<asp:LineChart ID="LineChart1" runat="server" 
ChartWidth="450" ChartHeight="300" ChartType="Basic" 
ChartTitle="" 
CategoriesAxis="2007,2008,2009,2010,2011,2012" 
ChartTitleColor="#0E426C" CategoryAxisLineColor="#D08AD9" 
ValueAxisLineColor="#D08AD9" BaseLineColor="#A156AB">
<Series>
    <asp:LineChartSeries Name="United States" 
    LineColor="#6C1E83" Data="110, 189, 255, 95, 107, 140" />
    <asp:LineChartSeries Name="Europe"  
    LineColor="#D08AD9" Data="49, 77, 95, 68, 70, 79" />
</Series>
</asp:LineChart>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" Runat="Server">
</asp:Content>

