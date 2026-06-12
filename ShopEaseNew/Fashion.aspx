<%@ Page Title="" Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Fashion.aspx.cs"
Inherits="ShopEaseNew.Fashion" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<!-- HERO SECTION -->

<section class="fashion-hero">

    <div class="overlay"></div>

    <div class="hero-content text-center text-white">

        <h1 class="hero-title">
            Fashion Store
        </h1>

        <p class="hero-subtitle">
            Discover Trendy Styles & Premium Fashion
        </p>

        <asp:Button
            ID="btnExplore"
            runat="server"
            Text="Explore Fashion"
            CssClass="btn btn-warning btn-lg px-5 py-3 mt-3"
            PostBackUrl="~/Products.aspx" />

    </div>

</section>

<div class="container py-5">

    <div class="row g-4">

        <!-- PRODUCT 1 -->

        <div class="col-lg-4 col-md-6">

            <div class="fashion-card">

                <img
                    src="https://images.unsplash.com/photo-1521572267360-ee0c2909d518"
                    class="fashion-img" />

                <div class="fashion-content text-center">

                    <h3>Casual T-Shirt</h3>

                    <p class="fashion-desc">
                        Comfortable premium cotton t-shirt.
                    </p>

                    <h4 class="price">
                        ₹999
                    </h4>

                    <asp:Button
                        ID="Button1"
                        runat="server"
                        Text="Add To Cart"
                        CssClass="btn btn-dark custom-btn"
                        OnClick="Button1_Click" />

                </div>

            </div>

        </div>

        <!-- PRODUCT 2 -->

        <div class="col-lg-4 col-md-6">

            <div class="fashion-card">

                <img
                    src="https://images.unsplash.com/photo-1496747611176-843222e1e57c"
                    class="fashion-img" />

                <div class="fashion-content text-center">

                    <h3>Women Dress</h3>

                    <p class="fashion-desc">
                        Elegant modern fashion outfit.
                    </p>

                    <h4 class="price">
                        ₹2499
                    </h4>

                    <asp:Button
                        ID="Button2"
                        runat="server"
                        Text="Add To Cart"
                        CssClass="btn btn-dark custom-btn"
                        OnClick="Button2_Click" />

                </div>

            </div>

        </div>

        <!-- PRODUCT 3 -->

        <div class="col-lg-4 col-md-6">

            <div class="fashion-card">

                <img
                    src="https://images.unsplash.com/photo-1542291026-7eec264c27ff"
                    class="fashion-img" />

                <div class="fashion-content text-center">

                    <h3>Sports Shoes</h3>

                    <p class="fashion-desc">
                        Stylish and comfortable running shoes.
                    </p>

                    <h4 class="price">
                        ₹3499
                    </h4>

                    <asp:Button
                        ID="Button3"
                        runat="server"
                        Text="Add To Cart"
                        CssClass="btn btn-dark custom-btn"
                        OnClick="Button3_Click" />

                </div>

            </div>

        </div>

    </div>

</div>

<style>

.fashion-card{
    background:white;
    border-radius:20px;
    overflow:hidden;
    box-shadow:0 5px 20px rgba(0,0,0,0.1);
}

.fashion-img{
    width:100%;
    height:300px;
    object-fit:cover;
}

.fashion-content{
    padding:20px;
}

.price{
    color:#e91e63;
    font-size:30px;
    font-weight:bold;
}

.custom-btn{
    border-radius:30px;
}

</style>

</asp:Content>