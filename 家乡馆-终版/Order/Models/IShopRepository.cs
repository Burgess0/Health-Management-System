namespace Order.Models
{
    public interface IShopRepository
    {
        IEnumerable<Shop> GetAllShops();//获取所有家乡馆信息
        Shop GetShopById(int id);//根据家乡馆Id获取店铺信息
    }
}
