namespace Order.Models
{
    public class Shop
    {  public int ShopId{ get; set; }
        public string? ShopName { get; set; }
        public string? ShopDescription { get; set; }
        public string? Address { get; set; }
        public string? ShopIntro { get; set; }
        public string? ShopImgurl { get; set; }

        public IEnumerable<Food>? Foods { get; set; }

    }
}
