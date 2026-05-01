<%@ Page Title="Forms" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Forms.aspx.cs" Inherits="EWTA2.Forms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-3">


        <h2 class="text-center fw-bold mb-4">EWTA Forms</h2>

        <div class="row text-center">

            <div class="col-md-6 mb-3">

                <asp:Button ID="btnEmployeeEntry" runat="server" Text="Employee Data Entry Form"
                    CssClass="btn btn-light border w-75 mb-3" OnClick="btnEmployeeEntry_Click" />

                <br />

                <asp:Button ID="btnEmployeeUpdate" runat="server" Text="Employee Data Update Form"
                    CssClass="btn btn-light border w-75 mb-3" OnClick="btnEmployeeUpdate_Click" />
                <br />

                <asp:Button ID="btnEmployeeWizard" runat="server" Text="Employee Data Entry Wizard Form"
                    CssClass="btn btn-light border w-75" OnClick="btnEmployeeWizard_Click" />
            </div>

            <div class="col-md-6 mb-3">

                <asp:Button ID="btnWageEntry" runat="server" Text="Wage Data Entry Form"
                    CssClass="btn btn-light border w-75 mb-3" OnClick="btnWageEntry_Click" />
                <br />

                <asp:Button ID="btnWageUpdate" runat="server" Text="Wage Data Update Form"
                    CssClass="btn btn-light border w-75 mb-3" OnClick="btnWageUpdate_Click" />
                <br />

                <asp:Button ID="btnDepartment" runat="server" Text="Department Data Entry and Update Form"
                    CssClass="btn btn-light border w-75" OnClick="btnDepartment_Click" />

            </div>

        </div>
    </div>

</asp:Content>
