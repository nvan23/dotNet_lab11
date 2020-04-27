using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SinhVien
{
    public class SinhVien
    {
        string strIdSinhVien, strTenSinhVien, strLop;

        public string TenSinhVien
        {
            get
            {
                return strTenSinhVien;
            }

            set
            {
                strTenSinhVien = value;
            }
        }

        public string Lop
        {
            get
            {
                return strLop;
            }

            set
            {
                strLop = value;
            }
        }

        public string IdSinhVien
        {
            get
            {
                return strIdSinhVien;
            }

            set
            {
                strIdSinhVien = value;
            }
        }
    }
}