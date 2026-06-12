<%@ Page Title=""
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Electronics.aspx.cs"
Inherits="ShopEaseNew.Electronics" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<!-- TOAST -->

<div id="toastBox" class="toast-box">
    Product Added To Cart Successfully ✔
</div>

<!-- HERO SECTION -->

<section class="hero-section">

    <div class="hero-content text-center text-white">

        <h1 class="hero-title">
            Electronics Hub
        </h1>

        <p class="hero-subtitle">
            Smart Gadgets • Home Appliances • Trending Electronics
        </p>

        <div class="hero-buttons">

            <asp:Button
                ID="btnExplore"
                runat="server"
                Text="Explore Products"
                CssClass="btn btn-warning btn-lg hero-btn me-3"
                PostBackUrl="~/Products.aspx" />

            <asp:Button
                ID="btnDeals"
                runat="server"
                Text="Today's Deals"
                CssClass="btn btn-outline-light btn-lg hero-btn" />

        </div>

    </div>

</section>

<!-- SEARCH -->

<div class="container mb-5 mt-5">

    <div class="search-container">

        <div class="row g-3">

            <div class="col-lg-5">

                <asp:TextBox
                    ID="txtSearch"
                    runat="server"
                    CssClass="form-control custom-input"
                    placeholder="Search Products">
                </asp:TextBox>

            </div>

            <div class="col-lg-3">

                <asp:DropDownList
                    ID="ddlCategory"
                    runat="server"
                    CssClass="form-select custom-input">

                    <asp:ListItem>
                        All Categories
                    </asp:ListItem>

                    <asp:ListItem>
                        Mobiles
                    </asp:ListItem>

                    <asp:ListItem>
                        Audio
                    </asp:ListItem>

                    <asp:ListItem>
                        Beauty Appliances
                    </asp:ListItem>

                    <asp:ListItem>
                        Cameras
                    </asp:ListItem>

                </asp:DropDownList>

            </div>

            <div class="col-lg-2">

                <asp:DropDownList
                    ID="ddlPrice"
                    runat="server"
                    CssClass="form-select custom-input">

                    <asp:ListItem>
                        Price Range
                    </asp:ListItem>

                    <asp:ListItem>
                        Below ₹2000
                    </asp:ListItem>

                    <asp:ListItem>
                        ₹2000 - ₹10000
                    </asp:ListItem>

                    <asp:ListItem>
                        Above ₹10000
                    </asp:ListItem>

                </asp:DropDownList>

            </div>

            <div class="col-lg-2">

                <asp:Button
                    ID="btnSearch"
                    runat="server"
                    Text="Search"
                    CssClass="btn btn-primary w-100 search-btn"
                    OnClick="btnSearch_Click" />

            </div>

        </div>

    </div>

</div>

<!-- PRODUCTS -->

<div class="container pb-5">

    <h2 class="section-title">
        Trending Electronic Appliances
    </h2>

    <div class="row g-4">

        <!-- PRODUCT 1 -->

        <div
            id="dryerCard"
            runat="server"
            class="col-lg-4 col-md-6">

            <div class="product-card">

                <div class="product-badge">
                    SALE
                </div>

                <img
                    src="https://images.unsplash.com/photo-1524678606370-a47ad25cb82a"
                    class="product-img" />

                <div class="product-content">

                    <h3>Hair Dryer</h3>

                    <p class="product-desc">
                        Professional salon-grade hair dryer
                    </p>

                    <h4 class="price">
                        ₹2499
                    </h4>

                    <asp:Button
                        ID="Button1"
                        runat="server"
                        Text="Add To Cart"
                        CssClass="btn btn-primary custom-btn w-100"
                        OnClick="Button1_Click"
                        OnClientClick="showToast()" />

                </div>

            </div>

        </div>

        <!-- PRODUCT 2 -->

        <div
            id="straightenerCard"
            runat="server"
            class="col-lg-4 col-md-6">

            <div class="product-card">

                <div class="product-badge hot">
                    HOT
                </div>

                <img
                    src="https://images.unsplash.com/photo-1596462502278-27bfdc403348"
                    class="product-img" />

                <div class="product-content">

                    <h3>Hair Straightener</h3>

                    <p class="product-desc">
                        Ceramic coated straightener
                    </p>

                    <h4 class="price">
                        ₹1899
                    </h4>

                    <asp:Button
                        ID="Button2"
                        runat="server"
                        Text="Add To Cart"
                        CssClass="btn btn-primary custom-btn w-100"
                        OnClick="Button2_Click"
                        OnClientClick="showToast()" />

                </div>

            </div>

        </div>

        <!-- PRODUCT 3 -->

        <div
            id="mobileCard"
            runat="server"
            class="col-lg-4 col-md-6">

            <div class="product-card">

                <div class="product-badge new">
                    NEW
                </div>

                <img
                    src="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9"
                    class="product-img" />

                <div class="product-content">

                    <h3>Smartphone</h3>

                    <p class="product-desc">
                        Latest flagship mobile
                    </p>

                    <h4 class="price">
                        ₹69999
                    </h4>

                    <asp:Button
                        ID="Button3"
                        runat="server"
                        Text="Add To Cart"
                        CssClass="btn btn-primary custom-btn w-100"
                        OnClick="Button3_Click"
                        OnClientClick="showToast()" />

                </div>

            </div>

        </div>

        <!-- PRODUCT 4 -->

        <div
            id="cameraCard"
            runat="server"
            class="col-lg-4 col-md-6">

            <div class="product-card">

                <img
                    src="https://images.unsplash.com/photo-1516035069371-29a1b244cc32"
                    class="product-img" />

                <div class="product-content">

                    <h3>DSLR Camera</h3>

                    <p class="product-desc">
                        Professional DSLR camera
                    </p>

                    <h4 class="price">
                        ₹45999
                    </h4>

                    <asp:Button
                        ID="Button4"
                        runat="server"
                        Text="Add To Cart"
                        CssClass="btn btn-primary custom-btn w-100"
                        OnClick="Button4_Click"
                        OnClientClick="showToast()" />

                </div>

            </div>

        </div>

        <!-- PRODUCT 5 -->

        <div
            id="speakerCard"
            runat="server"
            class="col-lg-4 col-md-6">

            <div class="product-card">

                <img
                    src="https://images.unsplash.com/photo-1545454675-3531b543be5d"
                    class="product-img" />

                <div class="product-content">

                    <h3>Bluetooth Speaker</h3>

                    <p class="product-desc">
                        Portable wireless speaker
                    </p>

                    <h4 class="price">
                        ₹3999
                    </h4>

                    <asp:Button
                        ID="Button5"
                        runat="server"
                        Text="Add To Cart"
                        CssClass="btn btn-primary custom-btn w-100"
                        OnClick="Button5_Click"
                        OnClientClick="showToast()" />

                </div>

            </div>

        </div>

    </div>

</div>

<script>

    function showToast() {

        let toast =
            document.getElementById("toastBox");

        toast.classList.add("toast-show");

        setTimeout(() => {

            toast.classList.remove("toast-show");

        }, 3000);
    }

</script>

<style>

body{
    background:#eef3ff;
    font-family:'Segoe UI';
}

.hero-section{
    height:70vh;

    background:
    linear-gradient(rgba(0,0,0,0.6),
    rgba(0,0,0,0.6)),
    url('https://images.unsplash.com/photo-1519389950473-47ba0277781c');

    background-size:cover;
    background-position:center;

    display:flex;
    justify-content:center;
    align-items:center;

    border-radius:0 0 40px 40px;
}

.hero-title{
    font-size:70px;
    font-weight:bold;
}

.hero-subtitle{
    font-size:24px;
}

.hero-btn{
    border-radius:40px;
}

.search-container{
    background:white;
    padding:30px;
    border-radius:25px;
    box-shadow:0 10px 30px rgba(0,0,0,0.08);
}

.custom-input{
    border-radius:35px;
    padding:15px;
}

.search-btn{
    border-radius:35px;
}

.section-title{
    text-align:center;
    font-size:40px;
    font-weight:bold;
    margin-bottom:40px;
}

.product-card{
    background:white;
    border-radius:25px;
    overflow:hidden;
    box-shadow:0 10px 30px rgba(0,0,0,0.08);
    transition:0.4s;
}

.product-card:hover{
    transform:translateY(-10px);
}

.product-img{
    width:100%;
    height:250px;
    object-fit:cover;
}

.product-content{
    padding:25px;
}

.price{
    color:#198754;
    font-size:28px;
    font-weight:bold;
}

.custom-btn{
    border-radius:30px;
}

.product-badge{
    position:absolute;
    top:15px;
    left:15px;
    background:red;
    color:white;
    padding:8px 15px;
    border-radius:20px;
}

.hot{
    background:#ff9f43;
}

.new{
    background:#1dd1a1;
}

.toast-box{
    position:fixed;
    top:30px;
    right:30px;
    background:#198754;
    color:white;
    padding:15px 25px;
    border-radius:10px;
    opacity:0;
    visibility:hidden;
    transition:0.4s;
    z-index:9999;
}

.toast-show{
    opacity:1;
    visibility:visible;
}

</style>

</asp:Content>