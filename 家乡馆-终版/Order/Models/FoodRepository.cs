namespace Order.Models
{
    public class FoodRepository : IFoodRepository
    {
        private readonly AppDbContext _context;
        public FoodRepository(AppDbContext appDbContext)
        {
            _context = appDbContext;
        }
        public IEnumerable<Food> GetAllFoods()
        {
            return _context.Foods;
        }
        public Food GetFoodById(int id)
        {
            return _context.Foods.FirstOrDefault(n => n.FoodId == id);
        }

    

        public IEnumerable<Food> GetFoodByShopId(int ShopId)
        {
            IEnumerable<Food> foods = GetAllFoods();
            List<Food> foodList = new List<Food>();
            foreach (var food in foods)
            {
                if (food.ShopId == ShopId)
                {
                    foodList.Add(food);
                }
            }
            return foodList;
        }
    }
}