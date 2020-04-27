using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SinhVien
{
    public class clsGiangVien
    {
        string strId, strTenGV, strMatKhau;
        public string Id
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
        public string tenGV
        {
            get
            {
                return strTenGV;
            }
            set
            {
                strTenGV = value;
            }
        }
        public string matKhau
        {
            get
            {
                return strMatKhau;
            }
            set
            {
                strMatKhau = value;
            }
        }
    }
}