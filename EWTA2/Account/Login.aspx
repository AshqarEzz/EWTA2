<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EWTA2.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="max-width:400px; margin:auto; margin-top:50px;">
        <h2>Login</h2>

        <asp:Label Text="Username" runat="server" />
        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />

        <br />

        <asp:Label Text="Password" runat="server" />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />

        <br />

        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />

        <br /><br />

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />

    </div>

</asp:Content>
