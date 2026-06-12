using System;

namespace ShopEaseNew
{
    public partial class Home :
        System.Web.UI.Page
    {
        protected void Page_Load(
            object sender,
            EventArgs e)
        {
            // CHECK LOGIN SESSION

            if (Session["UserEmail"] == null)
            {
                Response.Redirect(
                    "Login.aspx");
            }
        }

        // EXPLORE PRODUCTS

        protected void btnExplore_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect(
                "Products.aspx");
        }

        // TODAY DEALS

        protected void btnDeals_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect(
                "Products.aspx?type=deals");
        }

        // SEARCH PRODUCTS

        protected void btnSearch_Click(
            object sender,
            EventArgs e)
        {
            string keyword =
                txtSearch.Text.Trim();

            Response.Redirect(
                "Products.aspx?search=" +
                keyword);
        }

        // PRODUCT 1

        protected void Button1_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect(
                "Products.aspx");
        }

        // PRODUCT 2

        protected void Button2_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect(
                "Products.aspx");
        }

        // PRODUCT 3

        protected void Button3_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect(
                "Products.aspx");
        }
    }
}