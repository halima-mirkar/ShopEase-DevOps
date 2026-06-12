using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ShopEaseNew
{
    public partial class Products :
        System.Web.UI.Page
    {
        string cs =
            ConfigurationManager
            .ConnectionStrings["ShopEaseDB"]
            .ConnectionString;

        protected void Page_Load(
            object sender,
            EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        // LOAD PRODUCTS

        private void LoadProducts(
            string keyword = "")
        {
            try
            {
                SqlConnection con =
                    new SqlConnection(cs);

                string query =
                    @"SELECT
                        p.ProductId,
                        p.ProductName,
                        p.Description,
                        p.Price,
                        p.Stock,
                        p.ImageUrl,
                        c.CategoryName

                    FROM Products p

                    INNER JOIN Categories c
                    ON p.CategoryId = c.CategoryId";

                if (keyword != "")
                {
                    query +=
                        " WHERE p.ProductName LIKE @Keyword";
                }

                SqlCommand cmd =
                    new SqlCommand(query, con);

                if (keyword != "")
                {
                    cmd.Parameters.AddWithValue(
                        "@Keyword",
                        "%" + keyword + "%");
                }

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                rptProducts.DataSource = dt;

                rptProducts.DataBind();
            }

            catch (Exception ex)
            {
                lblMessage.Text =
                    ex.Message;

                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
            }
        }

        // SEARCH

        protected void btnSearch_Click(
            object sender,
            EventArgs e)
        {
            LoadProducts(
                txtSearch.Text.Trim());
        }

        // ADD TO CART

        protected void btnCart_Click(
            object sender,
            EventArgs e)
        {
            try
            {
                // LOGIN CHECK

                if (Session["UserId"] == null)
                {
                    Response.Redirect(
                        "Login.aspx");

                    return;
                }

                int userId =
                    Convert.ToInt32(
                    Session["UserId"]);

                System.Web.UI.WebControls.Button btn =
                    (System.Web.UI.WebControls.Button)sender;

                int productId =
                    Convert.ToInt32(
                    btn.CommandArgument);

                SqlConnection con =
                    new SqlConnection(cs);

                string query =
                    @"INSERT INTO Cart
                    (UserId, ProductId, Quantity)

                    VALUES
                    (@UserId, @ProductId, @Quantity)";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@UserId",
                    userId);

                cmd.Parameters.AddWithValue(
                    "@ProductId",
                    productId);

                cmd.Parameters.AddWithValue(
                    "@Quantity",
                    1);

                con.Open();

                int result =
                    cmd.ExecuteNonQuery();

                con.Close();

                if (result > 0)
                {
                    lblMessage.Text =
                        "Product Added To Cart Successfully";

                    lblMessage.ForeColor =
                        System.Drawing.Color.Green;
                }

                else
                {
                    lblMessage.Text =
                        "Failed To Add Product";

                    lblMessage.ForeColor =
                        System.Drawing.Color.Red;
                }
            }

            catch (Exception ex)
            {
                lblMessage.Text =
                    ex.Message;

                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
            }
        }
    }
}