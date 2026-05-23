<%@ Page Title="Wages By Employee Report" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="WagesByEmployeeReport.aspx.cs"
    Inherits="EWTA2.ReportPages.WagesByEmployeeReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-3">

        <h3 class="fw-bold">Wages By Employee Report</h3>

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

        <asp:GridView ID="gvWages" runat="server"
            AutoGenerateColumns="False"
            DataSourceID="dsWages"
            CssClass="table table-bordered">

            <Columns>
                <asp:BoundField DataField="Wage_ID" HeaderText="WageID" />
                <asp:BoundField DataField="Wage_Date" HeaderText="Paid Date" />
                <asp:BoundField DataField="Wage_Total" HeaderText="Wage Total" />
                <asp:BoundField DataField="Wage_Year" HeaderText="Year" />
                <asp:BoundField DataField="Month_Name" HeaderText="Month" />
            </Columns>

        </asp:GridView>

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

    <asp:SqlDataSource ID="dsWages" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="
            SELECT 
                w.Wage_ID,
                w.Wage_Date,
                (w.Wage_Amount + w.Wage_Commission) AS Wage_Total,
                DATEPART(YEAR, w.Wage_Date) AS Wage_Year,
                DATENAME(MONTH, w.Wage_Date) AS Month_Name
            FROM dbo.tbl_Wages w
            WHERE w.Empl_ID = @Empl_ID
            ORDER BY w.Wage_Date">

        <SelectParameters>
            <asp:ControlParameter Name="Empl_ID"
                ControlID="ddlEmployee"
                PropertyName="SelectedValue"
                Type="Int32"
                ConvertEmptyStringToNull="true" />
        </SelectParameters>

    </asp:SqlDataSource>

</asp:Content>
