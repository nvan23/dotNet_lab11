using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SinhVien
{
    public class clsConnection
    {
        public static SqlConnection con;
        public static Boolean OpenConnection()
        {
            try
            {
                con = new SqlConnection("Data Source=DESKTOP-E30J54Q\\SQLEXPRESS;Initial Catalog=SV;Integrated Security=True");
                con.Open();
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
        public static bool CloseConnection()
        {
            try
            {
                con.Close();
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
    }

}