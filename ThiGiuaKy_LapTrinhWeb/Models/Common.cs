using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
namespace ThiGiuaKy_LapTrinhWeb.Models
{
    public class Common
    {
        /// <summary>
        /// Hàn lấy sản phẩm
        /// </summary>
        /// <returns></returns>
        public static List<SanPham> getSp()
        {
            List<SanPham> l = new List<SanPham>();
            DbContext cn = new DbContext("name=ShopOnlineKetNoi");
            l = cn.Set<SanPham>().ToList<SanPham>();
            return l;
        }
        public static List<LoaiSP> getLoai()
        {
            List<LoaiSP> l = new List<LoaiSP>();
            DbContext cn = new DbContext("name=ShopOnlineKetNoi");
            l = cn.Set<LoaiSP>().ToList<LoaiSP>();
            return l;
        }
        public static List<SanPham> tungLoaiSp(int maloai)
        {
            List<SanPham> l = new List<SanPham>();
            //--- Khai báo 1 đối tượng đại diện cho Database
            DbContext cn = new DbContext("name=ShopOnlineKetNoi");
            //--- |Lấy dữ liệu....
            l = cn.Set<SanPham>().Where(x => x.maLoai == maloai ).ToList<SanPham>();
            return l;
        }
        public static List<SanPham> Spmoi()
        {
            List<SanPham> l = new List<SanPham>();
            //--- Khai báo 1 đối tượng đại diện cho Database
            DbContext cn = new DbContext("name=ShopOnlineKetNoi");
            //--- |Lấy dữ liệu....
            l = cn.Set<SanPham>().OrderBy(x=>x.ngayDang).ToList<SanPham>();
            return l;
        }
    }
}