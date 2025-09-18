namespace Order.Models
{
    public class Food
    {
        public int FoodId{ get; set; }
        public string? FoodName { get; set; }
        public int SaleNum{ get; set; }
        public string SaleRank { get; set; }
        public string FoodPrice { get; set; }
        public string FoodIntro { get; set; }
        public string? FoodPic { get; set; }
        public int ShopId{ get; set; }
    
    }
}
