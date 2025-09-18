using System.Collections;

// 分页继承类
namespace app.Dbs.Collects
{
    public interface ICollect<T> : IList
    {
        string reader();
        Page readerPage();
    }
}