using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SinhVien
{
    public class HocPhan
    {
        string strId, strIdGiangVien, strIdLop, strIdMonHoc, strTenMontenLop;

        public string TenMon
        {
            get
            {
                return strTenMontenLop;
            }

            set
            {
                strTenMontenLop = value;
            }
        }

        public string IdHocPhan
        {
            get
            {
                return strId;
            }

            set
            {
                strId = value;
            }
        }

        public string IdLop
        {
            get
            {
                return strIdLop;
            }

            set
            {
                strIdLop = value;
            }
        }

        public string IdGiangVien
        {
            get
            {
                return strIdGiangVien;
            }

            set
            {
                strIdGiangVien = value;
            }
        }

        public string IdMonHoc
        {
            get
            {
                return strIdMonHoc;
            }

            set
            {
                strIdMonHoc = value;
            }
        }
    }
}