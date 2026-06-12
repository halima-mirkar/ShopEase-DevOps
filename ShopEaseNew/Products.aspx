<%@ Page Title="Products"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Products.aspx.cs"
Inherits="ShopEaseNew.Products" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<style>

body{
    background:#f5f7fb;
}

.page-title{
    font-size:40px;
    font-weight:700;
}

.search-box{
    background:white;
    padding:20px;
    border-radius:20px;
    box-shadow:0 5px 20px rgba(0,0,0,0.08);
}

.product-card{
    border:none;
    border-radius:25px;
    overflow:hidden;
    transition:0.4s;
    box-shadow:0 5px 20px rgba(0,0,0,0.08);
    height:100%;
}

.product-card:hover{
    transform:translateY(-10px);
}

.product-img{
    width:100%;
    height:260px;
    object-fit:cover;
}

.product-title{
    font-size:24px;
    font-weight:700;
}

.price{
    color:#198754;
    font-size:28px;
    font-weight:bold;
}

.btn-cart{
    border-radius:30px;
    font-weight:600;
}

</style>

<div class="container py-5">

    <!-- TITLE -->

    <div class="text-center mb-5">

        <h1 class="page-title">
            Our Products
        </h1>

        <p class="text-muted">
            Explore Premium Products
        </p>

    </div>

    <!-- SEARCH -->

    <div class="search-box mb-5">

        <div class="row">

            <div class="col-md-10">

                <asp:TextBox
                    ID="txtSearch"
                    runat="server"
                    CssClass="form-control form-control-lg"
                    placeholder="Search Products">
                </asp:TextBox>

            </div>

            <div class="col-md-2 d-grid">

                <asp:Button
                    ID="btnSearch"
                    runat="server"
                    Text="Search"
                    CssClass="btn btn-primary btn-lg"
                    OnClick="btnSearch_Click" />

            </div>

        </div>

    </div>

    <!-- MESSAGE -->

    <div class="text-center mb-4">

        <asp:Label
            ID="lblMessage"
            runat="server"
            Font-Bold="true">
        </asp:Label>

    </div>

    <!-- PRODUCTS -->

    <div class="row">

        <asp:Repeater
            ID="rptProducts"
            runat="server">

            <ItemTemplate>

                <div class="col-lg-4 col-md-6 mb-4">

                    <div class="card product-card">

                        <img
                            src='<%# Eval("ImageUrl") %>'
                            class="product-img" />

                        <div class="card-body text-center p-4">

                            <h4 class="product-title">

                                <%# Eval("ProductName") %>

                            </h4>

                            <p class="text-muted">

                                <%# Eval("CategoryName") %>

                            </p>

                            <p>

                                <%# Eval("Description") %>

                            </p>

                            <p class="price">

                                ₹ <%# Eval("Price") %>

                            </p>

                            <p class="text-success">

                                In Stock :
                                <%# Eval("Stock") %>

                            </p>

                            <div class="d-grid">

                                <asp:Button
                                    ID="btnCart"
                                    runat="server"
                                    Text="Add To Cart"
                                    CssClass="btn btn-primary btn-cart"
                                    CommandArgument='<%# Eval("ProductId") %>'
                                    OnClick="btnCart_Click" />

                            </div>

                        </div>

                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

</div>

</asp:Content>