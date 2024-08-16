using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThiGiuaKy_LapTrinhWeb.Models;
namespace ThiGiuaKy_LapTrinhWeb.Areas.Admin.Controllers
{
    public class ChungLoai_NganhHangController : Controller
    {
        private static bool isUpdate = false;
        // GET: Admin/ChungLoai_NganhHang
        [HttpGet]
        public ActionResult Index()
        {
            List<LoaiSP> l = new ShopOnlineKetNoi().LoaiSPs.OrderBy(x => x.tenLoai).ToList<LoaiSP>();
            ViewData["DsLoai"] = l;
            return View();
        }
        [HttpPost]
        public ActionResult Index(LoaiSP x)
        {
            ShopOnlineKetNoi db = new ShopOnlineKetNoi();
            if (!isUpdate)
                db.LoaiSPs.Add(x);
            else{
                LoaiSP z = db.LoaiSPs.Find(x.maLoai);
                z.tenLoai = x.tenLoai;
                z.ghiChu = x.ghiChu;
                isUpdate = false;
            }
            db.SaveChanges();
            List<LoaiSP> l = db.LoaiSPs.OrderBy(m => m.tenLoai).ToList<LoaiSP>();
            if (ModelState.IsValid)
                ModelState.Clear();
            ViewData["DsLoai"] = l;
            return View();
        }
        [HttpPost]
        public ActionResult Delete(string maloai)
        {
            ShopOnlineKetNoi db = new ShopOnlineKetNoi();
            int ma = int.Parse(maloai);
            LoaiSP x = db.LoaiSPs.Find(ma);
            db.LoaiSPs.Remove(x);
            db.SaveChanges();
            List<LoaiSP> l = db.LoaiSPs.OrderBy(m => m.tenLoai).ToList<LoaiSP>();
            ViewData["DsLoai"] = l;
            return View("Index");
        }
        public ActionResult Update(string UpdateMa)
        {
            ShopOnlineKetNoi db = new ShopOnlineKetNoi();
            int ma = int.Parse(UpdateMa);
            LoaiSP x = db.LoaiSPs.Find(ma);
            isUpdate = true;
            List<LoaiSP> l = db.LoaiSPs.OrderBy(m => m.tenLoai).ToList<LoaiSP>();
            return View("Index" ,x);
        }
    }
}