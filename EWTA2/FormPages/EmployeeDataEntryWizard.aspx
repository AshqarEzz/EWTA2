<%@ Page Title="Employee Data Entry Wizard" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="EmployeeDataEntryWizard.aspx.cs"
    Inherits="EWTA2.FormPages.EmployeeDataEntryWizard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-3">

        <h2 class="fw-bold mb-4">Employee Data Entry Wizard</h2>

        <asp:Wizard ID="wizEmployee" runat="server"
    Width="650px"
    Height="350px"
    ActiveStepIndex="0"
    OnNextButtonClick="wizEmployee_NextButtonClick"
    OnActiveStepChanged="wizEmployee_ActiveStepChanged"
    OnFinishButtonClick="wizEmployee_FinishButtonClick">

            <SideBarStyle BackColor="#7d7258" ForeColor="White" Width="170px" />
            <HeaderStyle BackColor="#567596" ForeColor="White" Font-Bold="true" />
            <StepStyle BorderColor="#cccccc" BorderWidth="1px" BorderStyle="Solid" />
            <NavigationButtonStyle CssClass="btn btn-light border btn-sm" />

            <WizardSteps>

                <asp:WizardStep ID="stepPersonal" runat="server" Title="Personel Data">
                    <h5 class="bg-primary text-white p-1">Employee Data Entry Wizard Form</h5>

                    <div class="row mb-2">
                        <div class="col-md-3">Name:</div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mb-2">
                        <div class="col-md-3">Surname:</div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mb-2">
                        <div class="col-md-3">Birth Date:</div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtBirthDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mb-2">
                        <div class="col-md-3">Entry Date:</div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtEntryDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mb-2">
                        <div class="col-md-3">Title:</div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlTitle" runat="server"
    CssClass="form-control"
    DataSourceID="dsTitles"
    DataTextField="Title"
    DataValueField="LK_ID"
    AppendDataBoundItems="true">

    <asp:ListItem Text="Select Title" Value=""></asp:ListItem>

</asp:DropDownList>
                        </div>
                    </div>

                    <div class="row mb-2">
                        <div class="col-md-3">Gender:</div>
                        <div class="col-md-6">
                            <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="Man" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Woman" Value="2"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                </asp:WizardStep>

                <asp:WizardStep ID="stepCommunication" runat="server" Title="Communication Data">
                    <h5 class="bg-primary text-white p-1">Employee Data Entry Wizard Form</h5>

                    <div class="row mb-2">
                        <div class="col-md-3">Tel:</div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtTel" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mb-2">
                        <div class="col-md-3">Cell:</div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtCell" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mb-2">
                        <div class="col-md-3">Email:</div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mb-2">
                        <div class="col-md-3">Department:</div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlDepartment" runat="server"
    CssClass="form-control"
    DataSourceID="dsDepartments"
    DataTextField="Dept_Name"
    DataValueField="Dept_ID"
    AppendDataBoundItems="true">

    <asp:ListItem Text="Select Department" Value=""></asp:ListItem>

</asp:DropDownList>
                        </div>
                    </div>
                </asp:WizardStep>

                <asp:WizardStep ID="stepAddress" runat="server" Title="Address Data">
                    <h5 class="bg-primary text-white p-1">Employee Data Entry Wizard Form</h5>

                    <div class="row mb-2">
                        <div class="col-md-3">Address:</div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row mb-2">
                        <div class="col-md-3">City:</div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlCity" runat="server"
    CssClass="form-control"
    DataSourceID="dsCities"
    DataTextField="City"
    DataValueField="City"
    AppendDataBoundItems="true">

    <asp:ListItem Text="Select City" Value=""></asp:ListItem>

</asp:DropDownList>
                        </div>
                    </div>

                    <div class="row mb-2">
                        <div class="col-md-3">Province:</div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlProvince" runat="server"
    CssClass="form-control"
    DataSourceID="dsProvinces"
    DataTextField="Province"
    DataValueField="Province"
    AppendDataBoundItems="true">

    <asp:ListItem Text="Select Province" Value=""></asp:ListItem>

</asp:DropDownList>
                        </div>
                    </div>
                </asp:WizardStep>

                <asp:WizardStep ID="stepFinish" runat="server" Title="Finish">
                    <h5 class="bg-primary text-white p-1">Employee Data Entry Wizard Form</h5>

                    <p>Name: <asp:Label ID="lblName" runat="server"></asp:Label></p>
                    <p>Surname: <asp:Label ID="lblSurname" runat="server"></asp:Label></p>
                    <p>BDate: <asp:Label ID="lblBDate" runat="server"></asp:Label></p>
                    <p>Entry Date: <asp:Label ID="lblEntryDate" runat="server"></asp:Label></p>
                    <p>Title: <asp:Label ID="lblTitle" runat="server"></asp:Label></p>
                    <p>Phone: <asp:Label ID="lblPhone" runat="server"></asp:Label></p>
                    <p>Cell: <asp:Label ID="lblCell" runat="server"></asp:Label></p>
                    <p>Email: <asp:Label ID="lblEmail" runat="server"></asp:Label></p>
                    <p>Department: <asp:Label ID="lblDepartment" runat="server"></asp:Label></p>

                    <p class="mt-4">If all data entry are correct click on Finish button...</p>
                </asp:WizardStep>

                <asp:WizardStep ID="stepEnd" runat="server" Title="END" StepType="Complete">
                    <div style="height:250px; border:1px solid #ccc;"></div>

                    <asp:Label ID="lblMessage" runat="server"
                        ForeColor="Red"
                        Text="New Employee Successfully:<br/>Added">
                    </asp:Label>
                </asp:WizardStep>

            </WizardSteps>
        </asp:Wizard>

        <div class="mt-3">
    <asp:Label ID="lblWizardError" runat="server" ForeColor="Red"></asp:Label>
</div>

        <div class="mt-4">
            <asp:Button ID="btnCloseForm" runat="server"
                Text="Close Form"
                CssClass="btn btn-light border px-5"
                OnClick="btnCloseForm_Click" />
        </div>

    </div>

    <asp:SqlDataSource ID="dsEmployees" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        InsertCommand="
            INSERT INTO dbo.tbl_Employees
            (Empl_FName, Empl_LName, Empl_BDate, Empl_Start_Date,
             Empl_Phone, Empl_Cell, Empl_Email,
             Dept_ID, Gender_ID, Title_ID,
             Empl_Address, Empl_City, Empl_Province,
             Is_Empl_Active)
            VALUES
            (@Empl_FName, @Empl_LName, @Empl_BDate, @Empl_Start_Date,
             @Empl_Phone, @Empl_Cell, @Empl_Email,
             @Dept_ID, @Gender_ID, @Title_ID,
             @Empl_Address, @Empl_City, @Empl_Province,
             @Is_Empl_Active)">

        <InsertParameters>
            <asp:Parameter Name="Empl_FName" />
            <asp:Parameter Name="Empl_LName" />
            <asp:Parameter Name="Empl_BDate" />
            <asp:Parameter Name="Empl_Start_Date" />
            <asp:Parameter Name="Empl_Phone" />
            <asp:Parameter Name="Empl_Cell" />
            <asp:Parameter Name="Empl_Email" />
            <asp:Parameter Name="Dept_ID" />
            <asp:Parameter Name="Gender_ID" />
            <asp:Parameter Name="Title_ID" />
            <asp:Parameter Name="Empl_Address" />
            <asp:Parameter Name="Empl_City" />
            <asp:Parameter Name="Empl_Province" />
            <asp:Parameter Name="Is_Empl_Active" />
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

    <asp:SqlDataSource ID="dsCities" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="SELECT LK_ID, City FROM dbo.tbl_Lookups WHERE City IS NOT NULL ORDER BY LK_ID">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsProvinces" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="SELECT LK_ID, Province FROM dbo.tbl_Lookups WHERE Province IS NOT NULL ORDER BY LK_ID">
    </asp:SqlDataSource>

</asp:Content>
