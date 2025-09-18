using Microsoft.AspNetCore.Mvc;
using Order.Models;
using System.Diagnostics;

namespace Order.Controllers
{
    public class HomeController : Controller
    {
        private IShopRepository _shopRepository;
        private IFoodRepository _foodRepository;
        public HomeController(IShopRepository shopRepository, IFoodRepository foodRepository)
        {
            _shopRepository = shopRepository;
            _foodRepository = foodRepository;
        }
        private readonly ILogger<HomeController> _logger;

       

        public IActionResult Index()
        {
            var shops = _shopRepository.GetAllShops();
            return View(shops);
        }
		
		public IActionResult ShopDetail(int id)
        {
            var shop = _shopRepository.GetShopById(id);
            var foods = _foodRepository.GetFoodByShopId(id);
            shop.Foods = foods; 
            return View(shop);
        }
		
		public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}