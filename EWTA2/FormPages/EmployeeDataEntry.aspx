<%@ Page Title="Employee Data Entry" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeDataEntry.aspx.cs" Inherits="EWTA2.FormPages.EmployeeDataEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-3">

    <h2 class="text-center fw-bold mb-4">Employee Data Entry Form</h2>

    <div class="row mb-3">

        <!-- LEFT COLUMN -->
        <div class="col-md-6">

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblBirthDate" runat="server" Text="Birth Date:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtBirthDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4 pt-1">
                    <asp:Label ID="lblGender" runat="server" Text="Gender:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Vertical">
                        <asp:ListItem Text="Woman" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Man" Value="1"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblTitle" runat="server" Text="Title:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:DropDownList ID="ddlTitle" runat="server" CssClass="form-control"
                        DataSourceID="dsTitles"
                        DataTextField="Title"
                        DataValueField="LK_ID"
                        AppendDataBoundItems="true">
                        <asp:ListItem Text="Select Title" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblCity" runat="server" Text="City:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control"
                        DataSourceID="dsCities"
                        DataTextField="City"
                        DataValueField="City"
                        AppendDataBoundItems="true">
                        <asp:ListItem Text="Select City" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4 pt-2">
                    <asp:Label ID="lblCVInfo" runat="server" Text="CV Info:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtCVInfo" runat="server" TextMode="MultiLine" Rows="6" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-2">
    <div class="col-md-4">
        <asp:Label ID="lblCVFile" runat="server" Text="Upload CV:"></asp:Label>
    </div>
    <div class="col-md-8">
        <asp:FileUpload ID="fuCVFile" runat="server" CssClass="form-control" />
    </div>
</div>

        </div>

        <!-- RIGHT COLUMN -->
        <div class="col-md-6">

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblStartDate" runat="server" Text="Start Date:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4 pt-1">
                    <asp:Label ID="lblIsActive" runat="server" Text="Is Employee Active?"></asp:Label>
                </div>
                <div class="col-md-8 pt-2">
                    <asp:CheckBox ID="chkIsActive" runat="server" />
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblDepartment" runat="server" Text="Department:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control"
                        DataSourceID="dsDepartments"
                        DataTextField="Dept_Name"
                        DataValueField="Dept_ID"
                        AppendDataBoundItems="true">
                        <asp:ListItem Text="Select Department" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblCellPhone" runat="server" Text="Cell Phone:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtCellPhone" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblProvince" runat="server" Text="Province:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:DropDownList ID="ddlProvince" runat="server" CssClass="form-control"
                        DataSourceID="dsProvinces"
                        DataTextField="Province"
                        DataValueField="Province"
                        AppendDataBoundItems="true">
                        <asp:ListItem Text="Select Province" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblWorkPhone" runat="server" Text="Work Phone:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtWorkPhone" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblWage" runat="server" Text="Wage:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtWage" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblCommissionRate" runat="server" Text="Commission Rate:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtCommissionRate" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblTCN" runat="server" Text="TCN:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtTCN" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4 pt-1">
                    <asp:Label ID="lblIsManager" runat="server" Text="Is Manager?"></asp:Label>
                </div>
                <div class="col-md-8 pt-2">
                    <asp:CheckBox ID="chkIsManager" runat="server" />
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblLeftDate" runat="server" Text="Left Date:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtLeftDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-md-4">
                    <asp:Label ID="lblLeftReason" runat="server" Text="Left Reason:"></asp:Label>
                </div>
                <div class="col-md-8">
                    <asp:TextBox ID="txtLeftReason" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

        </div>

    </div>

    <div class="row mt-4 mb-3">
        <div class="col-md-6 text-center">
            <asp:Button ID="btnSaveRecord" runat="server" Text="Save Record"
                CssClass="btn btn-light border px-5"
                OnClick="btnSaveRecord_Click" />
        </div>

        <div class="col-md-6 text-center">
            <asp:Button ID="btnCloseForm" runat="server" Text="Close Form"
                CssClass="btn btn-light border px-5"
                CausesValidation="false"
                OnClick="btnCloseForm_Click" />
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-md-12 text-center">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </div>

</div>

        <asp:SqlDataSource ID="dsEmployees" runat="server"
    ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
    InsertCommand="
    INSERT INTO dbo.tbl_Employees
(Empl_FName, Empl_LName, Empl_BDate, Empl_Start_Date, Empl_Left_Date, Empl_Left_Reason,
 Empl_Address, Empl_City, Empl_Province, Empl_Phone, Empl_Cell,
 Dept_ID, Gender_ID, Title_ID,
 Empl_Wage, Empl_Commission_Rate, Empl_Email,
 Is_Empl_Manager, Is_Empl_Active, Empl_CV, Empl_CV_File)
VALUES
(@Empl_FName, @Empl_LName, @Empl_BDate, @Empl_Start_Date, @Empl_Left_Date, @Empl_Left_Reason,
 @Empl_Address, @Empl_City, @Empl_Province, @Empl_Phone, @Empl_Cell,
 @Dept_ID, @Gender_ID, @Title_ID,
 @Empl_Wage, @Empl_Commission_Rate, @Empl_Email,
 @Is_Empl_Manager, @Is_Empl_Active, @Empl_CV, @Empl_CV_File)">

    <InsertParameters>
        <asp:Parameter Name="Empl_FName" />
        <asp:Parameter Name="Empl_LName" />
        <asp:Parameter Name="Empl_BDate" />
        <asp:Parameter Name="Empl_Start_Date" />
        <asp:Parameter Name="Empl_Left_Date" />
        <asp:Parameter Name="Empl_Left_Reason" />
        <asp:Parameter Name="Empl_Address" />
        <asp:Parameter Name="Empl_City" />
        <asp:Parameter Name="Empl_Province" />
        <asp:Parameter Name="Empl_Phone" />
        <asp:Parameter Name="Empl_Cell" />
        <asp:Parameter Name="Dept_ID" />
        <asp:Parameter Name="Gender_ID" />
        <asp:Parameter Name="Title_ID" />
        <asp:Parameter Name="Empl_Wage" />
        <asp:Parameter Name="Empl_Commission_Rate" />
        <asp:Parameter Name="Empl_Email" />
        <asp:Parameter Name="Is_Empl_Manager" />
        <asp:Parameter Name="Is_Empl_Active" />
        <asp:Parameter Name="Empl_CV" />
        <asp:Parameter Name="Empl_CV_File" />
    </InsertParameters>
</asp:SqlDataSource>

    <asp:SqlDataSource ID="dsDepartments" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="SELECT Dept_ID, Dept_Name FROM dbo.tbl_Departments ORDER BY Dept_Name">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsTitles" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="SELECT LK_ID, Title FROM dbo.tbl_Lookups WHERE Title IS NOT NULL ORDER BY LK_ID">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsProvinces" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="SELECT LK_ID, Province FROM dbo.tbl_Lookups WHERE Province IS NOT NULL ORDER BY LK_ID">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsCities" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="SELECT LK_ID, City FROM dbo.tbl_Lookups WHERE City IS NOT NULL ORDER BY LK_ID">
    </asp:SqlDataSource>

</asp:Content>
