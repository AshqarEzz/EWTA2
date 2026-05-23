<%@ Page Title="Employee Data Update" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeDataUpdate.aspx.cs" Inherits="EWTA2.FormPages.EmployeeDataUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-3">
        <h2 class="fw-bold">Employee Data Update Form</h2>

        <div class="row mb-3 mt-3">
            <div class="col-md-4">
                <strong>Choose an Employee:</strong>
            </div>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="form-control"
                    AutoPostBack="true"
                    DataSourceID="dsEmployeeList"
                    DataTextField="Empl_Name"
                    DataValueField="Empl_ID"
                    AppendDataBoundItems="true">
                    <asp:ListItem Text="Select Employee" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <asp:DetailsView ID="dvEmployee" runat="server"
    AutoGenerateRows="False"
    DataSourceID="dsEmployeeDetails"
    DataKeyNames="Empl_ID"
    AutoGenerateEditButton="True"
    CssClass="table table-bordered"
    DefaultMode="ReadOnly"
    OnItemUpdating="dvEmployee_ItemUpdating">

            <Fields>
                <asp:BoundField DataField="Empl_ID" HeaderText="Empl_ID" ReadOnly="True" />
                <asp:BoundField DataField="Empl_FName" HeaderText="Empl_FName" />
                <asp:BoundField DataField="Empl_LName" HeaderText="Empl_LName" />
                <asp:BoundField DataField="Empl_Start_Date" HeaderText="Empl_Start_Date" />
                <asp:BoundField DataField="Empl_Left_Date" HeaderText="Empl_Left_Date" />
                <asp:BoundField DataField="Empl_Left_Reason" HeaderText="Empl_Left_Reason" />
                <asp:BoundField DataField="Empl_City" HeaderText="Empl_City" />
                <asp:BoundField DataField="Empl_Province" HeaderText="Empl_Province" />
                <asp:BoundField DataField="Empl_Phone" HeaderText="Empl_Phone" />
                <asp:BoundField DataField="Empl_Cell" HeaderText="Empl_Cell" />
                <asp:BoundField DataField="Dept_ID" HeaderText="Dept_ID" />
                <asp:BoundField DataField="Gender_ID" HeaderText="Gender_ID" />
                <asp:BoundField DataField="Title_ID" HeaderText="Title_ID" />
                <asp:BoundField DataField="Empl_Wage" HeaderText="Empl_Wage" />
                <asp:BoundField DataField="Empl_Email" HeaderText="Empl_Email" />

                <asp:CheckBoxField DataField="Is_Empl_Active" HeaderText="Is_Empl_Active" />
                <asp:CheckBoxField DataField="Is_Empl_Manager" HeaderText="Is_Empl_Manager" />

                <asp:BoundField DataField="Empl_CV" HeaderText="Empl_CV" />
               <asp:TemplateField HeaderText="CV File">

    <ItemTemplate>
        <asp:HyperLink ID="lnkCVFile" runat="server"
            Text='<%# Eval("Empl_CV_File") %>'
            NavigateUrl='<%# "~/CVFiles/" + Eval("Empl_CV_File") %>'
            Target="_blank"
            Visible='<%# Eval("Empl_CV_File") != DBNull.Value && Eval("Empl_CV_File").ToString() != "" %>'>
        </asp:HyperLink>
    </ItemTemplate>

    <EditItemTemplate>

        <asp:HiddenField ID="hfOldCVFile" runat="server"
            Value='<%# Bind("Empl_CV_File") %>' />

        <asp:Label ID="lblCurrentCV" runat="server"
            Text='<%# Eval("Empl_CV_File") %>'
            Visible='<%# Eval("Empl_CV_File") != DBNull.Value && Eval("Empl_CV_File").ToString() != "" %>'>
        </asp:Label>

        <br />

        <asp:CheckBox ID="chkDeleteCV" runat="server"
            Text="Delete CV"
            Visible='<%# Eval("Empl_CV_File") != DBNull.Value && Eval("Empl_CV_File").ToString() != "" %>' />

        <asp:FileUpload ID="fuCVFileEdit" runat="server"
            CssClass="form-control"
            Visible='<%# Eval("Empl_CV_File") == DBNull.Value || Eval("Empl_CV_File").ToString() == "" %>' />

    </EditItemTemplate>

</asp:TemplateField>
            </Fields>
        </asp:DetailsView>


<div class="row mt-2">
    <div class="col-md-12">
        <asp:Label ID="lblCVMessage" runat="server" ForeColor="Red"></asp:Label>
    </div>
</div>

        <div class="mt-3">
            <asp:Button ID="btnCloseForm" runat="server" Text="Close Form"
                CssClass="btn btn-light border px-4" OnClick="btnCloseForm_Click" />
        </div>
    </div>

    <asp:SqlDataSource ID="dsEmployeeList" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"
        SelectCommand="SELECT Empl_ID, Empl_Name FROM dbo.tbl_Employees ORDER BY Empl_Name">
    </asp:SqlDataSource>

  
    <asp:SqlDataSource ID="dsEmployeeDetails" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"

        SelectCommand="
    SELECT Empl_ID, Empl_FName, Empl_LName, Empl_Start_Date, Empl_Left_Date, Empl_Left_Reason,
           Empl_City, Empl_Province, Empl_Phone, Empl_Cell, Dept_ID, Gender_ID, Title_ID,
           Empl_Wage, Empl_Email, Is_Empl_Active, Is_Empl_Manager, Empl_CV, Empl_CV_File
    FROM dbo.tbl_Employees
    WHERE Empl_ID = @Empl_ID"

        UpdateCommand="
            UPDATE dbo.tbl_Employees
            SET Empl_FName = @Empl_FName,
                Empl_LName = @Empl_LName,
                Empl_Start_Date = @Empl_Start_Date,
                Empl_Left_Date = @Empl_Left_Date,
                Empl_Left_Reason = @Empl_Left_Reason,
                Empl_City = @Empl_City,
                Empl_Province = @Empl_Province,
                Empl_Phone = @Empl_Phone,
                Empl_Cell = @Empl_Cell,
                Dept_ID = @Dept_ID,
                Gender_ID = @Gender_ID,
                Title_ID = @Title_ID,
                Empl_Wage = @Empl_Wage,
                Empl_Email = @Empl_Email,
                Is_Empl_Active = @Is_Empl_Active,
                Is_Empl_Manager = @Is_Empl_Manager,
                Empl_CV = @Empl_CV,
        Empl_CV_File = @Empl_CV_File
            WHERE Empl_ID = @Empl_ID">

        <SelectParameters>

            <asp:ControlParameter Name="Empl_ID" ControlID="ddlEmployee" PropertyName="SelectedValue" Type="Int32" />

        </SelectParameters>

        <UpdateParameters>
            <asp:Parameter Name="Empl_FName" Type="String" />
            <asp:Parameter Name="Empl_LName" Type="String" />
            <asp:Parameter Name="Empl_Start_Date" Type="DateTime" />
            <asp:Parameter Name="Empl_Left_Date" Type="DateTime" />
            <asp:Parameter Name="Empl_Left_Reason" Type="String" />
            <asp:Parameter Name="Empl_City" Type="String" />
            <asp:Parameter Name="Empl_Province" Type="String" />
            <asp:Parameter Name="Empl_Phone" Type="String" />
            <asp:Parameter Name="Empl_Cell" Type="String" />
            <asp:Parameter Name="Dept_ID" Type="Int32" />
            <asp:Parameter Name="Gender_ID" Type="Int32" />
            <asp:Parameter Name="Title_ID" Type="Int32" />
            <asp:Parameter Name="Empl_Wage" Type="Decimal" />
            <asp:Parameter Name="Empl_Email" Type="String" />
            <asp:Parameter Name="Is_Empl_Active" Type="Boolean" />
            <asp:Parameter Name="Is_Empl_Manager" Type="Boolean" />
            <asp:Parameter Name="Empl_CV" Type="String" />
            <asp:Parameter Name="Empl_CV_File" Type="String" />
            <asp:Parameter Name="Empl_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>