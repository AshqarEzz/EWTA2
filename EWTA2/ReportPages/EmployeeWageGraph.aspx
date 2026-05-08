<%@ Page Title="Employee Wage Graph" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="EmployeeWageGraph.aspx.cs"
    Inherits="EWTA2.ReportPages.EmployeeWageGraph" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting"
    TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-3">

        <h3 class="fw-bold">Wage Totals Graph By Employee</h3>

        <div class="row mb-4">
            <div class="col-md-3">
                <strong>Choose an Employee:</strong>
            </div>

            <div class="col-md-4">
                <asp:DropDownList ID="ddlEmployee" runat="server"
    CssClass="form-control"
    AutoPostBack="true"
    DataSourceID="dsEmployees"
    DataTextField="Empl_Name"
    DataValueField="Empl_ID"
    AppendDataBoundItems="true">

    <asp:ListItem Text="Select Employee" Value=""></asp:ListItem>

</asp:DropDownList>
            </div>

        </div>

        <asp:Chart ID="chEmployeeWage" runat="server"
            DataSourceID="dsEmployeeWages"
            Width="700px"
            Height="400px">

            <Series>
                <asp:Series Name="Wages"
                    ChartType="Column"
                    XValueMember="Wage_Year"
                    YValueMembers="TotalWage">
                </asp:Series>
            </Series>

            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                    <AxisX Title="Year"></AxisX>
                    <AxisY Title="Total Wage"></AxisY>
                </asp:ChartArea>
            </ChartAreas>

        </asp:Chart>

        <div class="mt-3">
            <asp:Button ID="btnCloseReport" runat="server"
                Text="Close Report"
                CssClass="btn btn-light border px-5"
                OnClick="btnCloseReport_Click" />
        </div>

    </div>

    <asp:SqlDataSource ID="dsEmployees" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="
            SELECT Empl_ID, Empl_Name
            FROM dbo.tbl_Employees
            ORDER BY Empl_Name">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsEmployeeWages" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="
            SELECT 
                DATEPART(YEAR, Wage_Date) AS Wage_Year,
                SUM(Wage_Amount + Wage_Commission) AS TotalWage
            FROM dbo.tbl_Wages
            WHERE Empl_ID = @Empl_ID
            GROUP BY DATEPART(YEAR, Wage_Date)
            ORDER BY Wage_Year">

        <SelectParameters>
    <asp:ControlParameter Name="Empl_ID"
        ControlID="ddlEmployee"
        PropertyName="SelectedValue"
        Type="Int32"
        ConvertEmptyStringToNull="true" />
</SelectParameters>

    </asp:SqlDataSource>

</asp:Content>
