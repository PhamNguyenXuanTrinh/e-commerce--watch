using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThiGiuaKy_LapTrinhWeb.Models;
namespace ThiGiuaKy_LapTrinhWeb.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            string text = Mahoa.mahoaSHA256("123");
            return View();
        }
 
        
    }
}