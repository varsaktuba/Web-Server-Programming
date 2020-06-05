<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Homework3.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
    <div id="container" style="display:inline-block">

        <div id="panel" style="float: left;border:thick double #FFCCCC; padding:15px">

            <asp:Label ID="Label1" runat="server"></asp:Label>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"></asp:LinkButton>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Logout" Visible="false" OnClick="Button1_Click" />

        </div>

        
        <div id="booksPanel" runat="server" style="float: left;margin-left:50px;border:thick double #FFCCCC; padding:15px">
            <asp:Label ID="Label2" runat="server">Click on a Link below : </asp:Label>
            <br />

            <asp:Panel ID="Books" runat="server">
            </asp:Panel>
        </div>  

    </div>  
    </form>
</asp:Content>
