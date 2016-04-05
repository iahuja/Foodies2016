<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Final_Project.WebForm1" MasterPageFile="~/Master.Master" %>


 <asp:Content ContentPlaceHolderId="main" runat="server">
     <form runat="server"> 
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
             <Columns>
                 <asp:BoundField DataField="DishName" HeaderText="DishName" SortExpression="DishName" />
             </Columns>
         </asp:GridView>
      
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FoodiesConnectionString %>" SelectCommand="SELECT [DishName] FROM [Dishes]"></asp:SqlDataSource>
      
         </form>
         </asp:Content>
 

 

