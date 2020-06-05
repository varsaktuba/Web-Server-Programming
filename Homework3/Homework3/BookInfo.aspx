<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookInfo.aspx.cs" Inherits="Homework3.BookInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div id="container" style="display:inline-block">
    
        <div id="left" style="float:left">
            <asp:Image ID="Image1" runat="server" Width="200"/>
        </div>

        <div id="rightBook" runat="server" style="border: thick double #FFCCCC; float:left; margin-left:65px">

            <asp:Label ID="LabelTitle" runat="server" Font-Bold="true" Font-Size="36px"></asp:Label>
            <br />
            <br />
            <asp:Label ID="LabelAuthor" runat="server"></asp:Label><br />
            <asp:Label ID="LabelPublisher" runat="server"></asp:Label><br />
            <asp:Label ID="LabelPages" runat="server"></asp:Label><br />
            <br /><br />
            <asp:Button ID="Button1" runat="server" Text="Add to Cart" OnClick="Button1_Click"/><br />
            <br />
            <asp:LinkButton ID="LinkButtonDisplayBooks" runat="server" Text="Display Adding Books" PostBackUrl="~/Cart.aspx"></asp:LinkButton><br />
            <br />
            <asp:LinkButton ID="LinkButtonReturn2" runat="server" Text="Return to Main Page" PostBackUrl="~/Default.aspx" OnClick="LinkButtonReturn2_Click"></asp:LinkButton>
            
        </div>
        <div id="rightNull" runat="server" visible="false">
            <asp:Label ID="Label2" runat="server" Font-Bold="true" Font-Size="36px"></asp:Label><br /><br />
            <asp:LinkButton ID="LinkButtonReturn" runat="server" Text="Return to Main Page" PostBackUrl="~/Default.aspx" OnClick="LinkButtonReturn_Click"></asp:LinkButton>
        </div>
    </div>
    </form>
</asp:Content>
