<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Reports.aspx.cs"
    Inherits="EWTA2.ReportsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-3">

        <h2 class="text-center fw-bold mb-4">EWTA Reports</h2>

        <div class="row mb-4">

            <div class="col-md-6 text-center">
                <asp:Button ID="btnEmployeesByDepartment" runat="server"
                    Text="Employees By Department Report"
                    CssClass="btn btn-light border w-50 mb-4 fw-bold"
                    OnClick="btnEmployeesByDepartment_Click" />

                <br />

                <asp:Button ID="btnEmployeeWageGraphByYear" runat="server"
                    Text="Employee Wage Graph By Year"
                    CssClass="btn btn-light border w-50 mb-4 fw-bold"
                    OnClick="btnEmployeeWageGraphByYear_Click" />

                <br />

                <asp:Button ID="btnWageGraphByEmployee" runat="server"
                    Text="Wage Graph By Employee"
                    CssClass="btn btn-light border w-50 mb-4 fw-bold"
                    OnClick="btnWageGraphByEmployee_Click" />
            </div>

            <div class="col-md-6 text-center">
                <asp:Button ID="btnWagesByEmployee" runat="server"
                    Text="Wages By Employee Report"
                    CssClass="btn btn-light border w-50 mb-4 fw-bold"
                    OnClick="btnWagesByEmployee_Click" />

                <br />

                <asp:Button ID="btnEmployeeCommunication" runat="server"
                    Text="Employee Communication Report"
                    CssClass="btn btn-light border w-50 mb-4 fw-bold"
                    OnClick="btnEmployeeCommunication_Click" />

                <br />

                <asp:Button ID="btnEmployeeResign" runat="server"
                    Text="Employee Resign Report"
                    CssClass="btn btn-light border w-50 mb-4 fw-bold"
                    OnClick="btnEmployeeResign_Click" />
            </div>

        </div>

    </div>

</asp:Content>