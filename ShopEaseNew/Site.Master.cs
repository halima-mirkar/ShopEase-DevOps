using System;

namespace ShopEaseNew
{
    public partial class SiteMaster :
        System.Web.UI.MasterPage
    {
        protected void Page_Load(
            object sender,
            EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserEmail"] != null &&
                    Session["UserName"] != null &&
                    Session["Role"] != null)
                {
                    lblUser.Text =
                        "Welcome, " +
                        Session["UserName"].ToString()
                        + " (" +
                        Session["Role"].ToString()
                        + ")";
                }
                else
                {
                    lblUser.Text = "Guest";
                }
            }
        }

        protected void btnLogout_Click(
            object sender,
            EventArgs e)
        {
            Session.Clear();

            Session.Abandon();

            Response.Redirect(
                "Login.aspx");
        }

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
    }
}