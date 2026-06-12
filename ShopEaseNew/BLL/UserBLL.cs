using System.Data;
using System.Data.SqlClient;
using ShopEaseNew.DAL;

namespace ShopEaseNew.BLL
{
    public class UserBLL
    {
        DBHelper db =
            new DBHelper();

        // LOGIN METHOD

        public DataTable LoginUser(
      string email,
      string password)
        {
            SqlParameter[] param =
            {
        new SqlParameter("@Email", email),
        new SqlParameter("@Password", password)
    };

            return db.ExecuteSelect(
                "sp_LoginUser",
                param);
        }
    }
}