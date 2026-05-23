<%@ Page Title="Employee Communication Report" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="EmployeeCommunicationReport.aspx.cs"
    Inherits="EWTA2.ReportPages.EmployeeCommunicationReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-3">

        <h3 class="fw-bold">Employee Communication Report</h3>

        <asp:GridView ID="gvCommunication" runat="server"
            AutoGenerateColumns="False"
            DataSourceID="dsCommunication"
            CssClass="table table-bordered">

            <Columns>
                <asp:BoundField DataField="Empl_ID" HeaderText="EmplID" />
                <asp:BoundField DataField="Empl_Name" HeaderText="Name" />
                <asp:BoundField DataField="Empl_Phone" HeaderText="Work Phone" />
                <asp:BoundField DataField="Empl_Cell" HeaderText="Cell Phone" />
                <asp:BoundField DataField="Empl_Email" HeaderText="Email" />
                <asp:BoundField DataField="Dept_Name" HeaderText="Department" />
            </Columns>

        </asp:GridView>

        <div class="mt-3">
            <asp:Button ID="btnCloseReport" runat="server"
                Text="Close Report"
                CssClass="btn btn-light border px-5"
                OnClick="btnCloseReport_Click" />
        </div>

    </div>

    <asp:SqlDataSource ID="dsCommunication" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="
            SELECT 
                e.Empl_ID,
                e.Empl_Name,
                e.Empl_Phone,
                e.Empl_Cell,
                e.Empl_Email,
                d.Dept_Name
            FROM dbo.tbl_Employees e
            INNER JOIN dbo.tbl_Departments d
                ON e.Dept_ID = d.Dept_ID
            ORDER BY e.Empl_ID">
    </asp:SqlDataSource>

</asp:Content>