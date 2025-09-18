using System.ComponentModel.DataAnnotations;

namespace Register.Models
{
    public class User
    {
        [StringLength(5, ErrorMessage = "该值已超过限制长度")]

        [Required]
        public string userName { get; set; }

        [Required(ErrorMessage = "*必填项")]

        [Range(100,1000000,ErrorMessage = "*数字大小超出范围了")]

        public string passWord{ get;set;}
    [Required]
    [RegularExpression(@"^[a-zA-z0-9_.-]+@[a-zA-z0-9-]+(\.[a-zA-z0-9-]+)*\.[a-zA-z0-9]{2,6}$", ErrorMessage = "*邮箱格式错误")
]
        public string Email { get; set; }
    }
}
