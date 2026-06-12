using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ShopEaseNew
{
    public partial class Register :
        System.Web.UI.Page
    {
        protected void Page_Load(
            object sender,
            EventArgs e)
        {

        }

        protected void btnRegister_Click(
            object sender,
            EventArgs e)
        {
            try
            {
                string cs =
                    ConfigurationManager
                    .ConnectionStrings["ShopEaseDB"]
                    .ConnectionString;

                using (SqlConnection con =
                    new SqlConnection(cs))
                {
                    // CHECK EMAIL EXISTS

                    string checkQuery =
                        "SELECT COUNT(*) FROM Users WHERE Email=@Email";

                    SqlCommand checkCmd =
                        new SqlCommand(checkQuery, con);

                    checkCmd.Parameters.AddWithValue(
                        "@Email",
                        txtEmail.Text.Trim());

                    con.Open();

                    int count =
                        (int)checkCmd.ExecuteScalar();

                    if (count > 0)
                    {
                        lblMessage.Text =
                            "Email already exists";

                        lblMessage.ForeColor =
                            System.Drawing.Color.Red;

                        return;
                    }

                    // INSERT USER

                    string query =
                        @"INSERT INTO Users
                        (FullName,Email,Password,Role)

                        VALUES
                        (@FullName,@Email,@Password,@Role)";

                    SqlCommand cmd =
                        new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue(
                        "@FullName",
                        txtName.Text.Trim());

                    cmd.Parameters.AddWithValue(
                        "@Email",
                        txtEmail.Text.Trim());

                    cmd.Parameters.AddWithValue(
                        "@Password",
                        txtPassword.Text.Trim());

                    cmd.Parameters.AddWithValue(
                        "@Role",
                        "Customer");

                    int result =
                        cmd.ExecuteNonQuery();

                    con.Close();

                    // SUCCESS

                    if (result > 0)
                    {
                        lblMessage.Text =
                            "Registration Successful";

                        lblMessage.ForeColor =
                            System.Drawing.Color.Green;

                        ClearControls();
                    }

                    else
                    {
                        lblMessage.Text =
                            "Registration Failed";

                        lblMessage.ForeColor =
                            System.Drawing.Color.Red;
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

        // CLEAR CONTROLS

        private void ClearControls()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
    }
}