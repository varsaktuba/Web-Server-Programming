<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Homework3.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="New Books:" Font-Bold="True" Font-Size="36pt" BorderColor="#FFCCCC" BorderStyle="Double" BorderWidth="5px" Height="66px" Width="269px"></asp:Label>
        <br /><br />
        <asp:Panel ID="cartContainer" runat="server">
            <br />
            <br />
        </asp:Panel>
        <div id="secondChance" runat="server"></div>
    </div>
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>
