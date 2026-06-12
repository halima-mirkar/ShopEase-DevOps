using System;
using System.Data;
using System.Data.SqlClient;

namespace ShopEaseNew
{
    public partial class Orders :
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
            if (!IsPostBack)
            {
                // LOGIN CHECK

                if (Session["UserId"] == null)
                {
                    Response.Redirect(
                        "Login.aspx");
                }

                LoadOrders();
            }
        }

        private void LoadOrders()
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(cs))
                {
                    string role =
                        Session["Role"].ToString();

                    string query = "";

                    SqlCommand cmd;

                    // ADMIN VIEW

                    if (role == "Admin")
                    {
                        query = @"

SELECT
O.OrderID,
U.FullName,
P.ProductName,
OD.Quantity,
OD.Price,

(OD.Quantity * OD.Price)
AS Total,

ISNULL(PM.PaymentStatus,'Pending')
AS PaymentStatus,

ISNULL(O.OrderStatus,'Processing')
AS DeliveryStatus,

O.OrderDate

FROM Orders O

INNER JOIN Users U
ON O.UserID = U.UserID

INNER JOIN OrderDetails OD
ON O.OrderID = OD.OrderID

INNER JOIN Products P
ON OD.ProductID = P.ProductID

LEFT JOIN Payments PM
ON O.OrderID = PM.OrderID

ORDER BY O.OrderDate DESC";

                        cmd =
                            new SqlCommand(
                                query,
                                con);
                    }

                    // CUSTOMER VIEW

                    else
                    {
                        int userId =
                            Convert.ToInt32(
                            Session["UserId"]);

                        query = @"

SELECT
O.OrderID,
P.ProductName,
OD.Quantity,
OD.Price,

(OD.Quantity * OD.Price)
AS Total,

ISNULL(PM.PaymentStatus,'Pending')
AS PaymentStatus,

ISNULL(O.OrderStatus,'Processing')
AS DeliveryStatus,

O.OrderDate

FROM Orders O

INNER JOIN OrderDetails OD
ON O.OrderID = OD.OrderID

INNER JOIN Products P
ON OD.ProductID = P.ProductID

LEFT JOIN Payments PM
ON O.OrderID = PM.OrderID

WHERE O.UserID = @UserID

ORDER BY O.OrderDate DESC";

                        cmd =
                            new SqlCommand(
                                query,
                                con);

                        cmd.Parameters.AddWithValue(
                            "@UserID",
                            userId);
                    }

                    SqlDataAdapter da =
                        new SqlDataAdapter(cmd);

                    DataTable dt =
                        new DataTable();

                    da.Fill(dt);

                    GridView1.DataSource = dt;

                    GridView1.DataBind();
                }
            }

            catch (Exception ex)
            {
                Response.Write(
                    "<script>alert('"
                    + ex.Message.Replace("'", "")
                    + "')</script>");
            }
        }
    }
}