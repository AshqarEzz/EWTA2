<%@ Page Title="Employee Resign Report" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="EmployeeResignReport.aspx.cs"
    Inherits="EWTA2.ReportPages.EmployeeResignReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-3">

        <h3 class="fw-bold mb-4">Employee Resign Report</h3>

        <asp:GridView ID="gvResign" runat="server"
            AutoGenerateColumns="False"
            DataSourceID="dsResign"
            CssClass="table table-bordered">

            <Columns>
                <asp:BoundField DataField="Empl_ID" HeaderText="EmplID" />
                <asp:BoundField DataField="Empl_Name" HeaderText="Name" />
                <asp:BoundField DataField="Empl_Start_Date" HeaderText="Start Date" />
                <asp:BoundField DataField="Empl_Left_Date" HeaderText="Left Date" />
                <asp:BoundField DataField="Empl_Left_Reason" HeaderText="Resign Reason" />
                <asp:BoundField DataField="Empl_Cell" HeaderText="Cell Phone" />
                <asp:BoundField DataField="Empl_Email" HeaderText="Email" />
                <asp:BoundField DataField="Dept_Name" HeaderText="Department" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
            </Columns>

        </asp:GridView>

        <div class="mt-3">
            <asp:Button ID="btnCloseReport" runat="server"
                Text="Close Report"
                CssClass="btn btn-light border px-5"
                OnClick="btnCloseReport_Click" />
        </div>

    </div>

    <asp:SqlDataSource ID="dsResign" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="
            SELECT 
                e.Empl_ID,
                e.Empl_Name,
                e.Empl_Start_Date,
                e.Empl_Left_Date,
                e.Empl_Left_Reason,
                e.Empl_Cell,
                e.Empl_Email,
                d.Dept_Name,
                l.Title
            FROM dbo.tbl_Employees e
            INNER JOIN dbo.tbl_Departments d
                ON e.Dept_ID = d.Dept_ID
            INNER JOIN dbo.tbl_Lookups l
                ON e.Title_ID = l.LK_ID
            WHERE e.Empl_Left_Date IS NOT NULL
               OR e.Empl_Left_Reason IS NOT NULL
            ORDER BY e.Empl_Left_Date">
    </asp:SqlDataSource>

</asp:Content>
