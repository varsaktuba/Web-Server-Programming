<%@ Page Title="Login Page" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Homework3.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
   Login</p>


    <form id="form1" runat="server">
    <div style="font-size: large; border: thick double #FFCCCC">
    
        <br />
        <br />
    
        <asp:Label ID="Label1" runat="server" Text="First Name:" Width="100"></asp:Label>

        <asp:TextBox ID="TextBox1" runat="server" Height="22px" Width="174px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Last Name:"  Width="100"></asp:Label>

        <asp:TextBox ID="TextBox2" runat="server" Height="21px" Width="172px"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
        <br />
        <br />
            
    </div>
        <p class="auto-style1">
        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
    
        </p>
    </form>


</asp:Content>
