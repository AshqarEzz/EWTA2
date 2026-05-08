<%@ Page Title="Employee Wage Totals Graph By Year" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="EmployeeWageGraphByYear.aspx.cs"
    Inherits="EWTA2.ReportPages.EmployeeWageGraphByYear" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting"
    TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-3">

        <h3 class="fw-bold">Employee Wage Totals Graph By Year</h3>

        <div class="row mb-4">
            <div class="col-md-2">
                <strong>Year:</strong>
            </div>

            <div class="col-md-3">
                <asp:DropDownList ID="ddlYear" runat="server"
                    CssClass="form-control"
                    AutoPostBack="true"
                    DataSourceID="dsYears"
                    DataTextField="Wage_Year"
                    DataValueField="Wage_Year">
                </asp:DropDownList>
            </div>
        </div>

        <asp:Chart ID="chWageByYear" runat="server"
            DataSourceID="dsWageByYear"
            Width="700px"
            Height="400px">

            <Series>
                <asp:Series Name="Wages"
                    ChartType="Column"
                    XValueMember="Empl_Name"
                    YValueMembers="TotalWage">
                </asp:Series>
            </Series>

            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                    <AxisX Title="Employee"></AxisX>
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

    <asp:SqlDataSource ID="dsYears" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="
            SELECT DISTINCT DATEPART(YEAR, Wage_Date) AS Wage_Year
            FROM dbo.tbl_Wages
            ORDER BY Wage_Year">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsWageByYear" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="
            SELECT 
                e.Empl_Name,
                SUM(w.Wage_Amount + w.Wage_Commission) AS TotalWage
            FROM dbo.tbl_Wages w
            INNER JOIN dbo.tbl_Employees e
                ON w.Empl_ID = e.Empl_ID
            WHERE DATEPART(YEAR, w.Wage_Date) = @Wage_Year
            GROUP BY e.Empl_Name
            ORDER BY e.Empl_Name">

        <SelectParameters>
            <asp:ControlParameter Name="Wage_Year"
                ControlID="ddlYear"
                PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>

    </asp:SqlDataSource>

</asp:Content>