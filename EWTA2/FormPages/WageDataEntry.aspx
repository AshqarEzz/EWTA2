<%@ Page Title="Wage Data Entry" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WageDataEntry.aspx.cs" Inherits="EWTA2.FormPages.WageDataEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-3">
        <h2 class="text-center fw-bold mb-4">Wage Data Entry Form</h2>

        <div class="row mb-3">
            <div class="col-md-3">
                <asp:Label ID="lblEmployee" runat="server" Text="Choose an Employee:"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="form-control"
                    DataSourceID="dsEmployeesList" DataTextField="Empl_Name" DataValueField="Empl_ID" AppendDataBoundItems="true">
                    <asp:ListItem Text="Select Employee" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-3">
                <asp:Label ID="lblPaidDate" runat="server" Text="Paid Date:"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtPaidDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-3">
                <asp:Label ID="lblPaidAmount" runat="server" Text="Paid Amount:"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtPaidAmount" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-3">
                <asp:Label ID="lblPaidCommission" runat="server" Text="Paid Commission:"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtPaidCommission" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="row mb-4">
            <div class="col-md-3">
                <asp:Label ID="lblWageMonth" runat="server" Text="Wage Month:"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlWageMonth" runat="server" CssClass="form-control"
                    DataSourceID="dsMonths" DataTextField="Month" DataValueField="LK_ID" AppendDataBoundItems="true">
                    <asp:ListItem Text="Select Month" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="row mt-4 mb-3">
            <div class="col-md-4">
                <asp:Button ID="btnSaveData" runat="server" Text="Save Data" CssClass="btn btn-light border px-4" OnClick="btnSaveData_Click" />
            </div>
            <div class="col-md-4">
                <asp:Button ID="btnCloseForm" runat="server" Text="Close Form" CssClass="btn btn-light border px-4" CausesValidation="false" OnClick="btnCloseForm_Click" />
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-12">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="dsEmployeesList" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="SELECT Empl_ID, Empl_Name FROM dbo.tbl_Employees ORDER BY Empl_Name">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsMonths" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="SELECT LK_ID, Month FROM dbo.tbl_Lookups WHERE Month IS NOT NULL ORDER BY LK_ID">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsWages" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        InsertCommand="
        INSERT INTO dbo.tbl_Wages
        (Empl_ID, Wage_Date, Wage_Amount, Wage_Commission, Month_ID)
        VALUES
        (@Empl_ID, @Wage_Date, @Wage_Amount, @Wage_Commission, @Month_ID)">
        <InsertParameters>
            <asp:Parameter Name="Empl_ID" />
            <asp:Parameter Name="Wage_Date" />
            <asp:Parameter Name="Wage_Amount" />
            <asp:Parameter Name="Wage_Commission" />
            <asp:Parameter Name="Month_ID" />
        </InsertParameters>
    </asp:SqlDataSource>

</asp:Content>