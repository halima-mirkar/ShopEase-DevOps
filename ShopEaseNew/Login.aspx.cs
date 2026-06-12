using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace ShopEaseNew
{
    public partial class Login :
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
                lblMessage.Text = "";

                // REMEMBER ME COOKIE

                if (Request.Cookies["UserEmail"] != null)
                {
                    txtEmail.Text =
                        Request.Cookies["UserEmail"].Value;

                    chkRemember.Checked = true;
                }
            }
        }

        protected void btnLogin_Click(
            object sender,
            EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    using (SqlConnection con =
                        new SqlConnection(cs))
                    {
                        string query = @"

                        SELECT
                            UserId,
                            FullName,
                            Email,
                            Role

                        FROM Users

                        WHERE Email=@Email
                        AND Password=@Password";

                        SqlCommand cmd =
                            new SqlCommand(query, con);

                        cmd.Parameters.AddWithValue(
                            "@Email",
                            txtEmail.Text.Trim());

                        cmd.Parameters.AddWithValue(
                            "@Password",
                            txtPassword.Text.Trim());

                        SqlDataAdapter da =
                            new SqlDataAdapter(cmd);

                        DataTable dt =
                            new DataTable();

                        da.Fill(dt);

                        // LOGIN SUCCESS

                        if (dt.Rows.Count > 0)
                        {
                            // STORE SESSION

                            Session["UserId"] =
                                dt.Rows[0]["UserId"].ToString();

                            Session["UserName"] =
                                dt.Rows[0]["FullName"].ToString();

                            Session["UserEmail"] =
                                dt.Rows[0]["Email"].ToString();

                            Session["Role"] =
                                dt.Rows[0]["Role"].ToString();

                            // REMEMBER ME

                            if (chkRemember.Checked)
                            {
                                HttpCookie cookie =
                                    new HttpCookie(
                                        "UserEmail");

                                cookie.Value =
                                    txtEmail.Text.Trim();

                                cookie.Expires =
                                    DateTime.Now.AddDays(7);

                                Response.Cookies.Add(
                                    cookie);
                            }

                            else
                            {
                                if (Request.Cookies["UserEmail"] != null)
                                {
                                    HttpCookie cookie =
                                        new HttpCookie(
                                            "UserEmail");

                                    cookie.Expires =
                                        DateTime.Now.AddDays(-1);

                                    Response.Cookies.Add(
                                        cookie);
                                }
                            }

                            // ROLE CHECK

                            string role =
                                dt.Rows[0]["Role"].ToString();

                            // ADMIN

                            if (role == "Admin")
                            {
                                Response.Redirect(
                                    "AdminDashboard.aspx");
                            }

                            // CUSTOMER

                            else
                            {
                                Response.Redirect(
                                    "Home.aspx");
                            }
                        }

                        // INVALID LOGIN

                        else
                        {
                            lblMessage.Text =
                                "Invalid Email or Password";

                            lblMessage.ForeColor =
                                System.Drawing.Color.Red;
                        }
                    }
                }
            }

            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error : " + ex.Message;

                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
            }
        }
    }
}