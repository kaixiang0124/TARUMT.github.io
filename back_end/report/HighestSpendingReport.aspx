<%@ Page Title="" Language="C#" MasterPageFile="~/back_end/BackEnd.Master" AutoEventWireup="true" CodeBehind="HighestSpendingReport.aspx.cs" Inherits="TimeZone_Assign.back_end.report.HighestSpendingReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-container">

        
        <h3 style="text-align: center; margin-top: 50px;">Top 3 Highest Spending Customers</h3>
        <br />

        <asp:GridView CssClass="content-table" ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="CUSTOMER_ID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="CUSTOMER_ID" HeaderText="CUSTOMER_ID" ReadOnly="True" SortExpression="CUSTOMER_ID" />
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                <asp:BoundField DataField="PHONE" HeaderText="PHONE" SortExpression="PHONE" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP (3) CUSTOMER.CUSTOMER_ID, CUSTOMER.NAME, CUSTOMER.EMAIL, CUSTOMER.PHONE, CONCAT('RM ', SUM(PAYMENT.AMOUNT)) AS TotalAmount
FROM     CUSTOMER INNER JOIN
                  ORDERS ON CUSTOMER.CUSTOMER_ID = ORDERS.CUSTOMER_ID INNER JOIN
                  PAYMENT ON ORDERS.PAYMENT_ID = PAYMENT.PAYMENT_ID
GROUP BY CUSTOMER.CUSTOMER_ID, CUSTOMER.NAME, CUSTOMER.EMAIL, CUSTOMER.PHONE
ORDER BY TotalAmount DESC"></asp:SqlDataSource>
    </div>
</asp:Content>
