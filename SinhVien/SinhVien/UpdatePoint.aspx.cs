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
    public partial class UpdatePoint : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Response.Write("Xin chào," + Session["Id"]);
                lblName.Text = Convert.ToString(Session["Name"]);
                info_class(Convert.ToString(Session["Id"]));
                //info_class("001");


            }
        }
        public void info_class(string MaGV)
        {
            dropLop.DataSource = null;
            dropLop.Items.Clear();
            List<HocPhan> hp = new List<HocPhan>();
            try
            {
                clsConnection.OpenConnection();
                string query = "SELECT DISTINCT m.MaMon AS MaMon, m.TenMon AS TenMon, " +
                    " h.malop as MaLop, l.tenlop as TenLop, h.mahp AS MaHP" +
               " FROM MonHoc AS m JOIN HocPhan AS h ON m.MaMon = h.MaMon " +
               "JOIN Lop AS l ON l.malop = h.Malop " +
               "WHERE h.MaGV = '" + MaGV + "';";
                string query1 = "SELECT DISTINCT m.MaMon AS MaMon, m.TenMon AS TenMon " +

               " FROM MonHoc AS m JOIN HocPhan AS h ON m.MaMon = h.MaMon " +
               "JOIN Lop AS l ON l.malop = h.Malop " +
               "WHERE h.MaGV = '" + MaGV + "';";

                SqlCommand com = new SqlCommand(query1, clsConnection.con);
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    string tenLop = "";
                    string tenMon = "";
                    HocPhan hp2 = new HocPhan();
                    // hp2.IdGiangVien = dr.GetString(1);
                    //hp2.IdHocPhan = dr.GetString(0);
                    // hp2.IdLop = dr.GetString(2);

                    hp2.TenMon = dr.GetString(1);
                    //hp2.IdMonHoc = dr.GetString(3);
                    //hp2.IdGiangVien = dr.GetString(1);
                    hp2.IdMonHoc = dr.GetString(0);
                    //hp2.IdHocPhan = dr.GetInt32(4).ToString();
                    clsConnection.OpenConnection();


                    clsConnection.CloseConnection();
                    //hp2.IdMonHoc = hp2.IdLop + " - " + infoClass + "| " + hp2.IdMonHoc;

                    hp.Add(hp2);
                    dropLop.DataSource = hp;
                    dropLop.DataTextField = "TenMon";
                    dropLop.DataValueField = "IdMonHoc";
                    dropLop.DataBind();
                    dropLop.Enabled = true;
                }
                clsConnection.CloseConnection();

            }
            catch (Exception ex)
            {
                Response.Write("ERROR" + ex.Message);
            }
            loadData(dropLop.SelectedValue, Convert.ToString(Session["Id"]));


        }
        public void loadData(string maMon, string maGV)
        {
            try
            {
                clsConnection.OpenConnection();
                //string query1 = "select mahocphan, diem.masv, sinhvien.tensv, sinhvien.malop, lop.tenlop, diem.giatri from diem join sinhvien on diem.masv=sinhvien.masv join lop on sinhvien.malop=lop.malop where diem.mahp ='" + id + "';";
                //"select idTeach,pointStudent.idStudent, student.Name, student.idClass,class.className, pointStudent.point from [pointStudent] join [student] on pointStudent.idStudent=student.idStudent join [class] on student.idClass=class.idClass where pointStudent.idTeach='" + id + "'"
                string query = "SELECT s.MaSV as 'MaSV', s.HoSV + ' ' + s.TenSV as 'HoTenSV', " +
                    " l.MaLop as 'MaLop', l.TenLop as 'TenLop', " +
                    "p.GiaTri as 'GiaTri', c.mahp as 'idHocPhan' " +
                    "FROM SinhVien AS s " +
                    "JOIN HocPhan AS c ON c.MaLop = s.MaLop " +
                    "JOIN Lop AS l ON l.MaLop = c.MaLop " +
                    "LEFT JOIN Diem AS p ON (p.MaSV = s.MaSV AND p.MaHP = c.MaHP) " +
                    "WHERE c.MaMon = '" + maMon + "' and c.magv = '" + maGV + "';";
                string query1 = "select masv, hosv, tensv, malop from sinhvien";
                SqlDataAdapter da = new SqlDataAdapter(query, clsConnection.con);
                DataSet ds = new DataSet();
                da.Fill(ds, "Info");
                GrvStudent.DataSource = ds.Tables["Info"];
                GrvStudent.DataBind();


            }
            catch (Exception ex)
            {
                Response.Write("ERROR" + ex.Message);
            }
            clsConnection.CloseConnection();
        }

        protected void GrvStudent_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrvStudent.PageIndex = e.NewPageIndex;
            loadData(dropLop.SelectedValue, Convert.ToString(Session["Id"]));
        }
        protected void dropLop_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList cb = sender as DropDownList;
            if (cb.SelectedItem.Value != null)
            {
                //lblChoose.Text = dropLop.Items[dropLop.SelectedIndex].Value;
                loadData(dropLop.SelectedValue, Convert.ToString(Session["Id"]));
            }
        }

        protected void GrvStudent_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GrvStudent.EditIndex = e.NewEditIndex;
            loadData(dropLop.SelectedValue, Convert.ToString(Session["Id"]));
        }

        protected void GrvStudent_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string idT = GrvStudent.DataKeys[e.RowIndex].Value.ToString();
            TextBox point = GrvStudent.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox;

            TextBox idStudent = GrvStudent.Rows[e.RowIndex].Cells[0].Controls[0] as TextBox;
            string a = idStudent.Text;
            string p = "";
            try
            {
                clsConnection.OpenConnection();
                SqlCommand com = new SqlCommand("select giatri from diem where masv=@masv and mahp=@mahp", clsConnection.con);
                SqlParameter p1 = new SqlParameter("@masv", SqlDbType.NVarChar);
                p1.Value = a;
                SqlParameter p2 = new SqlParameter("@mahp", SqlDbType.NVarChar);
                p2.Value = idT;

                com.Parameters.Add(p1);
                com.Parameters.Add(p2);
                com.ExecuteNonQuery();
                SqlDataReader datareader = com.ExecuteReader();
                if (datareader.Read())
                {
                    p = datareader["giatri"].ToString();
                }
                else
                {
                    p = "Không";
                }
            }
            catch
            {

            }
            if (p.Equals("Không"))
            {

                try
                {
                    clsConnection.OpenConnection();
                    string qeury = "insert into diem (MaSV, MaHP, GiaTri) values (@masv, @mahp, @giatri);";
                    SqlCommand com = new SqlCommand(qeury, clsConnection.con);
                    SqlParameter p1 = new SqlParameter("@masv", SqlDbType.NVarChar);
                    p1.Value = idStudent.Text;
                    SqlParameter p2 = new SqlParameter("@mahp", SqlDbType.NVarChar);
                    p2.Value = idT;
                    SqlParameter p3 = new SqlParameter("@giatri", SqlDbType.Float);
                    p3.Value = Convert.ToDouble(point.Text);

                    com.Parameters.Add(p1);
                    com.Parameters.Add(p2);
                    com.Parameters.Add(p3);

                    com.ExecuteNonQuery();
                    clsConnection.CloseConnection();

                }

                catch (Exception ex)
                {
                    Response.Write("ERROR: insert " + ex.Message);
                }
            }
            else
            {
                try
                {
                    clsConnection.OpenConnection();
                    SqlCommand com = new SqlCommand("update diem set giatri=@p where mahp='" + idT + "' and masv= '" + a + "';", clsConnection.con);
                    SqlParameter p1 = new SqlParameter("@p", SqlDbType.Float);
                    p1.Value = Convert.ToDouble(point.Text);

                    com.Parameters.Add(p1);

                    com.ExecuteNonQuery();
                    clsConnection.CloseConnection();

                }

                catch (Exception ex)
                {
                    Response.Write("ERROR" + ex.Message);
                }

            }

        }

        protected void GrvStudent_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GrvStudent.EditIndex = -1;
            loadData(dropLop.SelectedValue, Convert.ToString(Session["Id"]));
        }

        protected void dropLop_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void GrvStudent_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {

        }

        protected void dropLop_SelectedIndexChanged2(object sender, EventArgs e)
        {

        }
    }
}
