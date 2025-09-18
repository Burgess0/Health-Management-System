using Microsoft.AspNetCore.Mvc;
using Order.Models;
using Microsoft.AspNetCore.Authorization;

namespace Order.Controllers
{
    [Authorize]
    public class FoodDetailController : Controller
    {
        private IFoodRepository _foodRepository;
        public FoodDetailController(IFoodRepository foodRepository)
        {
            _foodRepository = foodRepository;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult FoodDetail(int id)
        {
            return View(_foodRepository.GetFoodById(id));
        }
    }
}
