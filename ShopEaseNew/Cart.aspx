<%@ Page Title="My Cart"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Cart.aspx.cs"
Inherits="ShopEaseNew.Cart" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<style>

.cart-container{
    padding:40px 0;
}

.cart-card{
    border:none;
    border-radius:20px;
    overflow:hidden;
    box-shadow:0 5px 20px rgba(0,0,0,0.08);
}

.cart-header{
    background:linear-gradient(135deg,#0d6efd,#6610f2);
    color:white;
    padding:25px;
}

.summary-card{
    background:#f8f9fa;
    border-radius:20px;
    padding:30px;
    box-shadow:0 5px 20px rgba(0,0,0,0.08);
}

.total-price{
    font-size:35px;
    font-weight:bold;
    color:#198754;
}

.empty-cart{
    padding:60px;
    text-align:center;
}

</style>

<div class="container cart-container">

    <div class="row">

        <!-- CART GRID -->

        <div class="col-lg-8">

            <div class="card cart-card">

                <div class="cart-header">

                    <h2>
                        My Shopping Cart
                    </h2>

                </div>

                <div class="card-body">

                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        CssClass="table table-hover"
                        AutoGenerateColumns="False"
                        DataKeyNames="CartID"
                        EmptyDataText="Your Cart is Empty"
                        OnRowDeleting="GridView1_RowDeleting">

                        <Columns>

                            <asp:BoundField
                                DataField="ProductName"
                                HeaderText="Product" />

                            <asp:BoundField
                                DataField="Price"
                                HeaderText="Price"
                                DataFormatString="₹{0:N2}" />

                            <asp:BoundField
                                DataField="Quantity"
                                HeaderText="Quantity" />

                            <asp:BoundField
                                DataField="Total"
                                HeaderText="Total"
                                DataFormatString="₹{0:N2}" />

                            <asp:CommandField
                                ShowDeleteButton="True"
                                HeaderText="Remove"
                                DeleteText="Remove" />

                        </Columns>

                    </asp:GridView>

                    <asp:Label
                        ID="lblMessage"
                        runat="server"
                        Font-Bold="true">
                    </asp:Label>

                </div>

            </div>

        </div>

        <!-- ORDER SUMMARY -->

        <div class="col-lg-4">

            <div class="summary-card">

                <h3 class="mb-4">
                    Order Summary
                </h3>

                <div class="d-flex justify-content-between mb-3">

                    <span>Total Amount</span>

                    <asp:Label
                        ID="lblTotal"
                        runat="server"
                        CssClass="total-price">
                    </asp:Label>

                </div>

                <hr />

                <div class="d-grid mt-4">

                    <asp:Button
    ID="btnOrder"
    runat="server"
    Text="Proceed To Payment"
    CssClass="btn btn-success btn-lg"
    OnClick="btnOrder_Click" />

                </div>

            </div>

        </div>

    </div>

</div>

</asp:Content>