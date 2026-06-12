<%@ Page Title="Admin Dashboard"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="AdminDashboard.aspx.cs"
Inherits="ShopEaseNew.AdminDashboard" %>

<asp:Content
    ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="container-fluid mt-4">

        <!-- HEADER -->

        <div class="dashboard-header shadow-sm">

            <div>

                <h1 class="fw-bold text-white">
                    Admin Dashboard
                </h1>

                <p class="text-light mb-0">

                    Welcome back,

                    <asp:Label
                        ID="lblAdmin"
                        runat="server">
                    </asp:Label>

                </p>

            </div>

        </div>

        <!-- STATISTICS -->

        <div class="row mt-4 g-4">

            <!-- PRODUCTS -->

            <div class="col-md-3">

                <div class="card stats-card products-card">

                    <div class="card-body text-center">

                        <h1>📦</h1>

                        <h2>

                            <asp:Label
                                ID="lblProducts"
                                runat="server"
                                Text="0">
                            </asp:Label>

                        </h2>

                        <p class="mb-0">
                            Total Products
                        </p>

                    </div>

                </div>

            </div>

            <!-- USERS -->

            <div class="col-md-3">

                <div class="card stats-card users-card">

                    <div class="card-body text-center">

                        <h1>👥</h1>

                        <h2>

                            <asp:Label
                                ID="lblUsers"
                                runat="server"
                                Text="0">
                            </asp:Label>

                        </h2>

                        <p class="mb-0">
                            Registered Users
                        </p>

                    </div>

                </div>

            </div>

            <!-- ORDERS -->

            <div class="col-md-3">

                <div class="card stats-card orders-card">

                    <div class="card-body text-center">

                        <h1>🛒</h1>

                        <h2>

                            <asp:Label
                                ID="lblOrders"
                                runat="server"
                                Text="0">
                            </asp:Label>

                        </h2>

                        <p class="mb-0">
                            Total Orders
                        </p>

                    </div>

                </div>

            </div>

            <!-- SALES -->

            <div class="col-md-3">

                <div class="card stats-card sales-card">

                    <div class="card-body text-center">

                        <h1>💰</h1>

                        <h2>

                            ₹
                            <asp:Label
                                ID="lblSales"
                                runat="server"
                                Text="0">
                            </asp:Label>

                        </h2>

                        <p class="mb-0">
                            Total Sales
                        </p>

                    </div>

                </div>

            </div>

            <!-- PAYMENTS -->

            <div class="col-md-3">

                <div class="card stats-card payment-card">

                    <div class="card-body text-center">

                        <h1>💳</h1>

                        <h2>

                            <asp:Label
                                ID="lblPayments"
                                runat="server"
                                Text="0">
                            </asp:Label>

                        </h2>

                        <p class="mb-0">
                            Total Payments
                        </p>

                    </div>

                </div>

            </div>

        </div>

        <!-- QUICK ACTIONS -->

        <div class="card shadow-sm border-0 mt-5 rounded-4">

            <div class="card-body p-4">

                <h3 class="fw-bold mb-4">
                    Quick Actions
                </h3>

                <div class="row g-4">

                    <div class="col-md-3">

                        <a href="Products.aspx"
                            class="btn btn-primary w-100 p-3 dashboard-btn">

                            Manage Products

                        </a>

                    </div>

                    <div class="col-md-3">

                        <a href="Orders.aspx"
                            class="btn btn-success w-100 p-3 dashboard-btn">

                            View Orders

                        </a>

                    </div>

                    <div class="col-md-3">

                        <a href="AdminPayments.aspx"
                            class="btn btn-dark w-100 p-3 dashboard-btn">

                            Payment Reports

                        </a>

                    </div>

                    <div class="col-md-3">

                        <a href="Register.aspx"
                            class="btn btn-warning w-100 p-3 dashboard-btn">

                            Add User

                        </a>

                    </div>

                    <div class="col-md-3">

                        <asp:Button
                            ID="btnLogout"
                            runat="server"
                            Text="Logout"
                            CssClass="btn btn-danger w-100 p-3 dashboard-btn"
                            OnClick="btnLogout_Click" />

                    </div>

                </div>

            </div>

        </div>

        <!-- RECENT PAYMENTS -->

        <div class="card shadow-sm border-0 mt-5 rounded-4">

            <div class="card-body p-4">

                <h3 class="fw-bold mb-4">
                    Recent Payments
                </h3>

                <asp:GridView
                    ID="GridViewPayments"
                    runat="server"
                    CssClass="table table-hover table-bordered"
                    AutoGenerateColumns="False">

                    <Columns>

                        <asp:BoundField
                            DataField="PaymentID"
                            HeaderText="Payment ID" />

                        <asp:BoundField
                            DataField="FullName"
                            HeaderText="Customer" />

                        <asp:BoundField
                            DataField="Amount"
                            HeaderText="Amount" />

                        <asp:BoundField
                            DataField="PaymentMethod"
                            HeaderText="Method" />

                        <asp:BoundField
                            DataField="PaymentStatus"
                            HeaderText="Status" />

                        <asp:BoundField
                            DataField="PaymentDate"
                            HeaderText="Date" />

                    </Columns>

                </asp:GridView>

            </div>

        </div>

    </div>

    <style>

        body{
            background:#f4f7fb;
        }

        .dashboard-header{
            background:linear-gradient(135deg,#0d6efd,#6610f2);
            padding:40px;
            border-radius:25px;
        }

        .stats-card{
            border:none;
            border-radius:25px;
            color:white;
            transition:0.4s;
        }

        .stats-card:hover{
            transform:translateY(-10px);
        }

        .products-card{
            background:linear-gradient(135deg,#007bff,#00c6ff);
        }

        .users-card{
            background:linear-gradient(135deg,#ff416c,#ff4b2b);
        }

        .orders-card{
            background:linear-gradient(135deg,#11998e,#38ef7d);
        }

        .sales-card{
            background:linear-gradient(135deg,#f7971e,#ffd200);
        }

        .payment-card{
            background:linear-gradient(135deg,#8e2de2,#4a00e0);
        }

        .dashboard-btn{
            border-radius:15px;
            font-weight:600;
            transition:0.3s;
        }

        .dashboard-btn:hover{
            transform:scale(1.05);
        }

    </style>

</asp:Content>