<%@ Page Title="Help" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Help.aspx.cs"
    Inherits="EWTA2.Help" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">

        <h1 class="fw-bold mb-4">Help Guide - EWTA System</h1>

        <p style="font-size:18px; text-align:justify;">
            Employee Wages Tracking Application (EWTA) is used to manage employees,
            departments, wages, and reports. This help page explains how to use each
            part of the system.
        </p>

        <h3 class="fw-bold mt-4">1. Login</h3>
        <p>
            First, login with your username and password. After successful login,
            you can access Forms, Reports, About, Contact, and Help pages.
        </p>

        <h3 class="fw-bold mt-4">2. Home Page</h3>
        <p>
            The Home page shows the project name and introduction of the EWTA system.
            It is the main starting page after login.
        </p>

        <h3 class="fw-bold mt-4">3. Forms Page</h3>
        <p>
            The Forms page contains all data entry and update forms. Use this page
            when you want to add or change information in the database.
        </p>

        <h4 class="fw-bold mt-3">Employee Data Entry Form</h4>
        <ul>
            <li>Use this form to add a new employee.</li>
            <li>Enter employee personal information such as first name, last name, birth date, gender, title, and department.</li>
            <li>Enter communication information such as email, cell phone, work phone, city, province, and address.</li>
            <li>Use <strong>Basic Wage</strong> and <strong>Default Commission Rate</strong> as employee profile salary information.</li>
            <li>Click <strong>Save Record</strong> to insert the employee into the database.</li>
        </ul>

        <h4 class="fw-bold mt-3">Employee Data Entry Wizard Form</h4>
        <ul>
            <li>This form adds employee information step by step.</li>
            <li>Step 1 collects personal data.</li>
            <li>Step 2 collects communication data.</li>
            <li>Step 3 collects address data.</li>
            <li>The Finish step shows a summary before saving.</li>
            <li>Click <strong>Finish</strong> to save the employee record.</li>
        </ul>

        <h4 class="fw-bold mt-3">Employee Data Update Form</h4>
        <ul>
            <li>Use this form to edit existing employee records.</li>
            <li>Select or view an employee record.</li>
            <li>Click <strong>Edit</strong>, update the required fields, then click <strong>Update</strong>.</li>
            <li>Use <strong>Cancel</strong> if you do not want to save changes.</li>
        </ul>

        <h4 class="fw-bold mt-3">Wage Data Entry Form</h4>
        <ul>
            <li>Use this form to add actual wage payment records for employees.</li>
            <li>Select an employee.</li>
            <li>Enter wage date, wage amount, commission, and month.</li>
            <li>Click <strong>Save Record</strong> to store the wage entry.</li>
            <li>One employee can have many wage records.</li>
        </ul>

        <h4 class="fw-bold mt-3">Wage Data Update Form</h4>
        <ul>
            <li>This form shows all wage payment records.</li>
            <li>Each row represents one wage record, not one employee.</li>
            <li>Click <strong>Edit</strong> to update wage date, amount, commission, or month.</li>
            <li>The employee name helps you understand which employee the wage belongs to.</li>
        </ul>

        <h4 class="fw-bold mt-3">Department Data Entry and Update Form</h4>
        <ul>
            <li>Use this form to add or update departments.</li>
            <li>The table shows department name, phone, and current manager.</li>
            <li>The manager dropdown is used to assign an employee as the manager of a department.</li>
            <li>To add a new department, enter department name, department phone, select manager, and click <strong>Save Data</strong>.</li>
            <li>To change a department manager, click <strong>Edit</strong>, select another manager, then click <strong>Update</strong>.</li>
        </ul>

        <h3 class="fw-bold mt-4">4. Reports Page</h3>
        <p>
            The Reports page is used to view stored information in report format.
            Reports do not usually insert new data; they display existing database data.
        </p>

        <h4 class="fw-bold mt-3">Employees By Department Report</h4>
        <ul>
            <li>Select a department from the dropdown.</li>
            <li>The report shows employees who belong to that department.</li>
            <li>It displays employee name, phone, email, and city.</li>
        </ul>

        <h4 class="fw-bold mt-3">Wages By Employee Report</h4>
        <ul>
            <li>Select an employee from the dropdown.</li>
            <li>The report shows all wage records of that employee.</li>
            <li>It displays wage ID, paid date, wage total, year, and month.</li>
        </ul>

        <h4 class="fw-bold mt-3">Employee Communication Report</h4>
        <ul>
            <li>This report shows employee contact details.</li>
            <li>It includes work phone, cell phone, email, and department.</li>
            <li>It can be used as an employee contact directory.</li>
        </ul>

        <h4 class="fw-bold mt-3">Employee Resign Report</h4>
        <ul>
            <li>This report shows employees who have left the organization.</li>
            <li>It displays start date, left date, resign reason, contact information, department, and title.</li>
            <li>An employee appears here when left date or resign reason is saved in the employee record.</li>
        </ul>

        <h4 class="fw-bold mt-3">Wage Graph By Employee</h4>
        <ul>
            <li>Select an employee from the dropdown.</li>
            <li>The graph shows wage totals by year for that selected employee.</li>
            <li>If the graph is empty, it means that employee has no wage records.</li>
        </ul>

        <h4 class="fw-bold mt-3">Employee Wage Graph By Year</h4>
        <ul>
            <li>Select a year from the dropdown.</li>
            <li>The graph shows total wages of employees for the selected year.</li>
            <li>This helps compare employee wage totals year by year.</li>
        </ul>

        <h3 class="fw-bold mt-4">5. Important Database Notes</h3>
        <ul>
            <li><strong>tbl_Employees</strong> stores employee personal and job information.</li>
            <li><strong>tbl_Wages</strong> stores actual wage payment records.</li>
            <li><strong>tbl_Departments</strong> stores department information.</li>
            <li><strong>tbl_Lookups</strong> stores lookup values such as title, city, province, and other lists.</li>
            <li>Employee ID connects employee records with wage records.</li>
            <li>Department ID connects employees with departments.</li>
        </ul>

        <h3 class="fw-bold mt-4">6. Useful Tips</h3>
        <ul>
            <li>Always add an employee before adding wage records for that employee.</li>
            <li>If an employee does not appear in a wage report, check whether wage data exists for that employee.</li>
            <li>If a dropdown is empty, check whether the related database table has records.</li>
            <li>Use update forms carefully because changes are saved directly to the database.</li>
            <li>Use reports to verify that inserted data was saved correctly.</li>
        </ul>

        <h3 class="fw-bold mt-4">7. Logout</h3>
        <p>
            Click the <strong>Logout</strong> button in the navigation bar to safely exit the system.
        </p>

    </div>

</asp:Content>
