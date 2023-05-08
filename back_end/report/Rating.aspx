<%@ Page Title="" Language="C#" MasterPageFile="~/back_end/BackEnd.Master" AutoEventWireup="true" CodeBehind="Rating.aspx.cs" Inherits="TimeZone_Assign.back_end.report.Rating" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="text-align: center; margin-top: 50px;">Top 3 Rated Watches</h3>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" CssClass="content-table">
        <Columns>
            <asp:BoundField DataField="NAME" HeaderText="Category" SortExpression="NAME" />
            <asp:BoundField DataField="REFERENCE_NO" HeaderText="Reference No." SortExpression="REFERENCE_NO" />
            <asp:BoundField DataField="OVERALL_RATING" HeaderText="Overall Rating" ReadOnly="True" SortExpression="OVERALL_RATING" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" CssClass="grid-header" />
        <RowStyle BackColor="White" CssClass="grid-row" />
        <AlternatingRowStyle BackColor="#F7F7F7" CssClass="grid-row" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT 
        CATEGORY.NAME, 
        WATCH.REFERENCE_NO, 
        CAST(ROUND(AVG(CAST(REVIEW.RATING AS decimal(10,2))), 2) AS decimal(10,2)) AS OVERALL_RATING 
    FROM 
        CATEGORY 
        INNER JOIN WATCH ON CATEGORY.CATEGORY_ID = WATCH.CATEGORY_ID 
        INNER JOIN ORDER_ITEM ON WATCH.WATCH_ID = ORDER_ITEM.WATCH_ID 
        INNER JOIN REVIEW ON ORDER_ITEM.REVIEW_ID = REVIEW.REVIEW_ID 
    GROUP BY 
        CATEGORY.NAME, 
        WATCH.REFERENCE_NO
    ORDER BY 
        OVERALL_RATING DESC 
    OFFSET 0 ROWS
    FETCH NEXT 3 ROWS ONLY"></asp:SqlDataSource>
</asp:Content>
