<%@ Page Title="My Orders"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Orders.aspx.cs"
Inherits="ShopEaseNew.Orders" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<style>

.page-title{
    font-size:40px;
    font-weight:700;
    color:#0d6efd;
}

.order-card{
    border:none;
    border-radius:20px;
    overflow:hidden;
    box-shadow:0 5px 20px rgba(0,0,0,0.08);
}

.order-header{
    background:linear-gradient(135deg,#0d6efd,#6610f2);
    color:white;
    padding:20px;
}

.gridview{
    border:none !important;
}

.gridview th{
    background:#0d6efd;
    color:white;
    text-align:center;
    padding:14px;
}

.gridview td{
    padding:12px;
    vertical-align:middle;
}

</style>

<div class="container mt-5 mb-5">

    <div class="text-center mb-4">

        <h1 class="page-title">
            My Orders
        </h1>

        <p class="text-muted">
            View all your purchased products
        </p>

    </div>

    <div class="card order-card">

        <div class="order-header">

            <h4 class="mb-0">
                Order History
            </h4>

        </div>

        <div class="card-body">

            <asp:GridView
                ID="GridView1"
                runat="server"
                CssClass="table table-hover gridview"
                AutoGenerateColumns="False"
                EmptyDataText="No Orders Found">

                <Columns>

                    <asp:BoundField
                        DataField="OrderID"
                        HeaderText="Order ID" />

                    <asp:BoundField
                        DataField="ProductName"
                        HeaderText="Product Name" />

                    <asp:BoundField
                        DataField="Quantity"
                        HeaderText="Quantity" />

                    <asp:BoundField
                        DataField="Price"
                        HeaderText="Price"
                        DataFormatString="₹{0:N2}" />

                    <asp:BoundField
                        DataField="Total"
                        HeaderText="Total"
                        DataFormatString="₹{0:N2}" />

                    <asp:BoundField
                        DataField="PaymentStatus"
                        HeaderText="Payment Status" />

                    <asp:BoundField
                        DataField="DeliveryStatus"
                        HeaderText="Delivery Status" />

                    <asp:BoundField
                        DataField="OrderDate"
                        HeaderText="Order Date"
                        DataFormatString="{0:dd-MMM-yyyy}" />

                </Columns>

            </asp:GridView>

        </div>

    </div>

</div>

</asp:Content>