<%@ Page Title="Wage Data Update" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="WageDataUpdate.aspx.cs"
    Inherits="EWTA2.FormPages.WageDataUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-3">

        <h2 class="fw-bold mb-4">Wage Data Update Form</h2>

        <asp:GridView ID="gvWages" runat="server"
            AutoGenerateColumns="False"
            DataSourceID="dsWages"
            DataKeyNames="Wage_ID"
            CssClass="table table-bordered"
            AutoGenerateEditButton="True">

            <Columns>
    <asp:BoundField DataField="Wage_ID" HeaderText="Wage_ID" ReadOnly="True" />
    <asp:BoundField DataField="Empl_Name" HeaderText="Employee Name" ReadOnly="True" />
    <asp:BoundField DataField="Wage_Date" HeaderText="Wage_Date" />
    <asp:BoundField DataField="Wage_Amount" HeaderText="Wage_Amount" />
    <asp:BoundField DataField="Wage_Commission" HeaderText="Wage_Commission" />
    <asp:BoundField DataField="Month_ID" HeaderText="Month_ID" />
</Columns>

        </asp:GridView>

        <div class="mt-3">
            <asp:Button ID="btnCloseForm" runat="server" Text="Close Form"
                CssClass="btn btn-light border px-4" OnClick="btnCloseForm_Click" />
        </div>
    </div>
    <asp:SqlDataSource ID="dsWages" runat="server"
        ConnectionString="<%$ ConnectionStrings:EWTAConnection %>"

        SelectCommand="
    SELECT 
        w.Wage_ID,
        e.Empl_Name,
        w.Wage_Date,
        w.Wage_Amount,
        w.Wage_Commission,
        w.Month_ID
    FROM dbo.tbl_Wages w
    INNER JOIN dbo.tbl_Employees e
        ON w.Empl_ID = e.Empl_ID
    ORDER BY w.Wage_ID"

        UpdateCommand="
            UPDATE dbo.tbl_Wages
            SET Wage_Date = @Wage_Date,
                Wage_Amount = @Wage_Amount,
                Wage_Commission = @Wage_Commission,
                Month_ID = @Month_ID
            WHERE Wage_ID = @Wage_ID">  

        <UpdateParameters>
            <asp:Parameter Name="Wage_Date" Type="DateTime" />
            <asp:Parameter Name="Wage_Amount" Type="Decimal" />
            <asp:Parameter Name="Wage_Commission" Type="Decimal" />
            <asp:Parameter Name="Month_ID" Type="Int32" />
            <asp:Parameter Name="Wage_ID" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>

</asp:Content>
