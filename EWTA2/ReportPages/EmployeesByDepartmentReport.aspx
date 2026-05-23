<%@ Page Title="Employees By Department Report" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="EmployeesByDepartmentReport.aspx.cs"
    Inherits="EWTA2.Reports.EmployeesByDepartmentReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-3">

        <h3 class="fw-bold">Employees By Department Report</h3>

        <div class="row mb-4">

            <div class="col-md-3">
                <strong>Choose a Department:</strong>
            </div>

            
            <div class="col-md-4">
                <asp:DropDownList ID="ddlDepartment" runat="server"
                    CssClass="form-control"
                    AutoPostBack="true"
                    DataSourceID="dsDepartments"
                    DataTextField="Dept_Name"                
                    DataValueField="Dept_ID"
                    AppendDataBoundItems="true">
                    <asp:ListItem Text="Select Department" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <asp:GridView ID="gvEmployees" runat="server"
            AutoGenerateColumns="False"
            DataSourceID="dsEmployees"
            CssClass="table table-bordered">

            <Columns>
                <asp:BoundField DataField="Empl_ID" HeaderText="EmplID" />
                <asp:BoundField DataField="FullName" HeaderText="Name" />
                <asp:BoundField DataField="Empl_Phone" HeaderText="Work Phone" />
                <asp:BoundField DataField="Empl_Cell" HeaderText="Cell Phone" />
                <asp:BoundField DataField="Empl_Email" HeaderText="Email" />
                <asp:BoundField DataField="Empl_City" HeaderText="City" />
            </Columns>

        </asp:GridView>

        <div class="mt-3">
            <asp:Button ID="btnCloseReport" runat="server" Text="Close Report"
                CssClass="btn btn-light border px-5"
                OnClick="btnCloseReport_Click" />
        </div>

    </div>

    <asp:SqlDataSource ID="dsDepartments" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="SELECT Dept_ID, Dept_Name FROM dbo.tbl_Departments ORDER BY Dept_Name">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsEmployees" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="
            SELECT 
                Empl_ID,
                Empl_FName + ' ' + Empl_LName AS FullName,
                Empl_Phone,
                Empl_Cell,
                Empl_Email,
                Empl_City
            FROM dbo.tbl_Employees
            WHERE Dept_ID = @Dept_ID
            ORDER BY Empl_FName">

        <SelectParameters>
            <asp:ControlParameter Name="Dept_ID"
                ControlID="ddlDepartment"
                PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>

    </asp:SqlDataSource>

</asp:Content>
