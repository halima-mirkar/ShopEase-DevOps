<%@ Page Title="Login"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Login.aspx.cs"
Inherits="ShopEaseNew.Login"
UnobtrusiveValidationMode="None" %>

<asp:Content
    ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <style>

        .login-card{
            border:none;
            border-radius:20px;
            overflow:hidden;
        }

        .login-left{
            background:
            linear-gradient(135deg,#0d6efd,#6610f2);

            color:white;
            padding:50px 30px;
        }

        .login-left h1{
            font-weight:700;
        }

        .login-right{
            padding:50px 40px;
        }

        .login-btn{
            border-radius:30px;
            font-weight:600;
        }

        .form-control{
            border-radius:12px;
        }

        .login-icon{
            font-size:70px;
        }

    </style>

    <div class="container mt-5 mb-5">

        <div class="row justify-content-center">

            <div class="col-lg-10">

                <div class="card shadow-lg login-card">

                    <div class="row g-0">

                        <!-- LEFT SIDE -->

                        <div class="col-md-5 login-left d-flex flex-column justify-content-center">

                            <div class="text-center">

                                <i class="bi bi-bag-heart-fill login-icon">
                                </i>

                                <h1 class="mt-3">
                                    ShopEase
                                </h1>

                                <p class="mt-3">

                                    Welcome back to your
                                    favourite shopping destination.

                                </p>

                            </div>

                        </div>

                        <!-- RIGHT SIDE -->

                        <div class="col-md-7">

                            <div class="login-right">

                                <h2 class="fw-bold mb-2">
                                    User Login
                                </h2>

                                <p class="text-muted mb-4">
                                    Login to continue shopping
                                </p>

                                <!-- AJAX UPDATE PANEL -->

                                <asp:UpdatePanel
                                    ID="UpdatePanel1"
                                    runat="server">

                                    <ContentTemplate>

                                        <!-- VALIDATION SUMMARY -->

                                        <asp:ValidationSummary
                                            ID="ValidationSummary1"
                                            runat="server"
                                            CssClass="alert alert-danger"
                                            HeaderText="Please Fix These Errors :" />

                                        <!-- EMAIL -->

                                        <div class="mb-3">

                                            <label class="form-label fw-semibold">

                                                Email Address

                                            </label>

                                            <asp:TextBox
                                                ID="txtEmail"
                                                runat="server"
                                                CssClass="form-control form-control-lg"
                                                placeholder="Enter Email"
                                                AutoFocus="true">
                                            </asp:TextBox>

                                            <asp:RequiredFieldValidator
                                                ID="rfvEmail"
                                                runat="server"
                                                ControlToValidate="txtEmail"
                                                ErrorMessage="Email is Required"
                                                ForeColor="Red"
                                                Display="Dynamic">
                                            </asp:RequiredFieldValidator>

                                            <br />

                                            <asp:RegularExpressionValidator
                                                ID="revEmail"
                                                runat="server"
                                                ControlToValidate="txtEmail"
                                                ValidationExpression="\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+"
                                                ErrorMessage="Invalid Email Format"
                                                ForeColor="Red"
                                                Display="Dynamic">
                                            </asp:RegularExpressionValidator>

                                        </div>

                                        <!-- PASSWORD -->

                                        <div class="mb-3">

                                            <label class="form-label fw-semibold">

                                                Password

                                            </label>

                                            <asp:TextBox
                                                ID="txtPassword"
                                                runat="server"
                                                TextMode="Password"
                                                CssClass="form-control form-control-lg"
                                                placeholder="Enter Password">
                                            </asp:TextBox>

                                            <asp:RequiredFieldValidator
                                                ID="rfvPassword"
                                                runat="server"
                                                ControlToValidate="txtPassword"
                                                ErrorMessage="Password is Required"
                                                ForeColor="Red"
                                                Display="Dynamic">
                                            </asp:RequiredFieldValidator>

                                        </div>

                                        <!-- SHOW PASSWORD -->

                                        <div class="form-check mb-3">

                                            <input type="checkbox"
                                                class="form-check-input"
                                                onclick="showPassword()" />

                                            <label class="form-check-label">

                                                Show Password

                                            </label>

                                        </div>

                                        <!-- REMEMBER ME -->

                                        <div class="form-check mb-4">

                                            <asp:CheckBox
                                                ID="chkRemember"
                                                runat="server"
                                                CssClass="form-check-input" />

                                            <label class="form-check-label">

                                                Remember Me

                                            </label>

                                        </div>

                                        <!-- LOGIN BUTTON -->

                                        <div class="d-grid">

                                            <asp:Button
                                                ID="btnLogin"
                                                runat="server"
                                                Text="Login"
                                                CssClass="btn btn-success btn-lg login-btn"
                                                OnClick="btnLogin_Click" />

                                        </div>

                                        <!-- MESSAGE -->

                                        <div class="text-center mt-4">

                                            <asp:Label
                                                ID="lblMessage"
                                                runat="server"
                                                Font-Bold="true">
                                            </asp:Label>

                                        </div>

                                    </ContentTemplate>

                                </asp:UpdatePanel>

                                <!-- REGISTER -->

                                <div class="text-center mt-4">

                                    <span>
                                        New User?
                                    </span>

                                    <a href="Register.aspx"
                                        class="fw-bold text-decoration-none">

                                        Create Account

                                    </a>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <!-- SHOW PASSWORD SCRIPT -->

    <script>

        function showPassword() {

            var txt =
                document.getElementById(
                '<%= txtPassword.ClientID %>');

            if (txt.type === "password") {
                txt.type = "text";
            }

            else {
                txt.type = "password";
            }
        }

    </script>

</asp:Content>