<%@ Page Title="" Language="C#" MasterPageFile="~/back_end/BackEnd.Master" AutoEventWireup="true" CodeBehind="HotSellingReport.aspx.cs" Inherits="TimeZone_Assign.back_end.report.HotSellingReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-container">

    
        <h3 style="text-align: center; margin-top: 50px;">Top 3 Selling Watch</h3>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" CssClass="content-table">
            <Columns>
                <asp:BoundField DataField="WATCH_ID" HeaderText="WATCH_ID" SortExpression="WATCH_ID" />
                <asp:BoundField DataField="REFERENCE_NO" HeaderText="REFERENCE_NO" SortExpression="REFERENCE_NO" />
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                <asp:BoundField DataField="TotalQty" HeaderText="TotalQty" ReadOnly="True" SortExpression="TotalQty" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP (3) ORDER_ITEM.WATCH_ID, WATCH.REFERENCE_NO, CATEGORY_1.NAME, SUM(ORDER_ITEM.QTY) AS TotalQty FROM ORDER_ITEM INNER JOIN ORDERS ON ORDER_ITEM.ORDER_ID = ORDERS.ORDER_ID INNER JOIN WATCH ON ORDER_ITEM.WATCH_ID = WATCH.WATCH_ID INNER JOIN CATEGORY ON WATCH.CATEGORY_ID = CATEGORY.CATEGORY_ID INNER JOIN CATEGORY AS CATEGORY_1 ON WATCH.CATEGORY_ID = CATEGORY_1.CATEGORY_ID GROUP BY ORDER_ITEM.WATCH_ID, WATCH.REFERENCE_NO, CATEGORY_1.NAME ORDER BY TotalQty DESC"></asp:SqlDataSource>
    </div>
</asp:Content>
