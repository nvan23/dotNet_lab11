using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SinhVien
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                clsConnection.OpenConnection();
                clsGiangVien gv = new clsGiangVien();
                SqlCommand com = new SqlCommand("select * from giangvien where magv=@id and matkhau=@pass", clsConnection.con);
                SqlParameter p1 = new SqlParameter("@id", SqlDbType.NVarChar);
                p1.Value = txtName.Text;
                SqlParameter p2 = new SqlParameter("@pass", SqlDbType.NVarChar);
                p2.Value = txtpwd.Text;
                com.Parameters.Add(p1);
                com.Parameters.Add(p2);
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {

                    gv.Id = dr.GetString(0);
                    gv.tenGV = dr.GetString(1);
                    gv.matKhau = dr.GetString(2);
                }
                clsConnection.CloseConnection();
                if (txtName.Text != gv.Id)
                {
                    Response.Write("Lỗi");
                }
                else if (txtpwd.Text != gv.matKhau)
                {
                    Response.Write("lỗi");
                }
                else
                {
                    Session["Id"] = gv.Id;
                    Session["Name"] = gv.tenGV;
                    Response.Redirect("/UpdatePoint.aspx");
                }

            }
            catch (Exception ex)
            {
                Response.Write("ERROR" + ex.Message);
            }
        }
    }
}