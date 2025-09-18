namespace Order.Models
{
    public interface IFoodRepository
    {//获取指定家乡馆的所有菜品信息
        IEnumerable<Food> GetFoodByShopId(int ShopId);
        Food GetFoodById(int id);//根据商品Id获取商品信息
        IEnumerable<Food> GetAllFoods();//获取所有商品信息
    }
}