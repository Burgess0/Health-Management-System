

namespace Order.Models
{
    public class ShopRepository : IShopRepository
    {

        private readonly AppDbContext _context;

    public ShopRepository(AppDbContext appDbContext)
    {
        _context = appDbContext;
    }
    public Shop GetShopById(int Id)
    {
        return _context.Shops.FirstOrDefault(n => n.ShopId == Id); }

    public IEnumerable<Shop> GetAllShops()
    {
        return _context.Shops;
    }
    }
}
