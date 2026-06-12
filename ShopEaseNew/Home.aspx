<%@ Page Title="Home"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Home.aspx.cs"
Inherits="ShopEaseNew.Home" %>

<asp:Content
    ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <!-- HERO SECTION -->

    <section class="hero-section">

        <div class="hero-overlay"></div>

        <div class="container hero-content text-center text-white">

            <h1 class="hero-title">
                ShopEase with DevOps
            </h1>

            <p class="hero-subtitle">
                India's Premium Online Shopping Destination
            </p>

            <div class="mt-4">

                <asp:Button
                    ID="btnExplore"
                    runat="server"
                    Text="Explore Products"
                    CssClass="btn btn-warning btn-lg px-5 py-3 me-3 custom-btn"
                    OnClick="btnExplore_Click" />

                <asp:Button
                    ID="btnDeals"
                    runat="server"
                    Text="Today's Deals"
                    CssClass="btn btn-outline-light btn-lg px-5 py-3 custom-btn"
                    OnClick="btnDeals_Click" />

            </div>

        </div>

    </section>

    <!-- SEARCH -->

    <div class="container search-container">

        <div class="row justify-content-center">

            <div class="col-md-8">

                <div class="search-box shadow">

                    <asp:TextBox
                        ID="txtSearch"
                        runat="server"
                        CssClass="form-control border-0"
                        placeholder="Search products, brands and categories...">
                    </asp:TextBox>

                    <asp:Button
                        ID="btnSearch"
                        runat="server"
                        Text="Search"
                        CssClass="btn btn-primary px-4"
                        OnClick="btnSearch_Click" />

                </div>

            </div>

        </div>

    </div>

    <!-- STATS -->

    <div class="container py-5">

        <div class="row text-center g-4">

            <div class="col-md-3">

                <div class="stats-card">

                    <h1>10K+</h1>

                    <p>Happy Customers</p>

                </div>

            </div>

            <div class="col-md-3">

                <div class="stats-card">

                    <h1>500+</h1>

                    <p>Products</p>

                </div>

            </div>

            <div class="col-md-3">

                <div class="stats-card">

                    <h1>24/7</h1>

                    <p>Support</p>

                </div>

            </div>

            <div class="col-md-3">

                <div class="stats-card">

                    <h1>4.9★</h1>

                    <p>Ratings</p>

                </div>

            </div>

        </div>

    </div>

    <!-- FEATURES -->

    <div class="container mb-5">

        <h2 class="section-title">
            Why Shop With Us
        </h2>

        <div class="row g-4 text-center">

            <div class="col-md-4">

                <div class="feature-card">

                    <div class="feature-icon">
                        🚚
                    </div>

                    <h4>Fast Delivery</h4>

                    <p>
                        Lightning-fast shipping all over India.
                    </p>

                </div>

            </div>

            <div class="col-md-4">

                <div class="feature-card">

                    <div class="feature-icon">
                        🔒
                    </div>

                    <h4>Secure Payments</h4>

                    <p>
                        100% secure transactions and payment safety.
                    </p>

                </div>

            </div>

            <div class="col-md-4">

                <div class="feature-card">

                    <div class="feature-icon">
                        ⭐
                    </div>

                    <h4>Premium Quality</h4>

                    <p>
                        High-quality products at affordable prices.
                    </p>

                </div>

            </div>

        </div>

    </div>

    <!-- CATEGORIES -->

    <div class="container mb-5">

        <h2 class="section-title">
            Top Categories
        </h2>

        <div class="row g-4">

            <div class="col-md-4">

                <div class="category-card electronics"
                    onclick="window.location='Electronics.aspx'">

                    <h1>🎧</h1>

                    <h3>Electronics</h3>

                </div>

            </div>

            <div class="col-md-4">

                <div class="category-card fashion"
                    onclick="window.location='Fashion.aspx'">

                    <h1>👕</h1>

                    <h3>Fashion</h3>

                </div>

            </div>

            <div class="col-md-4">

                <div class="category-card accessories"
                    onclick="window.location='Accessories.aspx'">

                    <h1>⌚</h1>

                    <h3>Accessories</h3>

                </div>

            </div>

        </div>

    </div>

    <!-- TRENDING PRODUCTS -->

    <div class="container mb-5">

        <h2 class="section-title">
            Trending Products
        </h2>

        <div class="row g-4">

            <!-- PRODUCT 1 -->

            <div class="col-lg-4">

                <div class="product-card">

                    <div class="discount-badge">
                        -20%
                    </div>

                    <div class="wishlist">
                        ❤
                    </div>

                    <img
                        src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e"
                        class="product-img" />

                    <div class="p-4 text-center">

                        <h4>Wireless Headphones</h4>

                        <div class="mb-2">
                            ⭐⭐⭐⭐⭐
                        </div>

                        <p class="price">
                            ₹1999
                        </p>

                        <div class="d-flex justify-content-center gap-2">

                            <asp:Button
                                ID="Button1"
                                runat="server"
                                Text="Add To Cart"
                                CssClass="btn btn-primary px-4"
                                OnClick="Button1_Click" />

                            <button
                                class="btn btn-outline-dark">
                                View
                            </button>

                        </div>

                    </div>

                </div>

            </div>

            <!-- PRODUCT 2 -->

            <div class="col-lg-4">

                <div class="product-card">

                    <div class="discount-badge">
                        HOT
                    </div>

                    <div class="wishlist">
                        ❤
                    </div>

                    <img
                        src="https://images.unsplash.com/photo-1546868871-7041f2a55e12"
                        class="product-img" />

                    <div class="p-4 text-center">

                        <h4>Smart Watch</h4>

                        <div class="mb-2">
                            ⭐⭐⭐⭐☆
                        </div>

                        <p class="price">
                            ₹2999
                        </p>

                        <div class="d-flex justify-content-center gap-2">

                            <asp:Button
                                ID="Button2"
                                runat="server"
                                Text="Add To Cart"
                                CssClass="btn btn-primary px-4"
                                OnClick="Button2_Click" />

                            <button
                                class="btn btn-outline-dark">
                                View
                            </button>

                        </div>

                    </div>

                </div>

            </div>

            <!-- PRODUCT 3 -->

            <div class="col-lg-4">

                <div class="product-card">

                    <div class="discount-badge">
                        NEW
                    </div>

                    <div class="wishlist">
                        ❤
                    </div>

                    <img
                        src="https://images.unsplash.com/photo-1542291026-7eec264c27ff"
                        class="product-img" />

                    <div class="p-4 text-center">

                        <h4>Sports Shoes</h4>

                        <div class="mb-2">
                            ⭐⭐⭐⭐⭐
                        </div>

                        <p class="price">
                            ₹2499
                        </p>

                        <div class="d-flex justify-content-center gap-2">

                            <asp:Button
                                ID="Button3"
                                runat="server"
                                Text="Add To Cart"
                                CssClass="btn btn-primary px-4"
                                OnClick="Button3_Click" />

                            <button
                                class="btn btn-outline-dark">
                                View
                            </button>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <!-- CSS -->

    <style>

        body{
            background:#f5f7fb;
            font-family:'Segoe UI';
        }

        .hero-section{
            height:95vh;
            background:
            linear-gradient(rgba(0,0,0,0.65),
            rgba(0,0,0,0.65)),
            url('https://images.unsplash.com/photo-1521334884684-d80222895322');

            background-size:cover;
            background-position:center;

            border-radius:30px;

            display:flex;
            align-items:center;
            justify-content:center;
        }

        .hero-title{
            font-size:90px;
            font-weight:800;
        }

        .hero-subtitle{
            font-size:28px;
        }

        .search-container{
            margin-top:-40px;
            z-index:10;
            position:relative;
        }

        .search-box{
            background:white;
            border-radius:60px;
            padding:10px;
            display:flex;
        }

        .stats-card{
            background:white;
            padding:30px;
            border-radius:25px;
            box-shadow:0 5px 20px rgba(0,0,0,0.08);
        }

        .feature-card{
            background:white;
            padding:40px;
            border-radius:25px;
            box-shadow:0 5px 20px rgba(0,0,0,0.08);
        }

        .feature-icon{
            font-size:55px;
        }

        .section-title{
            text-align:center;
            font-size:42px;
            font-weight:700;
            margin-bottom:40px;
        }

        .category-card{
            padding:60px 20px;
            border-radius:25px;
            color:white;
            text-align:center;
            cursor:pointer;
        }

        .category-card h1{
            font-size:70px;
        }

        .electronics{
            background:linear-gradient(135deg,#007bff,#00c6ff);
        }

        .fashion{
            background:linear-gradient(135deg,#ff416c,#ff4b2b);
        }

        .accessories{
            background:linear-gradient(135deg,#11998e,#38ef7d);
        }

        .product-card{
            background:white;
            border-radius:25px;
            overflow:hidden;
            position:relative;
            box-shadow:0 5px 20px rgba(0,0,0,0.08);
        }

        .product-img{
            width:100%;
            height:300px;
            object-fit:cover;
        }

        .discount-badge{
            position:absolute;
            top:15px;
            left:15px;
            background:red;
            color:white;
            padding:8px 15px;
            border-radius:20px;
        }

        .wishlist{
            position:absolute;
            top:15px;
            right:15px;
            width:45px;
            height:45px;
            background:white;
            border-radius:50%;
            display:flex;
            align-items:center;
            justify-content:center;
        }

        .price{
            color:#198754;
            font-size:28px;
            font-weight:bold;
        }

        .custom-btn{
            border-radius:40px;
            font-weight:600;
        }

        .btn{
            border-radius:30px;
        }

    </style>

</asp:Content>