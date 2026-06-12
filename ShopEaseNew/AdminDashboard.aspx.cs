using System;
using System.Data;
using System.Data.SqlClient;

namespace ShopEaseNew
{
    public partial class AdminDashboard :
        System.Web.UI.Page
    {
        string cs =
            @"Data Source=(LocalDB)\MSSQLLocalDB;
            Initial Catalog=ShopEaseDB;
            Integrated Security=True";

        protected void Page_Load(
            object sender,
            EventArgs e)
        {
            if (Session["Role"] == null ||
                Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                lblAdmin.Text =
                    Session["UserName"].ToString();

                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {
                con.Open();

                // TOTAL PRODUCTS

                SqlCommand cmdProducts =
                    new SqlCommand(
                        "SELECT COUNT(*) FROM Products",
                        con);

                lblProducts.Text =
                    cmdProducts.ExecuteScalar().ToString();

                // TOTAL USERS

                SqlCommand cmdUsers =
                    new SqlCommand(
                        "SELECT COUNT(*) FROM Users",
                        con);

                lblUsers.Text =
                    cmdUsers.ExecuteScalar().ToString();

                // TOTAL ORDERS

                SqlCommand cmdOrders =
                    new SqlCommand(
                        "SELECT COUNT(*) FROM Orders",
                        con);

                lblOrders.Text =
                    cmdOrders.ExecuteScalar().ToString();

                // TOTAL SALES

                SqlCommand cmdSales =
                    new SqlCommand(
                        "SELECT ISNULL(SUM(TotalAmount),0) FROM Orders",
                        con);

                lblSales.Text =
                    cmdSales.ExecuteScalar().ToString();

                // TOTAL PAYMENTS

                SqlCommand cmdPayments =
                    new SqlCommand(
                        "SELECT COUNT(*) FROM Payments",
                        con);

                lblPayments.Text =
                    cmdPayments.ExecuteScalar().ToString();

                // RECENT PAYMENTS

                string query = @"

                SELECT TOP 5
                Payments.PaymentID,
                Users.FullName,
                Payments.Amount,
                Payments.PaymentMethod,
                Payments.PaymentStatus,
                Payments.PaymentDate

                FROM Payments

                INNER JOIN Users
                ON Payments.UserID = Users.UserID

                ORDER BY Payments.PaymentDate DESC";

                SqlDataAdapter da =
                    new SqlDataAdapter(query, con);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                GridViewPayments.DataSource = dt;

                GridViewPayments.DataBind();
            }
        }

        protected void btnLogout_Click(
            object sender,
            EventArgs e)
        {
            Session.Clear();

            Session.Abandon();

            Response.Redirect("Login.aspx");
        }
    }
}