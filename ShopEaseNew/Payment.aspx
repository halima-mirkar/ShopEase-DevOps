<%@ Page Title="Payment"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Payment.aspx.cs"
Inherits="ShopEaseNew.Payment" %>

<asp:Content ID="Content1"
ContentPlaceHolderID="MainContent"
runat="server">

<div class="container mt-5">

    <div class="card p-5 shadow">

        <h2 class="mb-4 text-center">
            Payment Gateway
        </h2>

        <div class="mb-3">

            <label>
                Card Holder Name
            </label>

            <asp:TextBox
                ID="txtName"
                runat="server"
                CssClass="form-control">
            </asp:TextBox>

        </div>

        <div class="mb-3">

            <label>
                Card Number
            </label>

            <asp:TextBox
                ID="txtCard"
                runat="server"
                CssClass="form-control">
            </asp:TextBox>

        </div>

        <div class="mb-3">

            <label>
                CVV
            </label>

            <asp:TextBox
                ID="txtCVV"
                runat="server"
                TextMode="Password"
                CssClass="form-control">
            </asp:TextBox>

        </div>

        <div class="mb-3">

            <label>
                Expiry Date
            </label>

            <asp:TextBox
                ID="txtExpiry"
                runat="server"
                CssClass="form-control">
            </asp:TextBox>

        </div>

        <div class="mb-4">

            <label>
                Payment Method
            </label>

            <asp:DropDownList
                ID="ddlMethod"
                runat="server"
                CssClass="form-select">

                <asp:ListItem>
                    Credit Card
                </asp:ListItem>

                <asp:ListItem>
                    Debit Card
                </asp:ListItem>

                <asp:ListItem>
                    UPI
                </asp:ListItem>

            </asp:DropDownList>

        </div>

        <asp:Button
            ID="btnPay"
            runat="server"
            Text="Pay Now"
            CssClass="btn btn-success btn-lg"
            OnClick="btnPay_Click" />

        <br />

        <asp:Label
            ID="lblMessage"
            runat="server"
            Font-Bold="true">
        </asp:Label>

    </div>

</div>

</asp:Content>