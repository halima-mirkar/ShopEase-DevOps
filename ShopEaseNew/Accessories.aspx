<%@ Page Title="" Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Accessories.aspx.cs"
Inherits="ShopEaseNew.Accessories" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<!-- HERO SECTION -->

<section class="accessories-hero">

    <div class="hero-overlay"></div>

    <div class="hero-content text-center text-white">

        <h1 class="hero-title">
            Accessories Collection
        </h1>

        <p class="hero-subtitle">
            Stylish Accessories For Your Everyday Lifestyle
        </p>

        <asp:Button
            ID="btnExplore"
            runat="server"
            Text="Explore Accessories"
            CssClass="btn btn-warning btn-lg px-5 py-3 mt-3"
            PostBackUrl="~/Products.aspx" />

    </div>

</section>

<!-- SEARCH BAR -->

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-7">

            <asp:TextBox
                ID="txtSearch"
                runat="server"
                CssClass="form-control custom-search"
                placeholder="Search accessories...">
            </asp:TextBox>

        </div>

    </div>

</div>

<!-- FEATURES -->

<div class="container py-5">

    <div class="row g-4 text-center">

        <div class="col-md-4">

            <div class="feature-card">

                <div class="feature-icon">
                    ⌚
                </div>

                <h4>Premium Accessories</h4>

                <p>
                    High quality products with modern design.
                </p>

            </div>

        </div>

        <div class="col-md-4">

            <div class="feature-card">

                <div class="feature-icon">
                    🎁
                </div>

                <h4>Perfect Gifts</h4>

                <p>
                    Accessories suitable for every occasion.
                </p>

            </div>

        </div>

        <div class="col-md-4">

            <div class="feature-card">

                <div class="feature-icon">
                    🚚
                </div>

                <h4>Fast Delivery</h4>

                <p>
                    Quick doorstep delivery across India.
                </p>

            </div>

        </div>

    </div>

</div>

<!-- PRODUCTS -->

<div class="container pb-5">

    <div class="row g-4">

        <!-- PRODUCT 1 -->

        <div class="col-lg-4 col-md-6">

            <div class="product-card">

                <div class="badge-custom">
                    BESTSELLER
                </div>

                <img
                    src="https://images.unsplash.com/photo-1523170335258-f5ed11844a49"
                    class="product-img" />

                <div class="p-4 text-center">

                    <h3 class="fw-bold">
                        Luxury Watch
                    </h3>

                    <p class="text-muted">
                        Elegant premium watch with stylish finish.
                    </p>

                    <div class="rating">
                        ⭐⭐⭐⭐⭐
                    </div>

                    <h4 class="price">
                        ₹4999
                    </h4>

                    <div class="d-flex justify-content-center gap-2 mt-3">

                        <asp:Button
                            ID="Button1"
                            runat="server"
                            Text="Add To Cart"
                            CssClass="btn btn-primary px-4"
                            OnClick="Button1_Click" />

                        <button
                            class="btn btn-outline-dark px-4"
                            data-bs-toggle="modal"
                            data-bs-target="#modal1">

                            View Details

                        </button>

                    </div>

                </div>

            </div>

        </div>

        <!-- PRODUCT 2 -->

        <div class="col-lg-4 col-md-6">

            <div class="product-card">

                <div class="badge-custom hot">
                    HOT
                </div>

                <img
                    src="https://images.unsplash.com/photo-1542291026-7eec264c27ff"
                    class="product-img" />

                <div class="p-4 text-center">

                    <h3 class="fw-bold">
                        Stylish Backpack
                    </h3>

                    <p class="text-muted">
                        Trendy backpack for travel and office use.
                    </p>

                    <div class="rating">
                        ⭐⭐⭐⭐☆
                    </div>

                    <h4 class="price">
                        ₹2499
                    </h4>

                    <div class="d-flex justify-content-center gap-2 mt-3">

                        <asp:Button
                            ID="Button2"
                            runat="server"
                            Text="Add To Cart"
                            CssClass="btn btn-primary px-4"
                            OnClick="Button2_Click" />

                        <button
                            class="btn btn-outline-dark px-4"
                            data-bs-toggle="modal"
                            data-bs-target="#modal2">

                            View Details

                        </button>

                    </div>

                </div>

            </div>

        </div>

        <!-- PRODUCT 3 -->

        <div class="col-lg-4 col-md-6">

            <div class="product-card">

                <div class="badge-custom new">
                    NEW
                </div>

                <img
                    src="https://images.unsplash.com/photo-1511499767150-a48a237f0083"
                    class="product-img" />

                <div class="p-4 text-center">

                    <h3 class="fw-bold">
                        Sunglasses
                    </h3>

                    <p class="text-muted">
                        Stylish UV protection sunglasses.
                    </p>

                    <div class="rating">
                        ⭐⭐⭐⭐⭐
                    </div>

                    <h4 class="price">
                        ₹1599
                    </h4>

                    <div class="d-flex justify-content-center gap-2 mt-3">

                        <asp:Button
                            ID="Button3"
                            runat="server"
                            Text="Add To Cart"
                            CssClass="btn btn-primary px-4"
                            OnClick="Button3_Click" />

                        <button
                            class="btn btn-outline-dark px-4"
                            data-bs-toggle="modal"
                            data-bs-target="#modal3">

                            View Details

                        </button>

                    </div>

                </div>

            </div>

        </div>

        <!-- PRODUCT 4 -->

        <div class="col-lg-4 col-md-6">

            <div class="product-card">

                <img
                    src="https://images.unsplash.com/photo-1584917865442-de89df76afd3"
                    class="product-img" />

                <div class="p-4 text-center">

                    <h3 class="fw-bold">
                        Leather Wallet
                    </h3>

                    <p class="text-muted">
                        Premium leather wallet with slim design.
                    </p>

                    <div class="rating">
                        ⭐⭐⭐⭐☆
                    </div>

                    <h4 class="price">
                        ₹999
                    </h4>

                    <asp:Button
                        ID="Button4"
                        runat="server"
                        Text="Add To Cart"
                        CssClass="btn btn-primary px-4 mt-2"
                        OnClick="Button4_Click" />

                </div>

            </div>

        </div>

        <!-- PRODUCT 5 -->

        <div class="col-lg-4 col-md-6">

            <div class="product-card">

                <img
                    src="https://images.unsplash.com/photo-1523170335258-f5ed11844a49"
                    class="product-img" />

                <div class="p-4 text-center">

                    <h3 class="fw-bold">
                        Smart Band
                    </h3>

                    <p class="text-muted">
                        Fitness smart band with heart tracking.
                    </p>

                    <div class="rating">
                        ⭐⭐⭐⭐⭐
                    </div>

                    <h4 class="price">
                        ₹2199
                    </h4>

                    <asp:Button
                        ID="Button5"
                        runat="server"
                        Text="Add To Cart"
                        CssClass="btn btn-primary px-4 mt-2"
                        OnClick="Button5_Click" />

                </div>

            </div>

        </div>

        <!-- PRODUCT 6 -->

        <div class="col-lg-4 col-md-6">

            <div class="product-card">

                <img
                    src="https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f"
                    class="product-img" />

                <div class="p-4 text-center">

                    <h3 class="fw-bold">
                        DSLR Camera Bag
                    </h3>

                    <p class="text-muted">
                        Waterproof camera bag with extra storage.
                    </p>

                    <div class="rating">
                        ⭐⭐⭐⭐☆
                    </div>

                    <h4 class="price">
                        ₹3499
                    </h4>

                    <asp:Button
                        ID="Button6"
                        runat="server"
                        Text="Add To Cart"
                        CssClass="btn btn-primary px-4 mt-2"
                        OnClick="Button6_Click" />

                </div>

            </div>

        </div>

    </div>

</div>

<!-- OFFER SECTION -->

<section class="offer-section text-center text-white">

    <h1 class="fw-bold">
        Accessories Mega Sale 🎉
    </h1>

    <p class="lead">
        Up To 60% OFF On Premium Accessories
    </p>

    <asp:Button
        ID="btnOffer"
        runat="server"
        Text="Shop Now"
        CssClass="btn btn-warning btn-lg px-5 py-3"
        PostBackUrl="~/Products.aspx" />

</section>

<!-- MODALS -->

<div class="modal fade" id="modal1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content p-4">
            <h3>Luxury Watch</h3>
            <p>Elegant premium watch with water resistance and stylish design.</p>
        </div>
    </div>
</div>

<div class="modal fade" id="modal2">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content p-4">
            <h3>Stylish Backpack</h3>
            <p>Spacious backpack perfect for travel, office and daily use.</p>
        </div>
    </div>
</div>

<div class="modal fade" id="modal3">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content p-4">
            <h3>Sunglasses</h3>
            <p>Premium sunglasses with UV protection and modern frame.</p>
        </div>
    </div>
</div>

<!-- CSS -->

<style>

body{
    background:#f4f7ff;
    font-family:'Segoe UI';
}

/* HERO */

.accessories-hero{
    height:70vh;
    background:
    linear-gradient(rgba(0,0,0,0.6),
    rgba(0,0,0,0.6)),
    url('https://images.unsplash.com/photo-1523170335258-f5ed11844a49');

    background-size:cover;
    background-position:center;

    border-radius:0 0 40px 40px;

    display:flex;
    align-items:center;
    justify-content:center;

    position:relative;
}

.hero-title{
    font-size:70px;
    font-weight:700;
    animation:float 2s infinite alternate;
}

.hero-subtitle{
    font-size:24px;
}

@keyframes float{
    from{
        transform:translateY(0);
    }

    to{
        transform:translateY(-10px);
    }
}

/* SEARCH */

.custom-search{
    border-radius:40px;
    padding:15px 25px;
    border:none;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

/* FEATURE CARD */

.feature-card{
    background:white;
    border-radius:25px;
    padding:35px 25px;
    transition:0.4s;
    box-shadow:0 8px 25px rgba(0,0,0,0.08);
}

.feature-card:hover{
    transform:translateY(-10px);
}

.feature-icon{
    font-size:50px;
    margin-bottom:15px;
}

/* PRODUCT CARD */

.product-card{
    background:white;
    border-radius:25px;
    overflow:hidden;
    transition:0.4s;
    position:relative;
    box-shadow:0 8px 25px rgba(0,0,0,0.08);
}

.product-card:hover{
    transform:translateY(-12px);
    box-shadow:0 15px 35px rgba(0,0,0,0.15);
}

.product-img{
    width:100%;
    height:280px;
    object-fit:cover;
    transition:0.5s;
}

.product-card:hover .product-img{
    transform:scale(1.08);
}

.price{
    color:#198754;
    font-size:30px;
    font-weight:bold;
}

/* BADGES */

.badge-custom{
    position:absolute;
    top:15px;
    left:15px;
    background:#ff4757;
    color:white;
    padding:8px 18px;
    border-radius:30px;
    font-size:13px;
    font-weight:bold;
    z-index:10;
}

.hot{
    background:#ff9f43;
}

.new{
    background:#1dd1a1;
}

/* OFFER */

.offer-section{
    margin:50px 20px;
    padding:90px 20px;
    border-radius:35px;

    background:
    linear-gradient(135deg,#6f42c1,#0d6efd);
}

/* BUTTON */

.btn{
    border-radius:30px;
    font-weight:600;
}

/* RESPONSIVE */

@media(max-width:768px){

    .hero-title{
        font-size:42px;
    }

    .hero-subtitle{
        font-size:18px;
    }

    .product-img{
        height:230px;
    }
}

</style>

</asp:Content>