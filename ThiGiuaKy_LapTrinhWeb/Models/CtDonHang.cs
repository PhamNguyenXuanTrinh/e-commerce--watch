//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ThiGiuaKy_LapTrinhWeb.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CtDonHang
    {
        public string soDH { get; set; }
        public string maSP { get; set; }
        public Nullable<int> soLuong { get; set; }
        public Nullable<long> giaBan { get; set; }
        public Nullable<long> giamGia { get; set; }
    
        public virtual SanPham SanPham { get; set; }
        public virtual DonHang DonHang { get; set; }
    }
}
