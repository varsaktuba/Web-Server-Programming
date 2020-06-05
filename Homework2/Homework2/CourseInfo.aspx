<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseInfo.aspx.cs" Inherits="Homework2.CourseInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CourseInfo</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 250px">
            <h2>Course Info</h2>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
                AutoGenerateRows="False" CellPadding="4" 
                DataKeyNames="CourseID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="CourseID" HeaderText="CourseID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="CourseID" />
                    <asp:BoundField DataField="CourseCode" HeaderText="CourseCode" SortExpression="CourseCode" />
                    <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                    <asp:BoundField DataField="Instructor" HeaderText="Instructor" SortExpression="Instructor" />
                    <asp:CommandField ShowEditButton="True" />
                </Fields>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [Courses] WHERE [CourseID] = @CourseID" 
                InsertCommand="INSERT INTO [Courses] ([CourseCode], [CourseName], [Instructor]) VALUES (@CourseCode, @CourseName, @Instructor)" 
                SelectCommand="SELECT * FROM [Courses] WHERE ([CourseID] = @CourseID)" 
                UpdateCommand="UPDATE [Courses] SET [CourseCode] = @CourseCode, [CourseName] = @CourseName, [Instructor] = @Instructor WHERE [CourseID] = @CourseID">
                <DeleteParameters>
                    <asp:Parameter Name="CourseID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CourseCode" Type="String" />
                    <asp:Parameter Name="CourseName" Type="String" />
                    <asp:Parameter Name="Instructor" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="CourseID" QueryStringField="id" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CourseCode" Type="String" />
                    <asp:Parameter Name="CourseName" Type="String" />
                    <asp:Parameter Name="Instructor" Type="String" />
                    <asp:Parameter Name="CourseID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

        <div style="height: 250px">
            <h2>Registered Students</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="StudentID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" 
                PageSize="5" Width="221px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="StudentID" />
                    <asp:HyperLinkField DataNavigateUrlFields="StudentID" DataNavigateUrlFormatString="StudentInfo.aspx?id={0}" 
                        DataTextField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [Students], [Enrolment] WHERE [Students].[StudentID] = [Enrolment].[StudentID] AND [Enrolment].[CourseID] = @CourseID">
                <SelectParameters>
                    <asp:QueryStringParameter Name="CourseID" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <h3>Register a New Student</h3>
            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" 
                AutoPostBack="True" DataSourceID="SqlDataSource3" 
                DataTextField="StudentName" DataValueField="StudentID" 
                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>Select Student</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp; 
            <asp:Label ID="Label1" runat="server" Text="Text" Width="500px" Visible="False"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [Students] ORDER BY [StudentName]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [Enrolment] WHERE [StudentID] = @StudentID AND [CourseID] = @CourseID" 
                InsertCommand="INSERT INTO [Enrolment] ([StudentID], [CourseID]) VALUES (@StudentID, @CourseID)" 
                SelectCommand="SELECT * FROM [Enrolment]">
                <DeleteParameters>
                    <asp:Parameter Name="StudentID" Type="Int32" />
                    <asp:Parameter Name="CourseID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="StudentID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:QueryStringParameter Name="CourseID" QueryStringField="id" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
