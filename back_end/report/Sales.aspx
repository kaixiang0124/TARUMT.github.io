<%@ Page Title="" Language="C#" MasterPageFile="~/back_end/BackEnd.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="TimeZone_Assign.back_end.report.Sales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="text-align: center; margin-top: 50px;">Sales Overview</h3>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" CssClass="content-table">
        <Columns>
            <asp:BoundField DataField="PAYMENT_DATE" HeaderText="PAYMENT_DATE" SortExpression="PAYMENT_DATE" />
            <asp:BoundField DataField="ORDER_ID" HeaderText="ORDER_ID" SortExpression="ORDER_ID" />
            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
            <asp:BoundField DataField="REFERENCE_NO" HeaderText="REFERENCE_NO" SortExpression="REFERENCE_NO" />
            <asp:BoundField DataField="TotalAmount" HeaderText="TotalAmount" ReadOnly="True" SortExpression="TotalAmount" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT 
  PAYMENT.PAYMENT_DATE, 
  ORDER_ITEM.ORDER_ID, 
  CATEGORY.NAME, 
  WATCH.REFERENCE_NO, 
  SUM(PAYMENT.AMOUNT) AS TotalAmount 
FROM 
  ORDERS 
  INNER JOIN ORDER_ITEM ON ORDERS.ORDER_ID = ORDER_ITEM.ORDER_ID 
  INNER JOIN PAYMENT ON ORDERS.PAYMENT_ID = PAYMENT.PAYMENT_ID 
  INNER JOIN WATCH ON ORDER_ITEM.WATCH_ID = WATCH.WATCH_ID 
  INNER JOIN CATEGORY ON WATCH.CATEGORY_ID = CATEGORY.CATEGORY_ID 
GROUP BY 
  PAYMENT.PAYMENT_DATE, 
  ORDER_ITEM.ORDER_ID, 
  CATEGORY.NAME, 
  WATCH.REFERENCE_NO
"></asp:SqlDataSource>
</asp:Content>
