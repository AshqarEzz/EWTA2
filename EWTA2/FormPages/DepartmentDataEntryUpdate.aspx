<%@ Page Title="Department Data Entry and Update" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="DepartmentDataEntryUpdate.aspx.cs"
    Inherits="EWTA2.FormPages.DepartmentDataEntryUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-3">

        <h2 class="fw-bold mb-4">Departments Data Entry and Update Form</h2>

        <asp:GridView ID="gvDepartments" runat="server"
            AutoGenerateColumns="False"
            DataSourceID="dsDepartments"
            DataKeyNames="Dept_ID"
            CssClass="table table-bordered"
            AutoGenerateEditButton="True"
            AllowPaging="True"
            PageSize="10">

            <Columns>
                <asp:BoundField DataField="Dept_ID" HeaderText="Dept_ID" ReadOnly="True" />

                <asp:BoundField DataField="Dept_Name" HeaderText="Dept_Name" />

                <asp:BoundField DataField="Dept_Phone" HeaderText="Dept_Phone" />

                <asp:TemplateField HeaderText="Empl_Name">

                    <ItemTemplate>
                        <%# Eval("Empl_Name") %>
                    </ItemTemplate>

                    <EditItemTemplate>

                        <asp:DropDownList ID="ddlManagerEdit" runat="server"
                            DataSourceID="dsManagers"
                            DataTextField="Empl_Name"
                            DataValueField="Empl_ID"
                            SelectedValue='<%# Bind("Manager_ID") %>'>
                        </asp:DropDownList>

                    </EditItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

        <div class="row mt-4">

            <div class="col-md-6">

                <div class="row mb-2">
                    <div class="col-md-4">
                        <asp:Label ID="lblDeptName" runat="server" Text="Dept Name:"></asp:Label>
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtDeptName" runat="server"></asp:TextBox>
                    </div>
                </div>


                <div class="row mb-2">
                    <div class="col-md-4">
                        <asp:Label ID="lblDeptPhone" runat="server" Text="Dept Phone:"></asp:Label>
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtDeptPhone" runat="server"></asp:TextBox>
                    </div>
                </div>


                <div class="row mb-2">
                    <div class="col-md-4">
                        <asp:Label ID="lblManager" runat="server" Text="Manager:"></asp:Label>
                    </div>
                    <div class="col-md-8">
                        <asp:DropDownList ID="ddlManager" runat="server"
                            DataSourceID="dsManagers"
                            DataTextField="Empl_Name"
                            DataValueField="Empl_ID"
                            AppendDataBoundItems="true">
                            <asp:ListItem Text="Select Employee" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

            </div>

            <div class="col-md-6 text-center">

                <asp:Button ID="btnCloseForm" runat="server" Text="Close Form"
                    CssClass="btn btn-light border px-5 mb-5"
                    OnClick="btnCloseForm_Click" />

                <br />

                <asp:Button ID="btnSaveData" runat="server" Text="Save Data"
                    CssClass="btn btn-light border px-5"
                    OnClick="btnSaveData_Click" />

            </div>

        </div>

        <div class="row mt-3">
            <div class="col-md-12">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>

    </div>

    <asp:SqlDataSource ID="dsDepartments" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"

        SelectCommand="
            SELECT 
                d.Dept_ID,
                d.Dept_Name,
                d.Dept_Phone,
                d.Manager_ID,
                e.Empl_Name
            FROM dbo.tbl_Departments d
            LEFT JOIN dbo.tbl_Employees e
            ON d.Manager_ID = e.Empl_ID
            ORDER BY d.Dept_ID"

        UpdateCommand="
            UPDATE dbo.tbl_Departments
            SET Dept_Name = @Dept_Name,
                Dept_Phone = @Dept_Phone,
                Manager_ID = @Manager_ID
            WHERE Dept_ID = @Dept_ID"

        InsertCommand="
            INSERT INTO dbo.tbl_Departments
            (Dept_Name, Dept_Phone, Manager_ID)
            VALUES
            (@Dept_Name, @Dept_Phone, @Manager_ID)">

        <UpdateParameters>
            <asp:Parameter Name="Dept_Name" Type="String" />
            <asp:Parameter Name="Dept_Phone" Type="String" />
            <asp:Parameter Name="Manager_ID" Type="Int32" />
            <asp:Parameter Name="Dept_ID" Type="Int32" />
        </UpdateParameters>

        <InsertParameters>
            <asp:Parameter Name="Dept_Name" Type="String" />
            <asp:Parameter Name="Dept_Phone" Type="String" />
            <asp:Parameter Name="Manager_ID" Type="Int32" />
        </InsertParameters>

    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsManagers" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="SELECT Empl_ID, Empl_Name, Is_Empl_Manager FROM tbl_Employees WHERE (Is_Empl_Manager = 1) ORDER BY Empl_Name">
    </asp:SqlDataSource>

</asp:Content>