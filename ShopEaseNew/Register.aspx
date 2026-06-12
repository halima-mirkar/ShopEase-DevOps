<%@ Page Title="Register"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Register.aspx.cs"
Inherits="ShopEaseNew.Register"
UnobtrusiveValidationMode="None" %>

<asp:Content
    ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <style>

        .register-card{
            border:none;
            border-radius:20px;
            overflow:hidden;
        }

        .register-left{
            background:
            linear-gradient(135deg,#0d6efd,#6610f2);

            color:white;
            padding:50px 30px;
        }

        .register-right{
            padding:50px 40px;
        }

        .register-btn{
            border-radius:30px;
            font-weight:600;
        }

        .form-control{
            border-radius:12px;
        }

    </style>

    <div class="container mt-5 mb-5">

        <div class="row justify-content-center">

            <div class="col-lg-10">

                <div class="card shadow-lg register-card">

                    <div class="row g-0">

                        <!-- LEFT SIDE -->

                        <div class="col-md-5 register-left d-flex flex-column justify-content-center">

                            <div class="text-center">

                                <i class="bi bi-person-plus-fill"
                                    style="font-size:70px;">
                                </i>

                                <h1 class="mt-3">
                                    Join ShopEase
                                </h1>

                                <p class="mt-3">

                                    Create your account
                                    and start shopping today.

                                </p>

                            </div>

                        </div>

                        <!-- RIGHT SIDE -->

                        <div class="col-md-7">

                            <div class="register-right">

                                <h2 class="fw-bold">
                                    User Registration
                                </h2>

                                <p class="text-muted mb-4">
                                    Fill all details carefully
                                </p>

                                <asp:ValidationSummary
                                    ID="ValidationSummary1"
                                    runat="server"
                                    CssClass="alert alert-danger" />

                                <!-- FULL NAME -->

                                <div class="mb-3">

                                    <label class="form-label">
                                        Full Name
                                    </label>

                                    <asp:TextBox
                                        ID="txtName"
                                        runat="server"
                                        CssClass="form-control"
                                        placeholder="Enter Full Name">
                                    </asp:TextBox>

                                    <asp:RequiredFieldValidator
                                        ID="rfvName"
                                        runat="server"
                                        ControlToValidate="txtName"
                                        ErrorMessage="Full Name is Required"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>

                                </div>

                                <!-- EMAIL -->

                                <div class="mb-3">

                                    <label class="form-label">
                                        Email Address
                                    </label>

                                    <asp:TextBox
                                        ID="txtEmail"
                                        runat="server"
                                        CssClass="form-control"
                                        placeholder="Enter Email">
                                    </asp:TextBox>

                                    <asp:RequiredFieldValidator
                                        ID="rfvEmail"
                                        runat="server"
                                        ControlToValidate="txtEmail"
                                        ErrorMessage="Email is Required"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>

                                    <br />

                                    <asp:RegularExpressionValidator
                                        ID="revEmail"
                                        runat="server"
                                        ControlToValidate="txtEmail"
                                        ValidationExpression="\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+"
                                        ErrorMessage="Invalid Email Format"
                                        ForeColor="Red">
                                    </asp:RegularExpressionValidator>

                                </div>

                                <!-- PASSWORD -->

                                <div class="mb-3">

                                    <label class="form-label">
                                        Password
                                    </label>

                                    <asp:TextBox
                                        ID="txtPassword"
                                        runat="server"
                                        TextMode="Password"
                                        CssClass="form-control"
                                        placeholder="Enter Password">
                                    </asp:TextBox>

                                    <asp:RequiredFieldValidator
                                        ID="rfvPassword"
                                        runat="server"
                                        ControlToValidate="txtPassword"
                                        ErrorMessage="Password is Required"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>

                                </div>

                                <!-- CONFIRM PASSWORD -->

                                <div class="mb-3">

                                    <label class="form-label">
                                        Confirm Password
                                    </label>

                                    <asp:TextBox
                                        ID="txtConfirmPassword"
                                        runat="server"
                                        TextMode="Password"
                                        CssClass="form-control"
                                        placeholder="Confirm Password">
                                    </asp:TextBox>

                                    <asp:CompareValidator
                                        ID="cvPassword"
                                        runat="server"
                                        ControlToValidate="txtConfirmPassword"
                                        ControlToCompare="txtPassword"
                                        ErrorMessage="Passwords do not match"
                                        ForeColor="Red">
                                    </asp:CompareValidator>

                                </div>

                                <!-- BUTTON -->

                                <div class="d-grid">

                                    <asp:Button
                                        ID="btnRegister"
                                        runat="server"
                                        Text="Create Account"
                                        CssClass="btn btn-primary btn-lg register-btn"
                                        OnClick="btnRegister_Click" />

                                </div>

                                <!-- MESSAGE -->

                                <div class="text-center mt-4">

                                    <asp:Label
                                        ID="lblMessage"
                                        runat="server"
                                        Font-Bold="true">
                                    </asp:Label>

                                </div>

                                <!-- LOGIN -->

                                <div class="text-center mt-4">

                                    Already have an account?

                                    <a href="Login.aspx"
                                        class="fw-bold text-decoration-none">

                                        Login Here

                                    </a>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</asp:Content>