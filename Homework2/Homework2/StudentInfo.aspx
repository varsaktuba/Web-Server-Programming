<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentInfo.aspx.cs" Inherits="Homework2.StudentInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>StudentInfo</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 250px">
           <h1>Student Info</h1> 
               <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                   DataKeyNames="StudentID" DataSourceID="SqlDataSource1" Height="50px" Width="147px" 
                   CellPadding="4" ForeColor="#333333" GridLines="None">
                   <AlternatingRowStyle BackColor="White" />
                   <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                   <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                   <Fields>
                       <asp:BoundField DataField="StudentID" HeaderText="StudentID" InsertVisible="False" 
                           ReadOnly="True" SortExpression="StudentID" />
                       <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                       <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" SortExpression="BirthDate" />
                       <asp:CommandField ShowEditButton="True" />
                   </Fields>
                   <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                   <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                   <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                   <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
               </asp:DetailsView>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                   SelectCommand="SELECT * FROM [Students] WHERE ([StudentID] = @StudentID)" 
                   DeleteCommand="DELETE FROM [Students] WHERE [StudentID] = @StudentID" 
                   InsertCommand="INSERT INTO [Students] ([StudentName], [BirthDate]) VALUES (@StudentName, @BirthDate)" 
                   UpdateCommand="UPDATE [Students] SET [StudentName] = @StudentName, [BirthDate] = @BirthDate WHERE [StudentID] = @StudentID">
                   <DeleteParameters>
                       <asp:Parameter Name="StudentID" Type="Int32" />
                   </DeleteParameters>
                   <InsertParameters>
                       <asp:Parameter Name="StudentName" Type="String" />
                       <asp:Parameter Name="BirthDate" Type="DateTime" />
                   </InsertParameters>
                   <SelectParameters>
                       <asp:QueryStringParameter Name="StudentID" QueryStringField="id" Type="Int32" />
                   </SelectParameters>
                   <UpdateParameters>
                       <asp:Parameter Name="StudentName" Type="String" />
                       <asp:Parameter Name="BirthDate" Type="DateTime" />
                       <asp:Parameter Name="StudentID" Type="Int32" />
                   </UpdateParameters>
            </asp:SqlDataSource>       
        </div>
            
        <div style="height: 250px">
            <h1>Courses Taken by the Student</h1>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseID" 
                    DataSourceID="SqlDataSource2" 
                    PageSize="5" CellPadding="4" ForeColor="#333333" GridLines="None" Width="264px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="CourseCode" HeaderText="CourseCode" SortExpression="CourseCode" />
                        <asp:HyperLinkField DataTextField="CourseName" HeaderText="CourseName" SortExpression="CourseName" 
                            DataNavigateUrlFields="CourseID" DataNavigateUrlFormatString="CourseInfo.aspx?id={0}" />
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
                SelectCommand="SELECT * FROM [Courses], [Enrolment] WHERE [Courses].[CourseID] = [Enrolment].[CourseID] AND [Enrolment].[StudentID] = @StudentID" >
                <SelectParameters>
                    <asp:QueryStringParameter Name="StudentID" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
